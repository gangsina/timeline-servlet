package com.saguadan.domain;

import com.bentengwu.utillib.reflection.UtilReflection;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/21 14:46.
 */
public class Eras extends _domain {
    private TimelineDatetime start_date;
    private TimelineDatetime end_date;
    private Text text;


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

    @Override
    public String toString() {
        return UtilReflection.toStringRefl(this);
    }
}
