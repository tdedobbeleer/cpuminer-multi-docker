FROM ubuntu:18.04

ENV DEPENDENCIES=automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++ git

#Dependencies
RUN apt update
RUN apt install -y $DEPENDENCIES

WORKDIR /tmp

#Get lib from git
RUN git clone https://github.com/tpruvot/cpuminer-multi

WORKDIR /tmp/cpuminer-multi

#Make it baby
RUN ./build.sh
RUN cp cpuminer /usr/bin

#Get ready
RUN mkdir /opt/cpuminer
WORKDIR /opt/cpuminer

#Cleanup
RUN rm -rf /tmp/*

CMD ["cpuminer", "--config=/opt/cpuminer/config.json"]

