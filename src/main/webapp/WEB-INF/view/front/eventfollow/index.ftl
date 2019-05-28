<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript" src="${ctx}/static/front/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/adminJS.js"></script>
</head>
<body>
   <div class="main">
     <div class="right">
          <div class="title"> 
          	<form id="myform" method="post">
               <h3>我的事件</h3>
               <div class="demo">
                	<select id="auditCategoryId" name="auditFlow.auditCategoryId" style="height: 25px;width: 100px;vertical-align: middle;float:left" onchange="searchForm();">
                		<#--<option value="">--全部--</option>-->
                        	<option value="1" <#if eventType ==1 >selected="selected"</#if>>广告事件</option>
                            <option value="2" <#if eventType ==2 >selected="selected"</#if>>活动事件</option>
                            <option value="3" <#if eventType ==3 >selected="selected"</#if>>媒介事件</option>
                	</select>
               </div>
               <a href="${ctx}/front/eventfollow/add" class="xgtx">新建事件</a>
               <div class="search">
                  <span class="put">
                  <input type="text" name="keywords" id="keywords" value="<#if keywords?? && keywords != ''>${keywords}<#else>请输入关键字</#if>"  onfocus="if (value =='请输入关键字'){value =''}" onblur="if (value ==''){value='请输入关键字'}"  class="put1"/>
                  </span>
                  <span class="but"><button type="button" onclick="searchForm();" class="but1"></button></span>
                </div>
               <div class="clear"></div>
				<input type="hidden" name="eventType" id="eventType" value="${eventType}">
               <input type="hidden" name="pageNum" id="pageNum" value="">
              </form>
          </div>
          <div class="tab1 tab3">

              <div class="list con1">
                      <table>
                         <tr>
							 <th width="15%">时间</th>
                             <th width="15%"><#if eventType ==3>内容<#else>标题</#if></th>
                             <th width="8%">发起人</th>
                             <#if eventType ==3><th width="6%">地址</th></#if>
                             <#if eventType ==3><th width="6%">物业</th></#if>
                             <#if eventType ==3><th width="4%">单价</th></#if>
                             <#if eventType ==3><th width="6%">起止时间</th></#if>
                             <th width="3%">合同来回</th>
                             <#if eventType ==2><th width="3%">活动预算</th></#if>
                             <th width="3%">上级领导</th>
                             <th width="3%">总经理</th>
                             <#if eventType ==3><th width="3%">入库</th></#if>
                             <#if eventType ==3><th width="3%">支付</th></#if>
<#if eventType ==1><th width="3%">上下刊</th></#if>
<#if eventType ==1><th width="3%">营销费用</th></#if>
                             <#if eventType ==2><th width="3%">成本支付</th></#if>
                             <th width="3%">发票</th>
<#if eventType ==1 || eventType ==2><th width="3%">收款</th></#if>
                            <th width="10%">操作</th>
                         </tr>
                        <#if page.result?? && page.result?size gt 0>
	                        <#list page.result as pr>
	                        	<#assign classSet = "" />
	                        	<#if pr_index%2 == 0>
	                        		<#assign classSet = "class='two'" />
	                        	</#if>
		                         <tr>
                                     <td ${classSet}>${pr.createDate?string('yyyy-MM-dd HH:mm:ss')}</td>
		                            <td ${classSet}>[${pr.title}]</td>
                                     <td ${classSet}>${pr.initiator}</td>
                                     <#if eventType ==3><td ${classSet}>${pr.address}</td></#if>
                                     <#if eventType ==3><td ${classSet}>${pr.propertyManagerCompany}</td></#if>
                                     <#if eventType ==3><td ${classSet}>${pr.unitPrice}</td></#if>
                                     <#if eventType ==3><td ${classSet}>${pr.adcUpTime}-${pr.adcDownTime}</td></#if>
                                     <td ${classSet}><#if pr.contractStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
									 <#elseif pr.contractStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									 <#elseif pr.contractStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td>
                                     <#if eventType ==2><td ${classSet}><#if pr.makeCollectionsStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
                                     <#elseif pr.makeCollectionsStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
                                     <#elseif pr.makeCollectionsStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
		                            <td ${classSet}><#if pr.upperStatus == -1>
                                        <img src="${ctx}/static/front/images/moblie/grey.png"/>
									<#elseif pr.upperStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									<#elseif pr.upperStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td>
		                            <td ${classSet}><#if pr.generalManagerStatus == -1>
                                        <img src="${ctx}/static/front/images/moblie/grey.png"/>
									<#elseif pr.generalManagerStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									<#elseif pr.generalManagerStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td>
                                     <#if eventType ==3><td ${classSet}><#if pr.putStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
                                     <#elseif pr.putStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
                                     <#elseif pr.putStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
                                     <#if eventType ==3><td ${classSet}><#if pr.payStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
                                     <#elseif pr.payStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
                                     <#elseif pr.payStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
                                <#if eventType ==1><td ${classSet}><#if pr.adcManagerStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
									 <#elseif pr.adcManagerStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									 <#elseif pr.adcManagerStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
                                <#if eventType ==1><td ${classSet}><#if pr.marketingCostsStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
									 <#elseif pr.marketingCostsStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									 <#elseif pr.marketingCostsStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
                                <#if eventType ==2><td ${classSet}><#if pr.payStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
                                     <#elseif pr.payStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
                                     <#elseif pr.payStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
                                     <td ${classSet}><#if pr.billStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
									 <#elseif pr.billStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									 <#elseif pr.billStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td>
                                <#if eventType ==1 || eventType ==2><td ${classSet}><#if pr.makeCollectionsStatus == -1>
                                         <img src="${ctx}/static/front/images/moblie/grey.png"/>
									 <#elseif pr.makeCollectionsStatus==1><img src="${ctx}/static/front/images/moblie/green.png" />
									 <#elseif pr.makeCollectionsStatus==2><img src="${ctx}/static/front/images/moblie/red.png" /></#if></td></#if>
		                            <td ${classSet}><a href="#" onclick="toView(${pr.id});">查看</a></td>
		                         </tr>
		                     </#list>
	                     <#else>
	                     	    <tr>
		                            <td colspan="11">[<font color="red">没有查询数据</font>]</td>
		                        </tr>
	                     </#if>
                      </table>
                   <div class="paging">
                      ${page.pageHtml}
                   </div>
              </div>
          </div>
          
     
     </div>
     
     <div class="clear"></div>
</div>
<script type="text/javascript">

    function toView(id_) {
        var keywords = $('#keywords').val();
        var eventType = $('#eventType').val();
//        alert(id_);
        window.location.href="${ctx}/front/eventfollow/view?id="+id_+"&eventType="+eventType+"&keywords="+keywords;
    }

	function jumpPage(p){
		$('#pageNum').val(p);
		searchForm();
	}
	
	function searchForm(){
		var keywords = $('#keywords').val();
		if($.trim(keywords) == '请输入关键字'){
			 $('#keywords').val('');
		}
        var checkText=$("#auditCategoryId").find("option:selected").val();
        $("#eventType").val(checkText);
        alert(checkText+"/"+keywords);
		$('#myform').attr('action','${ctx}/front/eventfollow/index?eventType='+checkText+"&keywords="+keywords);
		$('#myform').submit();
	}
	
	function statusSearch(s){
		if(s == 0){
			s = '';
		}
		$('#status').val(s);
		searchForm();
	}
</script>
</body>
</html>