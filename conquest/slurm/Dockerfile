FROM zhonger/conquest:latest

LABEL maintainer="zhonger zhonger@live.cn"

# Install munge & slurm
RUN sudo apt update \
    && sudo apt install munge slurm-wlm slurm-wlm-doc slurm-wlm-torque -y \
    && sudo rm -rf  /var/spool/slurm-llnl \
    && sudo mkdir /var/spool/slurm-llnl \
    && sudo chown -R slurm.slurm /var/spool/slurm-llnl \
    && sudo rm -rf /var/run/slurm-llnl/ \
    && sudo mkdir /var/run/slurm-llnl/ \
    && sudo chown -R slurm.slurm /var/run/slurm-llnl/

COPY slurm.conf /etc/slurm-llnl/slurm.conf

RUN sudo service munge restart \
    && sudo service slurmd restart \
    && sudo service slurmctld restart

# Clean apt-cache
RUN sudo apt autoremove -y \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
