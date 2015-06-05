#!/bin/bash
vmname="VM_Skype"
user="iya"
ip="10.10.10.10"
skypepath="/home/skype"
localpath="/mnt/skype"
screenname="skype"
command="skype"
if [ $1 = "start" ]
then
	sudo virsh start $vmname
	sleep 10
	sshfs $user@$ip:$skypepath $localpath
	screen -dmS $screenname ssh -X $user@$ip
	sleep 1
	screen -S $screenname -p 0 -X stuff "$command$(printf \\r)"
elif [ $1 = "stop" ]
then
	screen -S $screenname -p 0 -X stuff "^C$(printf \\r)"
	screen -S $screenname -p 0 -X stuff "exit$(printf \\r)"
	fusermount -u $localpath
	sudo virsh shutdown $vmname
else
	echo "Use start or stop"
fi
