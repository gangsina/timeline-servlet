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
               <h3>我的审批</h3>
               <div class="demo">
                    <dl class="select">
                    	<select id="auditCategoryId" name="auditFlow.auditCategoryId" style="height: 25px;width: 100px;vertical-align: middle;float:left" onchange="searchForm();">
                    		<option value="">--全部--</option>
                    		 <#list categoryList as cl>
                            	<option value="${cl.id}" <#if apply?? && apply.auditFlow?? && apply.auditFlow.auditCategoryId?? &&  apply.auditFlow.auditCategoryId == cl.id>selected="selected"</#if>>${cl.categoryName}</option>
                            </#list>
                    	</select>
                    </dl>
                  </div>
                  <#--
               	<a href="${ctx}/front/audit/apply/add" class="xgtx">新建申请</a>
               	--->
               <div class="search">
                  <span class="put">
                  <input type="text" name="applyContent" id="applyContent" value="<#if apply?? && apply.applyContent?? && apply.applyContent != ''>${apply.applyContent}<#else>请输入关键字</#if>"  onfocus="if (value =='请输入关键字'){value =''}" onblur="if (value ==''){value='请输入关键字'}"  class="put1"/>
                  </span>
                  <span class="but"><button type="button" onclick="searchForm();" class="but1"></button></span>
                </div>
               <div class="clear"></div>
               <input type="hidden" name="status" id="status" value="${status?if_exists}">
               <input type="hidden" name="pageNum" id="pageNum" value="">
              </form>
          </div>
          <div class="tab1 tab3">
              <ul class="menu">
              			<#list dtoList as dl>
              				<#if dl.status == 1>
                                <li class="li1 <#if !(status??) || status == 1>active</#if>" onclick="statusSearch(1);">所有（${dl.num}）</li>
                            <#elseif dl.status == 2>
                                <li class="li3 <#if status?? && status == 2>active</#if>" onclick="statusSearch(2);">未处理（${dl.num}）</li>
                            </#if>
                        </#list>
              </ul>
              <div class="list con1">
                      <table>
                         <tr>
                            <th width="20%">申请流程</th>
                            <th width="25%">申请内容</th>
                            <th width="15%">申请时间</th>
                            <th width="15%">申请人</th>
                            <th width="10%">审批结果</th>
                         </tr>
                        <#if page.result?? && page.result?size gt 0>
	                        <#list page.result as pr>
	                        	<#assign classSet = "" />
	                        	<#if pr_index%2 == 0>
	                        		<#assign classSet = "class='two'" />
	                        	</#if>
		                         <tr>
		                            <td ${classSet}>[${pr.apply.auditFlow.flowName}]</td>
		                            <td ${classSet}>${pr.apply.applyContent}</td>
		                            <td ${classSet}>${pr.apply.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>
		                            <td ${classSet}>${pr.apply.applyUser.realName}</td>
		                            <td ${classSet}>
		                            	<#if pr.dataType == 2>
		                            		<#if lib.checkOper('10010203')>
		                            			<a href="${ctx}/front/audit/check/view?id=${pr.id}" class="dp">去审批</a>
		                            		</#if>
		                            	<#elseif pr.dataType == 1>
			                            	<#if pr.record.status == 1>
			                            		已通过
			                            	<#elseif pr.record.status == 2>
			                            		<span class="wtg" style="cursor:pointer">不同意</span>
			                            		<div class="tckBox">
				                                <div class="tck_wtg" style="display:none">
			                                        <div class="sanj"></div>
			                                        <h3>不同意原因</h3>
			                                        <p>
			                                        	<span class="jibie">${pr.record.flowLevel.levelName}</span> 
			                                        	${pr.record.flowLevel.employee.realName}：${pr.record.memo}
			                                        </p>
			                                   </div>
			                                   </div>
				                            </#if>
		                            	</#if>
		                            	
		                            </td>
		                         </tr>
		                     </#list>
	                     <#else>
	                     	    <tr>
		                            <td colspan="5">[<font color="red">没有查询到你的审批数据</font>]</td>
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
		$('#myform').attr('action','${ctx}/front/audit/check/index');
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