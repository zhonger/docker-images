FROM marvelnccr/quantum-mobile:20.11.2a

LABEL maintainer="zhonger zhonger@live.cn"

# Install ssh-import-id tool
RUN sudo apt update \
    && sudo apt install -y ssh-import-id \
    && sudo service ssh restart

# Adjust Timezone
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

USER max
WORKDIR /home/max

# Install zsh
RUN sudo apt install -y git zsh \
    && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && sudo usermod -s /bin/zsh max

# Fix zsh locale
RUN sudo apt install -y locales \
    && sudo locale-gen en_US.UTF-8 \
    && sed -i "3a\export LANG=en_US.utf8" ~/.zshrc \
    && exec zsh

# Add PATH 
RUN echo "export PATH=$PATH:${HOME}/.local/bin" >> ~/.zshrc \
    && echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.7" >> ~/.zshrc \
    && echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.zshrc \
    && echo "TZ='Asia/Tokyo'; export TZ" >> ~/.zshrc

# Clean apt-cache
RUN sudo apt autoremove -y \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

ADD cid.sh /usr/bin/cid.sh

ENTRYPOINT ["/lib/systemd/systemd"]