FROM harisekhon/ubuntu-java
MAINTAINER Zuston (github.com/zuston)
LABEL Description="MIP Searching Runtime Container"


RUN apt-get install -y wget

RUN apt-get install -y libpcre3-dev \
    libssl-dev perl make build-essential curl maven

RUN mkdir /MIP
WORKDIR /MIP
RUN wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
RUN tar -zxvf openresty-1.11.2.1.tar.gz
WORKDIR openresty-1.11.2.1
RUN ./configure --prefix=/MIP/openresty \
            --with-pcre-jit \
            --with-ipv6 \
            --without-http_redis2_module \
            -j2
RUN make -j2
RUN make install

VOLUME ~/MIP:/MIP-CODE
EXPOSE 80
EXPOSE 8083
CMD /bin/bash
