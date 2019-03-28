# Attribute-based-and-identity-based
Attibute based Encryption and Identity based Authentication - A hybrid Scheme

Dependencies

Glib
pycharm
Cygwin - Install Gcc,g++ (incase of Windows)
pip
  hashlib\
  base64\

Error
if you find any exception like this "lib.so cannot open shared object file" , please config the LDLIBRARY path and export it
LD_LIBRARY_PATH = /usr/lib/
export LD_LIBRARY_PATH

Server:

Syntax
python ServerMain.py <port>
Example
python ServerMain.py 8080

Client:

Syntax
python MultiClient.py localhost:8080 <user> <password> <instance>
Example
python multiClient.py localhost:8080 sibi sibi commit


Adding Users
You can add multiple users in Server.py
