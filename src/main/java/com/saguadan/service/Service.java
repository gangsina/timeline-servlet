package com.saguadan.service;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/22 17:05.
 */
public abstract class Service {
    /**
     * @return 用于唯一定义服务的名字. 项目全局唯一，和界面交互时，用于确认页面需要使用的那个服务来处理自己的请求.
     */
    public abstract   String name();


    public abstract Object doService(Object... params);

}
