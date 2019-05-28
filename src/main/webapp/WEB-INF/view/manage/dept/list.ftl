 	<div class="list" >
 	<div class="titNm">
             <h3>${department.deptName}</h3>
             <!--<div class="time">(2014-08)</div>-->
             <#if lib.checkOper('20010102') || lib.checkOper('0000')>
             	<div class="dd"><a href="${ctx}/manage/emp/add" class="tjyg">添加员工</a></div>
             </#if>
              <#if lib.checkOper('20010107') || lib.checkOper('0000')>
             <div class="dd"><a href="javascript:addDeptDiv(${deptId});" class="tjbm">添加部门</a></div>
             </#if>
             <#if lib.checkOper('20010109') || lib.checkOper('0000')>
             <div class="dd" <#if deptId < 0 >style="display:none;"</#if>><a href="javascript:openDeptDiv(${deptId});" class="bjbm">编辑部门</a></div>
             </#if>
             <#if lib.checkOper('20010105')>
             <div class="dd"><a href="javascript:batchAdd_open();" class="pldr">批量导入</a></div>
             </#if>
             <div class="clear"></div>
       </div>
        <form>
           <table  id="mytable">
               <tr>
                  <#-- <th><input type="checkbox" value="" class="chek2"></th> -->
                  <th>员工编号</th>
                  <th>姓名</th> 
                  <th>部门</th>
                  <th>职位</th>
                  <th>状态</th>
                  <th>登录账号</th>
                  <th>电话</th>
                  <th>操作</th>
               </tr>
               <#list page.result as pr>
	               <tr>
	               	  <#-- <td><input type="checkbox" value="" class="chek2"></td> -->
	                  <td>${pr.employeeNumber}</td>
	                  <#if lib.checkOper('20010103') || lib.checkOper('0000')>
	                  	<td><a href="javascript:jumpEmpIndexPage('${pr.employeeNumber}')" class="blue1">${pr.realName}</a></td>
	                  <#else>
	                  	<td>${pr.realName}</td>
	                  </#if>
	                  <td>${pr.deptName}</td>
	                  <td>${pr.postName}</td>
	                  <#if lib.checkOper('20010104') || lib.checkOper('0000')>
		                  <#if pr.disabledFlag ==1 >
		                  	<td>启用</td>
		                  <#else>
		                  	<td>停用</td>
		                  </#if>
	                  </#if>
	                  <td>${pr.email}</td>
	                  <td>${pr.mobile}</td>
	                  <td>
	                     <#if lib.checkOper('20010104') || lib.checkOper('0000')>
	                     	 <a href="${ctx}/manage/emp/edit?employeeNumber=${pr.employeeNumber}" class="icon_01" title="编辑"></a>
		                     <#if pr.disabledFlag ==1 >
		                     	<a href="javascript:disabledEmploye('${pr.employeeNumber}')" class="icon_02" title="停用"></a>
		                     <#else>
		                     	<a href="javascript:enableEmploye('${pr.employeeNumber}')" class="icon_02" title="启用"></a>
		                     </#if>
	                     </#if>
	                     <#if lib.checkOper('20010106') || lib.checkOper('0000')>
	                     	<a href="javascript:showSendPwd('${pr.employeeNumber}','${pr.email}','${pr.mobile}', '${pr.realName}')" class="icon_033" title="重置密码"></a>
            			 </#if>
	                  </td>
	               </tr>
               </#list>
           </table>
        </form>
        <div class="paging">
             ${page.pageHtml}
        </div>
       </div>