FROM bazel/dependencies:buster-java

RUN apt-get install -y --no-install-recommends gnupg dirmngr
# https://wiki.apache.org/cassandra/DebianPackaging
RUN apt-key adv --no-tty --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-key 0xF8358FA2F2833C93
#RUN apt-key adv --no-tty --keyserver pool.sks-keyservers.net --recv-key 0xF758CE318D77295D
#RUN apt-key adv --no-tty --keyserver pool.sks-keyservers.net --recv-key 0x4BD736A82B5C1B00
#RUN apt-key adv --no-tty --keyserver pool.sks-keyservers.net --recv-key 0x749D6EEC0353B12C
RUN apt-key adv --no-tty --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-key 0xA278B781FE4B2BDA
RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" > /etc/apt/sources.list.d/cassandra.list

RUN apt-get update
RUN apt-get purge -y gnupg dirmngr
RUN apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y