
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>员工信息</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/manage/js/adminJS.js"></script>
<script type="text/javascript">
	// 返回上一页
	function jumpPageRetrun(){
		var p = $('#pageNumTemp').val();
		jumpPage(p);
	}
</script>

</head>
<body>
     <div class="grxx">
          <div class="titNm">
             <h3>${depTitle}</h3>
             <div class="dd"><a href="javascript:jumpPageRetrun()" class="back_01">返回上一页</a></div>
             <div class="clear"></div>
       </div>
       <div class="lin"></div>
          <div class="grone">
               <h3>${employee.realName}</span></h3>
               <form>
                 <table>
                     <tr>
                        <td>
                              <span class="name_01">性别：</span>
                              <span class="nr">
                              <#if employee.sex == 1 >
                           			  男
                              <#elseif employee.sex == 2>
                              		女
                              </#if>
                              </span>
                        </td>
                        <td>
                              <span class="name_01">启用状态：</span>
                              <span class="nr">
                                <#if employee.user.disabledFlag == 0 >
                              		否
                            	<#else>
                             		 是
                            	</#if>
								</span>
                        </td>
                     </tr>
                     <tr>
                        
                        <td>
                              <span class="name_01">所在部门：</span>
                              <span class="nr">${departmentName}</span>
                        </td>
                        <td>
                              <span class="name_01">登录邮箱：</span>
                              <span class="nr">${employee.user.email}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">岗位——：</span>
                              <span class="nr">${roleNameArr}</span>
                        </td>
                        <td>
                              <span class="name_01">工号：</span>
                              <span class="nr">${employee.user.employeeNumber}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">入职时间：</span>
                              <span class="nr">${joinDateStr}</span>
                        </td>
                        <td>
                              <span class="name_01">手机号码：</span>
                              <span class="nr">${employee.user.mobile}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">身份证号：</span>
                              <span class="nr">${employee.identityCard}</span>
                        </td>
                        <td>
                              <span class="name_01">最高学历：</span>
                              <span class="nr">   
                             <#switch employee.edu>
                             <#case 1>
	                             		 专科
	                             <#break>
                             <#case 2>
	                              		本科
	                             <#break>
	                         <#case 3>
	                  					硕士
	                             <#break>
	                         <#case 4>
	                              		博士
	                             <#break>
                             <#default>
	                              	
                             <#break>
                             </#switch>
                             </span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">出生年月：</span>
                              <span class="nr">${birthDateStr}</span>
                        </td>
                        <td>
                              <span class="name_01">本单位工龄：</span>
                              <span class="nr">${employee.companyWorkYear}<#if employee.companyWorkYear != 0 && employee.companyWorkYear != null>年</#if></span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">年龄：</span>
                              <span class="nr">${age}</span>
                        </td>
                        <td>
                              <span class="name_01">总工龄：</span>
                              <span class="nr">${employee.workYear}<#if employee.workYear != 0 && employee.workYear != null>年</#if></span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">籍贯：</span>
                              <span class="nr">${employee.nativePlace}</span>
                        </td>
                        <td>
                              <span class="name_01">在职状态：</span>
                              <span class="nr">
                              <#switch employee.jobStatus>
                             <#case 1>
	                              	在职
	                             <#break>
                             <#case 2>
	                              	离职
	                             <#break>
	                         <#case 3>
	                              	休假
	                             <#break>
                             <#default>
                             	<#break>
                             </#switch>
							  </span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">现住地址：</span>
                              <span class="nr">${employee.address}</span>
                        </td>
                        <td>
                              <span class="name_01">专业：</span>
                              <span class="nr">${employee.career}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">民族：</span>
                              <span class="nr">${employee.nation}</span>
                        </td>
                        <td>
                              <span class="name_01">社保号：</span>
                              <span class="nr">${employee.socialSecurityNo}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">婚姻状态：</span>
                              <span class="nr">
                              <#if employee.marriageFlag == 2 >
                              	已婚
                           	  <#elseif employee.marriageFlag == 1 >
                              	未婚
                              </#if>
								</span>
                        </td>
                        <td>
                              <span class="name_01">座机号码：</span>
                              <span class="nr">${employee.landlineNumber}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">健康状态：</span>
                              <span class="nr">${employee.health}</span>
                        </td>
                        <td>
                              <span class="name_01">QQ：</span>
                              <span class="nr">${employee.qq}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">政治面貌：</span>
                              <span class="nr"> 
                              <#switch employee.jobStatus>
                             <#case 1>
		                          	团员
	                             <#break>
                             <#case 2>
	                              	党员
	                             <#break>
	                         <#case 3>
	                              	群众
	                             <#break>
                             <#default>
                             	<#break>
                             </#switch></span>
                        </td>
                        <td>
                              <span class="name_01">紧急联络人：</span>
                              <span class="nr">${employee.urgencyLinker}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td>
                              <span class="name_01">户口类别：</span>
                              <span class="nr">
                              <#if employee.accountType == 1 >
                                  	城市
                           	  <#elseif employee.accountType == 2 >
                              	  	农村
                              </#if>
                              </span>
                        </td>
                        <td>
                              <span class="name_01">紧急联络人电话：</span>
                              <span class="nr">${employee.urgencyPhone}</span>
                        </td>
                     </tr>
                     <tr>  
                        <td colspan="2">
                              <span class="name_01">户口所在地：</span>
                              <span class="nr">${employee.accountAddress}</span>
                        </td>
                        
                     </tr>
                 </table>
               </form>
          </div>
          <div class="zpxx">
                <div class="zpbg">
                    <div class="img_01">
                    <#if employee.avatorAttachmentId != 0 && employee.avatorAttachmentId != null>
                    	<img src="${ctx}/front/attachment/read?id=${employee.avatorAttachmentId}" width="100%"/>
                    <#else>
                    	<img src="${ctx}/static/manage/images/zpBg.png" width="100%"/>
                    </#if>
                    </div>
                    <p><span>${employee.realName}</span>(${departmentName})</p>
               </div>
             <#if employee.resumeAttachmentId != 0 && employee.resumeAttachmentId != null>
                   <a href="${ctx}/front/attachment/download?id=${employee.resumeAttachmentId}">下载简历</a>
             </#if>
               <div class="bj">
<!--                    <a href="#" class="mp"></a>-->
			<#if lib.checkOper('10010302') || lib.checkOper('0000')>
                    <a href="${ctx}/manage/emp/edit?employeeNumber=${employee.user.employeeNumber}" class="bx"></a>
                    <!--  <a href="javascript:deleteEmploye('${employee.user.employeeNumber}')" class="sc"></a>-->
            </#if>
               </div>
               <div class="ham">
                    <span>${employee.user.email}</span>
                    <p>${employee.user.mobile}</p>
               </div>
          </div>
          <div class="clear"></div>
          <div class="tec">
                <div class="tec_01">
                     <h3>教育背景</h3>
                     <ul>
                        <li>${employee.eduMemo}</li>
                     </ul>
                </div>
                <div class="tec_01">
                
                     <h3>特长/爱好</h3>
                    <p>${employee.hobby}</p>
                </div>
          </div>
     </div>
     <div class="clear"></div>
</body>
</html>
