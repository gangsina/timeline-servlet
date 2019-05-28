<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript">
	function leftUrlToRightFrame(url){
		var pdocument = parent.document;
		pdocument.getElementById('rightFrame').src = url;
		
	}
	
	$(function(){
		var menuActions = $('.actionMenu');
		for(var i = 0;i<menuActions.length;i++){
			var $menuAction = $(menuActions[i]);
			$.ajax({
				url:$menuAction.attr('actionUrl'),
				dataType:'json',
				type:'post',
				success:function(data){
					var html = $menuAction.html();
					var countHtml = '(<font color="red">'+data+'</font>)';
					$menuAction.html(html+countHtml);
				},error:function(data){
					alert("请求异常");
				}
			})
		}
		
	})
</script>
</head>
<body>
   <div class="main">
	     <div class="left">
	          <!--返回首页<div class="fhsy"><a href="#"><img src="images/fhsy.png" width="28" height="103" /></a></div>-->
	          <div class="tx">
	              <div class="pic">
	              <a href="${ctx}/front/emp/personInfo" target="rightFrame">
	                   <#if avatorId != 0 && avatorId != null>
	                       <img src="${ctx}/front/attachment/read?id=${avatorId}" width="103" height="103" />
	                   <#else> 
	                       <img src="${ctx}/static/manage/images/zpBg.png" width="103" height="103" />
	                   </#if>     
	              </a>
	          </div>
	              <div class="name"><i>${emp.realName}</i>|<a href="${ctx}/front/emp/personInfo" target="rightFrame">账号</a></div>
	          </div>
	          <div class="nav">
	               <ul>
	               	<#list authService.frontMenuList as am>
	                   <li>
	                      <dl>
	                         <dt><a href="javascript:void(0);" class="${lib.frontMenuStyle(am_index)}">${am.menuName}</a></dt>
	                         <#list am.childList as ac>
	                         	<dd><a href="${ctx}${ac.menuUrl}" <#if ac.menuCode=='100102'>class="actionMenu" actionUrl="${ctx}/front/audit/check/ajaxCheckCount"</#if> target="rightFrame">${ac.menuName}</a></dd>
	                         </#list>
	                      </dl>
	                   </li>
	                </#list>
	                   <li>
	                      <dl>
	                         <dt><a href="#" class="wdkq">亿我内外</a></dt>
	                         <#--
	                         <dd><a href="#">请假 </a></dd>
	                         <dd><a href="#">加班</a></dd>
	                         <dd><a href="#">待处理</a></dd>
	                         <dd><a href="#">工作记录</a></dd>
	                         -->
	                         <dd><a href="${ctx}/webnotauth/contacts/index" class="xzgl" target="_top">花名册</a></dd>
	                      </dl>
	                   </li>
	                   <li>
	                      <dl>
	                         <dt><a href="#" class="xzgl">个人工作</a></dt>
	                      </dl>
	                   </li>
	               </ul>
	          </div>
	     </div>
	</div>
</body>
</html>