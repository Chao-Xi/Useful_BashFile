#!/bin/bash
aws elb describe-load-balancers| jq --raw-output .LoadBalancerDescriptions[].LoadBalancerName
#List all instances inside one elb
#aws elb describe-load-balancers --load-balancer-names elb_name| jq --raw-output .LoadBalancerDescriptions[].Instances[].InstanceId

#Show the private_ip_address by instance id
#aws ec2 describe-instances --instance-id instanec_id|jq --raw-output .Reservations[].Instances[].PrivateIpAddress

#List the first load balancer with all its instances
aws elb describe-load-balancers| jq --raw-output '.LoadBalancerDescriptions[0] | {Name: .LoadBalancerName, Instances: .Instances[].InstanceId}'


#List the all elastic load balancer with all their instances
aws elb describe-load-balancers| jq --raw-output '[.LoadBalancerDescriptions[] | {Name: .LoadBalancerName, Instances: .Instances[].InstanceId}]'


#List all elastic load balancer and every elb with its all instances
aws elb describe-load-balancers| jq -r '.LoadBalancerDescriptions[] | {(.LoadBalancerName) : [.Instances[].InstanceId] }'

#Add [] outside the output
aws elb describe-load-balancers| jq -r '[.LoadBalancerDescriptions[] | {(.LoadBalancerName) : [.Instances[].InstanceId] }]'


#Get all instances from elb
aws elb describe-load-balancers| jq -r '.LoadBalancerDescriptions[].Instances[].InstanceId'