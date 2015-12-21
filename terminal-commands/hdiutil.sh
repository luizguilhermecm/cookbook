# Usage: hdiutil <verb> <options>
# <verb> is one of the following:
# help 
# attach 
# detach 
# eject 
# verify 
# create 
# compact 
# convert 
# burn
# info 
# checksum 
# chpass 
# erasekeys 
# unflatten 
# flatten
# imageinfo
# internet-enable
# isencrypted
# makehybrid
# mount
# mountvol
# unmount
# plugins
# resize
# segment
# pmap
# udifderez
# udifrez



hdiutil create encrypted.dmg -encryption -size 1g -volname "Encrypted Disk Image" -fs JHFS+