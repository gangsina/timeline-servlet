
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>员工编辑</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<style type="text/css">
	.sczp .uploadify{margin:0 auto}
</style>
<#include "/common/script.ftl">
<#include "/common/validation.ftl">
<#include "/common/uploadify.ftl">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/manage/js/adminJS.js"></script>
<script type="text/javascript" src="${ctx}/static/common/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#myform").validationEngine("attach",{ 
		    promptPosition:"topRight", 
		    scroll:false 
		}); 
		
		// 页面加载时触发 之所以这样做是因为值似乎赋了没什么用会触发jquery非空的验证
		$("#postNameLb").attr("value",'${roleNameArr}');
		$("#postNameLb").html('${roleNameArr}');
	});
	
	function formSubmit(){
		var allCheck = $('#myform').validationEngine('validate');
		if(!allCheck){
			return;
		}
		$('#btnSave').html("保存中...");
		$('#btnSave').attr('disabled',true);
		$.ajax({
			url:'${ctx}/manage/emp/update',
			async:true,
			dataType:'json',
			data:$('#myform').serialize(),
			type:'post',
			success:function(data){
				$('#btnSave').html("保存");
				$('#btnSave').attr('disabled',false);
				alert(data.msg);
				if(data.result == "ok"){
					location.href = "${ctx}/manage/dept/index";
				}
			},error:function(data){
				alert("保存失败!");
				$('#btnSave').html("保存");
				$('#btnSave').attr('disabled',false);
			}
		})
	}
