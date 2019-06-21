package com.saguadan.listener;

import com.saguadan.service.*;
import com.saguadan.service.persistence.PersistenceService;

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
     * PS: 在实例中存在被引用的要先注册.
     */
    public void registerServiceAll() {
        PersistenceService persistenceService = new PersistenceService();
        serivce.registerService(persistenceService);

        TimelineEventService timelineEventService = new TimelineEventService();
        serivce.registerService(timelineEventService);

        TimelineInfoService timelineInfoService = new TimelineInfoService();
        serivce.registerService(timelineInfoService);

        TimelineService timelineService = new TimelineService();
        serivce.registerService(timelineService);

        HelloWorldService helloWorldService = new HelloWorldService();
        serivce.registerService(helloWorldService);


    }
}
