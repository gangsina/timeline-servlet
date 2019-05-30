package com.saguadan.domain;

/**
 * 时间线的标题
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 13:37.
 */
public class Title extends _domain{
    private Media media;
    private Text text;

    public Title() {
    }

    public Title(Media media, Text text) {
        this.media = media;
        this.text = text;
    }

    public Media getMedia() {
        return media;
    }

    public void setMedia(Media media) {
        this.media = media;
    }

    public Text getText() {
        return text;
    }

    public void setText(Text text) {
        this.text = text;
    }
}
