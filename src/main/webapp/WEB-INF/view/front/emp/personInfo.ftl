<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
    <#include "/common/script.ftl">
    <#include "/common/validation.ftl">
<script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/pc.js"></script>
<script type="text/javascript"> 
 
 
    $(function(){
                
            $("#myform").validationEngine("attach",{ 
                   promptPosition:"topRight", 
                   scroll:false 
            });
                
    });
 
    // 验证qq格式
    function qq(field, rules, i, options){
        var reg = /^[0-9]\d{5,10}$/;
        if (!reg.test(field.val())) {
            return "* QQ号码格式不正确";
        }
    }
    
    // 验证性别格式
    function sex(field, rules, i, options){
        var reg = /^['男'|'女']$/;
        if (!reg.test(field.val())) {
            return "*  性别格式不正确";
        }
    }
   
    // 根据email 员工编号 手机号查询是否已经存在
    function exist(field, rules, i, options){
        var con = field.val();
        var msg = "";
        if(con == "") return;
        $.ajax({
            async:false,
            url:'${ctx}/manage/emp/exist',
            dataType:'json',
            data:{condition:con},
            type:'post',
            success:function(data){
                if(data.result == "ok" && data.exist == 1){
                    msg = "已经存在";
                } 
            },error:function(data){
                msg = "已经存在";
            }
        })
        if(msg != "")
        return msg;
    }
    
    function  changeSex(){
    	
        var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
        var sex = $("#sex").val(); 
       
        $.ajax({
                    url:'${ctx}/front/emp/modifySex',
                    dataType:'json',
                    data: {sex:sex},
                    type:'post',
                    success:function(data){
                        if(data.result == "ok"){
                            alert(data.msg);
                            location.reload();
                        }else{
                            alert(data.msg);
                        }
                    },error:function(data){
                        alert("提交失败!");
                    }
                })
    }
    function  changeAddress(){
        
        var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
        var address = $("#address").val(); 
       
        $.ajax({
                    url:'${ctx}/front/emp/modifyAddress',
                    dataType:'json',
                    data: {address:address},
                    type:'post',
                    success:function(data){
                        if(data.result == "ok"){
                            alert(data.msg);
                            location.reload();
                        }else{
                            alert(data.msg);
                        }
                    },error:function(data){
                        alert("提交失败!");
                    }
                })
    }
    
    function  changeMobile(){
        
         var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
        var mobile = $("#mobile").val(); 
       
        $.ajax({
                    url:'${ctx}/front/emp/modifyMobile',
                    dataType:'json',
                    data: {mobile:mobile},
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
    
     function  changeBirthday(){
        
         var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
         var birthday = $("#birthday").val(); 
       
        $.ajax({
                    url:'${ctx}/front/emp/modifyBirthday',
                    dataType:'json',
                    data: {birthday:birthday},
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
    
    function  changeQQ(){
   
         var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
        var qq = $("#qq").val(); 
       
        $.ajax({
                    url:'${ctx}/front/emp/modifyQQ',
                    dataType:'json',
                    data: {qq:qq},
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
    
    function  changeLandNumber(){
   
         var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
         var landNumber = $("#landlineNumber").val(); 
       
         $.ajax({
                    url:'${ctx}/front/emp/modifyLandNumber',
                    dataType:'json',
                    data: {landNumber:landNumber},
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
    
    function  changeNativePlace(){
   
         var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
         var nativePlace = $("#nativePlace").val(); 
       
         $.ajax({
                    url:'${ctx}/front/emp/modifyNativePlace',
                    dataType:'json',
                    data: {nativePlace:nativePlace},
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
    
    function  changeHobby(){
        
         var allCheck = $('#myform').validationEngine('validate');
                if(!allCheck){
                    return;
                }
        var hobby = $("#hobby").val(); 
       
        $.ajax({
                    url:'${ctx}/front/emp/modifyHobby',
                    dataType:'json',
                    data: {hobby:hobby},
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
    
    
</script>    
</head>
<body>
<form id="myform">
  <div class="main">
     <div class="right">
          <div class="title"> 
               <h3>基本信息</h3>
               <!--<a href="#" class="xgtx">修改头像</a>-->
               <a href="${ctx}/user/changePersonPwd/" target="rightFrame" class="mmxg_01">密码修改</a>
               <span><a href="${ctx}/front/main/right">首页</a> > <i>账号</i></span>
               <div class="clear"></div>
          </div>
          <div class="jbxx">
               <h3>${employee.realName}</h3>
               <form>
                 <table>
                     <tr>
                        <td>
                              <div class="xx" id="div9">
                              <span class="name_01">性别：</span>
                              <span class="nr">${sex}</span>
                              <a href="#" id="xg0">【修改】</a>
                           </div>
                           <div class="xx" id="div10" style="display:none">
                              <span class="name_01">性别：</span>
                              <span class="nr"><input type="text" id="sex" name="name"  value='${sex}' class="put validate[funcCall[sex]" /></span>
                              <button type="button" onclick="changeSex()" class="Button0">保存</button>
                              <a href="#" id="qx0">取消</a>
                           </div>
                         
                        </td>
                        <td>
                           <div class="xx" id="div11">
                              <span class="name_01">出生年月：</span>
                              <span class="nr">${birthday}</span>
                              <a href="#" id="xg10">【修改】</a>
                           </div>
                           <div class="xx" id="div12" style="display:none">
                              <span class="name_01">出生年月：</span>
                              <span class="nr"><input type="text" id="birthday" name="name"  value='${birthday}' class="put validate[[custom[date]]" /></span>
                              <button type="button" onclick="changeBirthday()" class="Button0">保存</button>
                              <a href="#" id="qx10">取消</a>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <td>
                            <div class="xx">
                              <span class="name_01">所在部门：</span>
                              <span id="departSpan" class="nr">${department.deptName}</span>
                           </div>
                        </td>
                        <td>
                           <div class="xx" id="div15">
                              <span class="name_01">出生地：</span>
                              <span class="nr">${employee.nativePlace}</span>
                              <a href="#" id="xg6">【修改】</a>
                           </div>
                           <div class="xx" id="div16" style="display:none">
                              <span class="name_01">出生地：</span>
                              <span class="nr"><input type="text" id="nativePlace" name="name"  value='${employee.nativePlace}' class="put " /></span>
                              <button type="button" onclick="changeNativePlace()" class="Button0">保存</button>
                              <a href="#" id="qx6">取消</a>
                           </div>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                            <div class="xx">
                              <span class="name_01">岗位：</span>
                              <span id="roleSpan" class="nr">${roleString}</span>
                           </div>
                        </td>
                        <td>
                           <div class="xx" id="div1">
                              <span class="name_01">现住地址：</span>
                              <span class="nr">${employee.address}</span>
                              <a href="#" id="xg">【修改】</a>
                           </div>
                           <div class="xx" id="div2" style="display:none">
                              <span class="name_01">现住地址：</span>
                              <span class="nr">
                              <input type="text" id="address" name="name" class="put validate[maxSize[30]]"  value='${employee.address}'/>
                              </span>
                              <button type="button" onclick="changeAddress()" class="Button1">保存</button>
                              <a href="#" id="qx">取消</a>
                           </div>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                            <div class="xx">
                              <span class="name_01">入职时间：</span>
                              <span class="nr">${joinDate}</span>
                           </div>
                        </td>
                        <td>
                           <div class="xx">
                              <span class="name_01">联系电话：</span>
                              <span class="nr">${employee.user.mobile}</span>
                           </div>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                           <div class="xx" id="div5">
                              <span class="name_01">QQ：</span>
                              <span class="nr">${employee.qq}</span>
                              <a href="#" id="xg3">【修改】</a>
                           </div>
                           <div class="xx" id="div6" style="display:none">
                              <span class="name_01">QQ：</span>
                              <span class="nr"><input type="text" id="qq" name="name"  value='${employee.qq}' class="put validate[funcCall[qq]]" /></span>
                              <button type="button" onclick="changeQQ()" class="Button3">保存</button>
                              <a href="#" id="qx3">取消</a>
                           </div>
                        </td>
                        <td>
                           <div class="xx" id="div13">
                              <span class="name_01">座机号：</span>
                              <span class="nr">${employee.landlineNumber}</span>
                              <a href="#" id="xg5">【修改】</a>
                           </div>
                           <div class="xx" id="div14" style="display:none">
                              <span class="name_01">座机号：</span>
                              <span class="nr"><input type="text" id="landlineNumber" name="name"  value='${employee.landlineNumber}' class="put validate[custom[phone]]" /></span>
                              <button type="button" onclick="changeLandNumber()" class="Button3">保存</button>
                              <a href="#" id="qx5">取消</a>
                           </div>
                       </td>
                     </tr>
                 </table>
               </form>
               <div class="xqah">
                    <h3>兴趣爱好</h3>
                    <div class="xqah_nr" id="div7">
                         <span>${employee.hobby}</span>
                         <a href="#" id="xg4">【修改】</a>
                    </div>
                    <div class="xqah_nr" id="div8" style="display:none">
                         <p><textarea name="content" id="hobby" class="validate[maxSize[1000]]" style="width:580px;height:120px;">${employee.hobby}</textarea></p>
                         <div class="btn"><button type="button" onclick="changeHobby()" class="Button4">保存</button><button type="button" class="Button5">取消</button></div>
                    </div>
               </div>
          </div>
     </div>
     <div class="clear"></div>
</div>
</form>
</body>
</html>
