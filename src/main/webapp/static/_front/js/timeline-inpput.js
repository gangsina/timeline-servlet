/*
*这个文件用来处理timeline.html文件的前端逻辑。
* */


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
    phData.service_controller = "timelineService";

    var reqData = Object.create(null);
    reqData.filename = filename;

    _ajax_normal_ext(reqData, phData, list_ajax_callback);

}


function list_ajax_callback(retData) {
    assertConsole("_ajax_callback:retData-->");
    assertConsole(retData);

    //todo 时间轴信息返回处理。
}


