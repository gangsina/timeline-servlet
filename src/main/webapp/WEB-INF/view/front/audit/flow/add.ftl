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
  <form id="myform">
  <input type="hidden" id="attachmentIds" name="attachmentIds" value="" />
  <div class="right">
          <div class="title"> 
               <h3>新增流程</h3>
               <span><a href="${ctx}/front/main/right">首页</a> > <a href="${ctx}/front/audit/flow/index">审批维护</a> > <i>新增流程</i></span>
               <div class="clear"></div>
          </div>
          <div id="bjlcBox">
				<div class="qjsq2">
          		<div class="tbl2" style="height:auto;">
              	<ul>
                 	<li>
                 		<label>流程类型:</label>
                 		<select name="auditCategoryId" id="auditCategoryId" class="xialak" style="width:174px">
                              <#list categoryList as cl>
                              	<option value="${cl.id}">${cl.categoryName}</option>
                              </#list>
                        </select>
                 	</li>
                	<li><label><strong>* </strong>流程名称:</label>
                 		<input type="text" name="flowName" id="flowName" class="put validate[required,maxSize[100]]" value="" />
                 	</li>
                 	<li><label style="vertical-align:top">流程说明:</label>
                 		<textarea name="memo" id="memo" class="validate[maxSize[1000]]"></textarea>
                 	</li>
                 <li>
                 <div style="margin-left:124px;">
	                 <input type="file" name="fileData" id="fileData">
                 </div>
                <div style="margin-left:124px;display:none" id="attachmentShow">
                	
             	</div>
                 </li>
              </ul>
          </div>
          <div class="tbl3">
               <a href="javascript:void(0);" onclick="addLevel();" class="tjjb">添加级别</a>
               <div class="mbx"><strong>审批流程</strong>: <span id="flowEmpDiv"><font color="red">请先设置审批级别</font></span></div>
               <div class="clear"></div>
                 <table id="levelTable">
                    <tr>
                      <th width="20%">级别</th>
                      <th width="30%">级别名称</th>
                      <th width="35%">审批人<span> (选择人员)</span></th>
                      <th width="25%">操作</th>
                    </tr>
                    <tr>
                      <td>1</td>
                      <td><input type="text" name="levelCnInput" maxlength="50" class="put" value="第一级审批" /></td>
                      <td>
                        <span class="span1"><em dataId="-1" msgType="00" id="levelEmp0">--</em><a href="javascript:void(0);" onclick="openEmpTree(0);">【选择】</a></span>
                        </td>
                      <td><a class="shanc" href="javascript:void(0);" onclick="removeLevel(this);"></a></td>
                    </tr>
                 </table>
          </div>
          <div class="btn_02">
               <button type="button" class="Button4" onclick="formSubmit();">提交</button>
               <button type="button" onclick="history.back(-1);" class="Button5">返回</button>
          </div>
     </div>
	</div>
 </div>
 </form>
 <div class="clear"></div>
 
 <div id="csBox_1111" style="display:none">
     <div class="tcBG"></div>
     <div class="qjsq">
          <h3>选择人员</h3>
          <a href="javascript:void(0);" onclick="$.unblockUI();" class="guanbi">X</a>
           <div class="tbl4 ztreeData" style="margin-left:10px;overflow:auto;">
             	<ul id="ztreeList" class="ztree"></ul>
             </div>
          <div class="txfs" style="width:150px">
               <p>提醒方式:</p>
               <span><input type="checkbox" value="" class="chek" id="mailCheck" checked><label>邮件</label></span>
               <span><input type="checkbox" value="" class="chek" id="mobileCheck"><label>短信</label></span>
          </div>
          <div class="btn_02" style="float:left;width:80px; margin-top:6px">
               <button type="button" class="Button4" onclick="selectEmp();">确定</button>
          </div>
     </div>
     <input type="hidden" id="currentLevel" value="0">
