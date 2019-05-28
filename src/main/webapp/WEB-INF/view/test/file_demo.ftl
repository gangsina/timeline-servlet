<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
    <#include "/common/script.ftl">
    <#include "/common/ztree.ftl">
    <#include "/common/uploadify.ftl">
    <#include "/common/validation.ftl">
    <script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="${ctx}/static/front/js/adminJS.js"></script>
    <style type="text/css">

        .ztreeData ul li{
            margin:0;
        }

        .ztreeData ul li span{
            margin:0;
        }

        .uploadify_p{
            margin-left:124px;
        }
    </style>
</head>
<body>
<div style="margin-left:124px;">
    <input type="file" name="fileData" id="fileData">
</div>
<div style="margin-left:124px;display:none" id="attachmentShow">

</div>
<div>
    <img src="" alt=""/>
</div>

</body>
<script type="text/javascript">

    function deleteAttachment(id){
        alert(id);
        $("#attachment_"+id).remove();
        var _href = "${ctx}/front/attachment/download?id="+id;
        window.location.href= _href
        //$("#attachmentShow").hide();
    }

    function addAttachment(id,fileName){

        var html = '<div id="attachment_'+id+'">附件：<span>'+fileName+'</span>'+
            '<a href="javascript:void(0);" style="margin-left:5px;color:#45aad7" onclick="deleteAttachment('+id+');">查看</a>'+
            '<input type="hidden" name="attachmentId" value="'+id+'">';
        var attachmentShow = $('#attachmentShow');
        if(attachmentShow.html() == ''){
            attachmentShow.html(html+'</div>');
        }else{
            html = html + '</br></div>';
            attachmentShow.append(html);
        }
        $('#attachmentShow').show();
    }

    $(function() {

        setTimeout(function(){
            $("#fileData").uploadify({
                'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
                'uploader': '${ctx}/common/upload',
                'formData'  : {'jsessionid':'changeit'},
                'buttonText':'上传附件',
                'height':15,
                'width':80,
                'fileSizeLimit':'100MB',
                'fileObjName':'fileData',
                'removeTimeout':3,
                'queueSizeLimit':5,
                'onUploadSuccess' : function(file, data, response) {
                    eval('data = '+data);
                    addAttachment(data.attachmentId,file.name);
                    alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data.attachmentId);
                    alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                },onSelectError : function(file, errorCode, errorMsg) {
                    alert("上传文件错误!");
                }
            });
        },10);

    });


</script>
</html>