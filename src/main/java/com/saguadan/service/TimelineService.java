package com.saguadan.service;

import com.bentengwu.utillib.Collection.CollectionUtils;
import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.json.JsonUtil;
import com.bentengwu.utillib.validate.ValidateUtils;
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
 * 1:加载timeline的整个事件信息
 * 2：修改event
 * 3：修改eras
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
    
    /**
     *@description  
     *@author thender email: bentengwu@163.com
     *@param params
     *@return com.saguadan.domain.Timeline
     **/
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
        String _class = timelineFix.get_class();
        String filename =timelineFix.getFilename();
        Timeline timeline = findTimelineFixNull(filename);

        if (_class.equals("event")) {
            Event event = timelineFix.getEvent();
            if (!timeline.getEvents().add(event)) {
                timeline.getEvents().remove(event);
                timeline.getEvents().add(event);
            }
        } else if (_class.equals("timeline")) {
            timeline = timelineFix.getTimeline();
        }else if(_class.equals("eras")){
            //修改eras。
            CollectionUtils.clearFieldEmptyElement(timelineFix.getEras(),"start_date,end_date");
            timeline.setEras(timelineFix.getEras());
            timelineFix.setTimeline(timeline);
        }else{
            return "-1,非法格式。";
        }
        persistenceService.flushTimeline(filename, timeline);
        return timelineFix;
    }

    /**
     *@description  根据文件名获取Timeline实例.
     *@author thender email: bentengwu@163.com
     *@date 2019/6/27 12:18
     *@param filename	文件名
     *@return com.saguadan.domain.Timeline
     **/
    private Timeline findTimelineFixNull(String filename) {
        ValidateUtils.validateParams(filename);
        Timeline timeline    =   persistenceService.findTimeline(filename);
        if (timeline == null) {
            timeline = new Timeline();
            TimelineInfo timelineInfo = persistenceService.find(filename);
            timeline.getTitle().getText().setHeadline(timelineInfo.getTimelineName());
            timeline.getTitle().getText().setText(timelineInfo.getMemo());
        }
        return timeline;
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
