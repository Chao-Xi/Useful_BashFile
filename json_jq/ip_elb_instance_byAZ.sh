#!/bin/bash

elbs="$(aws elb describe-load-balancers| jq -r .LoadBalancerDescriptions[].LoadBalancerName)"
elb_arr=($elbs)
BLUE='\033[0;96m'
NC='\033[0m' 

for j in "${elb_arr[@]}"
do
   : 
   echo -e "${BLUE}load-balancer-name: $j ${NC}"
   instances="$(aws elb describe-load-balancers --load-balancer-names $j | jq -r .LoadBalancerDescriptions[].Instances[].InstanceId)"
   instance_arr=($instances)
   for i in "${instance_arr[@]}"
   do
   	  :
      ip="$(aws ec2 describe-instances --instance-id $i | jq -r '.Reservations[].Instances[] | {instance_id : .InstanceId, public_ip_address : .PublicIpAddress, private_ip_address : .PrivateIpAddress}')"
      echo $ip
   done   	  
done