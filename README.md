# yboot

#### 介绍
一个快速开发脚手架，后端为spring cloud开发，前端使用vue。 

#### 软件架构
采用前后端分离，使用spring gateway作为网关，认证授权和基础功能在base-server服务中是为了在部署的时候节省服务器资源。前后端交换采用jwt作为token。 business-server为业务服务，这里只是搭建了一个demo。方便开发者使用的时候套用。

#### 安装教程

1.  启动nacos项目这里使用的是windows版本的,启动时找到bin目录双击startup.cmd即可。
    在linux上使用自行去官网下载, https://github.com/alibaba/nacos/releases/download/1.2.0-beta.1/nacos-server-1.2.0-beta.1.tar.gz,
    解压文件，在bin目录下执行 ``` sh startup.sh -m standalone ```
2.  seata同样找到bin目录双击seata-server.bat即可。
3.  必须先启动base-servere服务，在启动其他两个服务。

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request
