# syntax=docker/dockerfile:1
FROM ubuntu:xenial AS dmdv3_builder

RUN apt-get update
RUN apt-get install -y  git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev wget
WORKDIR /root
RUN git clone https://github.com/DMDcoin/Diamond.git
WORKDIR /root/Diamond
COPY ubuntufiles/* /root/Diamond/
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:bitcoin/bitcoin -y
RUN apt-get install libdb4.8-dev libdb4.8++-dev bsdmainutils -y
RUN ./autogen.sh --without-gui 
RUN ./configure --without-gui
RUN make
RUN make install

# RUN add-apt-repository ppa:bitcoin/bitcoin && apt-get update && apt-get install libdb4.8-dev libdb4.8++-dev
# RUN ./install_berkley.sh
# RUN  
# 
# RUN echo $pwd


 
# COPY ./nixos /root
#RUN mkdir dmdv3 && curl https://github.com/DMDcoin/Diamond/releases/download/3.0.1.3/diamond-x86_64-linux-gnu_qt5-dev.zip -L -o diamond.zip
#RUN tar -xvzf diamond-x86_64-linux-gnu_qt5-dev.zip -C ./dmdv3
#
# RUN nix-shell
# RUN cd /root 
CMD diamondd