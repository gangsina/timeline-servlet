package com.saguadan;

import com.bentengwu.utillib.json.JsonUtil;
import com.bentengwu.utillib.reflection.UtilReflection;
import com.saguadan.domain.TimelineInfo;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/14 13:59.
 */
public class Test {
    private static void testJson2Bean() {
        String json ="{\"timelineName\":\"默认时间线11\",\"memo\":\"<p>\\n\\t11\\n</p>\\n<p>\\n\\t22\\n</p>\\n<p>\\n\\t33\\n</p>\\n<p>\\n\\t44\\n</p>\\n<p>\\n\\t55\\n</p>\",\"fileName\":\"-1\"}";
        TimelineInfo bean = JsonUtil.toBean(json, TimelineInfo.class);
        System.out.println(UtilReflection.toStringRefl(bean));

    }
    public static void main(String[] args) {
        try {
            testJson2Bean();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
