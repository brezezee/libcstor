FROM ubuntu:bionic-20200219

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \ 
    apt-get update && apt-get install -y \
    curl tcpdump dnsutils iputils-ping \
    libaio1 libaio-dev \
    libssl1.0.0 rsyslog net-tools gdb apt-utils \
    sed libjemalloc-dev

# RUN if [ "$TARGETARCH" != "arm64" ]; then \
#     apt-get install -y libkqueue-dev; \
#     fi

RUN apt-get -y install apt-file && apt-file update