#!/bin/bash
sudo systemctl start logstash
while true
do
  STATUS=$(systemctl status logstash)
   if [ $STATUS -eq  Active: active (running) ]; then
	echo "logstash is validated and is up and running"
	break
	else
	echo "logstash is inactive"
fi
done

