#!/bin/bash

instances="$(aws elb describe-load-balancers| jq -r '.LoadBalancerDescriptions[].Instances[].InstanceId')"
Instance_arr=($instances)


for i in "${Instance_arr[@]}"
do
   : 
   # do whatever on $i
   #echo $i

   pri_ip="$(aws ec2 describe-instances --instance-id $i | jq --raw-output '.Reservations[].Instances[] | {instance_id : .InstanceId, public_ip_address : .PublicIpAddress, private_ip_address : .PrivateIpAddress}')"
   echo $pri_ip
done