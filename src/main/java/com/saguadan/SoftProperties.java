package com.saguadan;

import com.bentengwu.utillib.file.PathUtil;
import com.bentengwu.utillib.map.SplitCt;

/**
 * 软件的配置参数在这个类中进行配置
 */
public abstract class SoftProperties {
    public static final String userDir = PathUtil.getDir();
    public static final String softName = "timeline";
    public static final String period = SplitCt.period;
}
