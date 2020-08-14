#!/bin/bash
sudo apt-get remove elasticsearch
sudo apt-get --purge autoremove elasticsearch
#sudo rm -rf /var/lib/elasticsearch/
#sudo rm -rf /etc/elasticsearch
#sudo apt-get remove logstash
#sudo apt-get --purge autoremove logstash
#sudo rm -rf /var/lib/logstash
#sudo rm -rf /var/log/logstash
#cd /home/charan/Nouvis_Installed
#sudo rm -R kibana-6.2.0-linux-x86_64
#cd /home/charan/Nouvis_Installed
#sudo rm kibana-6.2.0-linux-x86_64.tar.gz
sudo apt-get remove kibana
sudo apt-get --purge autoremove kibana
cd /var/lib
rm -R kibana/
cd /var/lib
rm -R elasticsearch/
cd /etc/apt/sources.list.d/
rm elastic-6.x.list

 
