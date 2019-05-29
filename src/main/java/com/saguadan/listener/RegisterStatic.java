package com.saguadan.listener;

import com.saguadan.service.HelloWorldService;
import com.saguadan.service.RootService;
import com.saguadan.service.TimelineEventService;

/**
 * 这个类用于注册统一注册所有的服务到RootService
 * 在系统启动的时候初始化.
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/22 17:31.
 */
 class RegisterStatic {
    RootService serivce = RootService.get();

    /**
     * 在容器启动的时候加载
     */
    public void registerServiceAll() {
        TimelineEventService timelineEventService = new TimelineEventService();
        HelloWorldService helloWorldService = new HelloWorldService();


        serivce.registerService(helloWorldService);
        serivce.registerService(timelineEventService);
    }
}
