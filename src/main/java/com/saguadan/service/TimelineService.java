package com.saguadan.service;

import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.UtilLogger;
import com.bentengwu.utillib.json.JsonUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.saguadan.domain.Event;
import com.saguadan.domain.Timeline;
import com.saguadan.domain.TimelineFix;
import com.saguadan.domain.TimelineInfo;
import com.saguadan.service.persistence.PersistenceService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/21 14:33.
 */
public class TimelineService extends CRUDControllerService<Timeline> {
    protected final Logger logger = LoggerFactory.getLogger(getClass());

    private PersistenceService persistenceService = getService(PersistenceService.class, "persistenceService");

    @Override
    protected  List<Timeline> list(Object... params) {
        return null;
    }

    @Override
    protected Timeline get(Object... params) {
        JSONObject json = JsonUtil.getJSONObject(getParam(String.class, 2, params).getBytes());
        String filename = JsonUtil.get(json, "filename", String.class);

        if (StrUtils.isEmpty(filename)) {
            return null;
        }else{
            return persistenceService.findTimeline(filename);
        }
    }

    /**
     *@description 根据不同的类型(event/timeline)，持久化数据到磁盘。
     *@author thender email: bentengwu@163.com
     *@date 2019/6/25 13:43
     *@param params 下标2为一个json格式的字符串。
     *@return java.lang.Object
     **/
    @Override
    protected Object save(Object... params) {
        String timelineStr = getParam(String.class, 2, params);
        TimelineFix timelineFix = JsonUtil.toBean(timelineStr, TimelineFix.class);
        if (timelineFix == null) {
            return _help("解析上行数据报错");
        }
        Timeline timeline = null;
        if (timelineFix.get_class().equals("event")) {
            timeline    =   persistenceService.findTimeline(timelineFix.getFilename());
            if (timeline == null) {
                timeline = new Timeline();
                TimelineInfo timelineInfo = persistenceService.find(timelineFix.getFilename());
                timeline.getTitle().getText().setHeadline(timelineInfo.getTimelineName());
                timeline.getTitle().getText().setText(timelineInfo.getMemo());
            }
            Event event = timelineFix.getEvent();
            timeline.getEvents().add(event);
        } else if (timelineFix.get_class().equals("timeline")) {
            timeline = timelineFix.getTimeline();
        }else{
            return "-1,非法格式。";
        }
        persistenceService.flushTimeline(timelineFix.getFilename(), timeline);
        return timelineFix;
    }

    @Override
    protected String delete(Object... params) {
        return null;
    }

    @Override
    public String name() {
        return "timelineService";
    }
}
