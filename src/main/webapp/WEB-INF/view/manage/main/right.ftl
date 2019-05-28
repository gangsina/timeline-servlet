<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">

    function exit(){
        if(confirm("确定要退出吗？")){
            window.top.location.href = '${ctx}/webnotauth/logout';
        }
    }
    
</script>
</head>
<body>
<div class="main">
     <div class="window">
          <ul>
          	 <#if lib.checkMenu('200101') || authService.superFlag == 1>
             	<li class="li1"><a href="${ctx}/manage/dept/index"></a></li>
             </#if>
             <#if lib.checkMenu('200301') || authService.superFlag == 1>
             <li class="li2"><a href="${ctx}/manage/role/index"></a></li>
             </#if>
             <#--
             <li class="li3"><a href="#"></a></li>
             <li class="li4"><a href="#"></a></li>
             -->
<!--             <li class="li5"><a href="#"></a></li>
             <li class="li6"><a href="#"></a></li>
             <li class="li7"><a href="#"></a></li>
             <li class="li8"><a href="#"></a></li>-->
             <li class="li9">
             <a href="javascript:void(0);" onclick="exit();"></a>
             </li>
          </ul>
     </div>
</div>
</body>
</html>