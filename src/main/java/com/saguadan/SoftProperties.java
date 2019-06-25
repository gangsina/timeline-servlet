package com.saguadan;

import com.bentengwu.utillib.file.PathUtil;
import com.bentengwu.utillib.map.SplitCt;

/**
 * 软件的配置参数在这个类中进行配置
 */
public abstract class SoftProperties {
    public static final String USER_DIR = PathUtil.getDir();
    public static final String SOFTNAME = "timeline";
    public static final String period = SplitCt.period;
    public  static final String sep = PathUtil.getFileSeparator();
    public static final String support_email = "bentengwu@163.com";
    public static final String _support = "-1,replace_msg，请联系管理员:" + support_email;

    /**
     * 用来存储所有的时间线(一个或者多个)的基本信息{@link com.saguadan.domain.TimelineInfo} .
     */
    public static final String TIMELINE_INFOS_FILENAME = "timelines.serialzation";

    /**
     * 工作目录.
     */
    public static final String WORK_DIR = USER_DIR + sep + period + SOFTNAME;
    /**
     * 所有timeline的信息的序列化文件地址.
     */
    public static final String TIMELINE_INFOS_FILEPATH = WORK_DIR + sep  + TIMELINE_INFOS_FILENAME;


    public static final String _help(String msg) {
        return _support.replaceAll("replace_msg", msg);
    }
}
