#!/bin/bash

sudo service munge restart
sudo service slurmctld restart
sudo service slurmd restart
sinfo

ssh-import-id gh:$GITHUB_NAME
sudo service ssh start
/bin/zsh