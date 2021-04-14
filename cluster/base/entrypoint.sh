#!/bin/bash

sudo service munge restart
sudo service slurmctld restart
sudo service slurmd restart
sinfo
/bin/zsh