# MIP-Docker
### 文件结构
1. Dockerfile 为 docker 容器的配置文件
2. init.sh 为 docker 容器启动时候的默认执行文件，是一些服务启动脚本
3. mip 为控制容器的脚本, 支持 start, install, update 命令来控制容器
### quick start
1. 把以下的代码 git clone 到 ~/MIP 下，包括 mongo 的配置文件  
`mkdir ~/MIP`  
`git clone git@github.com:zuston/MIP-Searching.git`  
`git clone git@github.com:zuston/MIP-FrontEnd.git`  
`git clone git@github.com:zuston/MIP-Block.git`  
2. 回到 MIP-Docker 目录下，执行 ./mip install
3. 执行 ./mip start
4. 如果 java 代码更新过后，则需要 ./mip update

<hr>
以下可省略不看，如果 容器内部有问题，可进入 container 里面查看哦！

### 代码需要挂载外部数据卷
`MIP-Searching
 MIP-FrontEnd
 MIP-Block
 /opt/mongo.properties
`
### 生成　images :　
`sudo docker build -t zuston/mipdocker:0.01 .`
### 启动　container : 
`sudo docker run -p 127.0.0.1:80:80 -p 8083:8083 -p 6379:6379 -it -v ~/MIP:/MIP-CODE --name mipCore0.0.1 zuston/mipdocker:0.01 /bin/bash  `
