#!/bin/sh

mkdir ~/.ssh
eval `ssh-agent`
ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add


while [[ $(ssh-add -l) = "The agent has no identities." ]]; do
  echo "Waiting for add ssh key"
   sleep 2
done 

echo "open port frowarding"
ssh -i /ssh/${KEY_NAME} -o "StrictHostKeyChecking no" -N -R ${FWD_PORT}:${LOCAL_HOST}:${LOCAL_PORT} ${FWD_HOST}