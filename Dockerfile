FROM arm32v7/debian:jessie

MAINTAINER Hendrik Belitz (hendrik@hendrikbelitz.de)

RUN apt-get update && \ 
 DEBIAN_FRONTEND=noninteractive apt-get install -y wget lsb-release apt-utils && \
 wget -q "https://labs.consol.de/repo/stable/RPM-GPG-KEY" -O - | apt-key add - && \
 echo "deb http://labs.consol.de/repo/stable/debian $(lsb_release -cs) main" > /etc/apt/sources.list.d/labs-consol-stable.list 
RUN apt-get update && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y omd-2.40-labs-edition 
EXPOSE 5000/tcp
WORKDIR /app
RUN omd setup 
RUN groupadd -g 6000 mon && useradd -g 6000 -u 6000 -ms /bin/bash -d /omd/sites/mon mon && \
    usermod -aG mon www-data && usermod -aG omd mon
COPY *.sh /app/
RUN /app/init.sh
CMD ["sh", "/app/run.sh"]

