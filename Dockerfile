FROM ubuntu
MAINTAINER henri bouvier

RUN apt-get -y update

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 505A7412
RUN echo "deb [arch=amd64] http://s3.amazonaws.com/tokumx-debs $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/tokumx.list
RUN sudo apt-get update -y
RUN sudo apt-get install -y tokumx

ADD ./etc /etc

VOLUME /var/lib/tokumx
VOLUME /var/log/tokumx
VOLUME /var/run/tokumx
VOLUME /usr/lib/tokumx/plugins

EXPOSE 27017
EXPOSE 28017
CMD /usr/bin/mongod --config /etc/tokumx.conf --pidfilepath /var/run/tokumx/tokumx.pid
