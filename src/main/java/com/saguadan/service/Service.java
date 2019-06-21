package com.saguadan.service;

import com.bentengwu.utillib.UtilConversion;
import com.saguadan.SoftProperties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/22 17:05.
 */
public abstract class Service extends SoftProperties {
    /**
     * @return 用于唯一定义服务的名字. 项目全局唯一，和界面交互时，用于确认页面需要使用的那个服务来处理自己的请求.
     */
    public abstract   String name();


    public abstract Object doService(Object... params);


    public HttpServletRequest getRequest(Object... params) {
        return (HttpServletRequest)params[0];
    }


    public HttpServletResponse getResponse(Object... params) {
        return (HttpServletResponse)params[1];
    }

    public <T> T getParam(Class<T> _class,int index,Object... params) {
        return UtilConversion.convert(_class, params[index]);
    }
}
