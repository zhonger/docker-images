#!/bin/bash

usermod -u 1153 ubuntu
groupmod -g 1153 ubuntu 
chown -R ubuntu:ubuntu /opt/openmpi /opt/fftw3 /opt/softwares /home/ubuntu