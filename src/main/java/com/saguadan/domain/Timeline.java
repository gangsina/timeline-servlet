package com.saguadan.domain;

import java.util.Set;

/**
 * 时间线(轴)的结构
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 13:32.
 */
public class Timeline extends _domain {
    private String scale;
    private Title title;
    private Eras eras;
    private Set<Event> events;

    public Eras getEras() {
        return eras;
    }

    public void setEras(Eras eras) {
        this.eras = eras;
    }

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

    public Timeline setEvents(Set<Event> events) {
        this.events = events; return this;
    }

    public int getEventCount() {
        return events == null ? 0 : events.size();
    }
}