</div>
</body>
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
		        'formData'  : {'jsessionid':'${authService.sessionId}'},
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
		            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传文件错误!");
		        }
		    });
		 },10);
		 
	});
	
	function formSubmit(){
		var allCheck = $("#myform").validationEngine("validate");
		if(!allCheck){
			return;
		}
		var levelTable = $('#levelTable').find('tr');
		var levelForm = "";
		var index = 0;
		for(var i = 1;i<levelTable.length;i++){
			var level = $(levelTable[i]);
			var levelName = level.find('input[name=levelCnInput]').eq(0).val();
			if($.trim(levelName) == ""){
				alert('请输入级别名称!');
				return;
			}
			var empId = level.find('em').eq(0).attr('dataId');
			if(empId == '' || empId == '-1'){
				alert('请选择审批人员!');
				return;
			}
			var msgType = level.find('em').eq(0).attr('msgType');
			levelForm += '<input type="hidden" name="levelList['+index+'].levelName" value="'+levelName+'">'+
						 '<input type="hidden" name="levelList['+index+'].msgType" value="'+msgType+'">'+
						 '<input type="hidden" name="levelList['+index+'].sortOrder" value="'+index+'">'+
						 '<input type="hidden" name="levelList['+index+'].employeeId" value="'+empId+'">';
			index++;
		}
		$('#myform').append(levelForm);
		
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
		$.ajax({
			url:'${ctx}/front/audit/flow/create',
			dataType:'json',
			data:$('#myform').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					location.href="${ctx}/front/audit/flow/index"
				}
			},error:function(data){
				alert("提交失败!");
			}
		})
	}
	
	var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "level"
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	
	function openEmpTree(level){
		var empId = $('#levelEmp'+level).attr('dataId');
		$('#currentLevel').val(level);
		$.ajax({
			url:'${ctx}/front/audit/flow/empTree',
			data:{empId:empId},
			dataType:'json',
			success:function(data){
				$("#ztreeList").html('');
				$.fn.zTree.init($("#ztreeList"), setting, data);
				$.blockUI({
                    message: $('#csBox_1111'),
                    css:{
                    	top:'10%'
                    }
                });
			},error:function(data){
				location.reload();
			}
		});
	}
	
	function selectEmp(){
		var nodes =  $.fn.zTree.getZTreeObj("ztreeList").getCheckedNodes(true);
		if(nodes.length != 1){
			alert('必须选择一项!');
			return;
		}
		var nodeId = nodes[0].id;
		var nodeName = nodes[0].name;
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
		if(msgType == '00'){
			alert("最少选择一个提醒方式!");
			return;
		}
		var currentLevel = $('#currentLevel').val();
		$('#levelEmp'+currentLevel).attr('dataId',nodeId);
		$('#levelEmp'+currentLevel).attr('msgType',msgType);
		$('#levelEmp'+currentLevel).html(nodeName);
		flowEmpReset();
		$.unblockUI();
	}
	
	function flowEmpReset(){
		var levelTr = $('#levelTable').find('tr');
		var flowVal = '';
		for(var i = 0;i<levelTr.length;i++){
			if(i == 0){
				continue;
			}
			var trObj = $(levelTr[i]);
			var empL = trObj.find('em').eq(0).html();
			if(empL != '' && empL != '--'){
				flowVal += '>'+empL;
			}
		}
		flowVal = flowVal.substring(1,flowVal.length);
		$('#flowEmpDiv').html(flowVal);
	}
	
	var levelCnArr = ['零','一','二','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五'];
	
	function addLevel(){
		
		var levelTr = $('#levelTable').find('tr');
		var level = levelTr.length;
		if(level >= 16){
			alert('最多添加15个级别!');
			return;
		}
		var levelCn = '第'+levelCnArr[level]+'级审批';
		
		var levelHtml = '<tr>'+
                      		'<td>'+level+'</td>'+
                      		'<td><input type="text" name="levelCnInput" maxlength="50" class="put" value="'+levelCn+'" /></td>'+
                      		'<td>'+
                        		'<span class="span1"><em dataId="-1" msgType="00" id="levelEmp'+level+'">--</em><a href="javascript:void(0);" onclick="openEmpTree('+level+');">【选择】</a></span>'+
                        	'</td>'+
                      		'<td><a class="shanc" href="javascript:void(0);" onclick="removeLevel(this);"></a></td>'+
                    	'</tr>';
        $('#levelTable').append(levelHtml);
	}
	
	function removeLevel(obj){
		var levelTr = $('#levelTable').find('tr');
		var level = levelTr.length;
		if(level <= 2){
			alert("至少有一个审批级别！");
			return;
		}
		if(confirm("确定要删除该级别吗？")){
			$(obj).parent().parent().remove();
			resetLevel();
		}
	}
	
	function resetLevel(){
		var levelTr = $('#levelTable').find('tr');
		var level = levelTr.length;
		for(var i = 0;i<levelTr.length;i++){
			if(i == 0){
				continue;
			}
			var trObj = $(levelTr[i]);
			var cLevel = parseInt(trObj.find('td').eq(0).html());
			trObj.find('td').eq(0).html(i);
			var levelCn = '第'+levelCnArr[cLevel]+'级审批';
			var levelInput = trObj.find('input[name=levelCnInput]').eq(0);
			if(levelInput.val() == '' || levelInput.val() == levelCn){
				levelInput.val('第'+levelCnArr[i]+'级审批');
			}
		}
		flowEmpReset();
	}

</script>
</html>