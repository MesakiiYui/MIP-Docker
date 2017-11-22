#! /bin/bash

cd /
# 更改权限
chmod -R 755 /MIP-CODE/MIP-FrontEnd
# 软链接到 nginx 目录
ln -s /MIP-CODE/MIP-FrontEnd /MIP/openresty/nginx/html

# 编译 java app
cd /MIP-CODE/MIP-Searching
mvn clean package
nohup java -jar target/materialSpringBoot-1.0-SNAPSHOT.war &

# 启动 nginx
cd /MIP/openresty/nginx/sbin
./nginx -c /MIP-CODE/MIP-Block/conf/nginx.conf


# 启动 redis
nohup redis-server &

# mongo 配置
ln -s /MIP-CODE/mongo.properties /opt/

cd /

tail -f /dev/null
