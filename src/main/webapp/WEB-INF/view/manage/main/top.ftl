<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亿我内外后台界面</title>
<link type="text/css" href="${ctx}/static/manage/css/base.css" rel="stylesheet">
<link type="text/css" href="${ctx}/static/manage/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/static/manage/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">

    function exit(){
        if(confirm("确定要退出吗？")){
            window.top.location.href = '${ctx}/webnotauth/logout';
        }
    }
    
</script>
</head>
<body>
<div class="top">
     <div class="top_01">
          <div class="logo">${company.systemName?if_exists}</div>
          <#--
          <div class="rt_info">
               <div class="wlc"><span>Andmin</span>，欢迎您进入后台</div>
               <div class="xiaoxi">
                    <span>0</span>
               </div>
               <ul>
                  <li><a href="#" class="sz">设置</a></li>
                  <li><a href="#" class="gw">个人中心</a></li>
                  <li><a href="javascript:exit();" class="tc">退出</a></li>
               </ul>
              
          </div>
          -->
          <div class="clear"></div>
     </div>
     <div class="top_02">
          <div style="width:197px;float:left;height:50px">
          <#--
                  <span class="put" style="display:none">
                  <input type="text" name="name" value="请输入关键字"  onfocus="if (value =='请输入关键字'){value =''}" onblur="if (value ==''){value='请输入关键字'}"  class="put1"/>
                  </span>
                  <span class="but" style="display:none"><button type="button" class="but1"></button></span>
                  -->
          </div>
          <div class="title" id="topNavTitle">
              	桌面
          </div>
     </div>
</div>
</body>
</html>