//	//检查号码是否符合规范，包括长度，类型
//	function isIdCardno(card){
//		 //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
//		 var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
//		 if(reg.test(card) === false){
//		  //alert("demo");
//		  return false;
//		 }
//		 return true;
//	}

	// 上传简历 
	$(function() {
	
		setTimeout(function(){
		    $("#resumeFileData").uploadify({
		        'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
		        'uploader': '${ctx}/common/upload',
		        'buttonText':'重新上传',
		        'formData':{'jsessionid':'${authService.sessionId}'},
		        'height':15,
		        'width':80,
		        'fileSizeLimit':'10MB',
		        'fileObjName':'fileData',
		        'removeTimeout':3,
		        'queueSizeLimit':1,
		        'multi':false,
		        'onUploadSuccess' : function(file, data, response) {
		        	eval('data = '+data);
		        	if(data.result == true){
			        	$("#resumeAttachmentId").val(data.attachmentId);
			        	$("#resumeComment").text("已上传");
			        	updateResumeId(data.attachmentId);
		        	} else {
		        		alert("上传文件错误!");
		        	}
		            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传文件错误!");
		        }
		    });
		 },10);
		 
	});
	
	// 上传照片 
	$(function() {
	
		setTimeout(function(){
		    $("#avatorFileData").uploadify({
		        'swf': '${ctx}/static/common/js/uploadify/uploadify.swf',
		        'uploader': '${ctx}/common/upload',
		        'buttonText':'上传照片',
		        'formData':{'jsessionid':'${authService.sessionId}'},
		        'height':15,
		        'width':80,
		        'fileSizeLimit':'10MB',
		        'fileObjName':'fileData',
		        'fileTypeDesc': '类型',
		        'fileTypeExts': '*.jpg;*.jpeg;*.png;*.gif;*.bmp;',
		        'removeTimeout':3,
		        'queueSizeLimit':1,
		        'multi':false,
		        'onUploadSuccess' : function(file, data, response) {
		        	eval('data = '+data);
		        	if(data.result == true){
			        	$("#avatorAttachmentId").val(data.attachmentId);
			        	$("#avatorImg").attr("src", '${ctx}/front/attachment/read?id=' + data.attachmentId);
			        	updateAvatorId(data.attachmentId);
		        	} else {
		        		alert("上传失败!");
		        	}
		            //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
		        },onSelectError : function(file, errorCode, errorMsg) {
		        	alert("上传失败!");
		        }
		    });
		 },10);
		 
	});
	
	// 旋转照片
	function rotateAvator(type){
		//var degree = $("#degree").val();
		var degree = 0;
		var avatorAttachmentId = $("#avatorAttachmentId").val();
		if(avatorAttachmentId == 0 || avatorAttachmentId == ""){
			alert("请先上传照片！！！");
			return;
		}
		//degree = parseInt(degree);
		if(type == 1){
			degree = degree + 90;
		}else{
			degree = degree - 90;
		}
		if(degree >= 360 || degree<=-360){
			degree = 0;
		}
		$('#rotateLeft').attr('disabled',true);
		$('#rotateRight').attr('disabled',true);
		$.ajax({
			url:"${ctx}/manage/emp/rotateAvator",
			type:'post',
			dataType:"json",
			data:{avatorAttachmentId:avatorAttachmentId, degree:degree},
			success:function(data){
				if(data.result){
					$("#avatorImg").attr("src", '${ctx}/front/attachment/read?id=' + avatorAttachmentId + '&vali=' + Math.random());
					//$("#degree").val(degree);
				}else{
					alert("旋转图片失败!");
				}
				$('#rotateLeft').attr('disabled',false);
				$('#rotateRight').attr('disabled',false);
			},error:function(data){
				alert("旋转图片失败!");
				$('#rotateLeft').attr('disabled',false);
				$('#rotateRight').attr('disabled',false);
			}
		})
	}
	
	// 根据员工id更新照片附件id
	function updateAvatorId(avatorAttachmentId){
		var eId = $("#employeeId").val();
		$.ajax({
			async:false,
			url:'${ctx}/manage/emp/updateAvatorId',
			dataType:'json',
			data:{avatorAttachmentId:avatorAttachmentId, id:eId},
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					//alert("保存成功!");
				}
			},error:function(data){
					//alert("保存失败!");
			}
		})
	}
	
	// 根据员工id更新简历附件id
	function updateResumeId(resumeAttachmentId){
		var eId = $("#employeeId").val();
		$.ajax({
			async:false,
			url:'${ctx}/manage/emp/updateResumeId',
			dataType:'json',
			data:{resumeAttachmentId:resumeAttachmentId, id:eId},
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					//alert("保存成功!");
				}
			},error:function(data){
					//alert("保存失败!");
				}
		})
	}

	// 根据email 员工编号 手机号查询是否已经存在
	function exist(field, rules, i, options){
		var con = field.val();
		var uId = $("#userId").val();
		var msg = "";
		if(con == "") return;
		$.ajax({
			async:false,
			url:'${ctx}/manage/emp/edit/exist',
			dataType:'json',
			data:{condition:con, userId:uId},
			type:'post',
			success:function(data){
				if(data.result == "ok" && data.exist == 1){
					msg = "已经存在";
				} 
			},error:function(data){
				msg = "请求出错";
			}
		})
		if(msg != "")
		return msg;
	}

	// 验证email格式
	function email(field, rules, i, options){
		var reg=  /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		if (!reg.test(field.val())) {
     		return "* 邮箱格式不正确";
      	}
//		return true;
      	
//      	var arrEmail = field.val().split("@");
//        var flag = "false";
//        if(arrEmail.length>1){
//            var email_varlidate = arrEmail[1];
//            var des = "'ewppay.com' || 'ewppay.com.cn' || '12pai.com.cn' || '12pai.cn' || 'yiwopay.com' || 'yiwopai.com.cn'|| 'huahaikeji.cn'";
//            if(des.indexOf("'"+email_varlidate+"'")!=-1){
//                     flag = "true";
//             }
//             if(flag != "true"){
//                return "* 邮箱格式非法";
//             }
//        }
	}
	
	// 验证qq格式
	function qq(field, rules, i, options){
		var reg = /^[0-9]\d{5,10}$/;
		if (!reg.test(field.val())) {
     		return "* QQ号码格式不正确";
      	}
	}
	// 验证身份证格式
	function chinaCardReg(field, rules, i, options){
	
		if (!isIdCard(field.val())) {
     		return "* 身份证号码格式不正确";
      	}
	}
	// 验证身份证格式
	function isIdCard(person_id) {
	    var person_id = person_id;
	    
	        //身份证的地区代码对照  
	        var aCity = {
	            11 : "北京",
	            12 : "天津",
	            13 : "河北",
	            14 : "山西",
	            15 : "内蒙古",
	            21 : "辽宁",
	            22 : "吉林",
	            23 : "黑龙江",
	            31 : "上海",
	            32 : "江苏",
	            33 : "浙江",
	            34 : "安徽",
	            35 : "福建",
	            36 : "江西",
	            37 : "山东",
	            41 : "河南",
	            42 : "湖北",
	            43 : "湖南",
	            44 : "广东",
	            45 : "广西",
	            46 : "海南",
	            50 : "重庆",
	            51 : "四川",
	            52 : "贵州",
	            53 : "云南",
	            54 : "西藏",
	            61 : "陕西",
	            62 : "甘肃",
	            63 : "青海",
	            64 : "宁夏",
	            65 : "新疆",
	            71 : "台湾",
	            81 : "香港",
	            82 : "澳门",
	            91 : "国外"
	        };
	        //获取证件号码  
	        //  var person_id=person_id.value();  
	        //合法性验证  
	        var sum = 0;
	        //出生日期  
	        var birthday;
	        //验证长度与格式规范性的正则  
	        var pattern = new RegExp(
	                /(^\d{15}$)|(^\d{17}(\d|x|X)$)/i);
	        if (pattern.exec(person_id)) {
	            //验证身份证的合法性的正则  
	            pattern = new RegExp(
	                    /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/);
	            if (pattern.exec(person_id)) {
	                //获取15位证件号中的出生日期并转位正常日期       
	                birthday = "19" + person_id.substring(6, 8)
	                        + "-" + person_id.substring(8, 10)
	                        + "-" + person_id.substring(10, 12);
	            } else {
	                person_id = person_id.replace(/x|X$/i, "a");
	                //获取18位证件号中的出生日期  
	                birthday = person_id.substring(6, 10) + "-"
	                        + person_id.substring(10, 12) + "-"
	                        + person_id.substring(12, 14);
	
	                //校验18位身份证号码的合法性  
	                for ( var i = 17; i >= 0; i--) {
	                    sum += (Math.pow(2, i) % 11)
	                            * parseInt(
	                                    person_id.charAt(17 - i),
	                                    11);
	                }
	                if (sum % 11 != 1) {
	                    $(this).addClass("txtRequired");
	                    //alert("身份证号码不符合国定标准，请核对！");                               
	                    //$("#person_id").val("");  
	                    $("#birthday").val("")
	                    return false;
	                }
	            }
	            //检测证件地区的合法性                                  
	            if (aCity[parseInt(person_id.substring(0, 2))] == null) {
	                $(this).addClass("txtRequired");
	                //  alert("证件地区未知，请核对！");                             
	                //$("#person_id").val("");  
	                $("#birthday").val("");
	                return false;
	            }
	            var dateStr = new Date(birthday.replace(/-/g, "/"));
	
	            //alert(birthday +":"+(dateStr.getFullYear()+"-"+ Append_zore(dateStr.getMonth()+1)+"-"+ Append_zore(dateStr.getDate())))  
	            if (birthday != (dateStr.getFullYear() + "-"
	                    + Append_zore(dateStr.getMonth() + 1) + "-" + Append_zore(dateStr
	                    .getDate()))) {
	                $(this).addClass("txtRequired");
	                //  alert("证件出生日期非法！");                           
	                //$("#person_id").val("");  
	                $("#birthday").val("");
	                return false;
	            }
	            $(this).removeClass("txtRequired");
	            $("#birthday").val(birthday);
	            
	        } else {
	            $(this).addClass("txtRequired");
	            // alert("证件号码格式非法！");                           
	            //$("#person_id").val("");  
	            $("#birthday").val("")
	            return false;
	        }
	       
	        return true;
	}
	
	function Append_zore(temp) {
	    if (temp < 10) {
	        return "0" + temp;
	    } else {
	        return temp;
	    }
	}
	
	// 取消职位选择
	function mmBoxCancle(){
		// 隐藏弹出框
		$.unblockUI({
             message: $('#mmBox')
         });
	}
	// 职位发送
	function mmBoxSend(){
	    var roleName = "";
	    var roleId = "";
		// 获取选中的职位
		$('input[name="checkRole"]:checked').each(function(){    
  	 			roleId = roleId + $(this).val() + " ";   
  				roleName = roleName + $("#checkRole" + $(this).val()).text() + " ";
  		}); 
  		// 显示选中的职位，保存职位id
  		$("#postNameLb").text(roleName);
  		$("#postNameLb").val(roleName);
  		$("#roleArr").val(roleId);
  		// 隐藏弹出框
		$.unblockUI({
             message: $('#mmBox')
         });
	}
