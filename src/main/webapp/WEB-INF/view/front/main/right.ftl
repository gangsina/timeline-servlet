<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc.css" rel="stylesheet" media="screen">
<#include "/common/script.ftl">
<script type="text/javascript">
    function exit(){
        if(confirm("确定要退出吗？")){
            window.top.location.href = '${ctx}/webnotauth/logout';
        }
    }
</script>
</head>
<body>
    <div class="main">
	     <div class="right">
	          <div class="welcome">
	               <span>${timeRegion} , <a href="${ctx}/front/emp/personInfo">${emp.realName}</a><i>您上次登录时间：${time}</i></span>
	               <span class="fr">
	                   <!--<a href="#" class="xgzl">修改资料</a>-->
	                   <a href="javascript:exit();" class="off">[退出]</a>
	               </span>
	          </div>
	          <div class="dclsj fl">
	               <div class="tit"><#--<a href="#">MORE 》</a>--><h3>系统提示</h3></div>
	               <ul>
	               	  <#if messageList?? && messageList?size gt 0>
	               	  	<#list messageList as ml>
	               	  		 <li><i>[${ml.type.getMemo()}]</i><a href="${ctx}${ml.type.toUrl}?id=${ml.objectId}">${ml.title}</a> - ${ml.triggerEmp.realName}</li>
	               	  	</#list>
	               	  <#else>
	               	  	 <li>没有提示</li>
	               	  </#if>
	               </ul>
	          </div>
	          <!--<div class="myzt fl">
	               <div class="tit"><a href="#">MORE 》</a><h3>我的主题</h3></div>
	               <ul>
	                  <li><a href="#">· 惊艳！著名网站重新设计的10个经著名网站重新设计的10个经……</a></li>
	                  <li><a href="#">· 帅到没朋友!25个灵感纷呈的HTML5</a> </li>
	                  <li><a href="#">· 惊艳！著名网站重新设计的10个经重新设计的10个经……</a> </li>
	               </ul>
	          </div>-->
	          <div class="ztdt fl">
	               <h3><a href="#">公告</a></h3>
	               <ul>
	                  <li>该栏目下没有内容</li>
	               </ul>
	          </div>
	          <div class="clear"></div>
	          <div class="kqtj">
	               <p>（近三月个人考勤统计）</p>
	              <div class="wdqj fl">
	                   <div class="tit_01"><span>假</span><a href="#">我的请假</a></div>
	                   <ul>
	                      <li><span>[6月]</span><a href="#">0</a>次</li>
	                      <li><span>[5月]</span><a href="#">0</a>次</li>
	                      <li><span>[4月]</span><a href="#">0</a>次</li>
	                   </ul>
	              </div>
	              <div class="wdqj fl">
	                   <div class="tit_02"><span>加</span><a href="#">我的加班</a></div>
	                   <ul>
	                      <li><span>[6月]</span><a href="#">0</a>次</li>
	                      <li><span>[5月]</span><a href="#">0</a>次</li>
	                      <li><span>[4月]</span><a href="#">0</a>次</li>
	                   </ul>
	              </div>
	              <div class="wdqj fl">
	                   <div class="tit_03"><span>勤</span><a href="#">我的考勤</a></div>
	                   <ul>
	                      <li><span>[6月]</span>迟到<a href="#">0</a>次，早退<a href="#">0</a>次</li>
	                      <li><span>[5月]</span>无任何迟到，早退</li>
	                      <li><span>[4月]</span>迟到<a href="#">0</a>次</li>
	                   </ul>
	              </div>
	              <div class="gzjl fl">
	                   <div class="tit_04"><span>记</span><a href="#">我的记录</a></div>
	                   <div class="tab">
	                        <ul class="menu">
	                            <li class="active">周</li>
	                            <li>月</li>
	                            <li>季</li>
	                        </ul>
	                        <div class="con1 con">
	                            <div class="clear"></div>
	                            <ul>	
	                                <li><li><span>[6月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                                <li><li><span>[5月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                                <li><li><span>[4月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                            </ul>
	                        </div>
	                        <div class="con2 con">
	                             <div class="clear"></div>
	                            <ul>	
	                                <li><li><span>[7月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                                <li><li><span>[8月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                                <li><li><span>[9月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                            </ul>
	                        </div>
	                        <div class="con3 con">
	                        <div class="clear"></div>
	                            <ul>	
	                                <li><li><span>[1月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                                <li><li><span>[2月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                                <li><li><span>[3月]</span><a href="#">第一周</a><a href="#">第二周</a><a href="#">第三周</a><a href="#">第四周</a></li></li>
	                            </ul>
	                        </div>
	                    </div>
	
	              </div>
	              <div class="clear"></div>
	          </div>
	     </div>
	     <div class="clear"></div>
	</div>
</body>
</html>