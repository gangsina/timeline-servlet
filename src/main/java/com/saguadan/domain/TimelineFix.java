package com.saguadan.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 用于提交时间轴的时候，接收客户端数据用。
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/21 15:27.
 */
public class TimelineFix extends _domain {
    private static final long serialVersionUID = -4585324204038700065L;
    private String filename;
    private Timeline timeline;
    private Event event;
    private Set<Eras> eras = new HashSet<>();
    private String _class; // event/timeline/eras. 当提交event的时候为event，当提交整个timeline的时候，为timeline

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public String get_class() {
        return _class;
    }

    public void set_class(String _class) {
        this._class = _class;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Timeline getTimeline() {
        return timeline;
    }

    public TimelineFix setTimeline(Timeline timeline) {
        this.timeline = timeline;return this;
    }

    public Set<Eras> getEras() {
        return eras;
    }

    public TimelineFix setEras(Set<Eras> eras) {
        this.eras = eras;
        return this;
    }
}
