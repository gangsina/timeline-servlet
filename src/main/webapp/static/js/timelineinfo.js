/**
 * Created by thender on 2019/6/12.
 */


function _input_timelineinfo(_params,opt) {
    assertConsole("+++++_input_timelineinfo:_params-->" + _params);

    $.ajax({
        url :_url_r,
        type : _method_post,
        dataType : _data_type_json,
        async: true,
        data: JSON.stringify(_params),
        beforeSend: function(request) {
            request.setRequestHeader("service_controller","timelineInfoService");
            request.setRequestHeader("data_type",_data_type_json);
            request.setRequestHeader("fmt",_fmt_string);
            request.setRequestHeader("opt",opt);
            request.setRequestHeader("Content-Type","application/json; charset=utf-8");
        },
        success:function(data){
            var retData = eval(data);
            if(retData) {
                alert(retData.message);
            }
        },
        error:function(data){
            alert("网络繁忙！");
        }
    });
}

function _load_timelineinfo(_filename) {
    assertConsole("+++++_load_timelineinfo:_filename-->" + _filename);
    $.ajax({
        url :_url_r,
        type : _method_post,
        dataType : _data_type_json,
        async: true,
        data: JSON.stringify({
            filename:_filename
        }),
        beforeSend: function(request) {
            request.setRequestHeader("service_controller","timelineInfoService");
            request.setRequestHeader("data_type",_data_type_json);
            request.setRequestHeader("fmt",_fmt_map);
            request.setRequestHeader("opt",_opt_r);
            request.setRequestHeader("Content-Type","application/json; charset=utf-8");
        },
        success:function(data){ _load_timelineinfo_success(data);},
        error:function(data){
            alert("网络繁忙！");
        }
    });
}

/* http 200 处理.*/
function _load_timelineinfo_success(data) {
    var dataObj = eval(data);
    assertConsole("++++++_load_timelineinfo return+++++++");
    assertConsole(dataObj);
    if(dataObj.code=="1"){
        var retData = dataObj.data;
        if(retData){
            $("span[name='eventCounts']").html(retData.eventCounts);
            $("span[name='updateTimes']").html(retData.updateTimes);
            $("span[name='size']").html(retData.size);
            $("span[name='createDate']").html(retData.createDate);

            $("input[name='filename']").val(retData.fileName);
            $("input[name='timelineName']").val(retData.timelineName);
            editor.html(retData.memo);
            $("#timelineinfo-detail").css("display","block");
        }else{
            //todo 没有数据.
        }
    }else{
        alert(dataObj.message);
    }
}

function _load_list(service) {
    $.ajax({
        url :_url_r,
        type : _method_post,
        dataType : _data_type_json,
        async: true,
        beforeSend: function(request) {
            request.setRequestHeader("service_controller",service);
            request.setRequestHeader("data_type",_data_type_json);
            request.setRequestHeader("fmt",_fmt_string);
            request.setRequestHeader("opt",_opt_l);
            request.setRequestHeader("Content-type","text/html; charset=utf-8");
        },
        success:function(data){
            var dataObj = eval(data);
            $(".zp_list").html("");
            if(dataObj.code=="1"){
                var retData = dataObj.data;
                if(retData){
                    $.each(retData, function(index, element) {
                        var imageUrl = "";

                        var createDate = element.createDate;
                        if(createDate){
                            var str = createDate.substring(createDate.length-2, createDate.length);
                            if(str == ".0"){
                                createDate = createDate.substring(0, createDate.length-2);
                            }
                        }

                        var filename = element.fileName;
                        
                        var _doc_p_tit1 = "<span class=\"p_tit1\">"+element.timelineName+"</span><br>";
                        var _doc_p_tit2 = "<span class=\"p_tit2\">"+createDate+"</span>";

                        var _doc_pop_tit = "<div class=\"pop_tit\" style=\"display: none;\" onclick='viewInputTimelineInfo(\""+filename+"\")'>"+_doc_p_tit1 + _doc_p_tit2 + "</div>";
                        var _doc_img = "<img onclick='viewTimeline(\""+filename+"\")' src=\"images/03.png\"/>";

                        var _doc_zp_box = "<div class=\"zp_box\">"+_doc_pop_tit + _doc_img +"</div>";
                        $(".zp_list").append(_doc_zp_box);

                    });
                }else{
                    //todo 没有数据.
                }
            }else{
                alert(dataObj.message);
            }
        },
        error:function(data){
            alert("更新异常！");
        }
    });
}

/*访问timeline界面*/
function viewTimeline(filename) {
    assertConsole("View Timeline :" + filename);
    go('timeline.html?filename=' + filename);
}

/*跳转到查看详情页*/
function viewInputTimelineInfo(filename) {
    assertConsole("++++++viewInputTimelineInfo :" + filename);
    go('timelineinfo-input.html?filename=' + filename);
}

function loadInputTimelineInfo(){
    var _v_filename = _req_params.parm("filename");
    assertConsole("+++++++[timelineinfo-input.html]++++++++loadInputTimelineInfo");
    assertConsole(_v_filename);
    if(_v_filename=='-1' || _v_filename=='undefined'){
        //认为是新增页面,不需要做处理.
        assertConsole("===============");
        assertConsole("新增一个时间轴!");
    }else{
        $("#h-filename").val(_v_filename);
        _load_timelineinfo(_v_filename);
    }
}

/* 提交 */
function inputTimelineInfo() {
    assertConsole("+++++++[timelineinfo-input.html]++++++++inputTimelineInfo");

    editor.sync();
    var params = new  Object();
    params.timelineName = $("input[name='timelineName']").val();
    params.memo = editor.html();
    params.fileName = $("input[name='filename']").val();

    assertConsole(params);
    var opt = _opt_c;
    if(params.fileName != '-1'){
        opt = _opt_u;
    }

    _input_timelineinfo(params,opt);
}



