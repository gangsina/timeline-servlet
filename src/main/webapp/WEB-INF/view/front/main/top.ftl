<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
</head>
<body>
    <div class="top">
	     <div class="gray"></div>
	     <div class="balck">
	     		<#if lib.checkMenu('2000')>
		            <div class="exit">
		                <a href="${ctx}/manage/main/index" target="_parent">系统维护</a>
		                <!--<div class="tck_02" style="display:none">
		                        <div class="sanj"></div>
		                        <ul>
		                           <li><a href="#" rel="" title=""><i>go></i>亿我拍官网</a></li>
		                           <li><a href="#" rel="" title=""><i>go></i>代理商入口</a></li>
		                           <li><a href="#" rel="" title=""><i>go></i>商户入口</a></li>
		                           <li style=" border:none"><a href="#" rel="" title=""><i>go></i>亿我内外</a></li>
		                        </ul>
		                </div>-->
		            </div>
	            </#if>
	     </div>
	</div>
</body>
</html>