#!/bin/bash

#aws elb describe-load-balancers --load-balancer-name 
aws elb describe-load-balancers --load-balancer-name elb_name | jq -r '.LoadBalancerDescriptions[] | .Instances[].InstanceId'