</script>
</head>
<body>
<form id="myform">
<div class="main">
     <div class="ygjbxx">
          <h3 class="tit"><a href="${ctx}/manage/dept/index" class="fhsyy"><img src="${ctx}/static/manage/images/fhsyy.png" width="98" height="22" style="vertical-align:middle"/></a>员工基本信息编辑</h3>
          <div class="xxList">
                   <table>
                        <tr>
                           <input type="hidden" id="userId" name="userId" value="${employee.user.id}" />
                           <input type="hidden" id="employeeId" name="employeeId" value="${employee.id}" />
                           <th><strong>*</strong>姓名:</th>
                           <td><input type="text" name="realName" value="${employee.realName}"  class="put validate[required,maxSize[10]]" style="width:162px"/></td>
                           <th>是否启用:</th>
                           <td>
                            <select name="disabledFlag" id="select" class="xialak" style="width:174px">
                            <#if employee.user.disabledFlag == 0 >
                              <option value = "1">是</option>
                              <option value = "0" selected = "true">否</option>
                            <#else>
                              <option value = "1" selected = "true">是</option>
                              <option value = "0">否</option>
                            </#if>
                            </select>
                          </td>
                        </tr>
                        <tr>
                           <th>性别:</th>
                           <td>                           
                           <select name="sex" id="select" class="xialak" style="width:174px">
                            <#if employee.sex == 2 >
                              <option value = "1">男</option>
                              <option value = "2" selected = "true">女</option>
                            <#else>
                              <option value = "1" selected = "true">男</option>
                              <option value = "2">女</option>
                            </#if>
                            </select>
                            </td>

                           <th><strong>*</strong>员工编号:</th>
                           <td><input type="text" name="employeeNumber" value="${employee.user.employeeNumber}"  class="put validate[required,custom[number],minSize[5],maxSize[10],funcCall[exist]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th><strong>*</strong>所在部门:</th>
                           <td>
                           <select name="departmentId" id="select" class="xialak validate[required]" style="width:174px">
                           <#list depList as dl>
                           	<#if employee.departmentId == dl.id >
                           	  <option value="${dl.id}" selected = "true">${dl.deptName}</option>
                           	<#else>
                              <option value="${dl.id}">${dl.deptName}</option>
                             </#if>
                           </#list>
                            </select>
                          </td>
                           <th><strong>*</strong>登录邮箱:</th>
                           <td>
                             <input type="text" name="email" value="${employee.user.email}"  class="put validate[required,funcCall[email],maxSize[50],funcCall[exist]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th><strong>*</strong>选择职位:</th>
                           <td>
                            <a href="#" class="djxz"><img src="${ctx}/static/manage/images/djxz.jpg" width="74" height="25"/></a>
                            <input type="hidden" id="roleArr" name="roleArr" value="${roleIdArr}" />
                            <label id="postNameLb" name="postNameLb" class="validate[required]" value=""> 
							</label>
                           <!--  <div id="postNameLb"  class="validate[required]" overflow-x:auto text-align:left float:left>
                            	 <#list ckRoleList as crl>
                            	   ${crl.roleName}&nbsp;
							 	 </#list>
                            </div>-->
                          </td>
                           <th><strong>*</strong>手机号码:</th>
                           <td>
                             <input type="text" name="mobile" value="${employee.user.mobile}"  class="put validate[required,custom[phone],funcCall[exist]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>	
                           <th><strong></strong>入职时间:</th>
                           <td>
                             <input type="text" name="joinDateStr" value="${joinDateStr}" readOnly onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="put validate[[custom[date]]" style="width:135px"/><label><img src="${ctx}/static/manage/images/rili.png" width="18" height="18" /></label>
                          </td>
                           <th>最高学历:</th>
                           <td>
                             <select name="edu" id="select" class="xialak" style="width:174px">
                             <#switch employee.edu>
                             <#case 1>
	                              <option value="1" selected = "true">专科</option>
	                              <option value="2">本科</option>
	                              <option value="3">硕士</option>
	                              <option value="4">博士</option>
	                             <#break>
                             <#case 2>
	                              <option value="1">专科</option>
	                              <option value="2" selected = "true">本科</option>
	                              <option value="3">硕士</option>
	                              <option value="4">博士</option>
	                             <#break>
	                         <#case 3>
	                              <option value="1">专科</option>
	                              <option value="2">本科</option>
	                              <option value="3" selected = "true">硕士</option>
	                              <option value="4">博士</option>
	                             <#break>
	                         <#case 4>
	                              <option value="1">专科</option>
	                              <option value="2">本科</option>
	                              <option value="3">硕士</option>
	                              <option value="4" selected = "true">博士</option>
	                             <#break>
                             <#default>
	                              <option value="1">专科</option>
	                              <option value="2" selected = "true">本科</option>
	                              <option value="3">硕士</option>
	                              <option value="4">博士</option>
                             <#break>
                             </#switch>
                            </select>
                          </td>
                        </tr>
                        <tr>
                           <th>身份证号:</th>
                           <td>
                              <input type="text" name="identityCard" value="${employee.identityCard}"  class="put  validate[funcCall[chinaCardReg]]" style="width:162px"/>
                          </td>
                           <th>专业:</th>
                           <td>
                             <input type="text" name="career" value="${employee.career}"  class="put validate[maxSize[15]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>出生年月:</th>
                           <td>
                             <input type="text" name="birthDateStr" value="${birthDateStr}" readOnly onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="put  validate[[custom[date]]" style="width:135px"/><label><img src="${ctx}/static/manage/images/rili.png" width="18" height="18" /></label>
                          </td>
                           <th>本单位工龄:</th>
                           <td>
                             <input type="text" name="companyWorkYear" value="${employee.companyWorkYear}"  class="put validate[custom[number],maxSize[2]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>籍贯:</th>
                           <td>
                             <input type="text" name="nativePlace" value="${employee.nativePlace}"  class="put validate[maxSize[10]]" style="width:162px"/>
                          </td>
                           <th>总工龄:</th>
                           <td>
                             <input type="text" name="workYear" value="${employee.workYear}"  class="put validate[custom[number],maxSize[2]]" style="width:135px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>现住地址:</th>
                           <td>
                             <input type="text" name="address" value="${employee.address}"  class="put validate[maxSize[30]]" style="width:280px"/>
                          </td>
                           <th>在职状态:</th>
                           <td>
                            <select name="jobStatus" id="select" class="xialak" style="width:174px">
                             <#switch employee.jobStatus>
                             <#case 1>
	                              <option value="1" selected = "true">在职</option>
	                              <option value="2">离职</option>
	                              <option value="3">休假</option>
	                             <#break>
                             <#case 2>
	                              <option value="1">在职</option>
	                              <option value="2" selected = "true">离职</option>
	                              <option value="3">休假</option>
	                             <#break>
	                         <#case 3>
	                              <option value="1">在职</option>
	                              <option value="2">离职</option>
	                              <option value="3" selected = "true">休假</option>
	                             <#break>
                             <#default>
	                              <option value="1" selected = "true">在职</option>
	                              <option value="2">离职</option>
	                              <option value="3">休假</option>
                             	<#break>
                             </#switch>
                            </select>
                          </td>
                        </tr>
                        <tr>
                           <th>民族:</th>
                           <td><input type="text" name="nation" value="${employee.nation}"  class="put  validate[maxSize[10]]" style="width:162px"/></td>
                           <th>社保号:</th>
                           <td>
                            <input type="text" name="socialSecurityNo" value="${employee.socialSecurityNo}"  class="put  validate[maxSize[20]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>婚姻状态:</th>
                           <td>
                            <select name="marriageFlag" id="select" class="xialak" style="width:174px">
                              <#if employee.marriageFlag == 2 >
                           	  	<option value="1">未婚</option>
                              	<option value="2" selected = "true">已婚</option>
                           	  <#else>
                              	<option value="1" selected = "true">未婚</option>
                              	<option value="2">已婚</option>
                              </#if>
                            </select>
                            </td>
                           <th>座机号码:</th>
                           <td>
                            <input type="text" name="landlineNumber" value="${employee.landlineNumber}"  class="put validate[custom[phone]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>健康状态:</th>
                           <td>
                            <input type="text" name="health" value="${employee.health}"  class="put validate[maxSize[20]]" style="width:162px"/>
                           </td>
                           <th>QQ:</th>
                           <td>
                            <input type="text" name="qq" value="${employee.qq}"  class="put validate[funcCall[qq]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>政治面貌:</th>
                           <td>
                            <select name="politicsStatus" id="select" class="xialak" style="width:174px">
                             <#switch employee.jobStatus>
                             <#case 1>
		                          <option  value="1"  selected = "true">团员</option>
	                              <option  value="2">党员</option>
	                              <option  value="3">群众</option>
	                             <#break>
                             <#case 2>
		                          <option  value="1">团员</option>
	                              <option  value="2"  selected = "true">党员</option>
	                              <option  value="3">群众</option>
	                             <#break>
	                         <#case 3>
		                          <option  value="1">团员</option>
	                              <option  value="2">党员</option>
	                              <option  value="3"  selected = "true">群众</option>
	                             <#break>
                             <#default>
		                          <option  value="1">团员</option>
	                              <option  value="2">党员</option>
	                              <option  value="3"  selected = "true">群众</option>
                             	<#break>
                             </#switch>
                            </select>
                            </td>
                           <th>紧急联络人:</th>
                           <td>
                            <input type="text" name="urgencyLinker" value="${employee.urgencyLinker}"  class="put validate[maxSize[10]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>户口类型:</th>
                           <td>
                            <select name="accountType" id="select" class="xialak" style="width:174px">
                              <#if employee.accountType == 2 >
                                  <option value="1" >城市</option>
                              	  <option value="2" selected = "true">农村</option>
                           	  <#else>
                                  <option value="1" selected = "true">城市</option>
                              	  <option value="2">农村</option>
                              </#if>
                            </select>
                            </td>
                           <th>紧急联络人电话:</th>
                           <td>
                             <input type="text" name="urgencyPhone" value="${employee.urgencyPhone}"  class="put validate[custom[phone]]" style="width:162px"/>
                          </td>
                        </tr>
                        <tr>
                           <th>户口所在地:</th>
                           <td>
                             <input type="text" name="accountAddress" value="${employee.accountAddress}"  class="put validate[maxSize[30]]" style="width:280px"/>
                          </td>
                        </tr>
                   </table>
          </div>
          <div class="sczp">
          	<div class="zpbg">
               		<input type="hidden" name="avatorAttachmentId" id="avatorAttachmentId" value="${employee.avatorAttachmentId}" />
                	<input type="hidden" name="degree" id="degree" value="0" />
                	<div class="img_01">
                     <#if employee.avatorAttachmentId != 0 && employee.avatorAttachmentId != null>
                    	<img id="avatorImg" src="${ctx}/front/attachment/read?id=${employee.avatorAttachmentId}" width="100%" />
                    <#else>
                    	<img id="avatorImg" src="${ctx}/static/manage/images/zpBg.png" width="100%" />
                    </#if>
                    </div>
                    <span>向左<a id="rotateLeft" href="javascript:rotateAvator(0)" class="left01"></a><a id="rotateRight" href="javascript:rotateAvator(1)" class="right01"></a>向右</span>
                </div>   
                <span style="margin: 0 auto" ><input type="file" class="sctp" name="avatorFileData" id="avatorFileData" multiple="false"/></span>
                    <!--<span> <a href="#" class="sctp">上传照片</a></span>-->
               <div class="scjl">
               <input type="hidden" name="resumeAttachmentId" id="resumeAttachmentId" value="${employee.resumeAttachmentId}" />
               上传电子版简历：<span id="resumeComment"><#if employee.resumeAttachmentId != 0 && employee.resumeAttachmentId != null>已上传<#else>未上传</#if></span>
                <p><!--<a href="#" class="sctp">重新上传</a>-->
                	<input type="file" class="sctp" name="resumeFileData" id="resumeFileData" multiple="false">
                </p>
               </div>
          </div>
          <div class="clear"></div>
          <div class="bjtx">
               <div class="jybj">
                    <p>教育背景:</p>
                    <textarea name="eduMemo" class="validate[maxSize[1000]]">${employee.eduMemo}</textarea>
               </div>
               <div class="jybj">
                    <p>特长爱好:</p>
                    <textarea name="hobby" class="validate[maxSize[1000]]">${employee.hobby}</textarea>
               </div>
               <div class="clear"></div>
               <div class="but"><button type="button" name="btnSave" id="btnSave" onclick="formSubmit();" class="but1">保存</button></div>
          </div>
     </div>
