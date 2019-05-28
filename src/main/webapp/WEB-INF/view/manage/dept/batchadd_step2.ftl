	  <div class="tcBG"></div>
      <div class="sxbkq">
           <h3>批量导入</h3>
           <div class="img"><img src="${ctx}/static/manage/images/pl_02.png" width="763" height="62" /></div>
           <div class="step_01">
               <div class="tit_01">确认信息</div>
               <p>
               	${confirmMessage}
               </p>
               <div class="shibai">
                  <span>1.必填内容为空</span>
                  <span>2.输入内容非法，过长等</span>
                  <span>3.EMAIL,手机号码等格式错误</span>
                  <span>4.员工工号和邮件地址与库中的数据同时匹配才可修改数据</span>
                  <span>5.同个文件中员工编号不可重复</span>
                  <span>6.同个文件中邮件不可重复</span>
                  <span>7.同个文件中手机号码不可重复</span>
               </div>
               <div class="biag">
                  <table>
                    <tr>
                      <th>序号</th>
                      <th>员工编号</th>
                      <th>姓名</th>
                      <th>部门</th>
                      <th>职位</th>
                      <th>邮件地址</th>
                      <th>电话</th>
                    </tr>
                    <#if resTag = "1">
                     <#list batchList as list>
	                    <tr>
	                      <td>${list_index + 1}</td>
	                      <td>
	                      	${list.employeeNumber}
	                      	<#if list.employeeNumberMessage?exists>
	                      		<i class="cuowu" title="${list.employeeNumberMessage}"></i>
	                      	</#if>
	                      </td>
	                      <td>${list.realName}
	                      	<#if list.realNameMessage?exists>
	                      		<i class="cuowu" title="${list.realNameMessage}"></i>
	                      	</#if></td>
	                      <td>${list.departmentName}
	                      	<#if list.departmentNameMessage?exists>
	                      		<i class="cuowu" title="${list.departmentNameMessage}"></i>
	                      	</#if></td>
	                      <td>${list.roleName}
	                      	<#if list.roleNameMessage?exists>
	                      	    <i class="cuowu" title="${list.roleNameMessage}"></i>
	                      	</#if></td>
	                      <td>${list.email}
	                      	<#if list.emailMessage?exists>
	                      	    <i class="cuowu" title="${list.emailMessage}"></i>
	                      	</#if></td>
	                      <td>${list.mobile}
	                      	<#if list.mobileMessage?exists>
	                      	    <i class="cuowu" title="${list.mobileMessage}"></i>
	                      	</#if></td>
	                    </tr>
                      </#list>
                     </#if>
                  </table>
               </div>
           </div>
           <div class="btn">
                <input type="button" onclick="javascript:batchAdd_open();" name="" value="上一步" class="but2" />
                <#if resTag = "1">
               	 <input type="button" id="btn_batchAdd_step3" onclick="javascript:batchAdd_step3();" name="" value="下一步" class="but1" />
                </#if>
                <input type="button" onclick="javascript:confirmLeave('您确定取消操作？');" name="" value="取消" class="but1" />
           </div>
      </div>
      
      <div style="display:none">
      	<input type="hidden" id="batchNumber" name="batchNumber" value="${batchNumber}" />
      	<input type="hidden" id="errorCount" value="${errorCount}" />
      	<input type="hidden" id="rightCount"  name="rightCount" value="${rightCount}" />
      	<input type="hidden" id="batchAddFilePath2" name="batchAddFilePath2" value="${batchAddFilePath2}">
      </div>
      
      
      
      <script>
      	$(function(){
      		$(".cuowu").click(function(){
      			alert($(this).attr("title"));
      		})
      	})
      </script>