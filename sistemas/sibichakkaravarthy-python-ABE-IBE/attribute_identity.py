from charm.toolbox.pairinggroup import ZR,G1,GT,pair
from charm.core.math.integer import integer,bitsize, int2Bytes, randomBits
from charm.toolbox.hash_module import Hash
from charm.core.engine.util import objectToBytes
from hash_lib_cloud import *
import hashlib, base64

debug = False
class Shajina_Cloud:
  
    def __init__(self, groupObj):
        global group,h
        group = groupObj
        h = Hash('sha1', group)
        
# CA authorization 
    def setup(self):
        s = group.random(ZR) 
        g =  group.random(G1)
        # choose H1-H6 hash functions
        msk = { 's':s }
        params = { 'g':g, 'g_s':g**s}
        if(debug):
            print("Public parameters...")
            group.debug(params)
            print("Master secret key...")
            group.debug(msk)
        return (msk, params)

    def keyGen(self, msk, ID):
        k = group.hash(ID,G1) ** msk['s']
        skid = { 'skid':k }        
        if(debug):
            print("Key for id => '%s'" % ID)
            group.debug(skid)
        return skid

# ciphering context
		
    def encrypt(self, params, ID, M):
        enc_M = integer(M)
        if bitsize(enc_M)/8 > group.messageSize():
            print("Message cannot be encoded.")
            return None
        sigma = group.random(GT)
        #r = h.hashToZr(sigma,enc_M)
	r = h.hashToZr1(sigma,M)
	#r1 = base64.b64encode(sigma,enc_M)
	#r = h.r1
        A = params['g'] ** r 
        B = sigma * pair(params['g_s'], group.hash(ID, G1) ** r)
        C = enc_M ^ h.hashToZn1(sigma)      
        C_ = {'A':A, 'B':B, 'C':C}
        S = group.hash((ID, C_),G1) ** r        
        ciphertext = {'S':S,'C':C_}           
        if(debug):
            print('\nEncrypt...')
            print('r => %s' % r)
            print('sigma => %s' % sigma)
            print('enc_M => %s' % enc_M)
            group.debug(ciphertext)
        return ciphertext
	
        
    def decryptFirstLevel(self, params, skid, cid, ID):
        H = group.hash((ID, cid['C']), G1)
        t = group.random(ZR)
        sigma =  cid['C']['B'] / (pair(cid['C']['A'], skid['skid'] * H ** t)/pair(params['g'] ** t, cid['S']))
        m =  cid['C']['C'] ^ h.hashToZn1(sigma)
        r = h.hashToZr1(sigma,m)
        if (cid['S'] != H**r) or (cid['C']['A'] != params['g'] ** r):
            if debug: print("Decryption Failed")
            return None 
        if(debug):
            print('\nDecrypting...')
            print('H => %s' % H)
            print('t => %s' % t)
            print('r => %s' % r)
            print('sigma => %s' % sigma)
            print int2Bytes(m)
        return int2Bytes(m)
    
    def rkGen(self, params, skid, IDsrc, IDdest):
        N = integer(randomBits(group.secparam))
        K = pair(skid['skid'], group.hash(IDdest, G1))
        if(debug):
            print("\nRe-encryption key for id1 => '%s' to id2 => '%s'" % (IDsrc,IDdest))
            group.debug(skid)
            print('N => %s' % N)
            print('K => %s' % K)
        return  {'N':N, 'R':group.hash((K, IDsrc, IDdest, N), G1) * skid['skid']}
        
    def reEncrypt(self, params, IDsrc, rk, cid):
        H = group.hash((IDsrc, cid['C']), G1)
        if pair(params['g'], cid['S']) != pair(H, cid['C']['A']):
            if debug: print("Re-encryption Failed")
            return None                
        t = group.random(ZR)
        B_ = cid['C']['B'] / (pair(cid['C']['A'], rk['R'] * H ** t)/pair(params['g'] ** t, cid['S']))
        if(debug):
            print('\nRe-ncrypt...')
            print('H => %s' % H)
            print('t => %s' % t)
            print('B\' => %s' % B_)
        return {'A':cid['C']['A'], 'B':B_, 'C':cid['C']['C'], 'IDsrc':IDsrc, 'N':rk['N']}
        
    def decryptSecondLevel(self, params, skid, IDsrc, ID, cid):
        K = pair(group.hash(IDsrc, G1), skid['skid'])
        sigma = cid['B'] * pair(cid['A'], group.hash((K, IDsrc, ID, cid['N']), G1))
        m = cid['C'] ^ h.hashToZn1(sigma)
        r = h.hashToZr1(sigma,m)
        if (cid['A'] != params['g'] ** r):
            if debug: print("Decryption second level Failed")
            return None 
        if(debug):
            print('\nDecrypting Second Level...')
            print('K => %s' % K)
            print('sigma => %s' % sigma)
            print int2Bytes(m) 
        return int2Bytes(m) 


	       		   		
