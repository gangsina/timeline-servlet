/**
 * Created by thender on 2019/6/12.
 */


function _input_timelineinfo(_params,opt) {
    assertConsole(["_input_timelineinfo(_params,opt)" , _params,opt]);

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

/**
 *@description  保存图片到后台
 *@author thender email: bentengwu@163.com
 *@date 2019/7/7 23:15
 *@param 当前操作的input.
 *@return
 **/
function _save_upload_cover_image(node) {
    assertConsole(["_save_upload_cover_image(node)", node]);
    assertCut1();
    var formData = new FormData();
    formData.append("file", node.files[0]);
    formData.append("token", "cover-image");

    $.ajax({
        url: "/timeline/upload",
        type: "POST",
        data: formData,
        processData: false, // 不要对data参数进行序列化处理，默认为true
        contentType: false, // 不要设置Content-Type请求头，因为文件数据是以 multipart/form-data 来编码
        xhr: function(){
            myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){
                myXhr.upload.addEventListener('progress',function(e) {
                    if (e.lengthComputable) {
                        var percent = Math.floor(e.loaded/e.total*100);
                        if(percent <= 100) {
                            console.log(percent);
                        }
                        if(percent >= 100) {
                            console.log("local success");
                        }
                    }
                }, false);
            }
            return myXhr;
        },
        success: function(res){
            // 请求成功
            assertConsole(["success: function(res)",res, typeof res]);
            var resData = JSON.parse(res);
            if (resData && resData.code == '1') {
                var url = getBaseUrl() + "/upload?id=" +resData.data;
                $("#coverImage").val(url);
                $("#preview-cover-image").html('<img src="'+url+'" />');
                $("#preview-cover-image").css("display", "block");
                assertConsole([$("#coverImage").val(), $("#preview-cover-image").html()]);
            }
        },
        error: function(res) {
            assertConsole(["error: function(res)",res, typeof res]);
            // 请求失败
        }
    });
}

function _load_timelineinfo(_filename) {
    assertConsole(["_load_timelineinfo(_filename)" , _filename]);
    console.log()
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
    assertConsole(["_load_timelineinfo_success(data)",data])
    assertCut1();
    var dataObj = eval(data);
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

            // 回显图片信息
            if (retData.coverImage) {
                $("#coverImage").val(retData.coverImage);
                $("#preview-cover-image").html('<img src="'+retData.coverImage+'" />');
                $("#preview-cover-image").css("display", "block");
            }
        }else{
            //todo 没有数据.
        }
    }else{
        alert(dataObj.message);
    }
    assertCut2();
}

function _load_list(service) {
    assertConsole(["function _load_list(service)", service]);
    assertCut1();
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
                        var coverImage = "images/03.jpg";
                        if (element.coverImage) {
                            coverImage = element.coverImage;
                        }
                        
                        var _doc_p_tit1 = "<span class=\"p_tit1\">"+element.timelineName+"</span><br>";
                        var _doc_p_tit2 = "<span class=\"p_tit2\">"+createDate+"</span>";

                        var _doc_pop_tit = "<div class=\"pop_tit\" style=\"display: none;\" onclick='viewInputTimelineInfo(\""+filename+"\")'>"+_doc_p_tit1 + _doc_p_tit2 + "</div>";
                        var _doc_img = "<img onclick='viewTimeline(\""+filename+"\")' src='"+coverImage+"'/>";

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
    assertCut2();
}

/*访问timeline界面*/
function viewTimeline(filename) {
    assertConsole(["function viewTimeline(filename)" , filename]);
    go('timeline.html?filename=' + filename);
}

/*跳转到查看详情页*/
function viewInputTimelineInfo(filename) {
    assertConsole(["function viewInputTimelineInfo(filename)" , filename]);
    go('timelineinfo-input.html?filename=' + filename);
}

function loadInputTimelineInfo(){
    assertConsole(["function loadInputTimelineInfo()"]);
    var _v_filename = _req_params.parm("filename");
    assertConsole(_v_filename);
    if(_v_filename=='-1' || _v_filename=='undefined'){
        //认为是新增页面,不需要做处理.
        assertCut1();
        assertConsole("新增一个时间轴!");
    }else{
        $("#h-filename").val(_v_filename);
        _load_timelineinfo(_v_filename);
    }
}

/* 提交 命名规则已经改变,input或者_input打头的用于打开input界面
* 提交到后台的统一用 save/update/delete等打头*/
function inputTimelineInfo() {
    assertConsole("inputTimelineInfo()");
    assertCut1();
    editor.sync();
    var params = new  Object();
    params.timelineName = $("input[name='timelineName']").val();
    params.memo = editor.html();
    params.fileName = $("input[name='filename']").val();
    params.coverImage = $("#coverImage").val();

    assertConsole(params);
    var opt = _opt_c;
    if(params.fileName != '-1'){
        opt = _opt_u;
    }

    _input_timelineinfo(params,opt);
    assertCut2();
}



