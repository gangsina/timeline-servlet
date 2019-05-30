package com.saguadan.service;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/22 17:02.
 */
public class RootService extends Service{

    public static final String DEFAULT_NAME = "helloWorldService";

    private static RootService rootService = new RootService();
    private RootService() { }
    public static RootService get() {
        return rootService;
    }


    /**
     * 用于存放实例对象
     */
    private Map<String, Service> serviceMap = new HashMap<String, Service>();


    /**
     * 外部注册服务.
     * @param service
     */
    public void registerService(Service service) {
        addServiceIntoServiceMap(service);
    }

    /**
     * 获取已经注册的服务
     * @param name
     * @return
     */
    public Service getService(String name) {
        if (serviceMap.containsKey(name)) {
            return serviceMap.get(name);
        }else{
            return serviceMap.get(DEFAULT_NAME);
        }
    }


    private void addServiceIntoServiceMap(Service service) {
        System.out.println("Register:"+service.name());
        serviceMap.put(service.name(), service);
    }



    @Override
    public Object doService(Object... params) {
        return null;
    }


    /**
     * @return 用于唯一定义服务的名字. 项目全局唯一，和界面交互时，用于确认页面需要使用的那个服务来处理自己的请求.
     */
    @Override
    public String name() {
        return "rootService";
    }
}
