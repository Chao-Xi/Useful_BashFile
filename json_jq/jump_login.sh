#!/bin/bash

#source ~/bashscript/ssh_agent.sh

PublicDnsName="$(aws ec2 describe-instances --filters 'Name=tag-value,Values=*-dev-*-jump01' | jq -r '.Reservations[].Instances[].PublicDnsName')"
#PublicDnsName="$(aws ec2 describe-instances --filters 'Name=tag-value,Values=*-stage-*-jump01' | jq -r '.Reservations[].Instances[].PublicDnsName')"
jump_dns="jxi@$PublicDnsName"

#echo $jump_dns
ssh -A $jump_dns