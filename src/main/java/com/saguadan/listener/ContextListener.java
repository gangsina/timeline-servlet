package com.saguadan.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 容器启动时,做环境准备.
 *  1: 注册各种服务类.
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/28 18:18.
 */
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        RegisterStatic registerStatic = new RegisterStatic();
        registerStatic.registerServiceAll();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
