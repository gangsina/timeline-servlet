package com.saguadan.domain;

import com.bentengwu.utillib.code.EncodeUtils;
import com.bentengwu.utillib.file.Rd;
import com.bentengwu.utillib.file.UtilFile;
import com.bentengwu.utillib.http.HttpUtils;
import com.bentengwu.utillib.json.JsonUtil;
import com.google.common.collect.Lists;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/5/30 15:28.
 */
public class Test {


    public static void main(String[] args) {

//        final Event event = new Event("",
//                new TimelineDatetime("2019","10","21"),
//                new Text("",""),null,1);
//        String s = JsonUtil.toJsonStr(event,true,true);
//        System.out.println(s);
//
//        String ss = JsonUtil.toJsonStr(event,true,false);
//        System.out.println(ss);
//
//        JSONObject sss = JsonUtil.toJson(event,false,false);
//        System.out.println(sss);

//        printZS();


//        String regix = "(,?)(\"{1})[a-zA-Z0-9_]{1,50}\":\"\"(,?)";
//        String ret = Pattern.compile(regix).matcher(s).replaceAll("+++++++++++++?");
//        System.out.println(ret);

    }
    //保存质数
    static final List<Integer> list = Lists.newArrayList();

    /*打印质数及其之间存在的其他数的个数.*/
    public static void printZS() {
        int max = 10000;
        int times = 0;
        int maxP = 0;
        for (int i = 1; i < max; i++) {
            if (run(i, 2)) {
                ++times;
                if (times % 20 == 0) {
                    System.out.println();
                }
                list.add(i);
                if(i>1){
                    int p = i-list.get(list.size()-2);
                    maxP = maxP > p ? maxP : p;
                    System.out.print("-("+p+")-"+i);
                }else{
                    System.out.print(i);
                }
            }
        }
        System.out.println();
        System.out.println(maxP);

    }

    /*保存10000以内的所有数字,并生成其有2个质数相加组合.*/
    public static void saveST() {

        Integer[] ay = list.toArray(new Integer[0]);
        StringBuilder retStr = null;
        StringBuilder totalStr = new StringBuilder();
        for (int i = 2; i < 10000; i++) {
            retStr = new StringBuilder(i + ":");
            if (list.contains(i)) {
                retStr.append("质数##");
            }

            if(i%2==0){
                retStr.append("偶数##");
            }else{
                retStr.append("奇数##");
            }

            boolean bret = false;
            for (int j = 0; j < ay.length; j++) {
                if (ay[j] >= i) {
                    break;
                }
                for (int k = ay.length-1; k >=j ; k--) {
                    if (ay[j] + ay[k] == i) {
                        bret = true;
                        retStr.append("(" + ay[j] + "," + ay[k] + ") ");
                    }
                }
            }

            if (bret && list.contains(i)) {
                System.out.println(retStr);
            }


            totalStr.append("\n").append(retStr);
        }

        Rd.write("e:\\111.txt", totalStr.toString(), EncodeUtils.UTF8);
    }

    public static boolean run(int num, int i) {
        if (num == 1 || num == 2 ) {
            return true;
        }
        if (num <= i) {
            return true;
        }

        if (num % i == 0) {
            return false;
        } else {
            return run(num, ++i);
        }

    }
}
