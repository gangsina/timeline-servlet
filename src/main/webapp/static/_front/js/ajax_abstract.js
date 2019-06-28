/*
* 提取请求
* */
function _ajax_normal(p_data, ph_data,_ajax_callback) {
    _ajax(_url_r,_method_post,_data_type_json,true,p_data, ph_data, _ajax_callback);
}


/**
 * 目前默认使用application/json; charset=utf-8的Content-Type
 *
 * @param p_url 请求地址。 现在用的都是一个入口,以后可能会有多个入口。还需要提取新的方法。
 * @param p_type    请求方法， post/get
 * @param p_dataType    数据返回类型，目前统一使用json。
 * @param p_async   true、false 是否为异步请求。
 * @param p_data    js object. 用于请求到服务端的数据.
 * @param ph_service_controller  处理该请求的业务实例
 * @param ph_data_type  数据类型。  指明数据格式.默认是json. 约定有如下数据格式: json/xml/form/string/bytes
 * @param ph_fmt        指明将上行的数据格式转换为什么类型. 服务端默认会把数据转化为map. map/json/string
 * @param ph_opt    在需要的时候可以带上opt,来分流执行. crudl c增加-->save() r查看 get() u修改 save() d删除 delete() l 列表. list()
 * @param _ajax_callback 请求成功、失败后回调的方法。
 */
function _ajax(p_url,p_type,p_dataType,p_async,p_data,ph_data,_ajax_callback) {
    assertConsole("+++++++++++++++request info:++++++++++++++++");
    assertConsole("p_url-->"+p_url);
    assertConsole("p_type-->" + p_type);
    assertConsole("p_dataType-->" + p_dataType);
    assertConsole("p_async-->" + p_async);
    assertConsole("p_data-->");
    assertConsole(p_data);
    assertConsole("ph_data-->" );
    assertConsole(ph_data);
    assertConsole("_ajax_callback-->" + _ajax_callback);
    assertConsole("=============================================");


    $.ajax({
        url :p_url,
        type : p_type,
        dataType : p_dataType,
        async: p_async,
        data: JSON.stringify(p_data),
        beforeSend: function(request) {
            request.setRequestHeader("service_controller",ph_data.service_controller);
            request.setRequestHeader("data_type",ph_data.data_type);
            request.setRequestHeader("fmt",ph_data.fmt);
            request.setRequestHeader("opt",ph_data.opt);
            request.setRequestHeader("ret_format",ph_data.ret_format);
            request.setRequestHeader("Content-Type",CONTENT_TYPE_JSON);
        },
        success:function(data){
            var dataObj = eval(data);
            assertConsole("+++++++++++++++response data:++++++++++++++++");
            assertConsole(dataObj);
            assertConsole("==============================================")
            _ajax_callback(dataObj);
        },
        error:function(data){
            var dataObj = eval(data);
            assertConsole("+++++++++++++++response data:++++++++++++++++");
            assertConsole(dataObj);
            assertConsole("==============================================")
            _ajax_callback(dataObj);
        }
    });
}


var CONTENT_TYPE_JSON = "application/json; charset=utf-8";

/*
* 设定默认的headerData*/
var headerData  = {
    service_controller:"",
    data_type:"json",
    fmt:"string",
    opt:"l",
    ret_format:"y"
}