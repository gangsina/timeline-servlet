package com.saguadan.servlet;

import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.json.JsonUtil;
import com.saguadan.service.RootService;
import com.saguadan.service.Service;
import org.slf4j.LoggerFactory;

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
    protected final static org.slf4j.Logger logger = LoggerFactory.getLogger(MainServlet.class);
    RootService serivce = RootService.get();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object beforeRet =  before(req,resp);

        String serviceController = req.getHeader("serviceController");
        Service _service = serivce.getService(serviceController);
        Object result = null;
        if (null != _service) {
            result = _service.doService(req,resp,beforeRet);
        }

        Object afterRet = after(req,resp,beforeRet,result);

        _return(resp,beforeRet,result,afterRet);
    }

    //TODO 请求业务控制前的处理
    Object before(HttpServletRequest req, HttpServletResponse resp) {
        String dataType = StrUtils.getString(req.getHeader("data_type"),"json");
        String method = req.getMethod();
        logger.debug("method:{}, data_type:{}",method,dataType);
        if (method.equals("get")) {
            return new RuntimeException("Not Support Yet!!");
        } else if (method.equals("post")) {
            try {
                return JsonUtil.jsonToMap(req.getInputStream());
            } catch (Exception ex) {
                return ex;
            }
        }
        return null;
    }

    //TODO 请求业务后的处理
    Object after(HttpServletRequest req, HttpServletResponse resp,Object beforeRet, Object result) {
        return null;
    }

    //返回数据的处理.
    Object _return(HttpServletResponse resp,Object beforeRet, Object result,Object afterRet) {
        if (result == null) {
            result = "Not Support Yet!!";
        }

        try {
            resp.getWriter().write(result.toString());
            resp.getWriter().flush();
            resp.getWriter().close();
            return "success";
        } catch (Exception ex) {
            return ex;
        }
    }
}
