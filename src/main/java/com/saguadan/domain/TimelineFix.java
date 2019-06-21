package com.saguadan.domain;

/**
 * 用于提交时间轴的时候，接收客户端数据用。
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/21 15:27.
 */
public class TimelineFix extends _domain {
    private String filename;
    private Timeline timeline;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Timeline getTimeline() {
        return timeline;
    }

    public void setTimeline(Timeline timeline) {
        this.timeline = timeline;
    }
}
