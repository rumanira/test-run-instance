#!/bin/bash
export TAG_NAME="TestGroup"
export INSTANCE_ID="`ec2metadata --instance-id`"
export TAG_VALUE="`aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=$TAG_NAME" --output=text | cut -f5`"
cd /home/ubuntu/test-scraper
exit_code=1
while [ $exit_code -ne 0 ]; do
    /usr/bin/python3 test.py "${TAG_VALUE}" >> app_scraper.log
    exit_code=$?
    echo "Script exited with code: ${exit_code}"
done