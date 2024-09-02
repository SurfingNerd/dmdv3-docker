# DMD Diamonds v3 Docker
a simple docker container for DMD Diamonds V3 Node Software and client tool.
The Diamond Node Software is initializing itself allows the execution of diamond-cli commands.


after starting the docker,
you can use docker to execute commands inside the container:

example: (running docker instance is musing_brattain in this example)
```
docker exec musing_brattain diamond-cli getnewaddress
> dHdvTfdZTnrrtkNYchaCFozED2YMY2YJP2

docker exec musing_brattain diamond-cli signmessage "dHdvTfdZTnrrtkNYchaCFozED2YMY2YJP2" "claim to: 0xbb753f1126c2463Ac29e175B180dAE7F7f627fA4"
> IH2kL87nB3j0hb4+wk+k4HYfXv4eXjkksanWw+CdtO+8XxQ8Ut/oHPV7UMjOKc/NvKTsE55p9DgmqxkK9MpZWP8=
```