<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery-1.4.2.min.js"></script>
<script>
	$(function(){
		$('.nav a').click(function(){
			var $this = $(this);
			$this.parent().parent().find('.on').removeClass();
			$this.parent().addClass('on');
			var pdocument = parent.document;
			var topDocument = parent.parent.document.getElementById('topFrame');
			topDocument.contentWindow.document.getElementById('topNavTitle').innerHTML = $this.html();
			pdocument.getElementById('rightFrame').src = $this.attr('url');
		});
	})
	
	function exit(){
        if(confirm("确定要退出吗？")){
            window.top.location.href = '${ctx}/webnotauth/logout';
        }
    }
    
    function editPwd(){
    	var pdocument = parent.document;
		var topDocument = parent.parent.document.getElementById('topFrame');
		topDocument.contentWindow.document.getElementById('topNavTitle').innerHTML = "修改密码";
		pdocument.getElementById('rightFrame').src = '${ctx}/user/superChangePwd';
    }
    
</script>
</head>
<body>
<div class="left">
      <div class="admin">
    
      	   <div class="img"><a href="javascript:void(0);" title="头像"></a></div>
           <dl>
              <#if authService.superFlag == 1>
              	<dt>超级管理员</dt>
      		  <#else>
              	<dt>${emp.realName}</dt>
              </#if>
              <dd><span><a href="javascript:void(0);" onclick="editPwd();" style="padding-left:0px;">修改密码</a></span>|<a href="javascript:exit();">退出</a></dd>
              <#if authService.superFlag != 1 && lib.checkMenu('1000')>
              <dd>
          	   	<span >
          			<a href="${ctx}/front/main/index" target="_parent" style="padding-left:0px">返回到个人主页</a>
          		</span>
              </dd>
              </#if>
           </dl>
      </div>
      <div class="nav">
	      	<ul>
	      		<li class="on"><a href="javascript:void(0);" url="${ctx}/manage/main/right" class="wdzm">我的桌面</a></li>
	      		<#if authService.superFlag == 1>
	      			<li><a href="javascript:void(0);" url="${ctx}/manage/dept/index" class="bmgl">组织结构</a></li>
	      			<li><a href="javascript:void(0);" url="${ctx}/manage/role/index" class="jsgl">职务管理</a></li>
             		<li><a href="javascript:void(0);" url="${ctx}/manage/constant/index" class="zygl">常量管理</a></li>
	      		<#else>
	      		   	<#list authService.manageMenuList as am>
		             	<li><a href="javascript:void(0);" url="${ctx}${am.menuUrl}" class="${lib.manageMenuStyle(am.menuPosition)}">${am.menuName}</a></li>
			      	</#list>
	      		</#if>
	      	</ul>
           <ul>
            
           </ul>
      </div>
</div>
</body>
</html>