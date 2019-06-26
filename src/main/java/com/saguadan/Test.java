package com.saguadan;

import com.bentengwu.utillib.json.JsonUtil;
import com.bentengwu.utillib.reflection.UtilReflection;
import com.saguadan.domain.Event;
import com.saguadan.domain.TimelineInfo;
import org.apache.poi.ss.formula.functions.Even;

import java.util.HashSet;
import java.util.Set;

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



    static boolean eventEqTest() {
        Event event1 = new Event("aa", "overview",null,null,null);
        Event event2 = new Event("aa", "overview1",null,null,null);
        Event event3 = new Event("aa", "overviaa",null,null,null);

        Set<Event> set = new HashSet<>();
        System.out.println(set.add(event1));
        set.remove(event2);
        System.out.println(set.add(event2));
        System.out.println(set.contains(event3));

        return event1.equals(event2);
    }

    public static void main(String[] args) {
        try {
//            testJson2Bean();
            System.out.println(eventEqTest());

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
