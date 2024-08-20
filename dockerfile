# syntax=docker/dockerfile:1
FROM alpine:latest AS dmdv3_builder
RUN apk add unzip wget curl
RUN echo $pwd
RUN mkdir dmdv3 && curl https://github.com/DMDcoin/Diamond/releases/download/3.0.1.3/diamond-x86_64-linux-gnu_qt5-dev.zip -L -o diamond.zip
#RUN tar -xvzf diamond-x86_64-linux-gnu_qt5-dev.zip -C ./dmdv3
RUN unzip diamond -d dmdv3
RUN pwd
RUN cd dmdv3 && ls

CMD /dmdv3/diamond-cli --version