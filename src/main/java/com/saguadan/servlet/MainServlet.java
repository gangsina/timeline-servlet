package com.saguadan.servlet;

import com.saguadan.service.RootService;
import com.saguadan.service.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * TODO 以后可以把这个servlet作为总路口，然后分流到其他项目业务类。
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/22 16:47.
 */
public class MainServlet extends HttpServlet {

    RootService serivce = RootService.get();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String serviceController = req.getHeader("serviceController");
        Service _service = serivce.getService(serviceController);
        if (null != _service) {
            _service.doService(req,resp);
        }else{
            super.doPost(req, resp);
        }
    }


}
