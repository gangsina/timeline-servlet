<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
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
               <h3>查看审批</h3>
               <span><a href="${ctx}/front/main/right">首页</a> > <a href="#">我的审批</a> > <i>查看审批</i></span>
               <div class="clear"></div>
          </div>
          <div class="qjsq3">
          <div class="tbl2">
              <ul>
                 <li><label>审批结果:</label>
                 <span class="red rt">
                 	<#if apply.status == 1>
                 		未处理
                 	<#elseif apply.status == 2>
                 		审批中
                 	<#elseif apply.status == 3>
                 		不同意
                 	<#elseif apply.status == 4>
                 		同意
                 	<#elseif apply.status == 5>
                 		已归档
                 	</#if>
                 </span>
                 </li>
                 <li><label>申请人:</label><span class="rt">${apply.applyUser.realName}</span>
                 <li><label>申请部门:</label><span class="rt">${apply.applyUser.department.deptName}</span></li>
                 <li><label>创建日期:</label><span class="rt">${apply.createDate?string('yyyy-MM-dd HH:mm:ss')}</span>
                 <li><label>申请流程:</label><span class="rt">${apply.auditFlow.flowName}</span></li>
                 <li><label>流程说明:</label>
                 <span class="xq_01 rt">
                 <#if apply.auditFlow.memo?? && apply.auditFlow.memo != ''>
                 	${apply.auditFlow.memo}
                 <#else>
                	 --
                 </#if>
                  <#--<a href="#" class="xiangq">详情</a>--></span>
                 <span class="xq_02 rt" style="display:none">${apply.auditFlow.memo}<a href="#" class="shuos">收缩</a></span>
                 <#if flowAttaList?? && flowAttaList?size gt 0>
                 <li>
                 <label>流程附件:</label>
	                 <span class="rt">
	                  <#list flowAttaList as al>
		                 <dl class="fjtb">
		                   <dt>${al.attachmentName}</dt>
		                   <dd><a href="${ctx}/front/attachment/download?id=${al.id}">下载</a><a href="javascript:void(0);" class="fwjl" onclick="openAttachmentWin(${al.id});">详情</a></dd>
		                 </dl>
		              </#list>
	                 </span>
                 </li>
                 </#if>
                 <li><label>申请内容:</label><span class="rt">
                 <#if apply.applyContent?? && apply.applyContent != ''>
                 	${apply.applyContent}
                 <#else>
                 	--
                 </#if>
                 </span></li>
                 <#if attaList?? && attaList?size gt 0>
                 <li>
                 <label>申请附件:</label>
	                 <span class="rt">
	                  <#list attaList as al>
		                 <dl class="fjtb">
		                   <dt>${al.attachmentName}</dt>
		                   <dd><a href="${ctx}/front/attachment/download?id=${al.id}">下载</a><a href="javascript:void(0);" class="fwjl" onclick="openAttachmentWin(${al.id});">详情</a></dd>
		                 </dl>
		              </#list>
	                 </span>
                 </li>
                 </#if>
               
              </ul>
              <div class="btn_02" style="width:340px">
              <#--
               <button type="button" class="Button4" id="chaos">抄送</button>
               -->
               <#if lib.checkOper('10010203')>
               <button type="button" class="Button4" id="shenp" onclick="openApplyWin();">审批</button>
               </#if>
               
               <button type="button" class="Button5" onclick="location.href = '${ctx}/front/audit/check/index'">返回</button>
              </div>
          </div>
          <div class="tbl3">

               <div class="mbx"><strong>审批流程</strong>: ${apply.auditFlow.showFlow}</div>
               <div class="clear"></div>
               <form>
                 <table>
                    <tr>
                      <th>审批级别</th>
                      <th>审批意见</th>
                      <th>审批人</th>
                      <th>审批时间</th>
                    </tr>
                    <#if apply.recordList?size gt 0>
        	         	<#list apply.recordList as ar>
		                    <tr>
		                      <td>${ar.flowLevel.levelName}</td>
		                      <td>
		                        <#if ar.status == 1> 
			             			已同意
			                   <#else>
		                   		<span class="red">           
			                        	 不同意
			                	 </span>
			                	 [${ar.memo}]
			                   </#if>
		                      </td>
		                      <td>${ar.flowLevel.employee.realName}</td>
		                      <td>${ar.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>
		                    </tr>
		                </#list>
                    <#else>
                    	<tr>
                    		<td colspan="4" align="center">[<font color="red">暂时还没有审批记录</font>]</td>
                    	</tr>
                    </#if>
                 </table>
               </form>
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
          <div class="tbl2" id="checkView" style="overflow:auto">
       
          </div>
          <div class="btn_02">
               <button type="button" class="Button4" id="checkSubmit" onclick="formSubmit();">提交</button><button type="button" class="Button5" id="cancelButton" onclick="$.unblockUI();">取消</button>
          </div>
     </div>
</div>

<div id="fwBox" style="display:none">
	
</div>

<script type="text/javascript">

	function openAttachmentWin(id){
		$.ajax({
			url:'${ctx}/front/attachment/view',
			data:'id='+id+'&'+Math.random(),
			dataType:'html',
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
				location.reload();
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
				location.reload();
			}
		});
	}
	
	function bindAuditUpload(){
		setTimeout(function(){
		    $("#fileData").uploadify({
		        'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
		        'uploader': '${ctx}/common/upload',
		        'formData'  : {'jsessionid':'${authService.sessionId}'},
		        'buttonText':'上传附件',
		        'height':15,
		        'width':80,
		        'fileSizeLimit':'20MB',
		        'fileObjName':'fileData',
		        'removeTimeout':1,
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
	}
	
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
	
	function formSubmit(){
		
		var checkstatus = $('input[name=checkstatus]:checked').val();
		$('#status').val(checkstatus);
		var memo = $('#memo').val();
		if(checkstatus == 2 && $.trim(memo) == ""){
			alert("如果不同意，请填写意见说明！");
			$('#memo').focus();
			return;
		}
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
		$('#cancelButton').hide();
		$('#checkSubmit').html('提交中...');
		$('#checkSubmit').attr('disabled',true);
		$.ajax({
			url:'${ctx}/front/audit/check/applyUpdate',
			dataType:'json',
			data:$('#myform').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					iframeReload();
					location.href="${ctx}/front/audit/check/index"
				}else{
					$('#checkSubmit').html('提交');
					$('#checkSubmit').attr('disabled',false);
				}
			},error:function(data){
				alert("提交失败!");
				$('#checkSubmit').html('提交');
				$('#checkSubmit').attr('disabled',false);
				location.reload();
			}
		});
	}
	
	function iframeReload(){
		var ifm= parent.document.getElementById("leftFrame"); 
		ifm.contentWindow.location.reload();
	}
</script>
</body>
</html>