package com.saguadan.listener;

import com.bentengwu.utillib.UtilSleep;
import com.bentengwu.utillib.file.Rd;
import com.saguadan.SoftProperties;
import com.saguadan.Timelines;
import com.saguadan.domain.TimelineInfo;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;

/**
 * 容器启动时,做环境准备.
 *  1: 注册各种服务类.
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/28 18:18.
 */
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //注册业务类控制器
        RegisterStatic registerStatic = new RegisterStatic();
        registerStatic.registerServiceAll();

        //初始化信息及加载
        init();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

    /**
     * 初始化一些基本配置
     * 1:缺失的目录如果没有,创建它
     * 2:默认的时间线如果没有,创建一个.
     */
    private void init() {
        TimelineInfo    timelineInfo    = null;
        Timelines       timelines       = null;

        if (!Rd.dirExits(SoftProperties.WORK_DIR)) {
            Rd.mkDir(SoftProperties.WORK_DIR);
        }

        if (!Rd.exists(SoftProperties.TIMELINE_INFOS_FILEPATH)) {
            timelineInfo = new TimelineInfo();
            timelines = new Timelines();
            timelines.registerTimelineInfo(timelineInfo,true);
            UtilSleep.sleep(10);
        }


    }
    /**
     * 从指定目录加载数据.
     * 目前系统约定的目录{@link com.saguadan.SoftProperties ${USER_DIR}/.${SOFTNAME}/TIMELINE_INFOS_FILENAME}
     */
    private void loadTimelinesInfo() {
        Timelines timelines = null;
        File timelinesFile = new File(SoftProperties.TIMELINE_INFOS_FILEPATH);
        //TODO 加载时间线汇总信息到堆.



        //TODO 加载默认时间线实例到堆
    }
}
