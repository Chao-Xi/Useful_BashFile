#!/bin/bash
aws elb describe-load-balancers| jq --raw-output .LoadBalancerDescriptions[].LoadBalancerName
#List all instances inside one elb
#aws elb describe-load-balancers --load-balancer-names elb_name| jq --raw-output .LoadBalancerDescriptions[].Instances[].InstanceId

#Show the private_ip_address by instance id
#aws ec2 describe-instances --instance-id instanec_id|jq --raw-output .Reservations[].Instances[].PrivateIpAddress