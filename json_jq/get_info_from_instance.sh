#!/bin/bash

#Show the private_ip_address by instance id
#aws ec2 describe-instances --instance-id instanec_id|jq --raw-output .Reservations[].Instances[].PrivateIpAddress

#show private ip address of the instance
aws ec2 describe-instances --instance-id instance_id | jq --raw-output '.Reservations[].Instances[] | {private_ip_address : .PrivateIpAddress}'

#show both public address and private address of the instance
aws ec2 describe-instances --instance-id instance_id jq --raw-output '.Reservations[].Instances[] | {public_ip_address : .PublicIpAddress, private_ip_address : .PrivateIpAddress}'
aws ec2 describe-instances --instance-id i-0bee956b343bebb10| jq -r '.Reservations[].Instances[] | {public_ip_address : .PublicIpAddress, private_ip_address : .PrivateIpAddress}'
