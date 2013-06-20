
import os
import re
import getpass

user = getpass.getuser()
if user == 'root':
	home_dir = '/root/'
else:
	home_dir = '/home/' + user

ssh_dir = home_dir + '.ssh/'

if os.path.exists(ssh_dir):
	for key in os.listdir(ssh_dir):
		if key[:6] == 'id_rsa' and key[-4:] != '.pub':
			os.system("/usr/bin/keychain %s %s" % (key, key))

os.system("/usr/bin/keychain --eval > ~/.ssh-agent")
os.system("chmod +x ~/.ssh-agent")


