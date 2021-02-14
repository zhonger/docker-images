FROM ubuntu:latest

LABEL maintainer="zhonger zhonger@live.cn"

# Create a no-passowrd sudo user
RUN apt update \
    && apt install -y sudo \
    && useradd -m ubuntu -s /bin/bash && adduser ubuntu sudo \
    && echo "ubuntu ALL=(ALL) NOPASSWD : ALL" | tee /etc/sudoers.d/nopasswd4sudo

# Adjust Timezone
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

USER ubuntu
WORKDIR /home/ubuntu

# Install zsh
RUN sudo apt install -y git zsh \
    && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && sed -i "s/robbyrussell/bira/" ~/.zshrc \
    && sudo usermod -s /bin/zsh ubuntu

# Fix zsh locale
RUN sudo apt install -y locales \
    && sudo locale-gen en_US.UTF-8 \
    && sed -i "3a\export LANG=en_US.utf8" ~/.zshrc \
    && exec zsh

# Clean apt-cache
RUN sudo apt autoremove -y \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/zsh"]
