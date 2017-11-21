# MIP-Docker
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
