#!/bin/bash
parameter_text="homepage"
echo "Starting Instance Manager"
IFS=","
read -r -a parameters <<< "$parameter_text"
echo "Processing ${#parameters[@]} parameter(s)"

instance_name="TestScraper-$(date +%Y-%m-%d_%H:%M:%S)"
for parameter in "${parameters[@]}"; do
    echo "$parameter"
    aws ec2 run-instances --image-id - \
    --instance-type t2.micro \
    --key-name - \
    --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
    --security-group-ids - \
    --iam-instance-profile "Name=-" \
    --user-data file://init-instance.txt \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}},{Key=TestGroup,Value=${parameter}}]" \
    --profile - > /dev/null
done