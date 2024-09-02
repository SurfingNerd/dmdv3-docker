# syntax=docker/dockerfile:1
FROM ubuntu:xenial AS dmdv3_builder

RUN apt-get update
RUN apt-get install -y software-properties-common git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev wget
WORKDIR /root
RUN git clone https://github.com/DMDcoin/Diamond.git
WORKDIR /root/Diamond
COPY ubuntufiles/* /root/Diamond/
RUN add-apt-repository ppa:bitcoin/bitcoin -y && apt-get update
RUN apt-get install libdb4.8-dev libdb4.8++-dev bsdmainutils openssl software-properties-common -y
RUN ./autogen.sh --without-gui 
RUN ./configure --without-gui
RUN make
RUN make install


CMD /root/Diamond/init.sh && diamondd