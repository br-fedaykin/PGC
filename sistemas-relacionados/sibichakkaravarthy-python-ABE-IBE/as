#!/usr/bin/env python
#-*- coding: utf-8 -*-
from function import Encryption, Decryption, DicoFromFile
import sys, time, base64

entree = sys.argv[1]

tab_entree = entree.split("#")
IDc = tab_entree[0]
ADc = tab_entree[1]
IDtgs = tab_entree[2]
TS1 = str(int(time.time()))
Duree1 = str(3600)

keys = DicoFromFile()

try:
    Kc = keys[IDc]
except KeyError:
    print "Identifiant inconnu"
    sys.exit(1)
    
try:
    Ktgs = keys[IDtgs]
except KeyError:
    print "TGS "
    sys.exit(1)

TICKETtgs = Encryption(Ktgs, IDc + "#" + ADc + "#" + IDtgs + "#" + TS1 + "#" + Duree1)

result = base64.b64encode(Encryption(Kc, TICKETtgs))
print result