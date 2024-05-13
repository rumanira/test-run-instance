#!/bin/bash
instance_name="TestScraper-$(date +%Y-%m-%d_%H:%M:%S)"
aws ec2 run-instances --image-id your_ami_id \
--instance-type t2.micro \
--key-name your_keypair_name \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids your_security_group_id \
--user-data file://start-script-homepage.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile your_aws_profile > /dev/null

aws ec2 run-instances --image-id your_ami_id \
--instance-type t2.micro \
--key-name your_keypair_name \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids your_security_group_id \
--user-data file://start-script-productlist.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile your_aws_profile > /dev/null