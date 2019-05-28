<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/adminJS.js"></script>
</head>
<body>
   <div class="main">
     <div class="right">
          <div class="title"> 
          	<form id="myform" method="post">
               <h3>我的申请</h3>
               <div class="demo">
                	<select id="auditCategoryId" name="auditFlow.auditCategoryId" style="height: 25px;width: 100px;vertical-align: middle;float:left" onchange="searchForm();">
                		<option value="">--全部--</option>
                		 <#list categoryList as cl>
                        	<option value="${cl.id}" <#if apply?? && apply.auditFlow?? && apply.auditFlow.auditCategoryId?? &&  apply.auditFlow.auditCategoryId == cl.id>selected="selected"</#if>>${cl.categoryName}</option>
                        </#list>
                	</select>
               </div>
               <#if lib.checkOper('10010102')>
               <a href="${ctx}/front/audit/apply/add" class="xgtx">新建申请</a>
               </#if>
               <div class="search">
                  <span class="put">
                  <input type="text" name="applyContent" id="applyContent" value="<#if apply?? && apply.applyContent?? && apply.applyContent != ''>${apply.applyContent}<#else>请输入关键字</#if>"  onfocus="if (value =='请输入关键字'){value =''}" onblur="if (value ==''){value='请输入关键字'}"  class="put1"/>
                  </span>
                  <span class="but"><button type="button" onclick="searchForm();" class="but1"></button></span>
                </div>
               <div class="clear"></div>
               <input type="hidden" name="status" id="status" value="${apply.status?if_exists}">
               <input type="hidden" name="pageNum" id="pageNum" value="">
              </form>
          </div>
          <div class="tab1 tab3">
              <ul class="menu">
              			<#list dtoList as dl>
              				<#if dl.status == 0>
                                <li class="li1 <#if !(apply??) || !(apply.status)??>active</#if>" onclick="statusSearch(0);">所有（${dl.num}）</li>
                            <#elseif dl.status == 2>
                                <li class="li2 <#if apply?? && apply.status?? && apply.status == 2>active</#if>" onclick="statusSearch(2);">审批中（${dl.num}）</li>
                            <#elseif dl.status == 3>
                                <li class="li3 <#if apply?? && apply.status?? && apply.status == 3>active</#if>" onclick="statusSearch(3);">不同意（${dl.num}）</li>
                            </#if>
                        </#list>
              </ul>
              <div class="list con1">
                      <table>
                         <tr>
                            <th width="25%">申请流程</th>
                            <th width="50%">申请内容</th>
                            <th width="15%">审批人</th>
                            <th width="15%">审批结果</th>
                         </tr>
                        <#if page.result?? && page.result?size gt 0>
	                        <#list page.result as pr>
	                        	<#assign classSet = "" />
	                        	<#if pr_index%2 == 0>
	                        		<#assign classSet = "class='two'" />
	                        	</#if>
		                         <tr>
		                            <td ${classSet}>[${pr.auditFlow.flowName}]</td>
		                            <td ${classSet}>${pr.applyContent}</td>
		                            <td ${classSet}>${pr.currentFlowLevel.employee.realName}</td>
		                            <td ${classSet}>
		                            	<#if pr.status == 2>
		                            		<#if lib.checkOper('10010103')>
		                            			<a href="${ctx}/front/audit/apply/view?id=${pr.id}" class="dp">审批中</a>
		                            		</#if>
		                            	<#elseif pr.status == 3>
		                            	   <span class="wtg"><a href="${ctx}/front/audit/apply/view?id=${pr.id}">不同意</a></span>
		                            	 <div class="tckBox">
		                                   <div class="tck_wtg" style="display:none">
		                                        <div class="sanj"></div>
		                                        <h3>不同意原因</h3>
		                                        <p>
		                                        	<span class="jibie">${pr.noPassRecord.flowLevel.levelName}</span> 
		                                        	${pr.noPassRecord.flowLevel.employee.realName}：${pr.noPassRecord.memo}
		                                        </p>
		                                   </div>
		                                </div>
			                            <#elseif pr.status == 4>
			                            	<a href="${ctx}/front/audit/apply/view?id=${pr.id}">已通过</a>
			                            <#else>
			                            	<a href="${ctx}/front/audit/apply/view?id=${pr.id}">未受理</a>
			                            </#if>
		                            </td>
		                         </tr>
		                     </#list>
	                     <#else>
	                     	    <tr>
		                            <td colspan="4">[<font color="red">没有查询到你的申请数据</font>]</td>
		                        </tr>
	                     </#if>
                      </table>
                   <div class="paging">
                      ${page.pageHtml}
                   </div>
              </div>
          </div>
          
     
     </div>
     
     <div class="clear"></div>
</div>
<script type="text/javascript">
	function jumpPage(p){
		$('#pageNum').val(p);
		searchForm();
	}
	
	function searchForm(){
		var applyContent = $('#applyContent').val();
		if($.trim(applyContent) == '请输入关键字'){
			 $('#applyContent').val('');
		}
		$('#myform').attr('action','${ctx}/front/audit/apply/index');
		$('#myform').submit();
	}
	
	function statusSearch(s){
		if(s == 0){
			s = '';
		}
		$('#status').val(s);
		searchForm();
	}
</script>
</body>
</html>