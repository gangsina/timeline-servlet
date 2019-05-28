<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
		<#include "/common/script.ftl">
		<#include "/common/validation.ftl">
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<script type="text/javascript"> 

var userId;


    var name = getCookie("NAME");
    var check = getCookie("CHECK");
    function ShowMessage()  
    {  
        if(name == "null") {
           
            $('#name').val("");
        }
        else
        {
            
            $('#name').val(name);
        } 
        if(check == "false"){
            document.getElementById("remember").checked = false;
        }
        else
        {
            document.getElementById("remember").checked = true;
        }
    }  
    window.onload=ShowMessage;  
  
    /* 
    功能：保存cookies函数  
    参数：name，cookie名字；value，值 
    */  
    function SetCookie(name,value){  
        var Days = 30*12;   //cookie 将被保存一年  
        var exp  = new Date();  //获得当前时间  
        exp.setTime(exp.getTime() + Days*24*60*60*1000);  //换成毫秒  
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();  
    }   
    /* 
    功能：获取cookies函数  
    参数：name，cookie名字 
    */  
    function getCookie(name){  
        var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));  
        if(arr != null){  
         return unescape(arr[2]);   
        }else{  
         return null;  
        }  
    }   
    /* 
    功能：删除cookies函数  
    参数：name，cookie名字 
    */  
      
    function delCookie(name){  
        var exp = new Date();  //当前时间  
        exp.setTime(exp.getTime() - 1);  
        var cval=getCookie(name);  
        if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();  
    }  
    
    
	$(function(){
				
			$("#myform").validationEngine("attach",{ 
				   promptPosition:"topRight", 
				   scroll:false 
			});
			
			$("#changePwdForm").validationEngine("attach",{ 
                   promptPosition:"topRight", 
                   scroll:false 
            });  
				
	});
	
	function username(field, rules, i, options){
		if(field.val() == "")
		{
			return;
		}
		
		if($('#name').val() == $('#password').val()){
            
            return "* 用户名和密码不能相同";
        }
        
		var reg1 = /^\d{5,10}$/;
		var reg2 = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		
		if (!(reg1.test(field.val()) || reg2.test(field.val()))) {
     		return "* 用户名为邮箱或者员工编号";
      	}
//      	var email = $('#name').val();
//        var arrEmail = email.split("@");
//        var flag = "false";
//        if(arrEmail.length>1){
//            var email_varlidate = arrEmail[1];
//            var des = "'ewppay.com' || 'ewppay.com.cn' || '12pai.com.cn' || '12pai.cn' || 'yiwopay.com' || 'yiwopai.com.cn'";
//            if(des.indexOf("'"+email_varlidate+"'")!=-1){
//                     flag = "true";
//             }
//             if(flag != "true"){
//                return "* 邮箱后缀名不正确";
//             }
//         }
 }
	
	 var isContinous = 0;
	 function isContinuous(passwd){
	   isContinous = 0;
	   var txts = passwd;
	   var length = txts.length;
	   for (var i = 0; i < length; i++)
	   {
	       if(isContinous == 1){
	           break;
	       }
	       for(var j= i; j < length; j++)
	       {
	           if((j+2) >= length)
	           break;
	           var a = txts.charAt(j);
	           var b = txts.charAt(j+1);
	           var c = txts.charAt(j+2);
	           if( c==undefined || b==undefined || a==undefined || ((c.charCodeAt()-b.charCodeAt()) == 1 && (b.charCodeAt()-a.charCodeAt()) == 1)){
	               isContinous = 1;
	               break;
	           }
	          
	       }
	   }
	   
	 }
	
     function password(field, rules, i, options){
        if(field.val() == "") {
           
            return;
        }
        if($('#name').val() == $('#password').val()){
            
            return "* 用户名和密码不能相同";
        }
        
        
        
        var reg1 = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;   //由数字和字母组成，并且要同时含有数字和字母，且长度要在8-16位之间
        var reg2 = /^.*?([a-zA-Z\d])\1\1.*?$/; //3个连续相同的数字或字母
         if(!reg1.test(field.val())){
            return "* 密码由8-16位数字和字母组成";
        }
        if ( !reg2.test(field.val()) && reg1.test(field.val()) ) {
           
        }
        else {
            
            return "* 密码不能连续3个相同数字或者字母";
        }
       
        isContinuous(field.val());
        if(isContinous == 1)
        {
            return "* 密码不能连续3个递增数字或者字母";
        }
       
    }
    
     function newpassword(field, rules, i, options){
        if(field.val() == "") {
           
            return;
        }
       
        var reg1 = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;   //由数字和字母组成，并且要同时含有数字和字母，且长度要在8-16位之间
        var reg2 = /^.*?([a-zA-Z\d])\1\1.*?$/; //3个连续相同的数字或字母
        if(!reg1.test(field.val())){
            return "* 密码由8-16位数字和字母组成";
        }
        if ( !reg2.test(field.val()) && reg1.test(field.val()) ) {
           
        }
        else {
            
            return "* 密码不能连续3个相同数字或者字母";
        }
        isContinuous(field.val());
        if(isContinous == 1)
        {
            return "* 密码不能连续3个递增数字或者字母";
        }
       
    }
    
    function repeatpassword(field, rules, i, options){
        if(field.val() == "") {
           
            return;
        }
       
        var reg1 = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;   //由数字和字母组成，并且要同时含有数字和字母，且长度要在8-16位之间
        var reg2 = /^.*?([a-zA-Z\d])\1\1.*?$/; //3个连续相同的数字或字母
        if(!reg1.test(field.val())){
            return "* 密码由8-16位数字和字母组成";
        }
        if ( !reg2.test(field.val()) && reg1.test(field.val()) ) {
           
        }
        else {
            
            return "* 密码不能连续3个相同数字或者字母";
        }
        isContinuous(field.val());
        if(isContinous == 1)
        {
            return "* 密码不能连续3个递增数字或者字母";
        }
        if($('#newPassword').val() == $('#repeatPassword').val()){
            
        }
        else{
        
            return "* 两次输入密码必须一致";
        }
       
    }
    
     function validate(field, rules, i, options){
        if(field.val() == "") {
           
            return;
        }
        else if(field.val().length == 4){   
            
        }
        else{
            
             return "* 校验码长度为4位";
        }
    }
	
			
			



	function func(){
    		location.href = "${ctx}"+"/front/main/index";
	}
	
	
	function changePasswordSubmit() {
	
	
		var allCheck = $('#changePwdForm').validationEngine('validate');
				if(!allCheck){
					return;
				}
	    var oldPwd = $("#oldPassword").val(); 
		var pwd = $("#newPassword").val(); 
		$.ajax({
					url:'${ctx}/user/changePwd',
					dataType:'json',
					data: {userId:userId,oldPassword:oldPwd,newPassword:pwd},
					type:'post',
					success:function(data){
						if(data.result == "ok"){
							alert(data.msg);
							func();
						}
						else{
							alert(data.msg);
						}
					},error:function(data){
						alert("提交失败!");
					}
				})
	}

    function refresh(obj) {
        obj.src = "${ctx}/webnotauth/vali?"+Math.random();
    }
  


	function formSubmit() { 
	  
		var allCheck = $('#myform').validationEngine('validate');
				if(!allCheck){
					return;
				}
				
		if (document.getElementById("remember").checked)
		{
		  
		   SetCookie("NAME",$('#name').val());
		   SetCookie("CHECK","true");
		}
		else
		{
		  delCookie("NAME");
		  SetCookie("CHECK","false");
		}
			$("#pasTip").html("");
			
				$.ajax({
					url:'${ctx}/webnotauth/logIndex',
					dataType:'json',
					data:$('#myform').serialize(),
					type:'post',
					success:function(data){
						if(data.result == "ok"){
							if(data.editPwd == 1){
								userId = data.userId;
								$('#pwdEditDiv').show();
							}else{
								location.href = "${ctx}"+data.forwardUrl;
							}
						}
						else{
							$("#pasTip").html(data.msg);
							$("#randomImg").attr("src","${ctx}/webnotauth/vali?"+Math.random());
						}
					},error:function(data){
						alert("提交失败!");
					}
				})
	} 
	
	
