package com.saguadan.service.persistence;

import com.bentengwu.utillib.String.StrUtils;
import com.bentengwu.utillib.UtilSerialization;
import com.bentengwu.utillib.UtilSleep;
import com.bentengwu.utillib.exception.ExceptionUtils;
import com.bentengwu.utillib.file.Rd;
import com.bentengwu.utillib.validate.ValidateUtils;
import com.saguadan.Timelines;
import com.saguadan.domain.Timeline;
import com.saguadan.domain.TimelineInfo;
import com.saguadan.service.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.List;

/**
 * 用于对持久化操作的支持.
 * 避免把写入和删除操作直接在结构信息类提现.
 *
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/3 17:43.
 */
public class PersistenceService extends Service {
    protected final Logger logger = LoggerFactory.getLogger(getClass());
    //时间线集合信息副本. 和磁盘信息保持同步. 系统启动后,通过容器加载 .
    private final Timelines timelines = loadTimelinesCopy();


    /**
     * 在软件启动时调用这个方法.加载数据索引信息副本到堆.
     * @return 当前对象实例
     */
    private Timelines loadTimelinesCopy() {
        Timelines _timelines = null;
        if (!Rd.dirExits(WORK_DIR)) {
            Rd.mkDir(WORK_DIR);
        }

        if (!Rd.exists(TIMELINE_INFOS_FILEPATH)) {
            Timeline timeline = new Timeline();
            TimelineInfo info = new TimelineInfo();

            _timelines = new Timelines();
            _timelines.registerTimelineInfo(info, true);

//            flushTimeline(info.getFileName(), timeline);
        } else {
            //加载时间线实例集合和默认时间线
            _timelines = UtilSerialization.unSerialization(new File(TIMELINE_INFOS_FILEPATH), Timelines.class);
            _timelines.setDefault();
        }

        return _timelines;
    }

    /**
     * 获取时间线配置信息(索引信息)
     *
     * @return
     */
    public Timelines getTimelines() {
        return this.timelines;
    }

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
     *保存时间线的基本信息
     *
     * @param timelineInfo 时间线的基本信息
     */
    public PersistenceService saveTimelineInfo(TimelineInfo timelineInfo) {
        this.timelines.registerTimelineInfo(timelineInfo,false);
        flushTimelines(false);
        return this;
    }


    public TimelineInfo delete(String filename) {
        return timelines.delete(filename);
    }

    /**
     * 目前不做分页. 一起全部加载.
     * @return
     */
    public List<TimelineInfo> find() {
        return timelines.getAll();
    }

    /**
     * @param filename 文件名
     * @return 时间线的索引值的基本信息.
     */
    public TimelineInfo find(String filename) {
        return timelines.getTimelineInfoByFilename(filename);
    }

    /**
     * @return 返回所有时间线文件名.
     */
    public String[] findAllFilenames() {
        return timelines.getAllTimelineFilenames().toArray(new String[0]);
    }


    /**
     * @param filename 文件名
     * @return 时间线实例
     */
    public Timeline findTimeline(String filename) {
        ValidateUtils.validateParams(filename);
        return UtilSerialization.unSerialization(newFile(filename), Timeline.class);
    }
    /**
     * 刷新堆中的{@link Timelines} 到 磁盘
     * @return
     */
    public PersistenceService flushTimelines(boolean indexOnly) {
        logger.warn("Start Flush the timelines to disk!");
        UtilSerialization.serialization(timelines, new File(TIMELINE_INFOS_FILEPATH));
        if (!indexOnly) {
            //todo 以后可能会先缓存数据到堆中,从这里刷新到磁盘.
        }
        UtilSleep.sleep(10);
        return this;
    }

    /**
     * 刷新堆中的时间线实例到磁盘
     *
     * @param timeline 时间线实例
     * @return
     */
    public PersistenceService flushTimeline( String filename,Timeline timeline) {
        logger.info("Flush {} To Disk!", timeline.getTitle());
        File timelineFile = newFile(filename);
        UtilSerialization.serialization(timeline, timelineFile);
        timelines.getTimelineInfoByFilename(filename)
                .setEventCounts(timeline.getEventCount()).setSize(timelineFile.length())
                .setUpdateTimes();
        flushTimelines(false);
        UtilSleep.sleep(10);
        return this;
    }


    private String formatFilename(String filename) {
        return StrUtils.join(WORK_DIR, sep, filename);
    }

    private File newFile(String filename) {
        return new File(formatFilename(filename));
    }


}
