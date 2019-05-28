<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<#include "/common/script.ftl">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/manage/js/adminJS.js"></script>
<#include "/common/validation.ftl">
<#include "/common/uploadify.ftl">
<script type="text/javascript">
	$(function(){
		
		$("#depfrom").validationEngine("attach",{ 
			    promptPosition:"topRight", 
			    scroll:false
		}); 
		
		
		jumpPage(1);
		
		$("ul li h3").each(function(){
			$(this).click(function(){
				$("#deptId").val($(this).attr("data"));
				li_onclick($(this).parent());
			})
		})
	});
	
	
	function li_onclick($this){
		closeOthers($this);
		viewChildren($this);
		jumpPage(1);
	}
	
	
	function closeOthers($this){
		$this.siblings("li").each(function(){
			var cld = $(this);
			cld.children().each(function(){
				if($(this).is("ul")){$(this).remove();}
			})
		})
	}
	
	function viewChildren($this){
		if($this.children().length==1){
			$.ajax({
				url:'${ctx}/manage/dept/getDeptChildren',
				dataType:'json',
				data:{
					depId:$("#deptId").val()
				},
				type:'post',
				success:function(jsonArray){
					if(jsonArray!=''){
						for(var i=0;i<jsonArray.length;i++){
							var json = jsonArray[i];
							var ul = "<ul><li><h3><span>"+json.DeptName+"</span></h3></li></ul>"
							var $ul = $(ul);
							$this.append($ul);
							$ul.children().children().attr("data",json.deptId);
							$ul.children().children().click(function(){
								$("#deptId").val($(this).attr("data"));
								li_onclick($(this).parent());
							});
						}
					}
				},error:function(data){
					location.reload();
				}
			});
		}else{
			
		}
	}
	
	function jumpPage(p){
		var deptId = $('#deptId').val();
		$("#pageNumTemp").val(p);
		$.ajax({
			url:'${ctx}/manage/dept/list',
			dataType:'html',
			data:'pageNum='+p+'&deptId='+deptId,
			type:'post',
			success:function(data){
				$("#deptEmpList").html(data);
			},error:function(data){
				alert("提交失败!");
			}
		});
	}
	
	// 员工信息
	function jumpEmpIndexPage(employeeNumber){
		$.ajax({
			url:'${ctx}/manage/emp/index',
			dataType:'html',
			data:'employeeNumber='+employeeNumber,
			type:'post',
			success:function(data){
				$("#deptEmpList").html(data);
			},error:function(data){
				alert("提交失败!");
			}
		});
	}
	
	// 启用员工
	function enableEmploye(employeeNumber){
		$.ajax({
			url:'${ctx}/manage/emp/enable',
			dataType:'json',
			data:{employeeNumber:employeeNumber},
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					location.href = "${ctx}/manage/dept/index";
				}
			},error:function(data){
				alert("启用失败!");
			}
		})
	}
	
	// 停用员工
	function disabledEmploye(employeeNumber){
		$.ajax({
			url:'${ctx}/manage/emp/disabled',
			dataType:'json',
			data:{employeeNumber:employeeNumber},
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					location.href = "${ctx}/manage/dept/index";
				}
			},error:function(data){
				alert("停用失败!");
			}
		})
	}
	
	// 弹出发送密码窗口
	function showSendPwd(employeeNumber,email,mobile,name){
	
		if(!confirm("确定要重置  "+ name +" 的密码吗？"))
	    	return;
	
		// 保存员工编号，邮件，手机
		$("#sendpwd_employeeNumber").val(employeeNumber);
		$("#sendpwd_email").val(email);
		$("#sendpwd_mobile").val(mobile);
		
		$("#sendpwd_form").validationEngine("attach",{ 
		    promptPosition:"topRight", 
		    scroll:false
		}); 
		$.blockUI({
            message: $('#mmBox'),
            css:{
            	top:'5%'
            }
        });
	}
	
	// 发送密码
	function sendPwd(){
		var allCheck = $('#sendpwd_form').validationEngine('validate');
		if(!allCheck){
			return;
		}
		$.ajax({
			async:false,
			url:'${ctx}/manage/emp/genPwd',
			dataType:'json',
			data:$('#sendpwd_form').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					$.unblockUI();
				}
			},error:function(data){
				alert("提交失败!");
			}
		});
	}
	
	function addDeptDiv(id){
		if(id == undefined){
			id = 0;
		}
		url = "${ctx}/manage/dept/add?id="+id;
		$.ajax({
			url:url,
			dataType:'html',
			type:'post',
			success:function(data){
				$("#bmBox").html(data);
				$("#create_depfrom").validationEngine("attach",{ 
				    promptPosition:"topRight", 
				    scroll:false
				}); 
			    $.blockUI({
                    message: $('#bmBox'),
                    css:{
                    	top:'1%'
                    }
                });
			},error:function(data){
				alert("提交失败!");
			}
		});
	}
	function openDeptDiv(id){
		url = "${ctx}/manage/dept/edit?id="+id;
		if(id == -2){
			alter("11");
		}
		$.ajax({
			url:url,
			dataType:'html',
			type:'post',
			success:function(data){
				$("#bmBox").html(data);
				$("#create_depfrom").validationEngine("attach",{ 
				    promptPosition:"topRight", 
				    scroll:false
				}); 
			    $.blockUI({
                    message: $('#bmBox'),
                    css:{
                    	top:'5%'
                    }
                });
			},error:function(data){
				alert("提交失败!");
			}
		});
	}
	
	
	
	function batchAdd_open(){
		var url = "${ctx}/manage/employeebatch/batchadd_step1";
		$.ajax({
			url:url,
			dataType:'html',
			type:'post',
			success:function(data){
				$("#plBox1").html(data);
				blockUI($('#plBox1'));
			},error:function(data){
				alert("提交失败!");
			}
		});
	}
	
	
	function batchAdd_step2(){
		var url = "${ctx}/manage/employeebatch/batchadd_step2";
		if($("#batchAddFilePath").val()==''){
			alert("请选择文件!");
			return;
		}
		//document.getElementById('btn_batchAdd_step2').innerHTML = "提交中...";
		//$("#btn_batchAdd_step2").html("提交中...");
		$("#btn_batchAdd_step2").attr('disabled',true);
		$.ajax({
			url:url,
			async:false,
			dataType:'html',
			type:'post',
			data:{
				batchAddFilePath:$("#batchAddFilePath").val()
			},
			success:function(data){
				$("#plBox2").html(data);
				blockUI($('#plBox2'));
			},error:function(data){
				alert("提交失败!");
				//$("#btn_batchAdd_step2").html("下一步");
				$("#btn_batchAdd_step2").attr('disabled',false);
			}
		});
	}
	
	
	
	function batchAdd_success(rightCount){
		var url = "${ctx}/manage/employeebatch/success";
		$.ajax({
			url:url,
			dataType:'html',
			data:{
				rightCount:rightCount
			},
			type:'post',
			success:function(data){
					$("#plBox3").html(data);
					blockUI($('#plBox3'));
			},
			error:function(data){
				$.unBlockUI();
			}
		});
	}
	
	function batchAdd_step3(){
		if($("#errorCount").val()!='0'){
			if (confirm("您确认放弃修改错误数据？\n注：错误数据不会被导入系统")==false){
				return;
    		} 
		}
		//$("#btn_batchAdd_step3").html("提交中...");
		$("#btn_batchAdd_step3").attr('disabled',true);
		var url = "${ctx}/manage/employeebatch/batchadd_step3";
		$.ajax({
			url:url,
			async:false,
			dataType:'html',
			type:'post',
			data:{
				batchNumber:$("#batchNumber").val(),
				batchAddFilePath2:$("#batchAddFilePath2").val(),
				rightCount:$("#rightCount").val()
			},
			success:function(data){
				if(data=="-1"){
					alert("业务处理失败，请联系管理员.");
				}else{
					batchAdd_success(data);
				}
			},error:function(data){
				alert("提交失败!");
				//$("#btn_batchAdd_step3").html("下一步");
				$("#btn_batchAdd_step3").attr('disabled',false);
			}
		});
	}
	
	
	function validateEngineAttach(form){
		form.validationEngine("attach",{ 
				    promptPosition:"topRight", 
				    scroll:false
				}); 
	}
	
	
	function confirmLeave(message){
		if (confirm(message)==true){
        	cancel();
    	} 
	}
	
	function blockUI(doc){
		$.blockUI({
                    message: doc,
                    css:{
                    	top:'0%'
                    }
			 });
	}
	
	function create(id){
		var allCheck = $('#create_depfrom').validationEngine('validate');
			if(!allCheck){
				return;
			}
		url = "${ctx}/manage/dept/create?id="+id;
		$.ajax({
			url:url,
			dataType:'json',
			data:$('#create_depfrom').serialize(),
			type:'post',
			success:function(data){
				alert(data.msg);
				if(data.result == "ok"){
					$.unblockUI();
					location.reload();
				}
			},error:function(data){
				alert("提交失败!");
			}
		})
	}
	
	function update(){
		var allCheck = $('#create_depfrom').validationEngine('validate');
			if(!allCheck){
				return;
			}
		$.ajax({
			url:'${ctx}/manage/dept/update',
			dataType:'json',
			data:$('#create_depfrom').serialize(),
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
	
	function deleteDept(){
		var allCheck = $('#create_depfrom').validationEngine('validate');
			if(!allCheck){
				return;
			}
		$.ajax({
			url:'${ctx}/manage/dept/delete',
			dataType:'json',
			data:$('#create_depfrom').serialize(),
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
	
	function cancel(){
		$.unblockUI();
	}
		
	function clickCompany(){
		$("#deptId").val("");
		jumpPage(1);
	}
</script>
</head>
<body>
<div class="main">
     <div class="xzyg"> 
     		 <#if lib.checkOper('20010101') || lib.checkOper('0000')>
               <div class="add" onclick="javascript:clickCompany();">公司部门</div>
               <ul id="panel">
                	<#list departlist as depart>
	                  <#--<#if depart.enable == 1> -->
	                    <li>
	                    	<h3 data="${depart.id}" ><span>${depart.deptName}</span></h3>
	                    </li>
	                 <#--> </#if> -->
                   </#list>  
               </ul>
          </div>
          </#if>
          <input type="hidden" id="deptId" value="${deptId}">
          <input type="hidden" id="pageNumTemp" value="">
     <div id="deptEmpList">
       
     </div>
     <div class="clear"></div>
</div>
<!--添加部门-->
<div id="bmBox" style="display:none">
     
</div>

<!--批量导入  start-->
<div id="plBox1" style="display:none">
      
</div>
<div id="plBox2" style="display:none">
      
</div>
<div id="plBox3" style="display:none">
     
</div>
<!--批量导入  end-->

<!--生成密码发送等式确认  start-->
<div id="mmBox" style="display:none">
 <div class="tcBG"></div>
 <div class="xzjs">
      <h3>生成密码发送等式确认</h3>
      <div class="xzglBx">
          <form id="sendpwd_form">
          <input type="hidden" id="sendpwd_employeeNumber" name="employeeNumber" value="">
          <input type="hidden" id="sendpwd_email" name="email" value="">
          <input type="hidden" id="sendpwd_mobile" name="mobile" value="">
           <table>
               <tr>
                  <td class="two_01" align="right" style=" font-size:14px"><input type="checkbox"  name="notice" value="1" class="chek2 validate[minCheckbox[1]]"><label>手机短信</label></td>
                  <td class="two_01" style="padding-left:20px; font-size:14px"><input type="checkbox" name="notice" value="2" class="chek2 validate[minCheckbox[1]]"><label>公司邮箱</label></td>
               </tr>
           </table>
          </form>
      </div>
      <div class="buttom"><button type="button" onClick="sendPwd();" class="but1">发送</button><button type="button" onClick="cancel();" class="but2" >取消</button></div>
 </div>
</div>
<!--生成密码发送等式确认  end-->



</body>
</html>