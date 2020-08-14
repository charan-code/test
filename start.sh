#!/bin/bash
#start elasticsearch
systemctl start elasticsearch.service
sleep 15
#curl -X GET "localhost:9200"
while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:9200)
  if [ $STATUS -eq 200 ]; then
    echo "Data storage service is successfully validated and started and is running on 9200 port"
    break
  else
    echo "Got $STATUS :( Not done yet..."
  fi
  sleep 10
done
#start kibana
sudo -i service kibana start
sleep 10
#curl -X GET "localhost:5601"
while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost:5601)
  if [ $STATUS -eq 200 ]; then
    echo "Data Visualization Service is successfully validated and running on port 5601"
    break
  else
    echo "Got $STATUS :( Not done yet..."
  fi
  sleep 10
done

#echo "succesfully started kibana"
#systemctl status logstash
#echo "successfully started logstash"
