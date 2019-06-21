package com.saguadan.service;

import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.json.JsonUtil;
import com.saguadan.domain.Timeline;
import com.saguadan.domain.TimelineFix;
import com.saguadan.service.persistence.PersistenceService;

import java.util.List;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/21 14:33.
 */
public class TimelineService extends CRUDControllerService<Timeline> {

    private PersistenceService persistenceService = getService(PersistenceService.class, "persistenceService");

    @Override
    protected  List<Timeline> list(Object... params) {
        return null;
    }

    @Override
    protected Timeline get(Object... params) {
        String filename = getParam(String.class, 2, params);
        if (StrUtils.isEmpty(filename)) {
            return null;
        }else{
            return persistenceService.findTimeline(filename);
        }
    }

    @Override
    protected Timeline save(Object... params) {
        String timelineStr = getParam(String.class, 2, params);
        TimelineFix timelineFix = JsonUtil.toBean(timelineStr, TimelineFix.class);
        persistenceService.flushTimeline(timelineFix.getFilename(), timelineFix.getTimeline());
        return persistenceService.findTimeline(timelineFix.getFilename());
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
