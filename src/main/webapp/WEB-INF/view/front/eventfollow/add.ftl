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

<input type="hidden" name="eventTag" id="eventTag" value="1"/>
     <div class="right">
          <div class="title"> 
               <h3>新建事件</h3>
               <span><a href="${ctx}/front/main/right">首页</a> > <a href="#">我的事件</a> > <i>新建事件</i></span>
               <div class="clear"></div>
          </div>
          <div class="qjsq3">
          <div class="tbl2">
              <ul>

				  <li><label>事件类型:</label>
				  <span  class="rt">
                	<select id="eventType" name="eventType" style="height: 25px;width: 100px;vertical-align: middle;float:left">
                            <option value="1" selected="selected">广告事件</option>
                            <option value="2" >活动事件</option>
                            <option value="3" >媒介事件</option>
                	</select>
				  </span>
                      <div class="clear"></div>
				  </li>
				  <li><label>发起人:</label><span  class="rt">${userName}</span><div class="clear"></div></li>
                  <li><label><strong>*</strong>标题:</label><span class="rt"><input id="title" name="title" type="text"/></span><div class="clear"></div></li>
				  <li id="customer_name_li"><label><strong>*</strong>甲方名称:</label><span class="rt"><input id="customerName" name="customerName" type="text"/></span><div class="clear"></div></li>
                  <li id="unit_price_li"><label><strong>*</strong>单价:</label><span class="rt"><input id="unitPrice" name="unitPrice" type="text"/></span><div class="clear"></div></li>
                  <li id="device_number_li"><label><strong>*</strong>设备数量:</label><span class="rt"><input id="deviceNumber" name="deviceNumber" type="text"/></span><div class="clear"></div></li>


                  <li id="address_li"><label>地址:</label><span class="rt"><input id="address" name="address" type="text"/></span><div class="clear"></div></li>
                  <li id="property_manager_company_li"><label><strong>*</strong>物业:</label><span class="rt"><input id="propertyManagerCompany" name="propertyManagerCompany" type="text"/></span><div class="clear"></div></li>
                  <li id="adc_up_time_li"><label><strong>*</strong>开始时间:</label><span class="rt"><input id="adcUpTime" name="adcUpTime" type="text"/></span><div class="clear"></div></li>
                  <li id="adc_down_time_li"><label><strong>*</strong>结束时间:</label><span class="rt"><input id="adcDownTime" name="adcDownTime" type="text"/></span><div class="clear"></div></li>

                  <li id="picData_li">
                      <label><strong>*</strong>安装位置:</label>
                      <span class="rt"><input type="file" id="picData" /></span>
                      <div class="clear"></div>
                      <div style="margin-left:140px;display:none" id="attachmentShow">
                      </div>
                  </li>
				  <li id="contractData_li">
                      <label>合同:</label>
                      <span class="rt"><input type="file" id="contractData" /></span>
                      <div class="clear"></div>
                      <div style="margin-left:140px;display:none" id="attachmentShow">
                      </div>
                  </li>
                 <li id="adData_li">
                 	 <label>海报内容:</label>
	                 <span class="rt"><input type="file" id="adData" /></span>
	                 <div class="clear"></div>
	                  <div style="margin-left:140px;display:none" id="attachmentShow">
             			</div>
                 </li>
                  <li id="budgetData_li">
                      <label>预算详表:</label>
                      <span class="rt"><input type="file" id="budgetData" /></span>
                      <div class="clear"></div>
                      <div style="margin-left:140px;display:none" id="attachmentShow">
                      </div>
                  </li>
                  <li id="settleData_li">
                      <label>结算表:</label>
                      <span class="rt"><input type="file" id="settleData" /></span>
                      <div class="clear"></div>
                      <div style="margin-left:140px;display:none" id="attachmentShow">
                      </div>
                  </li>
                 <li>
                 	<label></label>
                 	<span class="txfs2 rt">
                 	<strong style="margin-right:10px; font-weight:normal">提醒方式:</strong>
                 	<input type="checkbox" value="" class="chek" id="mailCheck" checked disabled=“”><i>邮件</i>
                 	<input type="checkbox" value="" class="chek" id="mobileCheck" disabled=""><i> 短信</i></span>
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

    $("#eventType").change(function(){
        var checkText=$("#eventType").find("option:selected").val();
        $("#eventTag").val(checkText);
//        alert(checkText);
		if(checkText==1){
            $("#customer_name_li").show();
            $("#unit_price_li").show();
            $("#device_number_li").show();

            $("#address_li ").hide();
            $("#property_manager_company_li").hide();
            $("#adc_up_time_li").hide();
            $("#adc_down_time_li").hide();
            $("#picData_li").hide();
            $("#contractData_li").show();
            $("#adData_li ").show();
            $("#budgetData_li").hide();
            $("#settleData_li").hide();
		}else if(checkText==2){
            $("#customer_name_li").show();
            $("#unit_price_li").show();
            $("#device_number_li").hide();

            $("#address_li ").hide();
            $("#property_manager_company_li").hide();
            $("#adc_up_time_li").hide();
            $("#adc_down_time_li").hide();
            $("#picData_li").hide();
            $("#contractData_li").show();
            $("#adData_li ").hide();
            $("#budgetData_li").show();
            $("#settleData_li").show();
		}else if(checkText==3){
            $("#customer_name_li").hide();
            $("#unit_price_li").show();
            $("#device_number_li").hide();

            $("#address_li ").show();
            $("#property_manager_company_li").show();
            $("#adc_up_time_li").show();
            $("#adc_down_time_li").show();
            $("#picData_li").show();
            $("#contractData_li").hide();
            $("#adData_li ").hide();
            $("#budgetData_li").hide();
            $("#settleData_li").hide();
		}
	});

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
        $("#customer_name_li").show();
        $("#unit_price_li").show();
        $("#device_number_li").show();
        $("#contract_price_li").hide();
        $("#contract_time_li").hide();
        $("#address_li ").hide();
        $("#property_manager_company_li").hide();
        $("#adc_up_time_li").hide();
        $("#adc_down_time_li").hide();
        $("#picData_li").hide();
        $("#contractData_li").show();
        $("#adData_li ").show();
        $("#budgetData_li").hide();
        $("#settleData_li").hide();

		setTimeout(function(){
		    $("#contractData").uploadify({
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
		            alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传文件错误!");
		        }
		    });
		 },10);
	});
	
	function formSubmit(){
		$('#submitButton').html("提交中...");
		$('#submitButton').attr('disabled',true);
		var eventTag = $('#eventTag').val();
        var formData = new Object();
        formData.eventType=$('#eventTag').val();
		formData.title=$('#title').val();
        formData.customerName=$('#customerName').val();
        formData.unitPrice=$('#unitPrice').val();
        if(eventTag==1){
        formData.deviceNumber=$('#deviceNumber').val();
		}
        formData.address=$('#address').val();
        formData.propertyManagerCompany=$('#propertyManagerCompany').val();

//        formData.adcUpTime=$('#adcUpTime').val();
//        formData.adcDownTime=$('#adcDownTime').val();
		$.ajax({
			url:'${ctx}/front/eventfollow/create',
			dataType:'json',
            data: formData,
			//data:$('#myform').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					location.href="${ctx}/front/eventfollow/index"
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