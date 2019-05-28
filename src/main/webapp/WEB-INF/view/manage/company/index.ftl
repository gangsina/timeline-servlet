
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公司信息</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<style type="text/css">
	.sczp .uploadify{margin:0 auto}
</style>
<#include "/common/script.ftl">
<#include "/common/validation.ftl">
<#include "/common/uploadify.ftl">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/manage/js/adminJS.js"></script>
<script type="text/javascript" src="${ctx}/static/common/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#myform").validationEngine("attach",{ 
		    promptPosition:"topRight", 
		    scroll:false 
		}); 
		
	});
	
	function formSubmit(){
		var allCheck = $('#myform').validationEngine('validate');
		if(!allCheck){
			return;
		}
		$.ajax({
			url:'${ctx}/manage/company/update',
			async:false,
			dataType:'json',
			data:$('#myform').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
			},error:function(data){
				alert("保存失败!");
			}
		})
	}
	
	
	// 上传照片 
	$(function() {
	
		setTimeout(function(){
		    $("#fileData").uploadify({
		        'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
		        'uploader': '${ctx}/common/upload',
		        'buttonText':'上传LOGO',
		        'formData':{'jsessionid':'${authService.sessionId}'},
		        'height':18,
		        'width':100,
		        'fileSizeLimit':'20MB',
		        'fileObjName':'fileData',
		        'fileTypeDesc': '类型',
		        'fileTypeExts': '*.jpg;*.jpeg;*.png;*.gif;*.bmp;',
		        'removeTimeout':3,
		        'queueSizeLimit':1,
		        'multi':false,
		        'onUploadSuccess' : function(file, data, response) {
		        	eval('data = '+data);
		        	if(data.result == true){
			        	$("#logoAttachmentId").val(data.attachmentId);
			        	$("#logoImg").attr("src", '${ctx}/front/attachment/read?id=' + data.attachmentId);
			        	$("#logoImg").show();
		        	} else {
		        		alert("上传失败!");
		        	}
		            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传失败!");
		        }
		    });
		 },10);
		 
	});

	
</script>
</head>
<body>
<form id="myform">
<div class="main">
     <div class="ygjbxx">
          <h3 class="tit">公司信息管理</h3>
          <div class="xxList">
          			<input type="hidden" name="id" value="${company.id?if_exists}">
                   <table>
                        <tr>
                           <th>公司名称:</th>
                           <td><input type="text" name="companyName" value="${company.companyName?if_exists}"  class="put validate[required,maxSize[100]]" style="width:450px"/></td>
                        </tr>
                         <tr>
                           <th>备案号:</th>
                           <td><input type="text" name="recordNumber" value="${company.recordNumber?if_exists}"  class="put validate[required,maxSize[100]]" style="width:450px"/></td>
                        </tr>
                         <tr>
                           <th>系统名称:</th>
                           <td><input type="text" name="systemName" value="${company.systemName?if_exists}"  class="put validate[required,maxSize[100]]" style="width:450px"/></td>
                        </tr>
                        <tr>
                           <th>公司LOGO:</th>
                           <td>
                           <input type="file" id="fileData" name="fileData" />
                           <input type="hidden" name="logoAttachmentId" id="logoAttachmentId" value="${company.logoAttachmentId?if_exists}" />
                           </td>
                        </tr>
                        <tr>
                           <th></th>
                           <td><img width="300" id="logoImg" <#if company.logoAttachmentId??>src="${ctx}/front/attachment/read?id=${company.logoAttachmentId}" <#else> style="display:none" </#if>/></td>
                        </tr>
                        <#if lib.checkOper('20040102')>
                        <tr>
                        	<td colspan="2" align="center"><button type="button" onclick="formSubmit();" style="width: 130px;
							height: 39px;
							background: #3e89b5;
							border-radius: 5px;
							border: none;
							cursor: pointer;
							color: #fff;
							font-size: 14px;">保存</button>
							</td>
                        </tr>
                        </#if>
                   </table>
          </div>
</div>

</form>
</body>
</html>
