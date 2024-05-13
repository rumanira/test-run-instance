#!/bin/bash
parameter_text="homepage"
echo "Starting Instance Manager"
IFS=","
read -r -a parameters <<< "$parameter_text"
echo "Processing ${#parameters[@]} parameter(s)"

instance_name="TestScraper-$(date +%Y-%m-%d_%H:%M:%S)"
for parameter in "${parameters[@]}"; do
    echo "$parameter"
    aws ec2 run-instances --image-id ami-09f7e910b38c382b8 \
    --instance-type t2.micro \
    --key-name rmnr-dev-key-sg \
    --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
    --security-group-ids sg-09f67f77703a27c65 \
    --iam-instance-profile "Name=RmnrTestScraperEC2Role" \
    --user-data file://start-script-x.txt \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}},{Key=TestGroup,Value=${parameter}}]" \
    --profile arie-rmnr-mgmt > /dev/null
done