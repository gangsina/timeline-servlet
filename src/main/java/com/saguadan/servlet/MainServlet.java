package com.saguadan.servlet;

import com.bentengwu.utillib.CommonUtils;
import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.UtilConversion;
import com.bentengwu.utillib.UtilLogger;
import com.bentengwu.utillib.json.JsonUtil;
import com.bentengwu.utillib.stream.StreamUtil;
import com.saguadan.Ret;
import com.saguadan.service.RootService;
import com.saguadan.service.Service;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  以后可以把这个servlet作为总路口，然后分流到其他项目业务类。
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

        if (beforeRet instanceof Exception) {
            Exception ex = UtilConversion.convert(Exception.class, beforeRet);
            logger.warn("before(req,resp)-->{}",ex.getMessage());
            _return(resp, beforeRet, null, after(req, resp, beforeRet, null));
            return;
        }

        String serviceController = req.getHeader("service_controller");
        Service _service = serivce.getService(serviceController);
        Object result = null;
        if (null != _service) {
            try {
                result = _service.doService(req, resp, beforeRet);
            } catch (Exception ex) {
                UtilLogger.log(logger,ex,"业务处理异常");
            }
        }

        Object afterRet = after(req,resp,beforeRet,result);

        _return(resp,beforeRet,result,afterRet);
    }

    //TODO 请求业务控制前的处理
    Object before(HttpServletRequest req, HttpServletResponse resp) {
        String dataType = StrUtils.getString(req.getHeader("data_type"),"json");
        String fmt = StrUtils.getString(req.getHeader("fmt"), "map");
        String method = req.getMethod();
        logger.debug("method:{}, data_type:{}",method,dataType);


        Object retObj  = new RuntimeException("Not Support Yet!!");
        if (method.equalsIgnoreCase("get")) {
            //todo something
        } else if (method.equalsIgnoreCase("post")) {
            try {
                if (fmt.equalsIgnoreCase("map") && dataType.equals("json")) {
                    retObj = JsonUtil.jsonToMap(req.getInputStream());
                } else if (fmt.equalsIgnoreCase("json") && dataType.equals("json")) {
                    retObj = JsonUtil.toJson(req.getInputStream());
                } else if (fmt.equalsIgnoreCase("string") && dataType.equals("json")) {
                    retObj = StreamUtil.read(req.getInputStream()).toString();
                }
            } catch (Exception ex) {
                retObj =  ex;
            }
        }


        return retObj;
    }


    // 请求业务后的处理
    Object after(HttpServletRequest req, HttpServletResponse resp,Object beforeRet, Object result) {
        if (result == null) {
            return new Ret(StrUtils.splitFirst("-2,result is null",","));
        }

        //格式化直接返回字符串的情况. 目前支持String -> Ret
        if (result instanceof String && result != null) {
            String retStr = StrUtils.getString(result);
            String[] args = StrUtils.splitFirst(retStr, ",");
            return new Ret(args);
        }else {
            return new Ret("1").setData(result);
        }
    }

    //返回数据的处理.
    Object _return(HttpServletResponse resp,Object beforeRet, Object result,Object afterRet) {
        try {
            //Object --> json string
            String retStr = "";
            if (afterRet != null) {
//                retStr = JsonUtil.toJsonStr(afterRet);
                retStr = CommonUtils.mapper.writeValueAsString(afterRet);
            }else{
//                retStr = JsonUtil.toJsonStr(result);
                retStr = CommonUtils.mapper.writeValueAsString(result);
            }
            logger.debug("Response : {}",retStr);
            System.out.println(retStr);
            resp.setContentType("text/html; charset=utf-8");
            resp.getWriter().write(retStr);
            resp.getWriter().flush();
            resp.getWriter().close();
            return "success";
        } catch (Exception ex) {
            return ex;
        }
    }


}
