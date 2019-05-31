package com.saguadan.domain;

import com.bentengwu.utillib.reflection.UtilReflection;

/**
 * 时间线中的事件
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 13:27.
 */
public class Event extends _domain{
    String unique_id = null;
    String type = null;
    Background background =null;
    TimelineDatetime date = null;
    TimelineDatetime start_date = null;
    TimelineDatetime end_date = null;
    Text text = null;
    Media media = null;
    Location location = null;




    /**
     * science event
     * @param unique_id
     * @param type
     * @param date
     * @param text
     * @param media
     */
    public Event(String unique_id, String type, TimelineDatetime date, Text text, Media media) {
        this.unique_id = unique_id;
        this.type = type;
        this.date = date;
        this.text = text;
        this.media = media;
    }

    /**
     * science event
     * @param unique_id
     * @param date
     * @param text
     * @param media
     * @param type 1 date, 2 start_date, 3 end_date
     */
    public Event(String unique_id,  TimelineDatetime date, Text text, Media media,int type) {
        this.unique_id = unique_id;
        switch (type) {
            case 1:this.date = date;
            case 2:this.start_date = date;
            case 3:this.end_date = date;
            default: this.date = date;
        }
        this.text = text;
        this.media = media;
    }


    public Event(String unique_id, TimelineDatetime start_date, TimelineDatetime end_date, Text text, Media media) {
        this.unique_id = unique_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.text = text;
        this.media = media;
    }

    public Event(String unique_id, Background background, TimelineDatetime start_date, Text text, Media media) {
        this.unique_id = unique_id;
        this.background = background;
        this.start_date = start_date;
        this.text = text;
        this.media = media;
    }


    public Event(String unique_id, Background background, TimelineDatetime start_date, Text text) {
        this.unique_id = unique_id;
        this.background = background;
        this.start_date = start_date;
        this.text = text;
    }


    public Event(String unique_id, TimelineDatetime start_date, TimelineDatetime end_date, Text text, Media media, Location location) {
        this.unique_id = unique_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.text = text;
        this.media = media;
        this.location = location;
    }


    public String getUnique_id() {
        return unique_id;
    }

    public void setUnique_id(String unique_id) {
        this.unique_id = unique_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Background getBackground() {
        return background;
    }

    public void setBackground(Background background) {
        this.background = background;
    }

    public TimelineDatetime getDate() {
        return date;
    }

    public void setDate(TimelineDatetime date) {
        this.date = date;
    }

    public TimelineDatetime getStart_date() {
        return start_date;
    }

    public void setStart_date(TimelineDatetime start_date) {
        this.start_date = start_date;
    }

    public TimelineDatetime getEnd_date() {
        return end_date;
    }

    public void setEnd_date(TimelineDatetime end_date) {
        this.end_date = end_date;
    }

    public Text getText() {
        return text;
    }

    public void setText(Text text) {
        this.text = text;
    }

    public Media getMedia() {
        return media;
    }

    public void setMedia(Media media) {
        this.media = media;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return UtilReflection.toStringRefl(this);
    }



}
