#!/bin/bash

aws elb describe-load-balancers| jq -r '.LoadBalancerDescriptions[] | {(.LoadBalancerName) : [.Instances[].InstanceId] }'