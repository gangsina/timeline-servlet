package com.saguadan;

import com.bentengwu.utillib.String.StrUtils;

/**
 * 用于返回简单的页面提示
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/5 12:58.
 */
public class Ret implements java.io.Serializable{
    private String code ;
    private String message;

    private Object data;

    public Object getData() {
        return data;
    }

    public Ret setData(Object data) {
        this.data = data;
        return this;
    }

    public Ret(String code) {
        this.code = code;
        if (code.equalsIgnoreCase("1")) {
            setMessage("success!");
        }else if (code.equalsIgnoreCase("-1")) {
            setMessage("fail!");
        }
    }

    public Ret(String code, String message) {
        this.code = code;
        this.message = message;
        if (StrUtils.isEmpty(message)) {
            if (code.equalsIgnoreCase("1")) {
                setMessage("success!");
            }else if (code.equalsIgnoreCase("-1")) {
                setMessage("fail!");
            }
        }
    }

    public Ret(String[] args) {
        setCode(args[0]);
        if (code.equalsIgnoreCase("1")) {
            setMessage("success!");
        }else if (code.equalsIgnoreCase("-1")) {
            setMessage("fail!");
        }
        if(args.length>1) setMessage(args[1]);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
