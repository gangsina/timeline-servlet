package com.saguadan;

import com.google.common.collect.Lists;
import com.saguadan.domain.TimelineInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/3 16:07.
 */
public class Timelines implements java.io.Serializable {


    private int timelineCount = 0; //timeliness的个数

    private Map<String, TimelineInfo> timelines = new HashMap<>(); //timelines内容列表. 用文件名作为key值

    private String defaultTimeline = null; //默认加载的timeline

    private long totalSize = 0;//所有文件大小汇总.

    public Timelines() {
    }

    /**
     * @param timelineInfo 注册一个时间线信息.
     * @param set2default  设置为默认的时间线. 默认时间线将被界面加载.
     */
    public Timelines registerTimelineInfo(TimelineInfo timelineInfo, boolean set2default) {
        addTimelineInfo(timelineInfo);
        if (set2default) {
            this.set2Default(timelineInfo);
        }
        return this;
    }

    /**
     * 增加一个时间线实例到集合.
     *
     * @param timelineInfo
     */
    private Timelines addTimelineInfo(TimelineInfo timelineInfo) {
        timelines.put(timelineInfo.getFileName(), timelineInfo);
        return this;
    }

    /**
     * @param timelineInfo
     * @return 将传入时间线设置为默认时间线.
     */
    public Timelines set2Default(TimelineInfo timelineInfo) {
        defaultTimeline = timelineInfo.getFileName();
        return this;
    }

    /**
     * 设置第一个为默认值.
     *
     * @return
     */
    public Timelines setDefault() {
        if (timelines.size() > 0) {
            defaultTimeline = timelines.keySet().toArray(new String[0])[0];
        }
        return this;
    }

    /**
     * @return 时间线集合中的时间线个数
     */
    public int getTimelineCount() {
        return timelines.size();
    }

    /**
     * @return 所有的时间线的文件列表信息
     */
    public Set<String> getAllTimelineFilenames() {
        return timelines.keySet();
    }

    /**
     * @param fileName 文件名,目前作为存储用的key. 生成机制为随机的字符串.
     * @return 时间线的基本信息.
     */
    public TimelineInfo getTimelineInfoByFilename(String fileName) {
        return timelines.get(fileName);
    }

    /**
     * @return 所有时间线索引明细信息
     */
    public List<TimelineInfo> getAll() {
        return Lists.newArrayList(timelines.values()) ;
    }

    public TimelineInfo delete(String filename) {
        return timelines.remove(filename);
    }

// TODO getter setter


}
