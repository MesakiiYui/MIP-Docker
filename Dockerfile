FROM harisekhon/ubuntu-java
MAINTAINER Zuston (github.com/zuston)
LABEL Description="MIP Searching Runtime Container"

# install some packages
RUN apt-get install -y libpcre3-dev \
    libssl-dev perl make build-essential curl maven redis-server wget

# environment params
ENV APP_HOME /MIP
ENV CODE_HOME /MIP-CODE

# install openresty
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN wget https://openresty.org/download/openresty-1.11.2.1.tar.gz
RUN tar -zxvf openresty-1.11.2.1.tar.gz
WORKDIR openresty-1.11.2.1
RUN ./configure --prefix=/$APP_HOME/openresty \
            --with-pcre-jit \
            --with-ipv6 \
            --without-http_redis2_module \
            -j2
RUN make -j2
RUN make install

# expose some ports
# webservice
EXPOSE 80

# springboot port
EXPOSE 8083

#redis port
EXPOSE 6379

# checkout main folder
WORKDIR $APP_HOME
# add the init script
ADD init.sh $APP_HOME/


CMD ["sh","init.sh"]

