package com.saguadan.domain;

import java.util.List;
import java.util.Set;

/**
 * 时间线的结构
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 13:32.
 */
public class Timeline extends _domain {
    private String scale;
    private Title title;
    private Set<Event> events;


    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public Title getTitle() {
        return title;
    }

    public void setTitle(Title title) {
        this.title = title;
    }

    public Set<Event> getEvents() {
        return events;
    }

    public void setEvents(Set<Event> events) {
        this.events = events;
    }
}
