<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<script type="text/javascript" language="javascript"> 
function leftIFrameHeight() { 
	var ifm= document.getElementById("centerFrame"); 
	var subWeb = document.frames ? document.frames["centerFrame"].document : ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = subWeb.body.scrollHeight + 30; 
	} 
} 

</script>
</head>
	<iframe src="${ctx}/front/main/top" frameborder="0" width="100%" height="54px" scrolling="no"></iframe>
	<iframe src="${ctx}/front/main/center" id="centerFrame" width="100%" height="2000" frameborder="0" scrolling="no"></iframe>
</html>
