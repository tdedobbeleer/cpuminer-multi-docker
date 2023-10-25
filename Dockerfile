FROM ubuntu:18.04

ENV DEPENDENCIES="automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev make g++"

#Dependencies
RUN apt update
RUN apt install -y git
RUN apt install -y $DEPENDENCIES

WORKDIR /tmp

#Get lib from git
RUN git clone https://github.com/tpruvot/cpuminer-multi

#Get ready
RUN mkdir /opt/cpuminer
WORKDIR /opt/cpuminer

ADD mine.sh /mine.sh
RUN chmod u+x /mine.sh

#Clean
RUN apt remove -y git

CMD ["/mine.sh"]

