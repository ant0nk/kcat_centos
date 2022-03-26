FROM centos:centos7.9.2009

COPY confluent.repo /etc/yum.repos.d/

RUN rpm --import https://packages.confluent.io/rpm/7.0/archive.key && \
    yum update -y && \
    yum group install -y "Development Tools" && \
    yum install -y cmake \
    yum install -y librdkafka-devel \
    yum install -y git which cyrus-sasl-devel cmake libcurl-devel

RUN git clone https://github.com/edenhill/kcat.git && \
    cd kcat/ && \
    ./bootstrap.sh && \
    ./kcat -h