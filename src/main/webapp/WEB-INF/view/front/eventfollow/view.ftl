<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>事件详情</title>
    <link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<#include "/common/uploadify.ftl">
    <script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="${ctx}/static/front/js/adminJS.js"></script>
</head>
<body>
<div class="main">
    <div class="right">
        <div class="title">
            <h3>事件详情</h3>
            <span><a href="${ctx}/front/main/right">首页</a> > <a href="#">我的事件</a> > <i>查看事件</i></span>
            <div class="clear"></div>
        </div>
        <div class="qjsq3">
            <div class="tbl2">
                <ul>
                    <li><label>标题:</label><span class="rt">${follow.title}</span><div class="clear"></div></li>
                    <li><label>发起人:</label><span class="rt">${follow.initiator}</span><div class="clear"></div></li>
                    <li><label>创建日期:</label><span class="rt">${follow.createDate?string('yyyy-MM-dd HH:mm:ss')}</span><div class="clear"></div></li>
                    <li><label>甲方名称:</label><span class="rt">${follow.customerName}</span><div class="clear"></div></li>
                    <li><label>单价:</label><span class="rt">${follow.unitPrice}元</span><div class="clear"></div></li>
                    <li><label>设备数量:</label><span class="rt">${follow.deviceNumber}</span><div class="clear"></div></li>
                    <li><label>上刊时间:</label><span class="rt">${follow.adcUpTime?string('yyyy-MM-dd HH:mm:ss')}</span><div class="clear"></div></li>
                    <li><label>下刊时间价:</label><span class="rt">${follow.adcDownTime?string('yyyy-MM-dd HH:mm:ss')}</span><div class="clear"></div></li>
                    <li><label>合同来回:</label><span class="rt">${follow.contractStatus}</span><div class="clear"></div></li>
                    <li><label>上级领导:</label><span class="rt">${follow.upperStatus}</span><div class="clear"></div></li>
                    <li><label>总经理:</label><span class="rt">${follow.generalManagerStatus}</span><div class="clear"></div></li>
                    <li><label>上下刊:</label><span class="rt">${follow.adcManagerStatus}</span><div class="clear"></div></li>
                    <li><label>营销费用:</label><span class="rt">${follow.marketingCostsStatus}</span><div class="clear"></div></li>
                    <li><label>发票:</label><span class="rt">${follow.billStatus}</span><div class="clear"></div></li>
                    <li><label>收款:</label><span class="rt">${follow.makeCollectionsStatus}</span><div class="clear"></div></li>
                    <li>
                        <label>海报内容:</label>
                        <span class="rt">
                           <dl class="fjtb">
		                   <dt>${follow.adcAttachmentId}</dt>
		                   <dd><a href="${ctx}/front/attachment/download?id=${al.id}">下载</a><a href="javascript:void(0);" class="fwjl" onclick="openAttachmentWin(${al.id});">详情</a></dd>
		                 </dl>
	                 </span><div class="clear"></div>
                    </li>
                    <li>
                        <label>合同:</label>
                        <span class="rt">
                           <dl class="fjtb">
		                   <dt>${follow.contractAttachmentId}</dt>
		                   <dd><a href="${ctx}/front/attachment/download?id=${al.id}">下载</a><a href="javascript:void(0);" class="fwjl" onclick="openAttachmentWin(${al.id});">详情</a></dd>
		                 </dl>
	                 </span><div class="clear"></div>
                    </li>


                    <li><label>备注:</label><span class="rt">${memo}</span><div class="clear"></div></li>

                </ul>
                <div class="btn_02" style="width:340px">

                    <button type="button" class="Button5" onclick="goJump(${eventType},'${keywords}');">返回</button>
                </div>
            </div>
            <div class="tbl3">

                <div class="mbx"><strong>审批流程</strong>: ${apply.auditFlow.showFlow}</div>
                <div class="clear"></div>
            </div>

        </div>
    </div>
    <div class="clear"></div>
</div>




<!--审批-->
<div id="clsqBox" style="display:none">
    <div class="tcBG"></div>
    <div class="qjsq2">
        <h3>处理申请</h3>
        <div class="tbl2" id="checkView">

        </div>
        <div class="btn_02">
            <button type="button" class="Button4" onclick="formSubmit();">提交</button><button type="button" class="Button5" onclick="$.unblockUI();">取消</button>
        </div>
    </div>
</div>

<div id="fwBox" style="display:none">

</div>

<script type="text/javascript">

    function goJump(e,k) {
//        alert(e,k);
        window.location.href = "${ctx}/front/eventfollow/index?eventType="+e+"&keywords="+k;
    }

    function openAttachmentWin(id){
        $.ajax({
            url:'${ctx}/front/attachment/view',
            data:'id='+id+'&'+Math.random(),
            dataType:'html',
            type:'get',
            success:function(data){
                $('#fwBox').html(data);
                $.blockUI({
                    message: $('#fwBox'),
                    css:{
                        top:'2%',
                        left:'1%'
                    }
                });
            },error:function(data){
                alert("请求失败！");
            }
        });
    }
    function openApplyWin(){
        $.ajax({
            url:'${ctx}/front/audit/check/viewCheck',
            data:'id=${apply.id}',
            dataType:'html',
            success:function(data){
                $('#checkView').html(data);
                bindAuditUpload();
                $.blockUI({
                    message: $('#clsqBox'),
                    css:{
                        top:'1%',
                        left:'1%'
                    }
                });
            },error:function(data){
                alert("请求失败！");
            }
        });
    }

    function bindAuditUpload(){
        setTimeout(function(){
            $("#fileData").uploadify({
                'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
                'uploader': '${ctx}/common/upload',
                'buttonText':'上传附件',
                'height':15,
                'width':80,
                'fileSizeLimit':'20MB',
                'fileObjName':'fileData',
                'removeTimeout':1,
                'queueSizeLimit':1,
                'multi':false,
                'onUploadSuccess' : function(file, data, response) {
                    eval('data = '+data);
                    $("#attachmentId").val(data.attachmentId);
                    //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                },onSelectError : function(file, errorCode, errorMsg) {
                    alert("上传文件错误!");
                }
            });
        },10);
    }

    function formSubmit(){
        var memo = $('#memo').val();
        if($.trim(memo).length > 1000){
            alert('意见说明输入过长了！');
            return;
        }
        var msgType = "";
        if($('#mailCheck').prop('checked')){
            msgType += "1";
        }else{
            msgType += "0";
        }
        if($('#mobileCheck').prop('checked')){
            msgType += "1";
        }else{
            msgType += "0";
        }
        $('#msgType').val(msgType);
        var checkstatus = $('input[name=checkstatus]:checked').val();
        $('#status').val(checkstatus);
        $.ajax({
            url:'${ctx}/front/audit/check/applyUpdate',
            dataType:'json',
            data:$('#myform').serialize(),
            type:'post',
            success:function(data){
                alert(data.msg);
                if(data.result == "ok"){
                    location.href="${ctx}/front/audit/apply/index"
                }
            },error:function(data){
                alert("提交失败!");
            }
        });
    }
</script>
</body>
</html>