</div>
<!--职位选择-->
<div id="mmBox" style="display:none">
     <div class="tcBG"></div>
     <div class="xzjs">
          <h3>职位选择</h3>
          <div class="xzglBx">
            <#assign index = 5 />
            <#assign ck = 0 />   
            <#list roleList as rl>
              <#if index % 5==0 >  
              	<p class="two_01">
 			  </#if> 
 			  <#list ckRoleList as crl>
 			  		<#if crl.id == rl.id > 
 			  			<#assign ck = 1 /> 
 			  			<#break>
 			  		<#else>
 			  			<#assign ck = 0 /> 
 			  		</#if>
 			  </#list>
 			  <#if ck == 1>
 			  	 	<span><input name="checkRole" checked="true" type="checkbox" value="${rl.id}" class="chek2"><label id="checkRole${rl.id}" name="checkRole${rl.id}" >${rl.roleName}</label></span>
 			  <#else>
 			  	 	<span><input name="checkRole" type="checkbox" value="${rl.id}" class="chek2"><label id="checkRole${rl.id}" name="checkRole${rl.id}" >${rl.roleName}</label></span>
 			  </#if>
 			  <#assign index=index+1 />
              <#if index % 5==0 || !rl_has_next>  
                </p>
               </#if> 
             </#list>
          </div>
          <div class="buttom"><button type="button" class="but1" onclick = "mmBoxSend()">发送</button><button type="button" class="but2" onclick = "mmBoxCancle()">取消</button></div>
     </div>
</div>
<!--上传照片-->
<div id="tanchuBox" style="display:none">
     <div class="tcBG"></div>
     <div class="xgwdtx">
         <div class="tcknr">
          <a class="close_btn" title="关闭" href="#"></a>
           <h3>上传照片</h3>
           <div class="jdtx">
                <p>默认照片</p>
                <div class="img"></div>
           </div>
           <div class="jdtx">
                <p>上传新的照片</p>
                <div class="btn2"><button type="button" class="Button">上传</button></div>
                <span>图片文件最大5MB，大小为198*144，支持.jpg .bmp 的图片格式</span>
           </div>
           <div class="clear"></div>
         </div>
     </div>
</div>
</form>
</body>
</html>
