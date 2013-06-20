#!/bin/bash

if [ -d /var/www/spice-html5 ];then
echo "spice-html5 exsits"
else
cp -r /home/spice-html5  /var/www/
fi
if [ -d /var/www/iso ];then
echo ""
else
mkdir  /var/www/iso/
fi
