<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<#include "/common/script.ftl">
<#include "/common/ztree.ftl">
<#include "/common/validation.ftl">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/manage/js/adminJS.js"></script>

<script type="text/javascript">
		
	$(document).ready(function(){
	
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};
		
		var jsonData = ${operJsonStr};
		if(jsonData.length <= 0){
			$("#roleOperDiv").html("<li>暂无权限</li>");
		}else{
			$.fn.zTree.init($("#roleOperDiv"), setting, jsonData);
		}
        
	});
	
	
	
	function inputRole(t){
		var url = '${ctx}/manage/role/add';
		if(t == 2){
			url = '${ctx}/manage/role/edit?id=${roleId}';
		}
		$.ajax({
			url:url,
			dataType:'html',
			type:'post',
			success:function(data){
				$('#zwBox').html(data);
				$("#myform").validationEngine("attach",{ 
				    promptPosition:"topRight", 
				    scroll:false 
				}); 
				$.blockUI({
	                message: $('#zwBox'),
	                css:{
	                	top:'10%'
	                }
	            });
			},error:function(data){
				alert('操作失败！');
			}
		})
	}
	
	function deleteRole(){
		if(confirm("确定要删除该角色吗？")){
			$.ajax({
				url:'${ctx}/manage/role/delete',
				dataType:'json',
				data:{id:${roleId}},
				type:'post',
				success:function(data){
					alert(data.msg);
					if(data.result == 'ok'){
						location.href = "${ctx}/manage/role/index"
					}
				},error:function(data){
					alert('操作失败！');
				}
			})
		}
	}

</script>
<style type="text/css">

	.ztreeData ul li{
		margin:0;
	}
	
	.ztreeData ul li span{
		margin:0;
	}

</style>
</head>
<body>
<div class="main">
     <div class="xzyg"> 
               <div class="add">权限列表</div>
               <ul class="quanx">
               	<#list roleList as rl>
                  <li <#if roleId == rl.id>class="on"</#if>>
                     <h3 class="highlight"><span><a href="${ctx}/manage/role/index?roleId=${rl.id}" style="color:#fff;text-decoration: none;">${rl.roleName}</a></span></h3>
                  </li>
                </#list>
               </ul>
      </div>
     <div class="list">
        <div class="titNm">
             <h3>管理员</h3>
             <#if lib.checkOper('20030102') || lib.checkOper('0000')>
             	<div class="dd"><a href="javascript:inputRole(1);" class="xjzw">新建职务</a></div>
             </#if>
             <#if lib.checkOper('20030103') || lib.checkOper('0000')>
             	<div class="dd"><a href="javascript:inputRole(2);" class="bjzw">编辑职务</a></div>
             </#if>
             <div class="clear"></div>
       </div>
       <div class="lin"></div>
        <div class="zwcent">
         <ul>
           <li><h3>职务名称：</h3><p>${role.roleName}</p>
           <div class="clear"></div></li>
           <li>
             <h3>描述 ：</h3>
             <div class="tab">
                        <ul class="menu">
                            <li class="active">查看权限</li>
                            <li>查看人员（<#if empList?if_exists && empList?size gt 0>${empList?size}<#else>0</#if>）</li>
                        </ul>
                        <div class="ztreeData" style="margin-left:20px;overflow:auto;" >
							<ul id="roleOperDiv" class="ztree"></ul>
						</div>
                        <div class="con2 con">
                             <div class="clear"></div>
                             <form>
                                <table>
                                   <tr>
                                     <th>编号</th>
                                     <th>姓名</th>
                                     <th>所属部门</th>
                                   </tr>
                                   <#if empList?if_exists && empList?size gt 0>
                                   <#list empList as el>
	                                   <tr>
	                                     <td>${el_index+1}</td>
	                                     <td>${el.realName}</td>
	                                     <td>${el.department.deptName!'暂无'}</td>
	                                   </tr>
                                   </#list>
                                   <#else>
                                   		<tr>
	                                     <td colspan="4">暂无员工</td>
	                                   </tr>
                                   </#if>
                                </table>
                             </form>
                        </div>
                 </div>
                 <div class="clear"></div>
           </li>
           <li><div class="btn">
           		 <#if lib.checkOper('20030103') || lib.checkOper('0000')>
                 	<input type="button" name="" onclick="inputRole(2);" value="编辑" class="but1" />
                 </#if>
                 <#if lib.checkOper('20030104') || lib.checkOper('0000')>
                	<input type="button" name="" onclick="deleteRole();" value="删除" class="but2" />
                 </#if>
           </div></li>
         </ul>
             
        </div>
     </div> 
</div>

<div id="zwBox" style="display:none">
    
</div>
</body>
</html>