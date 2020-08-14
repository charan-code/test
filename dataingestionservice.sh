#!/bin/bash
#installing logstash
sudo wget https://artifacts.elastic.co/downloads/logstash/logstash-6.2.0.deb
sudo dpkg -i logstash-6.2.0.deb
sudo apt-get install logstash=6.2.0
systemctl enable logstash
cp /home/Nouvis-Installer/logstash.properties /etc/logstash/pipelines.yml
cd /home/
mkdir nouvisinstalled
cd /home/nouvisinstalled
mkdir logstash_conf
cd /home/nouvisinstalled/logstash_conf
mkdir logstash_custom_config
cp -a /home/logstash_custom_conf1/. /home/nouvisinstalled/logstash_conf/logstash_custom_config
cd /home/nouvisinstalled/logstash_conf
mkdir logs
cd /home/nouvisinstalled/logstash_conf/logs
cp -a /home/Nouvis-Installer/samplelogs/. /home/nouvisinstalled/logstash_conf/logs
#mkdir feature
#cd /home/nouvisinstalled/logstash_conf/logs/feature
#touch feature.csv
#cd /home/nouvisinstalled/logstash_conf/logs
#mkdir fusion
#cd /home/nouvisinstalled/logstash_conf/logs/fusion
#touch fusion.csv
cd /home/nouvisinstalled/logstash_conf
mkdir data
mv /home/Nouvis-Installer/logstash-6.2.0.deb /home/Nouvis-Installer/temp


