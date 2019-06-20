[TOC]



# timeline软件设定

## jdk

1.7

## 容器

Tomcat

## 存储

timelines.serialzation 统一存放所有的时间线信息(用序列化存储,避免解析带来的麻烦). 类似一个索引文件,存放所有的时间线信息.
不同的时间线信息放在根目录的其他文件中.一个时间线一个文件.

\'${user.dir}\'/.timeline/timelines.serialzation


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

##### http header

| header name       | memo                                                         |
| ----------------- | ------------------------------------------------------------ |
| service_controller | 用于指定提供服务的控制器,如果不存在对应的控制器,则使用默认控制器. |
| data_type         | 指明数据格式.默认是json.   约定有如下数据格式: json/xml/form/string/bytes |
| fmt                | 指明将上行的数据格式转换为什么类型. 默认是转化为map.  map/json/string |
| opt   | 在需要的时候可以带上opt,来分流执行. crudl c增加-->save()  r查看 get()  u修改 save() d删除 delete() l 列表. list() |
| ret_format    |   用于约定返回的时候，是否通过对结果做统一处理 ，改变原先的返回数据结构，增加上返回码和返回消息等。 如果不传，认为是需要的。|

​		利用上下文在启动注册器，注册所有的业务类。 业务类需要暴漏自己到注册器（com.saguadan.service.RegisterStatic）， 上下文启动注册器。

#### 	交互与转发

​	MainServlet 从http head中提取头参数 serviceController 来定位 提供服务器的**业务控制器**. **业务控制器**,类似于struct2的控制器,用来处理一些简单的业务和整合服务资源.



####技术参考
采用的富文本编辑器参考地址 .
http://kindeditor.net/doc3.php