<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/adminJS.js"></script>

<script type="text/javascript">

	function openInputDiv(id){
		var url = '${ctx}/front/audit/category/add';
		if(id > 0){
			url = '${ctx}/front/audit/category/edit?id='+id;
		}
		$.ajax({
			url:url,
			dataType:'html',
			success:function(data){
				$('#qjsqBox').html(data);
				$('#hiddenInputTag').focus();
				$.blockUI({
                    message: $('#qjsqBox'),
                    css:{
                    	top:'10%'
                    }
                });
			},error:function(data){
				alert('请求失败！');
			}
		})
	}
	
	function deleteById(id){
		if(confirm("确定要删除吗？")){
			$.ajax({
				url:'${ctx}/front/audit/category/delete',
				dataType:'json',
				data:{id:id},
				type:'post',
				success:function(data){
					alert(data.msg);
					if(data.result == 'ok'){
						location.reload();
					}
				},error:function(data){
					alert('请求失败！');
				}
			});
		}
	}
	
	function formSubmit(id){
		var categoryName = $('#categoryName').val();
		if($.trim(categoryName) == ''){
			$('#errorMsgDiv').show();
			return;
		}
		$('#errorMsgDiv').hide();
		
		var url = '${ctx}/front/audit/category/create';
		var param = {categoryName:categoryName};
		if(id > 0){
			url = '${ctx}/front/audit/category/update';
			param = {categoryName:categoryName,id:id};
		}
		
		$.ajax({
			url:url,
			dataType:'json',
			data:param,
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == 'ok'){
					location.reload();
				}
			},error:function(data){
				alert('请求失败！');
			}
		});
	}
	
	function jumpPage(p){
		location.href = '${ctx}/front/audit/category/index?pageNum='+p;
	}
</script>
</head>
<body>
   <div class="right">
          <div class="title"> 
               <h3>审批维护</h3>
               <div class="clear"></div>
          </div>
          <div class="tab1">
              <ul class="menu">
                     <li class="li1"  onclick="location.href='${ctx}/front/audit/flow/index'">流程设置</li>
                     <li class="active li3">类型设置</li>
              </ul>
              <div class="list con3" style="display:block">
                  <div class="lxsz_01">
                   <#if lib.checkOper('10010305')>
                   <a href="javascript:void(0);" onclick="openInputDiv(-1);" class="lxsz">添加类型</a>
                   </#if>
                      <table>
                         <tr>
                            <th>序号</th>
                            <th>类型</th>
                            <th>操作</th>
                         </tr>
                         <#if page?? && page.result?? && page.result?size gt 0>
	                         <#list page.result as pr>
	                         <tr>
	                            <td width="130">${pr.viewid}</td>
	                            <td>${pr.categoryName}</td>   
	                            <td width="160">
	                            <#if lib.checkOper('10010306')>
	                               <a class="bianj" href="javascript:void(0);" onclick="openInputDiv(${pr.id})"></a>
	                            </#if>
	                            <#if lib.checkOper('10010307')>
	                               <a class="shanc" href="javascript:void(0);" onclick="deleteById(${pr.id});"></a>
	                            </#if>
	                            </td>
	                         </tr>
	                         </#list>
                         <#else>
                         	<tr>
                         		<td colspan="3">暂无审批类型数据</td>
                         	</tr>
                         </#if>
                      </table>
                  </div>
                   <div class="paging">
                       ${page.pageHtml}
               		</div>
              </div>
          </div>
     </div>
     
 <div id="qjsqBox" style="display:none">
 </div>
</body>
</html>