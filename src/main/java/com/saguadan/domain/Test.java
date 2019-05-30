package com.saguadan.domain;

import com.bentengwu.utillib.json.JsonUtil;
import org.json.JSONObject;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 15:28.
 */
public class Test {
    public static void main(String[] args) {
        Event event = new Event("",
                new TimelineDatetime("2019","10","21"),
                new Text("",""),null,1);
        String s = JsonUtil.toJsonStr(event,true,true);
        System.out.println(s);

        String ss = JsonUtil.toJsonStr(event,true,false);
        System.out.println(ss);

        JSONObject sss = JsonUtil.toJson(event,false,false);
        System.out.println(sss);




//        String regix = "(,?)(\"{1})[a-zA-Z0-9_]{1,50}\":\"\"(,?)";
//        String ret = Pattern.compile(regix).matcher(s).replaceAll("+++++++++++++?");
//        System.out.println(ret);

    }
}
