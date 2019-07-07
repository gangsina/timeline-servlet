package com.saguadan.domain;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 13:40.
 */
public class Text extends _domain {
    private static final long serialVersionUID = 3498127549622960716L;
    private String headline;
    private String text;

    public Text() {
    }

    public Text(String headline, String text) {
        this.headline = headline;
        this.text = text;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
