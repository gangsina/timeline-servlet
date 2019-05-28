<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery-1.4.2.min.js"></script>
</head>
<body>
	<div class="bottom"><span>${company.recordNumber?if_exists}</span><p>${company.companyName?if_exists}</p></div>
</body>
</html>