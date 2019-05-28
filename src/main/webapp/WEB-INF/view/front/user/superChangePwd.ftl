
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<#include "/common/script.ftl">
<#include "/common/validation.ftl">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript">
	
	 $(function(){
            
            $("#changePwdForm").validationEngine("attach",{ 
                   promptPosition:"topRight", 
                   scroll:false 
            });  
                
    });

     var isContinous = 0;
     function isContinuous(passwd){
       isContinous = 0;
      // var txts = $('#password').val();
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
               var a = txts[j];
               var b = txts[j+1];
               var c = txts[j+2];
               if((c.charCodeAt()-b.charCodeAt()) == 1 && (b.charCodeAt()-a.charCodeAt()) == 1){
                   isContinous = 1;
                   break;
               }
              
           }
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
    
    function func(){
            //location.href = "${ctx}"+"/front/main/index";
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
                    data: {oldPassword:oldPwd,newPassword:pwd},
                    type:'post',
                    success:function(data){
                        if(data.result == "ok"){
                            alert(data.msg);
                           location.reload();
                        }
                        else{
                            alert(data.msg);
                        }
                    },error:function(data){
                        alert("提交失败!");
                    }
                })
    }
    
    function cancelSubmit(){
    
        //location.href = "${ctx}"+"/front/main/index";
    }
</script>
</head>
<body>
<div class="main">
     <div class="ygjbxx">
          <h3 class="tit">修改密码</h3>
          <div class="xxList">
          <form id="changePwdForm">
                   <table>
                        <tr>
                           <td align="center">原密码：<input type="password" id="oldPassword" name="oldPassword" class="put validate[required,funcCall[newpassword]]" style="width:350px"/></td>
                        </tr>
                        <tr>
                           <td align="center">新密码：<input type="password" id="newPassword" name="newPassword" class="put validate[required,funcCall[newpassword]]" style="width:350px"/></td>
                        </tr>
                        <tr>
                           <td align="center">重复密码：<input type="password" id="repeatPassword" name="repeatPassword" class="put validate[required,funcCall[repeatpassword]]" style="width:350px"/></td>
                        </tr>
                         <tr>
                           <td align="center"><button type="button" style="width: 85px;
											height: 28px;
											border: 1px solid #2f5e78;
											cursor: pointer;
											background: #3f7898;
											color: #fff;
											margin-right: 10px;
											border-radius: 5px;" onclick="changePasswordSubmit()">保存</button></td>
                        </tr>
                   </table>
                   </form>
          </div>
     </div>
</div>
</form>
</body>
</html>
