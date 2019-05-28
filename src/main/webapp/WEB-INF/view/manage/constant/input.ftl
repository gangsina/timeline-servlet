  <div class="tcBG" style="width:433px;height:350px"></div>
     <div class="xzjs xzjs1" style="width:433px;height:350px">
          <h3 style="width:433px">
     	<#if constant.id?? && constant.id gt 0>
     	编辑常量
     	<#else>
     	添加常量
     	</#if>     
          </h3>
          <div class="xzglBx xzzy" style="width:407px;height:195px">
			<form id="myform">
				<input type="hidden" name="id" value="${constant.id!'-1'}" id="id" />
			   <table>
			       <tr>
			          <td class="name"><strong>* </strong>所属类别：</td>
			          <td >
			          	<select id="classTypeSelect" onchange="autoClassType();" style="width:127px;height:27px">
				        	<#if classTypeList?? && classTypeList?size gt 0>
				        		<option value="">已有类别</option>
				        		<#list classTypeList as ct>
				        			<option value="${ct}">${ct}</option>
				        		</#list>
				        	<#else>
				        		<option value="${classType}">选择常量类别</option>
				        	</#if>
				        </select>
			          <input class="put validate[required,maxSize[50]]" name="classType" id="inputClassType" value="${constant.classType!''}"/>
			          </td>
			       </tr>
			       <tr>
			          <td class="name">常量描述：</td>
			          <td ><input type="text" name="memo" id="memo" value="${constant.memo!''}" style="width:300px"  class="put validate[required,maxSize[100]]" />
			          </td>
			       </tr>
			       <#if !(constant??) || !(constant.id??)>
			         <tr>
			          <td class="name">常量Key：</td>
			          <td ><input type="text" name="key" id="key" value="${constant.key!''}" style="width:300px" class="put validate[required,maxSize[50]]" />
			          </td>
			       </tr>
			       </#if>
			         <tr>
			          <td class="name">常量Value：</td>
			          <td ><input type="text" name="value" id="value" value="${constant.value!''}" style="width:300px" class="put validate[required,maxSize[200]]" />
			          </td>
			       </tr>
			   </table>
			  </form>
  		</div>
      <div class="buttom"><button type="button" class="but1" onclick="formSubmit();">保存</button><button onclick="$.unblockUI();" type="button" class="but2" >取消</button></div>
 </div>