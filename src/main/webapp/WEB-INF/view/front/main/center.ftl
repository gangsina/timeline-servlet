<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript" language="javascript"> 
/*function iFrameHeight(idobj) {
	var ifm= document.getElementById(idobj); 
	var subWeb = document.frames ? document.frames[idobj].document : ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = subWeb.body.scrollHeight; 
	} 
} */
function iFrameHeight(iframe) {
    if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
    }
};
</script>
</head>
<body>
   <div class="main" id="mainFrame" name="mainFrame">
   		<div style="margin-top:0px;float:left">
   			<iframe src="${ctx}/front/main/left" frameborder="0" id="leftFrame" width="192px"  marginwidth="0" marginheight="0" onload="iFrameHeight(this);" scrolling="no"></iframe>
   		</div>
   		<div>
			<iframe src="${ctx}/front/main/right" id="rightFrame" name="rightFrame" marginwidth="0" marginheight="0" height="2000" width="84%" frameborder="0" scrolling="no"></iframe>
		</div>
   </div>
</body>
</html>