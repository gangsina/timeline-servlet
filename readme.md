[TOC]



# timeline软件设定

## jdk

1.7

## 容器

Tomcat

## 存储

json文件, 每个时间线一个json文件。

\'${user.dir}'/timeline/\${name}.json





## 代码结构

```java
com.saguadan.servlet
	//放servlet
com.saguadan.service
	//放业务控制器
com.saguadan.jdbc
	//放DB操作。 目前没有DB操作.
```



### 软件加载流程

#### 	系统启动数据加载

​		加载存储中所有的json到内存(考虑还是按需要加载)。

#### 	 系统程序设计

​		利用上下文在启动注册器，注册所有的业务类。 业务类需要暴漏自己到注册器（com.saguadan.service.RegisterStatic）， 上下文启动注册器。

#### 	交互与转发

​	MainServlet 从http head中获取头参数 serviceController 来定位 提供服务器的**业务控制器**. **业务控制器**,类似于struct2的控制器,用来处理一些简单的业务和整合服务资源.