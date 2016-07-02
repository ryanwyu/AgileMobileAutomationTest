# Docker-appiumlib-and-cucumber

## Introduction
This image is used for AMAT framework. The docker image is just install the cucumber framework with appium_lib. The tester who uses AMAT can just start a container with this image to connect with appium server and run the cucubmer tests.
This can make the tester convenient to start working without spending too much time on environment setup.
这个Docker镜像适用于AMAT框架。它安装了Cucumber测试框架以及Appiumlib库。使用AMAT的测试人员可以通过启动这个容器快速和Appium服务器建立连接并远程运行cucubmer测试。
这可以使测试人员非常方便地开始移动应用测试工作，而不需要在环境设置上花费太多的时间。

###1. Get image 获取镜像

有两种方式获取这个镜像:

#### Pull ruby applium_lib and cucumber image
#### 从远程镜像库中下载镜像文件
```
user@local-machine:~/workspace/OneCucumber$ sudo docker pull lannyzhujin/ruby_appiumlib_and_cucumber:0.2
```
镜像下载完成之后可以直接用于启动容器

#### Or build image by docker file
#### 或者通过Docker在本地构建镜像
````
user@local-machine:~$git clone https://github.com/lannyzhujin/Docker-appiumlib-and-cucumber.git
user@local-machine:~$sudo docker build -t lannyzhujin/ruby_appiumlib_and_cucumber:0.2 .
````
Dockerfile不能直接使用, 下载之后需要使用build命令构建镜像, 镜像才能用于启动容器

### 2. Run container 启动容器
启动容器就是在本地宿主机器上运行了一个类似虚拟机的程序, 这个程序本身就是一个操作系统, 容器和本地宿主机之间可以很方便的通信, 操作维护非常方便,不需要退出宿主机操作系统

#### Run OneCucumber client and execute the tests
#### 启动OneCucumber™客户端并执行测试

```
```
user@local-machine:~/workspace/OneCucumber$ sudo docker run -it --rm --name test  -v /home/lanny/workspace/OneCucumber/:/home/workspace/OneCucumber lannyzhujin/ruby_appiumlib_and_cucumber:0.2  cucumber -p "iphone6p-9_0" "features/client.feature"

#### Start the container and only go into the command line of the container
#### 启动容器并进入到容器系统的命令行终端模式, 在容器内进行操作
```
user@local-machine:~/workspace/OneCucumber$ sudo docker run -it --rm --name test  -v /home/lanny/workspace/OneCucumber/:/home/workspace/OneCucumber lannyzhujin/ruby_appiumlib_and_cucumber:0.2  bash
```
####命令说明
###### OneCucumber是一种移动测试自动化框架,基于Cucumber进行搭建,主要是可以同时支持Android和Ios平台的自动化
###### _docker run_命令是docker自带命令,基于一个镜像来启动相应的容器,后面的_lannyzhujin/ruby_appiumlib_and_cucumber:0.2_是镜像名称。
###### _-it_参数指明这个容器可以进行人机交互, _--rm_是在退出时删除这个容器
###### 为了方便修改测试脚本,测试框架OneCucumber的代码通过volumn方式加载到容器的文件系统,这样可以在容器内进行访问,又可以随时修改更新,加载的路径通过-v指定



project is in path /home/workspace/OneCucumber