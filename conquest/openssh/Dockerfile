FROM zhonger/conquest:slurm

LABEL maintainer="zhonger zhonger@live.cn"

# Install ssh-import-id tool
RUN sudo apt update \
    && sudo apt install -y ssh-import-id \
    && sudo service ssh restart

# Clean apt-cache
RUN sudo apt autoremove -y \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]