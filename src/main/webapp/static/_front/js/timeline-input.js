/*
*这个文件用来处理timeline.html文件的前端逻辑。
* */

var _timelineService = "timelineService";

var _timeline = null;

$(function () {
    var filename = _req_params.parm("filename");
    assertConsole("Position: timeline.html: filename:" + filename);

    if (filename != null && filename != 'undefined') {
        _load_timeline(filename);
    }else {
        alert("加载失败，请重新选择一个时间轴!");
        go("index.html");
    }

    // 绑定快捷键.
    _binding_hotkeys();
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
        //todo 渲染 timeline界面
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
 * 显示timeline-input界面。
 * @param type 0 ：表示新增  1 ：表示编辑。
 *
 * note: 当第一次打开某个具体的timeline的时候，对象timeline可能还没初始化,为null.
 */
function _input_event2timeline(type) {
    assertConsole("_input_event2timeline:idex-->" + type);
    var _event = null;
    _clear_event_form();
    if (_timeline != null) {
        // 读取数据用于渲染界面
        _event = _timeline.getCurrentSlide().data;
        if (_event) {
            //event_form的表单附值。
            _set_value2doc(_event);
        }
    }

    _display_input_dialog();

}

function _save_input_timeline() {
    //todo validate
    //code it...
    //将event写入到timeline对象，关闭对话框，展现timeline信息。
    var newEvent = Object.create(null);

    _set_value(newEvent, 'group', 'group');
    _set_value(newEvent, 'display_date', 'display_date');
    _set_value(newEvent, 'autolink', 'autolink');
    _set_value(newEvent, 'unique_id', 'unique_id');

    _set_value_sub(newEvent, 'start_date', ['year','month','day','minute','second','millisecond','format']);
    _set_value_sub(newEvent, 'end_date', ['year','month','day','minute','second','millisecond','format']);
    _set_value_sub(newEvent, 'text', ['headline','text']);
    _set_value_sub(newEvent, 'background', ['color','opacity','url']);
    _set_value_sub(newEvent, 'media', ['url', 'caption', 'credit', 'thumb', 'alt', 'title', 'link', 'link_target']);

    assertConsole("++++++++++++++++++++++++++++");
    assertConsole("提交的newEventn内容：");
    assertConsole(newEvent);
    assertConsole("+++++++++++++++++++++++++++++");

    if (_timeline == null) {
        var events = [newEvent];
        var timelineObj = Object.create(null);
        timelineObj.events = events;

        assertConsole(JSON.stringify(timelineObj));
        _timeline = new TL.Timeline('timeline',  JSON.parse(JSON.stringify(timelineObj)));
    }else {
        _timeline.add(JSON.stringify(newEvent));
    }
    _timeline.updateDisplay();
    _hide_input_dialog();
}

/**
 * 在打开时间轴编辑界面的时候调用，用于清理上次遗留的值.
 * @private
 */
function _clear_event_form() {
    //清理#event_form下input的所有值。
    $("input.put").val("");
    $("input[name='start_date.year']").val("1985");
    $("input[name='end_date.year']").val("1990");
    $("input[name='text.text']").val("Just a test!");
    $("input[name='start_date.format']").val("yyyy-mm-dd");
    $("input[name='end_date.format']").val("yyyy-mm-dd");
}


/**
 * 打开时间轴编辑界面。
 * @private
 */
function _display_input_dialog() {
    $.blockUI({
        message:$("#event_form"),
        css:{ width: '80%',height:'80%',left:'10%', top: '10%'}
    });
}

/**
 * 隐藏时间轴编辑界面.
 * @private
 */
function _hide_input_dialog() {
    $.unblockUI({message: "<h1>系统处理中，请稍候...</h1>"});
}

/**
 * 将对象_data的数据写入到页面元素中。使用规则：
 * _data.field1 写入到 name='prefix.field1'的doc中。
 * _data.filed1.subf1 写入到name='prefix.filed1.subf1'的doc中。
 * 当 filed为null时， 用""代替。
 * 当prefix为空或者null时，则没有前缀.
 * @param _data
 * @param prefix 用于递归和第一次写入时附值。 允许为null或者"".
 * 当非object对象时，找到将直接找name=prefix的元素并附值。
 * 当为object对象时，将找 prefix.field1的name元素附值.
 * @private
 * @date 2019年6月24日19:13:56
 * @author bentengwu@163.com
 *
 * note: 仅设置_data对象（不包含父对象的可枚举属性）中可枚举的属性。
 */
function _set_value2doc(_data,prefix) {
    var _prefix = "";
    if (prefix != null && prefix!='' && prefix !=undefined && prefix != 'undefined') {
        _prefix = prefix + '.';
    }
    if (typeof _data == 'object') {
        Object.keys(_data).forEach(function (element) {
            var val = _data[element];
            if (val == null || val == undefined || val == 'undefined') {
                val = '';
            }
            _set_value2doc(val, _prefix + element);
        });
    }else {
        _set_value2doc_byname(prefix, _data);
    }
}

/**
 * 将 【name=变量_name】 的元素值 改为变量_val的值。
 * @param _name
 * @param _val
 * @private
 */
function _set_value2doc_byname(_name,_val) {
    assertConsole("timeline-input.js._set_value2doc_name 参数:");
    assertConsole("_name-->");
    assertConsole(_name);
    assertConsole("_val-->");
    assertConsole(_val);
    assertConsole("----------}");

    var _$doc = $("[name='" + _name + "']");
    if (_$doc) {
        _$doc.val(_val);
    }
}


function _set_value_obj(obj, _field_name, _value) {
    assertConsole("timeline-input.js._set_value_obj  参数：");
    assertConsole("obj-->");
    assertConsole(obj);
    assertConsole("_field_name-->" + _field_name);
    assertConsole("_input_name-->" );
    assertConsole(_value);
    assertConsole("----------}");

    var descriptor = Object.create(null);
    descriptor.writable = true;
    descriptor.enumerable = true;
    descriptor.configurable = true;
    descriptor.value = _value;
    if (_value == undefined || _value == null) {
        descriptor.value = "";
    }
    Object.defineProperty(obj, _field_name, descriptor);
}

/**
 * 将doc对象中name属性值为_input_name 的value值 附值到obj对象的_field_name属性中。
 * @param obj 目标对象
 * @param _field_name 目标对象的属性名
 * @param _input_name doc中input的name值。
 * @private
 */
function _set_value(obj,_field_name,_input_name) {

    assertConsole("timeline-input.js._set_value 参数：");
    assertConsole("obj-->");
    assertConsole(obj);
    assertConsole("_field_name-->" + _field_name);
    assertConsole("_input_name-->" + _input_name);
    assertConsole("----------}");


    var _value = $("input[name='" + _input_name + "']").val();

    // if (_value) {
        _set_value_obj(obj, _field_name, _value);
    // } else{
    //     assertConsole("pass !!  "+_input_name+" 's value is empty " );
    // }

}

/**
 * 设置obj属性_field_name为对象的属性值。
 * 要求doc中的name命名方式符合使用规范。name=_field_name._sub_field_name
 * @param obj  目标对象
 * @param _field_name 目标对象的属性对象
 * @param _sub_field_names 目标对象的属性对象的字段名集合数组
 * @private
 */
function _set_value_sub(obj,_field_name,_sub_field_names) {
    assertConsole("timeline-input.js._set_value_sub 参数：{");
    assertConsole("obj-->");
    assertConsole(obj);
    assertConsole("_field_name-->" + _field_name);
    assertConsole("_sub_field_names-->");
    assertConsole(_sub_field_names);
    assertConsole("----------}");
    var _fieldObj = Object.create(null) ;

    _sub_field_names.forEach(function (element, index) {
        var _input_name = _field_name +"." + element;
        _set_value(_fieldObj, element, _input_name);
    })

    assertConsole(_field_name + "last子对象拥有 非空属性个数为:" + Object.getOwnPropertyNames(_fieldObj).length +"!,分别是：");
    assertConsole(Object.getOwnPropertyNames(_fieldObj));

    if (Object.getOwnPropertyNames(_fieldObj).length > 0) {
        _set_value_obj(obj, _field_name, _fieldObj);
    }


}

/**
 * @param obj
 * @param _field_name
 * @returns {boolean} obj 有名是变量_field_name 的属性值时为true
 *                      没有是 false
 */
function hasPropertiy(obj,_field_name) {

    Object.getOwnPropertyNames(obj).forEach(function (element) {
        if (element == _field_name) {
            return true;
        }
    });
    return false;
}



/* hotkey opt*/
function _binding_hotkeys() {
    jQuery(document).bind('keydown.Ctrl_e',
        function (evt){
            assertConsole("hotkeys: Ctrl_e");
                 return false;
        });
    
}

/**
 * 按ctrl+e快捷键，触发编辑当前的选中的slide；
 * 如果当前没有选中任何slide（这种情况其实是不存在的），则触发新增一个slide(event)的操作
 * @private
 */
function _ctrl_e_input_timeline_data() {
    //todo  _ctrl_e_input_timeline_data
}