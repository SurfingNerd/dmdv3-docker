#!/bin/bash


# creating a random password for the rpcuser and rpcpassword
# only if file /root/.DMDV3/diamond.conf is empty
if [ ! -s /root/.DMDV3/diamond.conf ]; then
  # this command will create the .DMDV3 directory and the diamond.conf file
  diamondd | true  
  echo -e "rpcuser=diamondrpc\nrpcpassword=$(openssl rand -hex 32)" > /root/.DMDV3/diamond.conf
fi