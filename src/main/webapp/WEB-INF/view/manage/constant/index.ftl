<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<#include "/common/script.ftl">
<#include "/common/validation.ftl">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/manage/js/adminJS.js"></script>
<script type="text/javascript">
	$(function(){
	
				
	});
	
function classTypeSearch(){
	var classType = $("#classType").val();
	$("#searchClassType").val(classType);
	$("#searchForm").attr("action","${ctx}/manage/constant/index");
	$("#searchForm").attr("method","post");
	$("#searchForm").submit();
}

function publish(){
	var classType = $("#classType").val();
	$.ajax({
		url:"${ctx}/manage/constant/publish",
		data:{'classType':classType},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data){
				alert("发布成功！");
			}else{
				alert("发布失败！");
			}
		},error:function(data){
			alert("系统异常!");
		}
		
	})
}

function publishAll(){
	var classType = $("#classType").val();
	$.ajax({
		url:"${ctx}/manage/constant/publishall",
		data:{},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data){
				alert("发布成功！");
			}else{
				alert("发布失败！");
			}
		},error:function(data){
			alert("系统异常!");
		}
		
	})
}

function reset(){
	$.ajax({
		url:"${ctx}/manage/constant/reset",
		dataType:'json',
		type:'post',
		success:function(data){
			if(data){
				alert("重启成功！");
			}else{
				alert("重启失败！");
			}
		},error:function(data){
			alert("系统异常!");
		}
		
	})
}

function deleteByKey(key){
	if(confirm("确定要删除吗？")){
		$.ajax({
			url:'${ctx}/manage/constant/delete',
			dataType:'json',
			data:"key="+key,
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					location.reload();
				}
			},error:function(data){
				alert("提交失败!");
			}
		})
	}
}

function openConstantWin(id){
		$.ajax({
			url:'${ctx}/manage/constant/input',
			data:'id='+id,
			dataType:'html',
			success:function(data){
				$('#bmBox').html(data);
				$.blockUI({
	                message: $('#bmBox'),
	                css:{
	                	top:'2%'
	                }
	            });
			},error:function(data){
				alert("请求失败！");
			}
		});
	}
	
	function autoClassType(){
		var classType = $("#classTypeSelect").val();
		if(classType == ""){
			return;			
		}
		$("#inputClassType").val(classType);
		
	}
	
	function formSubmit(){
		var allCheck = $('#myform').validationEngine('validate');
		if(!allCheck){
			return;
		}
		$.ajax({
			url:'${ctx}/manage/constant/save',
			dataType:'json',
			data:$('#myform').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					location.reload();
				}
			},error:function(data){
				alert("提交失败!");
			}
		})
	}	
</script>
</head>
<body>
<div class="main">
     <div class="list" style="position:static">
        <div class="titNm">
             <h3>常量管理</h3>
             <!--<div class="time">(2014-08)</div>-->
             <#if lib.checkOper('20020102') || lib.checkOper('0000')>
             <div class="dd"><a href="javascript:void(0);" onclick="openConstantWin(-1);" class="tjyg">添加常量</a></div>
             </#if>
             <#if lib.checkOper('20020105') || lib.checkOper('0000')>
             <div class="dd"><a href="javascript:void(0);" onclick="publish();" class="shanc" title="更新当前 val(class_type)的所有键值对到主存数据 (redis db 6)" alt="更新当前 val(class_type)的所有键值对到主存数据 (redis db 6)">发布到主存</a></div>
             </#if>
             <#if lib.checkOper('20020105') || lib.checkOper('0000')>
             <div class="dd"><a href="javascript:void(0);" onclick="publishAll();" class="shanc" title="点击  全部更新  将更新所有键值对到  主存数据库 (redis db 6 )" alt="点击  全部更新  将更新所有键值对到  主存数据库 (redis db 6 )">全部更新</a></div>
             </#if>
             <#if lib.checkOper('20020106') || lib.checkOper('0000')>
             <div class="dd"><a href="javascript:void(0);" onclick="reset();" class="shanc">重启主存客户端</a></div>
             </#if>
             	<select id="classType" onchange="classTypeSearch();" style="width:120px;height:25px;margin-top:32px">
             		<#if classTypeList?? && classTypeList?size gt 0>
		        		<#list classTypeList as ct>
		        			<option value="${ct}" <#if classType == ct>selected="selected"</#if>>${ct}</option>
		        		</#list>
		        	<#else>
		        		<option value="${classType}">选择常量类别</option>
		        	</#if>
             	</select>
             <div class="clear"></div>
             <form id="searchForm">
             	<input type="hidden" name="classType" id="searchClassType" value="">
             </form>
       </div>
        <form>
           <table  id="mytable">
               <tr>
                  <th>序号</th>
                  <th>描述</th>
                  <th>常量Key</th>
                  <th>常量Value</th>
                  <th>操作</th>
               </tr>
               <#list constantList as cl>
               <tr>
                  <td>${cl_index+1}</td>
                  <td>${cl.memo}</td>
                  <td>${cl.key}</td>
                  <td>${cl.value}</td>
                  <td>
                  	 <#if lib.checkOper('20020103') || lib.checkOper('0000')>
                     	<a href="javascript:void(0);" class="icon_01" onclick="openConstantWin(${cl.id});" title="编辑"></a>
                     </#if>
                     <#if lib.checkOper('20020104') || lib.checkOper('0000')>
                     <a href="javascript:void(0);" onclick="deleteByKey('${cl.key}');" class="icon_02" title="删除"></a>
                     </#if>
                  </td>
               </tr>
               </#list>
           </table>
        </form>
     </div>
     <div class="clear"></div>
</div>


<div id="bmBox" style="display:none">
   
              
        
</div>

</body>
</html>