package com.saguadan.domain;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 14:00.
 */
public class Background extends _domain{
    private String color;
    private int opacity;
    private String url;

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getOpacity() {
        return opacity;
    }

    public void setOpacity(int opacity) {
        this.opacity = opacity;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


}