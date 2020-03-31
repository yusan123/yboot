# yboot

#### 介绍
一个快速开发脚手架，后端为spring cloud开发，前端使用vue。 

#### 软件架构
采用前后端分离，使用spring gateway作为网关，认证授权和基础功能在base-server服务中是为了在部署的时候节省服务器资源。前后端交换采用jwt作为token。 business-server为业务服务，这里只是搭建了一个demo。方便开发者使用的时候套用。

#### 功能介绍

![系统管理](https://ae01.alicdn.com/kf/H62eeaf33f5444d1896c91461a9f9851a2.png)

![工作流](https://ae01.alicdn.com/kf/H62eeaf33f5444d1896c91461a9f9851a2.png)



1. 新添加支付功能（2020年3月31日）

![img](https://www.cloudbed.vip/file/2020/3/31/49fb944b031642adb30da0f6bbae6e3f.png)



#### 安装教程

1.  启动nacos项目这里使用的是windows版本的,启动时找到bin目录双击startup.cmd即可。
    在linux上使用自行去官网下载, [necos 下载链接](https://github.com/alibaba/nacos/releases/download/1.2.0-beta.1/nacos-server-1.2.0-beta.1.tar.gz,) 解压文件，在bin目录下执行 ``` sh startup.sh -m standalone ```  
2.  seata同样找到bin目录双击seata-server.bat即可。
3.  必须先启动base-servere服务，在启动其他两个服务。

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request

#### 欢迎关注公众号

欢迎关注本人公众号，后面会将开发文档上传至公众号，也会提供一些好玩有趣的科技资讯。

![](https://img-blog.csdnimg.cn/20200220102915639.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTEyOTYxNjU=,size_16,color_FFFFFF,t_70)

