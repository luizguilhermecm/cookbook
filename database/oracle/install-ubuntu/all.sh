sudo apt-get install alien libaio1 unixodbc

sudo alien --scripts oracle-xe-11.2.0-1.0.x86_64.rpm

sudo cp chkconfig /sbin/

# sudo touch /sbin/chkconfig

# sudo gedit /sbin/chkconfig
# 
# #!/bin/bash
# # Oracle 11gR2 XE installer chkconfig hack for Ubuntu file=/etc/init.d/oracle-xe
# if [[ ! `tail -n1 $file | grep INIT` ]]; then
#     echo >> $file
#     echo '### BEGIN INIT INFO' >> $file
#     echo '# Provides: OracleXE' >> $file
#     echo '# Required-Start: $remote_fs $syslog' >> $file
#     echo '# Required-Stop: $remote_fs $syslog' >> $file
#     echo '# Default-Start: 2 3 4 5' >> $file
#     echo '# Default-Stop: 0 1 6' >> $file
#     echo '# Short-Description: Oracle 11g Express Edition' >> $file 
#     echo '### END INIT INFO' >> $file
# fi
# 
# update-rc.d oracle-xe defaults 80 01 #EOF


sudo chmod 755 /sbin/chkconfig

sudo cp 60-oracle.conf /etc/sysctl.d

#sudo touch /etc/sysctl.d/60-oracle.conf 

#sudo gedit /etc/sysctl.d/60-oracle.conf
#
## Oracle 11g XE kernel parameters
#fs.file-max=6815744 
#net.ipv4.ip_local_port_range=9000 65000 
#kernel.sem=250 32000 100 128 
#kernel.shmmax=536870912

sudo service procps start

sudo ln -s /usr/bin/awk /bin/awk
sudo rm -rf /dev/shm
sudo mkdir /dev/shm
sudo mount -t tmpfs shmfs -o size=2048m /dev/shm 

sudo mkdir /var/lock/subsys
sudo touch /var/lock/subsys/listener

sudo cp S10oracle-mount /etc/rc2.d

#sudo touch /etc/rc2.d/S10oracle-mount
#sudo gedit /etc/rc2.d/S10oracle-mount



# #! /bin/sh
# ### BEGIN INIT INFO
# # Provides: Creates Oracle mount point # Required-Start:
# # Required-Stop:
# # Default-Start: 2 3 4 5
# # Default-Stop: 0 1 6
# # Short-Description: Used for Oracle installation # Description: Used for Oracle installation 
# ### END INIT INFO
# 
# # Aktionen
# case "$1" in 
#     start)
#         mkdir /var/lock/subsys 2>/dev/null 
#         touch /var/lock/subsys/listener 
#         rm /dev/shm 2>/dev/null
#         mkdir /dev/shm 2>/dev/null
#         mount -t tmpfs shmfs -o size=2048m /dev/shm
#         ;; 
#     stop)
#         ;; 
#     restart)
#         ;;
# esac 
# exit 0


sudo chmod 755 /etc/rc2.d/S10oracle-mount

sudo dpkg -i oracle-xe_11.2.0-2_amd64.deb

sudo /etc/init.d/oracle-xe configure

sudo gedit /etc/bash.bashrc

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe 
export ORACLE_SID=XE
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib
export PATH=$ORACLE_HOME/bin:$PATH

sudo service oracle-xe start


