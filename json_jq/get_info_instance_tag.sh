#!/bin/bash

aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId' 

aws ec2 describe-instances | jq -r '.Reservations[].Instances[].Tags' 



s ec2 describe-instances --filters 'Name=tag-value,Values=*-jump01' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag-value,Values=*-dev-*-jump01' | jq -r '.Reservations[].Instances[].InstanceId'
aws ec2 describe-instances --filters 'Name=tag-value,Values=*-stage-*-jump01' | jq -r '.Reservations[].Instances[].InstanceId'

aws ec2 describe-instances --filters 'Name=tag-value,Values=*-jump01' | jq -r '.Reservations[].Instances[].PublicDnsName'
aws ec2 describe-instances --filters 'Name=tag-value,Values=*-dev-*-jump01' | jq -r '.Reservations[].Instances[].PublicDnsName'
aws ec2 describe-instances --filters 'Name=tag-value,Values=*-stage-*-jump01' | jq -r '.Reservations[].Instances[].PublicDnsName'