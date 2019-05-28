<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<#include "/common/uploadify.ftl">
<#include "/common/validation.ftl">
<script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/adminJS.js"></script>
<style type="text/css">

</style>
</head>
<body>
<form id="myform">
<input type="hidden" id="attachmentIds" name="attachmentIds" value="" />
<input type="hidden" name="auditFlowId" id="auditFlowId" value="-1"/>
<input type="hidden" name="auditFlowLevelId" id="auditFlowLevelId" value="-1"/>
<input type="hidden" name="msgType" id="msgType" value="-1"/>
     <div class="right">
          <div class="title"> 
               <h3>新建申请</h3>
               <span><a href="${ctx}/front/main/right">首页</a> > <a href="#">我的申请</a> > <i>新建申请</i></span>
               <div class="clear"></div>
          </div>
          <div class="qjsq3">
          <div class="tbl2">
              <ul>
                 <li><label>申请人:</label><span  class="rt">${emp.realName}</span>
                 <li><label>申请部门:</label><span class="rt">${emp.department.deptName}</span></li>
                 <li>
                 	<label><strong>*</strong>申请流程:</label>
                 	<span class="rt"><em id="flowDiv">--</em><a href="javascript:void(0);" onclick="openFlowWin();" class="xzlc">选择流程</a></span>
                 </li>
                 <li id="flowMemoTag">
                 	<label>流程说明:</label>
                 	<span class="rt"><em id="flowMemo">--</em></span>
                 </li>
                 
                 
                 
                 <li>
                 	<label><strong>*</strong>申请内容:</label>
                 	<span class="rt"><textarea name="applyContent" id="applyContent" style="width:580px;height:120px; margin-bottom:20px" class="validate[required,maxSize[1000]"></textarea></span>
                 </li>
                 <li>
                 	 <label></label>
	                 <span class="rt"><input type="file" name="fileData" id="fileData" /></span>
	                 <div class="clear"></div>
	                  <div style="margin-left:140px;display:none" id="attachmentShow">
                	
             			</div>
                 </li>
                 
                 <li>
                 	<label>审批人:</label>
                 	<span class="rt"><input type="text" name="name" readonly class="put" value="点击选择审批人" style="width:240px" id="spr"/></span>
                 </li>
                 <li>
                 	<label></label>
                 	<span class="txfs2 rt">
                 	<strong style="margin-right:10px; font-weight:normal">提醒方式:</strong>
                 	<input type="checkbox" value="" class="chek" id="mailCheck" checked><i>邮件</i>  
                 	<input type="checkbox" value="" class="chek" id="mobileCheck"><i> 短信</i></span>
                 </li>
              </ul>
              <div class="btn_03">
               <button type="button" class="Button4" id="submitButton" onclick="formSubmit();">提&nbsp;&nbsp;交</button>
              </div>
          </div>
     </div>
     </div>
     <div class="clear"></div>
</form>

<!--选择流程-->
<div id="lcBox" style="display:none">
     <div class="tcBG"></div>
     <div class="xzjs xzjs1">
          <h3>选择流程</h3>
          <div class="xzglBx xzzy" style="overflow:auto;">
               <table id="flowList">
					<#list categoryList as cl>
					   <tr>
					      <td class="name2">${cl.categoryName}：</td>
					      <td>
					      <#assign isHas = false>
					      <#list cl.flowList as cf>
					      	<#if cf.disableFlag?? && cf.disableFlag == 1>
					      		<#assign isHas = true>
					      		<a href="javascript:void(0);" onclick="selectFlow(${cf.id})">【${cf.flowName}】</a>
					      	</#if>
					      </#list>
					      <#if !isHas>
					      	该类型下暂无可用流程
					      </#if>
					      </td>  
					   </tr>
					 </#list>
               </table>
          </div>
          <div style="text-align:center">
           		<button type="button" onclick="$.unblockUI();" style="border-radius: 5px; width:90px;height:30px;background-color:#999999;
