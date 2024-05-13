#!/bin/bash
parameter_text="homepage,productlist"
echo "Starting Instance Manager"
IFS=","
read -r -a parameters <<< "$parameter_text"
echo "Processing ${#parameters[@]} parameter(s)"

instance_name="TestScraper-$(date +%Y-%m-%d_%H:%M:%S)"
for parameter in "${parameters[@]}"; do
    echo "$parameter"
    aws ec2 run-instances --image-id your_ami_id \
    --instance-type t2.micro \
    --key-name your_key_pair_name \
    --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
    --security-group-ids your_sg_id \
    --iam-instance-profile "Name=YourInstance_profile_name" \
    --user-data file://start-script-x.txt \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}},{Key=TestGroup,Value=${parameter}}]" \
    --profile your_profile > /dev/null
done