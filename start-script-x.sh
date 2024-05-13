#!/bin/bash
export TAG_NAME="TestGroup"
export INSTANCE_ID="`ec2metadata --instance-id`"
export TAG_VALUE="`aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=$TAG_NAME" --output=text | cut -f5`"
whoami >> who_r.log
cd /home/ubuntu/test-scraper
sudo -u ubuntu bash << EOF
git pull
whoami >> who.log
/usr/bin/python3 test.py "${TAG_VALUE}" >> app_scraper.log
EOF