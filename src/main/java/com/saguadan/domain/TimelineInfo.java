package com.saguadan.domain;

import com.bentengwu.utillib.String.StrUtils;

import java.util.Date;

/**
 * 某个时间线的基本信息.
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/3 15:57.
 */
public class TimelineInfo extends   _domain{
    private String timelineName = "默认时间线";
    private String fileName = StrUtils.getRandomNumLetters(10);
    private Date createDate = new Date();
    private long updateTimes=0;
    private long size=0;
    private int eventCounts=0;
    private String memo = "";//用来备注下,这个是用来干嘛用的.

    public TimelineInfo() {

    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
    //getter/setter

    public String getTimelineName() {
        return timelineName;
    }

    public TimelineInfo setTimelineName(String timelineName) {
        this.timelineName = timelineName;
        return this;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }


    public Date getCreateDate() {
        return createDate;
    }

    public long getUpdateTimes() {
        return updateTimes;
    }

    public TimelineInfo setUpdateTimes() {
        ++ this.updateTimes ;
        return this;
    }

    public long getSize() {
        return size;
    }

    public TimelineInfo setSize(long size) {
        this.size = size;
        return this;
    }

    public int getEventCounts() {
        return eventCounts;
    }

    public TimelineInfo setEventCounts(int eventCounts) {
        this.eventCounts = eventCounts;
        return this;
    }
}
