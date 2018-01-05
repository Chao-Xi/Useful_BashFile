#!/bin/bash
pkill ssh-agent
unset SSH_AGENT_PID
unset SSH_AUTH_SOCK

if [ -z "$SSH_AUTH_SOCK" ] ; then
  
  echo "Clean local SSH_AGENT_PID & SSH_AUTH_SOCK"
  
  #unset SSH_AGENT_PID
  #unset SSH_AUTH_SOCK

  eval `ssh-agent -s`

  ssh-add -K ~/.ssh/id_rsa
  
fi
#remember use source ./ssh_agent.sh
#eval `ssh-agent -k` # kill the process