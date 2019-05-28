<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>测试例子</title>
		<#include "/common/script.ftl">
		<#include "/common/validation.ftl">
		<script type="text/javascript">
			
			$(function(){
				
				$("#myform").validationEngine("attach",{ 
				    promptPosition:"topRight", 
				    scroll:false 
				}); 
				
			});
			
			function formSubmit(){
				var allCheck = $('#myform').validationEngine('validate');
				if(!allCheck){
					return;
				}
				$.ajax({
					url:'${contextPath}/test/save',
					dataType:'json',
					data:$('#myform').serialize(),
					type:'post',
					success:function(data){
						alert(data.msg);
						if(data.result == "ok"){
							location.reload();
						}
					},error:function(data){
						alert("提交失败!");
					}
				})
			}
			
		</script>
	</head>
	<body>
		<#list testList as tl>
			第${tl_index+1}个人&nbsp;&nbsp;姓名:${tl.name}-年龄:${tl.age}岁-性别:
			<#if tl.sex == 1>
				男
			<#else>
				女
			</#if>
			<br />
		</#list>
		<br />
		<form id="myform">
			姓名:<input type="input" class="validate[required,maxSize[50]]" name="name" id="name" /><br />
			年龄:<input type="input" class="validate[required,custom[integer]]" name="age" id="age" /><br />
			性别:
			<select name="sex" id="sex">
				<option value="1">男</option>
				<option value="2">中</option>
			</select>
			<br />
			<input type="button" onclick="formSubmit();" value="提交" />
		</form>
	</body>
</html>
