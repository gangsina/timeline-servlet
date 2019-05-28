
<#function checkOper operCode>
	<#assign result = false>
	<#if authService.hasOper(operCode)>
		<#assign result = true>
	</#if>
	<#return result>
</#function>

<#function checkMenu menuCode>
	<#assign result = false>
	<#if authService.hasMenu(menuCode)>
		<#assign result = true>
	</#if>
	<#return result>
</#function>

<#function frontMenuStyle position>
	<#--
	gexx=工作流程  默认
	-->
	<#assign str=['gexx','gexx']>
	<#if position lt str?size>
		<#return str[position]>
	<#else>
		<#return str[0]>
	</#if>
</#function>

<#function manageMenuStyle position>
	<#--
	wdzm=我的桌面   默认
	bmgl=部门管理
	jsgl=职务权限
	zygl=常量管理
	kqgl=？
	-->
	<#assign str=['wdzm','bmgl','jsgl','zygl','kqgl','wzgl']>
	<#if position lt str?size>
		<#return str[position]>
	<#else>
		<#return str[0]>
	</#if>
</#function>