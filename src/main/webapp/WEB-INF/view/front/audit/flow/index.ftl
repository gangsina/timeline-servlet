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
   <div class="right">
          <div class="title"> 
               <h3>审批维护</h3>
               <div class="clear"></div>
          </div>
          <div class="tab1">
              <ul class="menu">	
                                <li class="active li1">流程设置</li>
                                <#if lib.checkOper('10010304')>
                                	<li class="li3" onclick="location.href='${ctx}/front/audit/category/index'">类型设置</li>
                                </#if>
              </ul>
              <div class="list con1">
                   <div class="lcsz_01">
                   		<#if lib.checkOper('10010302')>
                        <a href="${ctx}/front/audit/flow/add" class="lcsz">流程设置</a>
                        </#if>
                        <ul>
                        <#list page.result as pr>
                           <li>
                              <h3>${pr.categoryName}</h3>
                              <p>
                              <#if pr.flowList?size gt 0>
	                              <#list pr.flowList as pf>
	                              	<#if pf.disableFlag?? && pf.disableFlag == 1>
	                              		<a href="${ctx}/front/audit/flow/edit?id=${pf.id}" class="bjlc">【${pf.flowName}】</a>
	                              	<#else>
	                              		<a href="${ctx}/front/audit/flow/edit?id=${pf.id}" class="bjlc" style="color:#CCCCCC">【${pf.flowName}】</a>
	                              	</#if>
	                              		
	                              </#list>
	                          <#else>
	                          	  该类型下暂无流程
	                          </#if>
                              </p>
                           </li>
                        </#list>
                        </ul>
                   </div>
                   <div class="paging">
                       ${page.pageHtml}
               </div>
              </div>
          </div>
     </div>
<script type="text/javascript">
	function jumpPage(p){
		location.href = '${ctx}/front/audit/flow/index?pageNum='+p;
	}
</script>
</body>
</html>