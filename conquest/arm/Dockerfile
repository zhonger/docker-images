FROM zhonger/ubuntu:arm64

LABEL maintainer="zhonger zhonger@live.cn"

# Install open-mpi etc.
RUN sudo apt update \
    && sudo apt update \
    && sudo apt install -y build-essential gcc gfortran openmpi-bin \
    && sudo apt install -y libopenmpi-dev libxc-dev \
    && sudo apt install -y libblas3 libblas-dev liblapack3 liblapack-dev libatlas-base-dev \
    && sudo apt install -y libscalapack-mpi-dev \
    && sudo apt install -y fftw3 fftw3-dev pkg-config

# Compile CONQUEST
COPY system.make /home/ubuntu/system.make
RUN sudo mkdir -p /opt/softwares \
    && sudo chown -R ubuntu:ubuntu /opt/softwares \
    && cd /opt/softwares \
    && git clone https://github.com/OrderN/CONQUEST-release conquest \
    && cd conquest/src \
    && mv system.make system.make.bak \
    && cp ~/system.make ./system.make \
    && make \
    && cd ../tools/BasisGeneration \
    && mv system.make system.make.bak \
    && mv ~/system.make ./system.make \
    && make 

# Add PATH for CONQUEST
RUN echo "export PATH=/opt/softwares/conquest/bin:\$PATH" >> ~/.zshrc \
    && echo "alias cq=/opt/softwares/conquest/bin/Conquest" >> ~/.zshrc \
    && echo "alias cqion=/opt/softwares/conquest/bin/MakeIonFiles" >> ~/.zshrc

# Clean apt-cache & archive files
RUN sudo apt autoremove -y \
    && sudo apt clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/zsh"]