</script>
</head>
<body  class="login_bg">
    <div class="loginBG">
        <div class="loginlogo">
            <#if company.logoAttachmentId != 0 && company.logoAttachmentId != null>
                 <img src="${ctx}/front/attachment/read?id=${company.logoAttachmentId}" width="295" height="107" />
            <#else>
                 <img src="${ctx}/static/front/images/loginlogo.png" width="295" height="107" />
            </#if>
        </div>
        <div class="login">
        	<form id="myform">
            <h3>登录${company.systemName}</h3>
            <ul>
<#--               <li><label>员工号/邮箱：</label><input type="text" id="name" name="loginName" class="put validate[required,funcCall[username],maxSize[50]]" value="12345"/><span id="nameTip"></span></li>-->
               <li><label>员工号/邮箱：</label><input type="text" id="name" name="loginName" value="xuweihong@huahaikeji.cn"/></li>
<#--               <li><label>密码：</label><input type="password" id="password" name="password" class="put validate[required,funcCall[password]]" value="1a2b3c4d"/><span id="pasTip"></span></li>-->
               <li><label>密码：</label><input type="password" id="password" name="password" value="hhgxfc11"/></li>
               <li style="width:315px"><label>验证码：</label>
               <input type="text" id="randomCode" name="randomCode" class="put validate[required,funcCall[validate],custom[onlyLetterNumber]]" style="width:69px;margin-left:-4px;" value=""/>
               <img title="点击更换" style="border:1px solid #b1b4b9;vertical-align: middle;" id="randomImg" onclick="javascript:refresh(this);" src="${ctx}/webnotauth/vali" width="80" height="22">
               </li>
               <li class="jzmm"><input name="" 	id="remember" type="checkbox" value="" /><i>记住用户名</i></li>
               <li><button type="button" onclick="formSubmit()">登录</button></li>
            </ul>
            </form>
        </div>
    </div>
    <div class="bottom"><span>${company.recordNumber}</span></div>
    <div class="mmxg" style="display:none" id="pwdEditDiv">
         <div class="tcBG">
             <div class="mmxgzt">
             	<form id="changePwdForm">
                  <h3>密码修改</h3>
                  <ul>
                    <li class="li1">首次登录或每隔3个月需要修改密码</li>
                    <li class="li2">原密码：<input type="password" id="oldPassword"  name="oldPassword" class="put validate[required,funcCall[newpassword]]" value=""/></li>
                    <li class="li2">新密码：<input type="password" id="newPassword"  name="newPassword" class="put validate[required,funcCall[newpassword]]" value=""/></li>
                    <li class="li2">重复密码：<input type="password" id="repeatPassword" name="repeatPassword" class="put validate[required,funcCall[repeatpassword]]" value=""/></li>
                  </ul>
                 </form>
                  <div class="mmxgBTN">
                      <button type="button" onclick="changePasswordSubmit()">保&nbsp;存</button>
                  </div>
             </div>
         </div>
      </div> 
</body>
</html>