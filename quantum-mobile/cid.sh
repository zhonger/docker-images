#!/bin/bash

#usermod -u 1153 max
#groupmod -g 1153 users
chown -R max:users /home/max
sudo service postgresql start
sudo service rabbitmq-server start
workon aiida
verdi daemon start