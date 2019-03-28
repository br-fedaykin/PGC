from attribute_identity import *
from charm.toolbox.pairinggroup import PairingGroup  
#from kerberosimp import *
import hashlib, base64
import subprocess
import os
ID = "shajina.ar@gmail.com"
password1 = "how"
#pwd=encrypt(ID,password1)
ID2 = "varanip@gmail.com"
password2 ="hii"
#encrypt(ID,password2)
#pwd1=encrypt(ID2,password2)
#main1=subprocess.call(['./root/Kerberos_proto/Kerberos_protocol.sh'])
bashcommand = 'bash /root/Kerberos_proto/Kerberos_protocol.sh'

msg = "Welcome to MIT!!!!!" 
group = PairingGroup('SS512', secparam=1024)  
pre = Shajina_Cloud(group)
(master_secret_key, params) = pre.setup()
id_secret_key = pre.keyGen(master_secret_key, ID)
id2_secret_key = pre.keyGen(master_secret_key, ID2)
ciphertext = pre.encrypt(params, ID, msg);
s=pre.decryptFirstLevel(params,id_secret_key, ciphertext, ID)
r=re_encryption_key = pre.rkGen(params,id_secret_key, ID, ID2)
ciphertext2 = pre.reEncrypt(params, ID, re_encryption_key, ciphertext)
y=pre.decryptSecondLevel(params,id2_secret_key,ID, ID2, ciphertext2)

os.system(bashcommand)
#print main1
#print "\n",pwd
#print "\n",pwd1
print "ciphertext",ciphertext
print "id_secret_key", id_secret_key
print "ciphertext2",ciphertext2
print "id2_secret_key", id2_secret_key
print "\n Attribute Encryption - anonymous users",r
#print "\n decryption Owner", s
#print "\n decryption Owner2", y
