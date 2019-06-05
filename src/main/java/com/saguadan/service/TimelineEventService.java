package com.saguadan.service;

import com.bentengwu.utillib.UtilConversion;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/22 17:41.
 */
public class TimelineEventService extends Service {
    /**
     * @return 用于唯一定义服务的名字.
     * 项目全局唯一，和界面交互时，用于确认页面需要使用的哪个服务来处理自己的请求.
     */
    @Override
    public String name() {
        return "timelineEventService";
    }

    @Override
    public Object doService(Object... params) {
        Object ret = null;
        JSONObject retJSON = new JSONObject();
        Map map =  UtilConversion.convert(HashMap.class, params[2]);





        return "Hello Timeline";
    }

}
