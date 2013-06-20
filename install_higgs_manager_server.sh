#!/bin/sh

if [ $# -eq 0 ];then
    echo "Waiting for configuring..."
    sed -i '/exit 0/d' /etc/rc.local
    echo "/usr/sbin/apache2ctl start" >> /etc/rc.local
    echo "./home/expect.sh" >> /etc/rc.local
    echo "exit 0" >> /etc/rc.local
    
    echo "python ~/set_keychain.py" >> /root/.bashrc
    echo "source ~/.ssh-agent >/dev/null" >> /root/.bashrc
    echo "ps axu | grep -v 'grep' | egrep \"8080\"|awk '{system(\"kill -9 \"\$2)}'" >> /root/.bashrc
    echo "sh ~/check_spice.sh" >> /root/.bashrc
    echo "ntpdate 192.168.103.254" >> /root/.bashrc
    echo "nohup python /root/vmm/manage.py runserver 0:8080 &" >> /root/.bashrc
    
    cp -r vmm    /root/
    cp -r horizon  /root/
    cp -r spice-html5 /home/
    cp check_spice.sh  /root/
    cp set_keychain.py /root/
    cp expect.sh  /home/
    cp HiggsManageBroker.conf  /etc/
    cp HiggsHyper.pem  /etc/
    mkdir /home/iso/

    echo "Waiting for installing Django-1.4.5..."
    tar xvzf Django-1.4.5.tar.gz
    cd Django-1.4.5
    sudo python setup.py install

    apt-get update
    echo "Waiting for installing python-memcached..."
    apt-get install python-setuptools -y
    easy_install-2.7 python-memcached
    
    echo "Waiting for installing django-compressor..."
    apt-get install python-pip -y
    pip install django_compressor

    echo "Waiting for installing python-libvirt..."
    apt-get install python-libvirt -y

    echo "Waiting for installing python-ldap..."
    apt-get install python-ldap -y

    echo "Waiting for installing python-m2crypto..."
    apt-get install python-m2crypto -y

    echo "Waiting for installing nodejs..."
    apt-get install nodejs -y

    echo "Waiting for installing sshpass..."
    apt-get install sshpass -y

    echo "Waiting for installing keychain..."
    apt-get install keychain -y

    echo "Waiting for installing expect..."
    apt-get install expect -y

    echo "Waiting for installing nfs-kernel-server..."
    apt-get install nfs-kernel-server -y

    echo "Waiting for installing nfs-common..."
    apt-get install nfs-common -y

    echo "Waiting for installing apache2..."
    apt-get install apache2 -y
    
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
    echo "/home/iso        *(ro,sync)" >> /etc/exports
    chmod 777 -R /home/iso
    exportfs -r
    echo "The system will be restart..."
    reboot

else
    echo "Error:need no arguments,please try it again."
fi

