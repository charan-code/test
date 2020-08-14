#!/bin/bash
sudo -n true
if [ $? -ne 0 ]
then
echo "This script requires user to have passwordless sudo access"
exit
fi
java -version
if [ $? -ne 0 ]
then
# Installing Java 8 if it's not installed
sudo apt-get install openjdk-8-jre-headless -y
fi
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update
sudo apt-get install elasticsearch=6.2.0
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
# change elasticsearch cluster config
#sudo sed -i 's/#network.host: 192.168.0.1/network.host: ["localhost:9200"]/' /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's/#cluster.name: my-application/cluster.name: charan-cluster/' /etc/elasticsearch/elasticsearch.yml
#sudo sed -i 's/#node.name: node-1/node.name: '$MY_HOSTNAME'/' /etc/elasticsearch/elasticsearch.yml
# Starting The Services
sudo systemctl start elasticsearch.service
sleep 35
#validate elastic search
while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:9200)
  if [ $STATUS -eq 200 ]; then
    echo "Data storage service is successfully installed and validated"
    break
  else
    echo "Got $STATUS :( Not done yet, kindly Wait for few seconds to become succesful"
  fi
  sleep 10
done
#install and validate kibana
sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.0-amd64.deb
sudo dpkg -i kibana-6.2.0-amd64.deb
sudo -i service kibana start
sleep 10
while true
do
 STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:5601)
  if [ $STATUS -eq 200 ]; then
    echo "Data Visualization is successfully installed and validated and is running on 5601 port"
    break
  else
    echo "Got $STATUS :( Not done yet, Kindly wait for few seconds to complete"
  fi
  sleep 10
done
#mv /home/Nouvis-Installer/kibana-6.2.0-amd64.deb /home/Nouvis-Installer/temp
	




