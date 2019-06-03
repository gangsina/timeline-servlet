package com.saguadan.service.persistence;

import com.bentengwu.utillib.exception.ExceptionUtils;
import com.saguadan.domain.Timeline;
import com.saguadan.domain.TimelineInfo;
import com.saguadan.service.Service;

/**
 * 用于对持久化操作的支持.
 * 避免把写入和删除操作直接在结构信息类提现.
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/3 17:43.
 */
public class PersistenceService extends Service {
    /**
     * @return 用于唯一定义服务的名字. 项目全局唯一，和界面交互时，用于确认页面需要使用的那个服务来处理自己的请求.
     */
    @Override
    public String name() {
        return "persistenceService";
    }

    @Override
    public Object doService(Object... params) {
        return ExceptionUtils.newRE("Not support!");
    }

    /**
     *TODO 保存时间线的基本信息
     * @param timelineInfo 时间线的基本信息
     *
     */
    public void saveTimelineInfo(TimelineInfo timelineInfo) {

    }

    /**
     *TODO 保存时间线的数据信息
     * @param timeline 时间线的数据信息
     */
    public void saveTimeline(Timeline timeline) {

    }

}
