#!/bin/bash
parameter_text="homepage,productlist"
echo "Starting Instance Manager"
IFS=","
read -r -a parameters <<< "$parameter_text"
echo "Processing ${#parameters[@]} parameter(s)"

# set variables
current_time=$(date +%Y-%m-%d_%H:%M:%S)
instance_name="TestScraper-$current_time"
ami_id=your_ami_id
key_pair_name=your_key_pair_name
sg_id=your_sg_id
ec2_role_name=your_ec2_role_name
local_profile_name=your_local_aws_profile_name

for parameter in "${parameters[@]}"; do
    echo "$parameter"
    # run spot instances with public dns
    aws ec2 run-instances --image-id ${ami_id} \
    --instance-type t2.micro \
    --key-name ${key_pair_name} \
    --instance-market-options 'MarketType=spot,SpotOptions={MaxPrice=0.004}' \
    --security-group-ids ${sg_id} \
    --iam-instance-profile "Name=${ec2_role_name}" \
    --user-data file://init-instance.txt \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${instance_name}},{Key=TestGroup,Value=${parameter}}]" \
    --profile ${local_profile_name} > /dev/null

    # get public dns
    public_dns=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${instance_name}" \
    "Name=tag:TestGroup,Values=${parameter}" \
    --query "Reservations[].Instances[].PublicDnsName" --output text \
    --profile ${local_profile_name})
    echo "${public_dns}"

    # construct ubuntu user and public dns for ssh
    echo "ubuntu@${public_dns}" >> created_host_${current_time}.txt
done