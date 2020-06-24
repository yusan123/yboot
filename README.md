# yboot

# 访问地址  http://yboot.budongfeng.com/   账号 test  密码 123456

#### 介绍
一个快速开发脚手架，后端为spring cloud开发，前端使用vue。 



#### 软件架构
采用前后端分离，使用spring gateway作为网关，认证授权和基础功能在base-server服务中是为了在部署的时候节省服务器资源。前后端交换采用jwt作为token。 business-server为业务服务，这里只是搭建了一个demo。方便开发者使用的时候套用。

#### 功能介绍

![系统管理](https://images.gitee.com/uploads/images/2020/0624/181848_09948e7c_1523748.png)

![工作流](https://images.gitee.com/uploads/images/2020/0624/181848_09948e7c_1523748.png)



1. 新添加支付功能（2020年3月31日）

![img](https://www.cloudbed.vip/file/2020/3/31/49fb944b031642adb30da0f6bbae6e3f.png)

2.  html转word文件

使用方法分为两部，直接访问这个路径，会返回一个json值。

http://127.0.0.1:9200/base/html2word?pageUrl=http://yboot.budongfeng.com/word.html

json值如下：

```
{"success":true,"message":"success","code":200,"timestamp":1590558590389,"result":"http://127.0.0.1:9200/base/file/view/277945827303886848"}
```

将返回结果中的result的值， 放到游览器中，就会直接下载word文件。





#### 安装教程

1.  启动nacos项目这里使用的是windows版本的,启动时找到bin目录双击startup.cmd即可。
    在linux上使用自行去官网下载, [necos 下载链接](https://github.com/alibaba/nacos/releases/download/1.2.0-beta.1/nacos-server-1.2.0-beta.1.tar.gz,) 解压文件，在bin目录下执行 ``` sh startup.sh -m standalone ```  
2.  seata同样找到bin目录双击seata-server.bat即可。
3.  在数据库中创建yboot数据库，在根目录里面有两个sql文件，先运行quartz.sql在运行yboot.sql。
4.  必须先启动base-servere服务，在启动其他两个服务。

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request

#### 欢迎关注公众号

欢迎关注本人公众号，后面会将开发文档上传至公众号，也会提供一些好玩有趣的科技资讯。

![](https://images.gitee.com/uploads/images/2020/0624/181848_63a82da6_1523748.png)

  