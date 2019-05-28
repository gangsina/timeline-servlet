<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" language="javascript"> 
function iFrameHeight(idobj) { 
	var ifm= document.getElementById(idobj); 
	var subWeb = document.frames ? document.frames[idobj].document : ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = subWeb.body.scrollHeight; 
	} 
} 

</script>
</head>
<body>
   		<div style="margin-top:0px;float:left">
   			<iframe src="${ctx}/manage/main/left" frameborder="0" id="leftFrame" width="198px" marginwidth="0" marginheight="0" onload="iFrameHeight('leftFrame');" scrolling="yes"></iframe>
   		</div>
   		<div style="margin-top:0px">
			<iframe src="${ctx}/manage/dept/index" id="rightFrame" name="rightFrame" marginwidth="0" marginheight="0" onload="iFrameHeight('rightFrame');" width="84%" frameborder="0" scrolling="yes"></iframe>
		</div>
</body>
</html>
