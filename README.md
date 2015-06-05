# tools
# Launch_Skype 
Script for launch skype from a libvirt VM in ssh X11Forward mode.

In start mode:
 - Start Skype VM
 - Mount skypeVM folder to a localFolder
 - Launch skype by ssh X11Forward

In stop mode:
 - Stop skype
 - umount skype local folder
 - shutdown skype VM
Require: screen sudo opensshclient sshfs virsh
