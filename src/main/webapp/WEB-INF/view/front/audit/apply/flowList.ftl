
<#list categoryList as cl>
   <tr>
      <td class="name2">${cl.categoryName}：</td>
      <td>
      <#assign isHas = false>
      <#list cl.flowList as cf>
      	<#if cf.disableFlag?? && cf.disableFlag == 1>
      		<#assign isHas = true>
      		<a href="javascript:void(0);" onclick="selectFlow(${cf.id})">【${cf.flowName}】</a>
      	</#if>
      </#list>
      <#if !isHas>
      	该类型下暂无可用流程
      </#if>
      </td>  
   </tr>
 </#list>