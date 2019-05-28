<head>
	<title>亿我支付流程申请审批邮件</title>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>
<body style="background:#ccc">
	<p>
		<span style="color:#003399;">${apply.currentFlowLevel.employee.realName}，你好：</span>
	</p>
	<div style="margin-left:50px">
		<p>
			<span style="color:#003399;">${apply.applyUser.realName}向你递交了${apply.auditFlow.flowName}流程需要你的审批。</span>
		</p>
		<p>
			<span style="color:#003399;"></span><span style="color:#003399;">申请内容：${apply.applyContent}</span>
		</p>
		<p>
			<span style="color:#003399;">请登录亿我内外：<a href="${projectAddr}">${projectAddr}</a>进行审批</span>
		</p>
		<p>
			<span style="color:#E53333;"><strong>此邮件是系统自动发送邮件，请不要回复！</strong></span>
		</p>
	</div>
</body>