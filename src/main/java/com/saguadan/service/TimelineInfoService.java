package com.saguadan.service;

import com.bentengwu.utillib.UtilConversion;
import com.bentengwu.utillib.UtilLogger;
import com.bentengwu.utillib.json.JsonUtil;
import com.bentengwu.utillib.map.MapUtil;
import com.google.common.collect.Lists;
import com.saguadan.domain.TimelineInfo;
import com.saguadan.service.persistence.PersistenceService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

/**
 * timeline的相关操作.  增删改查
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/5 11:38.
 */
public class TimelineInfoService extends CRUDControllerService<TimelineInfo> {
    protected final Logger logger = LoggerFactory.getLogger(getClass());
    /**
     * @return 用于唯一定义服务的名字. 项目全局唯一，和界面交互时，用于确认页面需要使用的那个服务来处理自己的请求.
     */
    @Override
    public String name() {
        return "timelineInfoService";
    }


    private PersistenceService persistenceService = getService(PersistenceService.class, "persistenceService");


    @Override
    protected List<TimelineInfo> list(Object... params) {
        List<TimelineInfo> retList =  persistenceService.find();
        return retList;
    }

    @Override
    protected TimelineInfo get(Object... params) {
        Map map = UtilConversion.convert(Map.class,params[2]);
        String filename = MapUtil.getStr(map, "filename");
        return persistenceService.find(filename);
    }

    /**
     * @param params [2] 为字符串格式.
     * @return
     */
    @Override
    protected TimelineInfo save(Object... params) {
        String paramStrJson = UtilConversion.convert(String.class,params[2]);
        TimelineInfo bean = JsonUtil.toBean(paramStrJson, TimelineInfo.class);
         return persistenceService.saveTimelineInfo(bean).find(bean.getFileName());
    }

    @Override
    protected String delete(Object... params) {
        try {
            String filename = UtilConversion.convert(JSONObject.class, params[2]).getString("filename");
            persistenceService.delete(filename);
            return "1";
        } catch (Exception ex) {
            UtilLogger.log(logger,ex,"时间线索引-删除");
            return "-1,时间线索引-删除-失败!";
        }
    }
}
