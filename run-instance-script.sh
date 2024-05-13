#!/bin/bash
instance_name="TestScraper-$(date +%Y-%m-%d_%H:%M:%S)"
aws ec2 run-instances --image-id ami-02512749e345170c5 \
--instance-type t2.micro \
--key-name rmnr-dev-key-sg \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids sg-09f67f77703a27c65 \
--user-data file://start-script-homepage.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile arie-rmnr-mgmt > /dev/null

aws ec2 run-instances --image-id ami-02512749e345170c5 \
--instance-type t2.micro \
--key-name rmnr-dev-key-sg \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids sg-09f67f77703a27c65 \
--user-data file://start-script-productlist.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile arie-rmnr-mgmt > /dev/null

aws ec2 run-instances --image-id ami-02512749e345170c5 \
--instance-type t2.micro \
--key-name rmnr-dev-key-sg \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids sg-09f67f77703a27c65 \
--user-data file://start-script-productdetail.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile arie-rmnr-mgmt > /dev/null

aws ec2 run-instances --image-id ami-02512749e345170c5 \
--instance-type t2.micro \
--key-name rmnr-dev-key-sg \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids sg-09f67f77703a27c65 \
--user-data file://start-script-rating.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile arie-rmnr-mgmt > /dev/null

aws ec2 run-instances --image-id ami-02512749e345170c5 \
--instance-type t2.micro \
--key-name rmnr-dev-key-sg \
--instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
--security-group-ids sg-09f67f77703a27c65 \
--user-data file://start-script-review.txt \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}}]" \
--profile arie-rmnr-mgmt > /dev/null