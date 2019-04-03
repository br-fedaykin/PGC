import charm.core.crypto.cryptobase
from charm.core.math.pairing import pairing,pc_element,ZR
from charm.core.math.integer import integer,int2Bytes
from charm.toolbox.conversion import Conversion
from charm.toolbox.bitstring import Bytes
import hashlib, base64

class Hash():
    def __init__(self, htype='sha1', pairingElement=None, integerElement=None):        
        if htype == 'sha1':
            self.hash_type = htype 
            # instance of PairingGroup
            self.group = pairingElement
        
    def hashToZn1(self, value):
        if type(value) == pc_element:
            h = hashlib.new(self.hash_type)
            h.update(self.group.serialize(value))
            #print "digest => %s" % h.hexdigest()
            # get raw bytes of digest and hash to Zr
            val = h.digest()
            return integer(int(unicode(self.group.hash(val, ZR))))
            # do something related to that
        if type(value) == integer:
            str_value = int2Bytes(value)
            #print("str_value =>", str_value)
            #val = self.group.hash(str_value, ZR)
            #print("hash =>", val)
            return integer(int(unicode(self.group.hash(str_value, ZR))))
        return None
    
    # takes two arbitrary strings and hashes to an element of Zr
    def hashToZr1(self, *args):
        if isinstance(args, tuple):
            #print("Hashing =>", args)
            strs = ""
            for i in args:
                if type(i) == unicode:
                    strs += unicode(base64.encodestring(i))
                elif type(i) == bytes:
                    strs += unicode(base64.encodestring(i))
                elif type(i) == integer:
                    strs += unicode(base64.encodestring(int2Bytes(i)))
                elif type(i) == pc_element:
                    strs += unicode(base64.encodestring(self.group.serialize(i)))

            if len(strs) > 0:
                return self.group.hash(strs, ZR)
            return None


