FROM ubuntu:18.04

#Dependencies
RUN apt update
RUN apt install -y automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++ git

WORKDIR /tmp

#Get lib from git
RUN git clone https://github.com/tpruvot/cpuminer-multi && cd cpuminer-multi

#Make it baby
RUN ./build.sh
RUN cp /tmp/cpuminer /usr/bin

#Get ready
RUN mkdir /opt/cpuminer
WORKDIR /opt/cpuminer

CMD ["cpuminer", "--config=/opt/cpuminer/config.json"]