color: #fff;
border: none;
cursor: pointer;
margin-top: 10px;
margin-right: 10px;
font-family: "微软雅黑";
background: #414141;
border: 1px solid #d4d4d4;">取消</button>
      	  </div>
     </div>
</div>


<script type="text/javascript">

	function deleteAttachment(id){
		$("#attachment_"+id).remove();
		//$("#attachmentShow").hide();
	}
	
	function addAttachment(id,fileName){
		var html = '<div id="attachment_'+id+'">附件：<span>'+fileName+'</span>'+
				   '<a href="javascript:void(0);" style="margin-left:5px;color:#45aad7" onclick="deleteAttachment('+id+');">删除</a>'+
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
		        'buttonText':'上传附件',
		        'formData'  : {'jsessionid':'${authService.sessionId}'},
		        'height':15,
		        'width':80,
		        'fileSizeLimit':'20MB',
		        'fileObjName':'fileData',
		        'removeTimeout':2,
		        'queueSizeLimit':5,
		        'onUploadSuccess' : function(file, data, response) {
		        	eval('data = '+data);
		        	addAttachment(data.attachmentId,file.name);
		            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传文件错误!");
		        }
		    });
		 },10);
	});
	
	function formSubmit(){
		if($('#flowDiv').html() == '--'){
			alert("请选择流程！");
			return;
		}
		var allCheck = $("#myform").validationEngine("validate");
		if(!allCheck){
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
		if(msgType == "00"){
			alert("最少选择一个提醒方式!");
			return;
		}
		
		var attachmentData = $('input[name=attachmentId]');
		var attachmentIds = "";
		for(var i = 0;i<attachmentData.length;i++){
			var attachmentId = $(attachmentData[i]);
			attachmentIds += attachmentId.val() + ',';
		}
		if(attachmentIds != ''){
			attachmentIds = attachmentIds.substring(0,attachmentIds.length-1);
		}
		$('#attachmentIds').val(attachmentIds);
		$('#msgType').val(msgType);
		$('#submitButton').html("提交中...");
		$('#submitButton').attr('disabled',true);
		$.ajax({
			url:'${ctx}/front/audit/apply/create',
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
				$('#submitButton').html("提&nbsp;&nbsp;交");
				$('#submitButton').attr('disabled',false);
			}
		})
	}
	
	function openFlowWin(){
		$.blockUI({
            message: $('#lcBox'),
            css:{
            	top:'1%',
            	left:'1%'
            }
        });
	}
	
	function selectFlow(id){
		$.ajax({
			url:'${ctx}/front/audit/apply/flowDetail',
			dataType:'json',
			data:'id='+id,
			success:function(data){
				$('.appendHtml').parent().remove();
				$('#flowDiv').html(data.flow);
				if(data.memo != ''){
					$('#flowMemo').html(data.memo);
				}
				if(data.attaList != null && data.attaList.length > 0){
					var attaList = data.attaList;
					var attaHtml = "";
					var memo = '流程附件:';
					for(var i = 0;i<attaList.length;i++){
						var href = '${ctx}/front/attachment/download?id='+attaList[i].attachment_id;
						var flowAttaDiv = '<em>'+attaList[i].attachment_name+'</em><a href="'+href+'" class="zxlc">下载</a>';
						if(i>0){
							memo = '';
						}
						attaHtml += '<li>'+
		                 				'<label>'+memo+'</label>'+
		                 				'<span class="rt appendHtml">'+
		                 				flowAttaDiv+
		                 				'</span>'+
                 					'</li>';
					}
					$('#flowMemoTag').after(attaHtml);
				}
				$('#spr').val(data.first_emp_name);
				$('#auditFlowId').val(data.id);
				$('#auditFlowLevelId').val(data.first_id);
				$.unblockUI();
			},error:function(data){
				alert("请求失败！");
			}
		});
	}
</script>
</body>
</html>