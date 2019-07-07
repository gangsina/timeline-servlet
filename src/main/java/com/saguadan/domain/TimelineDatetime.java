package com.saguadan.domain;

import com.bentengwu.utillib.date.DateUtil;

import java.util.Calendar;
import java.util.Date;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 13:46.
 */
public class TimelineDatetime extends _domain {
    private static final long serialVersionUID = -4437762881236600870L;
    private String year;
    private String month;
    private String day;
    private String hour;
    private String minute;
    private String second;
    private String millisecond;
    private String format;

    public TimelineDatetime() {

    }

    public TimelineDatetime(String year, String month, String day) {
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public TimelineDatetime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        setYear(cal.get(Calendar.YEAR)+"");
        setMonth(cal.get(Calendar.MONTH)+"");
        setDay(cal.get(Calendar.DAY_OF_MONTH)+"");
        setHour(cal.get(Calendar.HOUR_OF_DAY)+"");
        setMinute(cal.get(Calendar.MINUTE)+"");
        setSecond(cal.get(Calendar.SECOND) + "");
        setMillisecond(cal.get(Calendar.MILLISECOND)+"");
        setFormat(DateUtil.LONG_DATE_FORMAT);
    }


    public TimelineDatetime(String year, String month, String day, String hour, String minute, String second, String millisecond, String format) {
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.minute = minute;
        this.second = second;
        this.millisecond = millisecond;
        this.format = format;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    public String getMinute() {
        return minute;
    }

    public void setMinute(String minute) {
        this.minute = minute;
    }

    public String getSecond() {
        return second;
    }

    public void setSecond(String second) {
        this.second = second;
    }

    public String getMillisecond() {
        return millisecond;
    }

    public void setMillisecond(String millisecond) {
        this.millisecond = millisecond;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }
}
