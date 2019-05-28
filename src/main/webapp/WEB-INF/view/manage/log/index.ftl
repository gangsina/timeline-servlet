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
<script type="text/javascript" src="${ctx}/static/common/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function(){
	
				
	});

function jumpPage(p){
	$('#pageNum').val(p);
	$('#searchForm').submit();
}


function openConstantWin(){
		$.ajax({
			url:'${ctx}/manage/log/sysLog',
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
	
</script>
</head>
<body>
<div class="main">
     <div class="list" style="position:static">
     	<div class="chaxun">
     		<form id="searchForm" method="post" action="${ctx}/manage/log/index">
     			<input type="hidden" name="pageNum" id="pageNum" value="1"/>
	             <span><label>操作人：</label><input type="text" name="username" value="${username?if_exists}" class="put" style="width:90px;"/></span>
	             <span><label>操作模块：</label><input type="text" name="module" value="${module?if_exists}" class="put" style="width:90px;"/></span>
	           	 <span><label>操作信息：</label><input type="text" name="logInfo" value="${logInfo?if_exists}" class="put" style="width:90px;"/></span>
	             <span><label>操作时间：</label>
	             <input type="text" name="startDate" value="${startDate?if_exists}" class="put" onclick="WdatePicker({readOnly:true})" style="width:90px;"/>
	             —
	             <input type="text" name="endDate" value="${endDate?if_exists}" class="put" onclick="WdatePicker({readOnly:true})" style="width:90px;"/>
	             </span>
	             <span>
	                <input type="button" onclick="jumpPage(1);" value="查询" class="but1" />
	             </span>
            </form>
        </div>
     
        <div class="titNm">
             <h3>日志管理</h3>
             <!--<div class="time">(2014-08)</div>-->
             <#if lib.checkOper('20050102')>
             <div class="dd"><a href="javascript:void(0);" onclick="openConstantWin();" class="tjyg">系统日志</a></div>
             </#if>
             <div class="clear"></div>
             <form id="searchForm">
             	<input type="hidden" name="classType" id="searchClassType" value="">
             </form>
       </div>
        <form>
           <table id="mytable" width="98%">
               <tr>
                  <th>序号</th>
                  <th>日志类型</th>
                  <th>操作人</th>
                  <th>所属模块</th>
                  <th>操作时间</th>
                  <th>操作IP</th>
                  <th>操作信息</th>
               </tr>
               <#list page.result as cl>
               <tr>
                  <td>${cl.viewid}</td>
                  <td>${cl.typeStr}</td>
                  <td>${cl.createUserName}</td>
                  <td>${cl.module}</td>
                  <td>${cl.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>
                  <td>${cl.ip}</td>
                  <td><div style="word-break:break-all; overflow:auto; width:400px;margin:5px auto">${cl.log}</div></td>
               </tr>
               </#list>
           </table>
        </form>
         <div class="paging">
             ${page.pageHtml}
        </div>
     </div>
     <div class="clear"></div>
</div>


<div id="bmBox" style="display:none">
   
              
        
</div>

</body>
</html>