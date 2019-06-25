package com.saguadan.listener;

import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.UtilSleep;
import com.bentengwu.utillib.file.PathUtil;
import com.bentengwu.utillib.file.Rd;
import com.saguadan.SoftProperties;
import com.saguadan.Timelines;
import com.saguadan.domain.TimelineInfo;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.PropertyConfigurator;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;
import java.util.Properties;

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

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }

}
