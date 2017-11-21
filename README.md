# MIP-Docker
### 文件结构
1. Dockerfile 为 docker 容器的配置文件
2. init.sh 为 docker 容器启动时候的默认执行文件，是一些服务启动脚本
3. mip 为控制容器的脚本, 支持 start, install, update 命令来控制容器

### 代码需要挂载外部数据卷
`MIP-Searching
 MIP-FrontEnd
 MIP-Block
 /opt/mongo.properties
`
### 生成　images :　
`sudo docker build -t zuston/mipdocker:0.01 .`
### 启动　container : 
`sudo docker run -p 127.0.0.1:80:80 -p 127.0.0.1:8083:8083 -it -v ~/MIP:/MIP-CODE --name mipCore0.0.1 zuston/mipdocker:0.01 /bin/bash  `
