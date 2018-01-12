#!/bin/bash

elbs="$(aws elb describe-load-balancers| jq --raw-output .LoadBalancerDescriptions[].LoadBalancerName)"
elb_arr=($elbs)


for j in "${elb_arr[@]}"
do
   : 
   echo "load-balancer-name: $j"
   instances="$(aws elb describe-load-balancers --load-balancer-names $j | jq -r .LoadBalancerDescriptions[].Instances[].InstanceId)"
   instance_arr=($instances)
   for i in "${instance_arr[@]}"
   do
   	  :
      ip="$(aws ec2 describe-instances --instance-id $i | jq --raw-output '.Reservations[].Instances[] | {instance_id : .InstanceId, public_ip_address : .PublicIpAddress, private_ip_address : .PrivateIpAddress}')"
      echo $ip
   done   	  
done