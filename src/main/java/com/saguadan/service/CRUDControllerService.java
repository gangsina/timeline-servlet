package com.saguadan.service;

import com.bentengwu.utillib.UtilConversion;
import com.saguadan.Ret;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author <a href="bentengwu@163.com">thender.xu</a>
 * @Date 2019/6/5 12:06.
 */
public abstract class CRUDControllerService<T> extends Service {

    protected abstract <T> List<T> list(Object...params);


    protected abstract <T> T get(Object... params);


    protected abstract <T> T save(Object... params);


    protected abstract String delete(Object... params);

    protected RootService service = RootService.get();

    /**
     * @param _class 具体的类型
     * @param serviceName 统一约定的名字
     * @return 业务类.
     */
    public <K> K getService(Class<K> _class,String serviceName) {
        return (K) service.getService(serviceName);
    }

    @Override
    public Object doService(Object... params) {
        return invokeMethod(params);
    }

    protected Object invokeMethod( Object... params) {
        String opt = UtilConversion.convert(HttpServletRequest.class, params[0]).getHeader("opt");
        if (opt.equalsIgnoreCase("c") || opt.equalsIgnoreCase("u")) {
            return save(params);
        } else if (opt.equalsIgnoreCase("r")) {
            return get(params);
        } else if (opt.equalsIgnoreCase("l")) {
            return list(params);
        } else if (opt.equalsIgnoreCase("d")) {
            return delete(params);
        } else {
            return new Ret("-1", "不支持的操作方式!");
        }
    }

}
