#!/bin/bash

# script to update /etc/hosts when the ip address or network interface change
# for the hostname your using
#
# Example Usage:
#
#     andrew@guggenheim:bin $ ./updatehosts.sh 
#
#     current ip address for guggenheim.local:
#       10.1.0.4
#
#     Available IPs: 
#       0: 127.0.0.1
#       1: 192.168.1.5
#       2: 172.16.146.1
#       3: 172.16.252.1
#     Which ip address would you like to assign guggenheim.local? 1
#
#     Enter root password to update /etc/hosts
#     Password:
#     Sorry, try again.
#     Password:
#
#     current ip address for guggenheim.local
#       192.168.1.5

hostname=`hostname`
currentip=`cat /etc/hosts | grep $hostname | awk '{ print $1; }'`
possibleips=(`ifconfig $1 | grep 'inet ' | awk '{ print $2; }'`)

echo ""
echo "current ip address for ${hostname}:"
echo "  ${currentip}"
echo ""
echo "Available IPs: "

for i in ${!possibleips[*]}
do
    echo "  ${i}: ${possibleips[$i]}"
done

echo -n "Which ip address would you like to assign ${hostname}? "
read INPUT

newip=${possibleips[$INPUT]}
cp -p /etc/hosts /tmp/etc_hosts.bak
sed -e s/${currentip}/${newip}/g /tmp/etc_hosts.bak > /tmp/etc_hosts.new

echo ""
echo "Enter root password to update /etc/hosts"
sudo mv /tmp/etc_hosts.new /etc/hosts
exitstatus=$?

if test ${exitstatus} -ne 0; then
    exit ${exitstatus}
else
    currentip=`cat /etc/hosts | grep $hostname | awk '{ print $1; }'`
    echo ""
    echo "current ip address for ${hostname}"
    echo "  ${currentip}"
    exit 0
fi
