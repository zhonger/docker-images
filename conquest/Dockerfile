FROM zhonger/oneapi-hpckit:latest

LABEL maintainer="zhonger zhonger@live.cn"

# Install open-mpi
RUN sudo apt update \
    && sudo apt install -y wget \
    && sudo mkdir -p /opt/softwares /opt/openmpi /opt/fftw3 \
    && sudo chown -R ubuntu:ubuntu /opt/openmpi /opt/softwares /opt/fftw3 \
    && cd /opt/softwares \
    && wget -c https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.0.tar.gz \
    && tar zxvf openmpi-4.1.0.tar.gz \
    && cd openmpi-4.1.0 \
    && ./configure --prefix=/opt/openmpi \
    && make -j 128 \
    && make install

# Install fftw3
RUN cd /opt/softwares \
    && wget -c http://www.fftw.org/fftw-3.3.9.tar.gz \
    && tar zxvf fftw-3.3.9.tar.gz \
    && cd fftw-3.3.9 \
    && ./configure --prefix=/opt/fftw3 \
    && make -j 128 \
    && make install

# Add PATH for open-mpi & fftw3
RUN echo "export PATH=/opt/openmpi/bin:/opt/fftw3/bin:\$PATH" >> ~/.zshrc \
    && echo "export MKLROOT=/opt/intel/oneapi/mkl/latest" >> ~/.zshrc \
    && echo "export LD_LIBRARY_PATH=/opt/openmpi/lib:/opt/fftw3/lib:\$LD_LIBRARY_PATH" >> ~/.zshrc \
    && echo "export LIBRARY_PATH=/opt/openmpi/lib:/opt/fftw3/lib:\$LIBRARY_PATH" >> ~/.zshrc

# Compile CONQUEST
COPY system.make /home/ubuntu/system.make
ENV PATH=/opt/openmpi/bin:/opt/fftw3/bin:$PATH
ENV LD_LIBRARY_PATH=/opt/openmpi/lib:/opt/fftw3/lib:$LD_LIBRARY_PATH
ENV LIBRARY_PATH=/opt/openmpi/lib:/opt/fftw3/lib:$LIBRARY_PATH
RUN cd /opt/softwares \
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
    && sudo rm -rf /var/lib/apt/lists/* \
    && rm /opt/softwares/*.tar.gz

ENTRYPOINT ["/bin/zsh"]