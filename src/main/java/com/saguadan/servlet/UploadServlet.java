package com.saguadan.servlet;

import com.bentengwu.utillib.CommonUtils;
import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.code.EncodeUtils;
import com.bentengwu.utillib.date.DateUtil;
import com.bentengwu.utillib.http.ContentType;
import com.bentengwu.utillib.servlet.AjaxUploadSupport;
import com.bentengwu.utillib.servlet.Writer;
import com.bentengwu.utillib.stream.StreamUtil;
import com.saguadan.Ret;
import com.saguadan.SoftProperties;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * 这个类用于上传文件的时候返回访问路径.
 * @Author thender email: bentengwu@163.com
 * @Date 2019/7/2 18:10.
 */
public class UploadServlet extends HttpServlet {
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (StrUtils.isEmpty(id)) {
            Writer.writeStr(resp,"-1,缺少参数!");
        }
        String suffix = new String(EncodeUtils.hexDecode(FilenameUtils.getBaseName(id)));
        String _savePath = SoftProperties.STUFF_PATH + File.separator + suffix;
        System.out.println(_savePath);
        // 根据文件后缀确定文件的content-type类型.
//        String contentType = "image/png";
        String contentType = ContentType.findContentType(FilenameUtils.getExtension(_savePath));
        Writer.write(resp,FileUtils.readFileToByteArray(new File(_savePath)), contentType);
    }

    /**
     *@description  上传文件.
     *  {code:1,message:xxx,date:"hex(yyyy-MM-dd/asfasdf.txt)"}
     *@author thender email: bentengwu@163.com
     *@date 2019/7/3 18:46
     *@param req
     *@param resp
     **/
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String currentDate = DateUtil.getCurrentStringDate();
        String savePath = SoftProperties.STUFF_PATH + File.separator + currentDate;
        Map<String,String> retMap =
        AjaxUploadSupport.saveServletInputStreamToFile(req.getInputStream(), savePath, true);
        String _r_savePath = retMap.get(AjaxUploadSupport._key_savePath);
        String retStr = currentDate + "/" + FilenameUtils.getName(_r_savePath);
//        String url = req.getRequestURL().toString().replaceAll("http:","http--").replaceAll("https:","https--") + "?id=";
        retStr = EncodeUtils.hexEncode(retStr.getBytes());
        retStr = CommonUtils.mapper.writeValueAsString(new Ret("1")
                                                            .setData(retStr)
                                                            );
        System.out.println(retStr);
        Writer.writeStr(resp,retStr);
    }


    @Override
    protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doHead(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        return;
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        return ;
    }

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        return;
    }

    @Override
    protected void doTrace(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        return;
    }
}
