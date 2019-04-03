import socket
from utils import hash_function
#from subprocess import Popen, CREATE_NEW_CONSOLE
import subprocess

host = '127.0.0.1'
port = 9899
size = 1024

secret = 'shaji'

cc = 'client-challenge'
cr = ''
sc = ''

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((host,port))

# client asking the server for authentication
sock.send('AUTH')

# client verifies the expected value of 'sr'
def check_sr(sr, sc):
	return sr == hash_function(sc + cc + secret)

while True:
	data = sock.recv(size)

	# server challenge in responce to the 'AUTH' request
	if 'SC.' in data:
		sc = data[3:]
		cr = hash_function(cc + sc + secret)

		# client sends 'cr' and 'cc' to the server
		sock.send('CR.' + cr + 'CC.' + cc)

	# server sends 'sr'
	if 'SR.' in data:
		sr = data[3:]

		if check_sr(sr, sc):
			print('TRUE')
			print('Authenticated Successfully')
			#Popen([executable, 'python hybrid_attr_iden_main.py'], creationflags=CREATE_NEW_CONSOLE)
			subprocess.call('python hybrid_attr_iden_main.py', shell=True)
		else:
			print(e)

	# client receive an error response
	if 'ERROR' in data:
		print('CLIENT ERROR')
		break

sock.close()
