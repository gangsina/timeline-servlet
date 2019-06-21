/*
*这个文件用来处理timeline.html文件的前端逻辑。
* */

var _timelineService = "timelineService";

var _timeline = null;

$(function () {
    var filename = _req_params.parm("filename");
    assertConsole("timeline.html: filename:" + filename);

    if (filename != null && filename != 'undefined') {
        _load_timeline(filename);
    }else {
        alert("加载失败，请重新选择一个时间轴!");
        go("index.html");
    }
})

//加载时间线 2019年6月20日15:02:07
function _load_timeline(filename){
    assertConsole("_load_timeline:filename-->" + filename);

    var phData = Object.create(headerData);
    phData.service_controller = _timelineService;
    phData.opt = _opt_r;

    var reqData = Object.create(null);
    reqData.filename = filename;

    _ajax_normal(reqData, phData, list_ajax_callback);

}


function list_ajax_callback(retData) {
    assertConsole("_ajax_callback:retData-->");
    assertConsole(retData);

    if (retData.code && retData.code == '1') {
        //todo 渲染界面
        var timelineData = retData.data;
        if (timelineData) {
            _timeline = new TL.Timeline('timeline', timelineData, {
                theme_color: "#288EC3",
                ga_property_id: "UA-27829802-4"
            });
            _timeline.updateDisplay();
        }
    } if(retData.code && retData.code == '-2'){
        //这种情况，目前我们认为它是一个新的时间轴。
        // 直接弹出输入框，让人可以新建一个事件。
        _input_event2timeline(0);
    }else {
        if (retData.message) {
            alert(retData.message);
        }else{
            alert("网络繁忙，返回重试！");
            go("index.html");
        }
    }
    //todo 时间轴信息返回处理。
}

/**
 * 显示下标为{idx}的内容到input界面上。
 * @param idx 下标
 * @private
 *
 * note: 当第一次打开某个具体的timeline的时候，对象timeline可能还没初始化,为null.
 */
function _input_event2timeline(idx) {
    assertConsole("_input_event2timeline:idex-->" + idx);
    var _event = null;
    _clear_event_form();
    if (_timeline != null) {
        // 读取数据用于渲染界面
        _event = _timeline.getData(idx);
        if (_event) {
            //todo event_form的表单附值。
        }
    }

    _display_input_dialog();

}


function _clear_event_form() {
    //清理#event_form下input的所有值。
    $(":text .put").val("111");
}


function _display_input_dialog() {
    $.blockUI({
        message:$("#event_form"),
        css:{ width: '80%',height:'80%'}

    });
}

function _hide_input_dialog() {
    $.unblockUI({message: "<h1>系统处理中，请稍候...</h1>"});
}



