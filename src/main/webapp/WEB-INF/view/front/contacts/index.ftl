<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>花名册</title>
<link type="text/css" href="${ctx}/static/front/css/base-pc-hmc.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="${ctx}/static/front/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/static/front/js/pc.js"></script>


<script type="text/javascript">
//瀑布流
window.onload = function(){
	//运行瀑布流主函数
	PBL('wrap','box');
	
	$('.close_btn').click(function () {
                $.unblockUI({
                    message: $('#hmcBOX')
                });
            });
	
	//数据
	var data;
	var pageNum = $("#pageNum").val();
	var isShowAll = false;//是否加载完
	
	//设置滚动加载
	window.onscroll = function(){
		//校验数据请求
		var arr = $(".box");
		var totalCount = $("#totalCount").val();
		//alert(arr.length+"::"+totalCount+(arr.length==totalCount));
		if(getCheck() && (arr.length!=totalCount)){
		//alert('111');
			var wrap = document.getElementById('wrap');
			pageNum ++ ;
			$.ajax({
				url:'${ctx}/webnotauth/contacts/showmore',
				dataType:'json',
				data:{'pageNum':pageNum},
				type:'post',
				async:false,
				success:function(response){
					//alert(response[0].realName);
					data = response;
					if(data == null || data.length ==0){
						isShowAll = true;
					}
				},error:function(response){
					alert("提交失败!");
					//location.reload();
				}
			});
			
			for(i in data){
				//创建box
				//var box = document.createElement('div');
				//box.className = 'box';
				//wrap.appendChild(box);
				////创建info
				//var info = document.createElement('div');
				//info.className = 'info';
				//box.appendChild(info);
				////创建pic
				//var pic = document.createElement('div');
				//pic.className = 'pic';
				//info.appendChild(pic);
				////创建img
				//var img = document.createElement('img');
				//img.src = 'images/'+data[i].src;
				//img.style.height = 'auto';
				//pic.appendChild(img);
				////创建title
				//var title = document.createElement('div');
				//title.className = 'title';
				//info.appendChild(title);
				////创建a标记
				//var a = document.createElement('a');
				//a.innerHTML = data[i].title;
			    //title.appendChild(a);
			    var html = "<div class=\"box\"><div class=\"info\"><div class=\"picc\" onclick='getInfo("+data[i].id+");'>";
			    if(data[i].avatorAttachmentId != 0 && data[i].avatorAttachmentId != null){
			    	html +="<img src=\"${ctx}/webnotauth/contacts/read?id=" + data[i].avatorAttachmentId + "\">";
			    }else{
			    	html +='<img src="${ctx}/static/manage/images/zpBg.png" width="100%" />';
			    }
			    html += '</div>';
			    var deptName = data[i].deptName;
			    var postName = data[i].postName;
			    var sourceStr = deptName+ '-' + postName;
			    if(postName.length>6){
			    	postName = postName.substring(0,5)+"...";
			    }
			    var showStr = deptName + '-' + postName;
			    html += "<div class=\"title\"><h3 title='"+sourceStr+"'>【"+showStr+"】"+ data[i].realName + "  </h3><p><strong>爱好：</strong>" + data[i].hobby + "</p>" +
               " <div class=\"nub\">联系方式：" + data[i].mobile + "</div></div></div></div>";
			    $("#wrap").append(html);
			}
			PBL('wrap','box');
		}
	}
}

function query(){
	var condition = $("#condition").val();
	if(condition == null || condition == '' || condition == '手机号码/名字/分机号'){
		location.reload();
	}else{
	$.ajax({
				url:'${ctx}/webnotauth/contacts/showinfobycondition',
				dataType:'json',
				data:{'condition':condition},
				type:'post',
				success:function(data){
					var queryHtml = '';
					for(i in data){
						queryHtml += '<div class="box">';
				        queryHtml += '           <div class="info">';
				        queryHtml += '<div class="picc" onclick="getInfo('+data[i].id+');">';
				        if(data[i].avatorAttachmentId != 0 && data[i].avatorAttachmentId != null){
				        	queryHtml += '<img src="${ctx}/webnotauth/contacts/read?id='+data[i].avatorAttachmentId+'" width="100%" />';
				        }else{
				        	queryHtml += '<img src="${ctx}/static/manage/images/zpBg.png" width="100%" />';
				        }
				        queryHtml += '               </div>';
				        queryHtml += '              <div class="title">';
				        queryHtml += ' <h3>【'+data[i].deptName+'-'+data[i].postName+'】'+data[i].realName+'</h3>';
				        queryHtml += '<p><strong>爱好：</strong>'+data[i].hobby+'</p>';
				        queryHtml += '<div class="nub">联系方式：'+data[i].mobile+'</div>';
				        queryHtml += '                </div>';
				        queryHtml += '            </div>';
				        queryHtml += '        </div>';
	                     	   
	               }
	               if(data == null || data.length == 0 || data == '' ){
		             $("#queryDiv").show();
		             $("#wrap").hide();
		             return;
	               }else{
		               $("#wrap").html(queryHtml);
		               $("#wrap").show();
		               $("#queryDiv").hide();
	               }
				},error:function(response){
					alert("查询失败!");
					//location.reload();
				}
			});
	}
	
}

function getInfo(id){
	$.ajax({
				url:'${ctx}/webnotauth/contacts/showinfobyid',
				dataType:'json',
				data:{'id':id},
				type:'post',
				success:function(data){
					var hmcLeftHtml = '<div class="hmc_tx">';
					if(data.avatorAttachmentId != 0 && data.avatorAttachmentId != null){
				    	hmcLeftHtml += '<img src="${ctx}/webnotauth/contacts/read?id='+data.avatorAttachmentId+'" width="214" height="219" />';
				    }else{
				    	hmcLeftHtml +='<img src="${ctx}/static/manage/images/zpBg.png" width="100%" />';
				    }
				    var deptName = data.deptName;
				    var postName = data.postName;
				    var sourceStr = deptName+ '-' + postName;
				    if(postName.length>6){
				    	postName = postName.substring(0,5)+"...";
				    }
				    var showStr = deptName + '-' + postName;
                    hmcLeftHtml += '<p><span>'+data.realName+'</span><span title="'+sourceStr+'">('+showStr+')</span></p>';
               		hmcLeftHtml += '</div>';
              		hmcLeftHtml += ' <div class="youx">';
                    hmcLeftHtml += '<span>'+data.email+'</span>';
                    hmcLeftHtml += '<p>'+data.mobile+'</p>';
               		hmcLeftHtml += '</div>';
               		$("#hmcLFDiv").html(hmcLeftHtml);
               		
               		
               		var hmcRightHtml = '<div class="jbxx">';
                    hmcRightHtml += '<h3>'+data.realName+'</h3>';
                    hmcRightHtml += '<form>';
                    hmcRightHtml += '<table>';
                    hmcRightHtml += '<tr>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">工号:</span>';
                    hmcRightHtml += '<span class="nr">'+data.employeeNumber+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">性别:</span>';
                    hmcRightHtml += '<span class="nr">';
                    if(data.sex == 1){
                    	hmcRightHtml += '男';
                    }else if(data.sex == 2){
                    	hmcRightHtml += '女';
                    }
                    hmcRightHtml += '</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '</tr>';
                    hmcRightHtml += '<tr>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">出生年月:</span>';
                    hmcRightHtml += '<span class="nr">'+data.birthDateStr+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">所在部门：</span>';
                    hmcRightHtml += '<span class="nr">'+data.deptName+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '</tr>';
                    hmcRightHtml += '<tr>  ';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">出生地：</span>';
                    var accountAddress = data.accountAddress;
                    if(accountAddress.length > 22){
                    	accountAddress = accountAddress.substring(0,22)+"...";
                    }
                    hmcRightHtml += '<span class="nr" title="'+data.accountAddress+'">'+accountAddress+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">岗位：</span>';
                    var postName = data.postName;
                    if(postName.length > 15){
                    	postName = postName.substring(0,15)+"...";
                    }
                    hmcRightHtml += '<span class="nr" title="'+data.postName+'">'+postName+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '</tr>';
                    hmcRightHtml += '<tr>  ';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">现住地址：</span>';
                    var address = data.address;
                    if(address.length > 22){
                    	address = address.substring(0,22)+"...";
                    }
                    hmcRightHtml += '<span class="nr" title="'+data.address+'">'+address+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">入职时间：</span>';
                    hmcRightHtml += '<span class="nr">'+data.joinDateStr+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '</tr>';
                    hmcRightHtml += '<tr>  ';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">联系电话：</span>';
                    hmcRightHtml += '<span class="nr">'+data.mobile+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '           <div class="xx">';
                    hmcRightHtml += '              <span class="name_01">QQ：</span>';
                    hmcRightHtml += '              <span class="nr">'+data.qq+'</span>';
                    hmcRightHtml += '           </div>';
                    hmcRightHtml += '        </td>';
                    hmcRightHtml += '     </tr>';
                    hmcRightHtml += '<tr>';
                    hmcRightHtml += '<td>';
                    hmcRightHtml += '<div class="xx">';
                    hmcRightHtml += '<span class="name_01">分机号:</span>';
                    hmcRightHtml += '<span class="nr">'+data.landlineNumber+'</span>';
                    hmcRightHtml += '</div>';
                    hmcRightHtml += '</td>';
                    hmcRightHtml += '</tr>';
                    
                    hmcRightHtml += ' </table>';
                    hmcRightHtml += '</form>';
                    hmcRightHtml += '<div class="xqah" style="margin-top:20px">';
                    hmcRightHtml += '    <h3>兴趣爱好</h3>';
                    hmcRightHtml += '    <div class="xqah_nr">';
                    var hobby = data.hobby;
                    if(hobby.length > 200){
                    	hobby = hobby.substring(0,200)+"...";
                    }
                    hmcRightHtml += '         <span title="'+data.hobby+'">'+hobby+'</span>';
                    hmcRightHtml += '    </div>';
                    hmcRightHtml += '</div>      ';    
                    hmcRightHtml += '</div>';
                    $("#hmcRTDiv").html(hmcRightHtml);
                    $.blockUI({
	                    message: $('#hmcBOX')
	                });
				},error:function(response){
					alert("提交失败!");
				}
			});
}



/**
* 瀑布流主函数
* @param  wrap	[Str] 外层元素的ID
* @param  box 	[Str] 每一个box的类名
*/
function PBL(wrap,box){
	//	1.获得外层以及每一个box
	var wrap = document.getElementById(wrap);
	var boxs  = getClass(wrap,box);
	//	2.获得屏幕可显示的列数
	var boxW = boxs[0].offsetWidth;
	var colsNum = Math.floor(1400/boxW);
	wrap.style.width = boxW*colsNum+'px';//为外层赋值宽度
	//	3.循环出所有的box并按照瀑布流排列
	var everyH = [];//定义一个数组存储每一列的高度
	for (var i = 0; i < boxs.length; i++) {
		if(i<colsNum){
			everyH[i] = boxs[i].offsetHeight;
		}else{
			var minH = Math.min.apply(null,everyH);//获得最小的列的高度
			var minIndex = getIndex(minH,everyH); //获得最小列的索引
			getStyle(boxs[i],minH,boxs[minIndex].offsetLeft,i);
			everyH[minIndex] += boxs[i].offsetHeight;//更新最小列的高度
		}
	}
}
/**
* 获取类元素
* @param  warp		[Obj] 外层
* @param  className	[Str] 类名
*/
function getClass(wrap,className){
	var obj = wrap.getElementsByTagName('*');
	var arr = [];
	for(var i=0;i<obj.length;i++){
		if(obj[i].className == className){
			arr.push(obj[i]);
		}
		
	}
	var boxSize = arr.length;
	return arr;
}
/**
* 获取最小列的索引
* @param  minH	 [Num] 最小高度
* @param  everyH [Arr] 所有列高度的数组
*/
function getIndex(minH,everyH){
	for(index in everyH){
		if (everyH[index] == minH ) return index;
	}
}
/**
* 数据请求检验
*/
function getCheck(){
	var documentH = document.documentElement.clientHeight;
	var scrollH = document.documentElement.scrollTop || document.body.scrollTop;
	return documentH+scrollH>=getLastH() ?true:false;
}
/**
* 获得最后一个box所在列的高度
*/
function getLastH(){
	var wrap = document.getElementById('wrap');
	var boxs = getClass(wrap,'box');
	return boxs[boxs.length-1].offsetTop+boxs[boxs.length-1].offsetHeight;
}
/**
* 设置加载样式
* @param  box 	[obj] 设置的Box
* @param  top 	[Num] box的top值
* @param  left 	[Num] box的left值
* @param  index [Num] box的第几个
*/
var getStartNum = 0;//设置请求加载的条数的位置
function getStyle(box,top,left,index){
    if (getStartNum>=index) return;
    $(box).css({
    	'position':'absolute',
        'top':top,
        "left":left,
        "opacity":"0"
    });
    $(box).stop().animate({
        "opacity":"1"
    },999);
    getStartNum = index;//更新请求数据的条数位置
}

</script>
</head>
<body>
<div class="toper">
    <div class="top">
         <div class="gray"></div>
         <div class="balck">
                <!--<div class="exit">
                    <a href="#"><img src="${ctx}/static/front/images/exit-01.png" width="58" height="24" /></a>
                    <div class="tck_02" style="display:none">
                            <div class="sanj"></div>
                            <ul>
                               <li><a href="#" rel="" title=""><i>go></i>亿我拍官网</a></li>
                               <li><a href="#" rel="" title=""><i>go></i>代理商入口</a></li>
                               <li><a href="#" rel="" title=""><i>go></i>商户入口</a></li>
                               <li style=" border:none"><a href="#" rel="" title=""><i>go></i>亿我内外</a></li>
                            </ul>
                    </div>
                </div>-->
                <div style="width: 105px;
height: 24px;
float: right;
text-align: center;
line-height: 24px;
background: #2fa3d4;
font-size: 16px;">
<a href="${ctx}/front/main/index" style="color:#fff;">首&nbsp;页</a>
                </div>
         </div>
    </div>
</div>
<div class="main">
     <div class="main_01">
           <div class="tit_05">
                <DIV class="hmc_bg2"><img src="${ctx}/static/front/images/hmcBG2.png" width="15" height="32" /></DIV>
                <!--<div class="fhsy"><a href="${ctx}/front/main/index"><img src="${ctx}/static/front/images/fhsy.png" width="28" height="103" /></a></div>-->
                <h3>花名册</h3> 
                <div class="search">
                  <span class="put"><input id="condition" type="text" name="condition" value="手机号码/名字/分机号"  onfocus="if (value =='手机号码/名字/分机号'){value =''}" onblur="if (value ==''){value='手机号码/名字/分机号'}"  class="put1"/></span>
                  <span class="but"><button type="button" class="but1" onclick="query();"></button></span>
                </div>
               <div class="clear"></div>
           </div>
           <input id="pageNum" value="${pageNo}" type="hidden"/>
           <input id="totalCount" value="${totalCount}" type="hidden"/>
           <div id="queryDiv" style="height:100px;display:none;">
           		<tr>
	                <td colspan="5">[<font color="red">没有查询到数据</font>]</td>
	            </tr>
           </div>
           <div id="wrap">
           		<#if page.result?? && page.result?size gt 0>
	                        <#list page.result as pr>
	                        	<div class="box">
				                    <div class="info">
				                        <div class="picc" onclick="getInfo(${pr.id});">
				                        <#if pr.avatorAttachmentId != 0 && pr.avatorAttachmentId != null>
					                    	<img src="${ctx}/webnotauth/contacts/read?id=${pr.avatorAttachmentId}" width="100%" />
					                    <#else>
					                    	<img src="${ctx}/static/manage/images/zpBg.png" width="100%" />
					                    </#if>
				                        </div>
				                        <div class="title">
				                             <h3>【${pr.deptName}-${pr.postName}】${pr.realName}  </h3>
				                             <p><strong>爱好：</strong>${pr.hobby}</p>
				                             <div class="nub">联系方式：${pr.mobile}</div>
				                        </div>
				                    </div>
				                </div>
		                     </#list>
	                     <#else>
	                     	    <tr>
		                            <td colspan="5">[<font color="red">没有查询到数据</font>]</td>
		                        </tr>
	                     </#if>
                
	</div> 
          <div class="clear"></div>
     </div>
</div>
<div class="toTop" id="roll_top"><img src="${ctx}/static/front/images/BackTop.png" width="30" height="16" /></div>
<div id="hmcBOX" style="display:none">
     <div class="hmcbg">
          <a class="close_btn" title="关闭"></a>
          <div class="hmcLF" id="hmcLFDiv">
               <div class="hmc_tx">
                    <img src="${ctx}/static/front/images/24.png" width="214" height="219" />
                    <p><span>安娜</span>(开发部-UI)</p>
               </div>
               <div class="youx">
                     <span>2589566@qq.com</span>
                     <p>15267452556</p>
               </div>
          </div>
          <div class="hmcRT"  id="hmcRTDiv">
               <div class="jbxx">
                   <h3>安娜<i>（娜娜）</i></h3>
                   <form>
                     <table>
                         <tr>
                            <td>
                               <div class="xx">
                                  <span class="name_01">性别:</span>
                                  <span class="nr">女</span>
                               </div>
                            </td>
                            <td>
                                <div class="xx">
                                  <span class="name_01">出生年月:</span>
                                  <span class="nr">1993.6.8</span>
                               </div>
                            </td>
                         </tr>
                         <tr>
                            
                            <td>
                                <div class="xx">
                                  <span class="name_01">所在部门：</span>
                                  <span class="nr">开发部</span>
                               </div>
                            </td>
                            <td>
                               <div class="xx">
                                  <span class="name_01">出生地：</span>
                                  <span class="nr">杭州</span>
                               </div>
                            </td>
                         </tr>
                         <tr>  
                            <td>
                                <div class="xx">
                                  <span class="name_01">岗位——：</span>
                                  <span class="nr">UI设计师</span>
                               </div>
                            </td>
                            <td>
                               <div class="xx">
                                  <span class="name_01">现住地址：</span>
                                  <span class="nr">西湖区翠苑一区A幢18楼</span>
                               </div>
                            </td>
                         </tr>
                         <tr>  
                            <td>
                                <div class="xx">
                                  <span class="name_01">入职时间：</span>
                                  <span class="nr">2014.5.9</span>
                               </div>
                            </td>
                            <td>
                               <div class="xx">
                                  <span class="name_01">联系电话：</span>
                                  <span class="nr">152685426538</span>
                                  
                               </div>
                               
                            </td>
                         </tr>
                         <tr>  
                            <td>
                                <div class="xx">
                                  <span class="name_01">我的团队：</span>
                                  <span class="nr">10 个</span>
                               </div>
                            </td>
                            <td>
                               <div class="xx">
                                  <span class="name_01">QQ：</span>
                                  <span class="nr">258956996</span>
                               </div>
    
                            </td>
                         </tr>
                     </table>
                   </form>
                   <div class="xqah" style="margin-top:20px">
                        <h3>兴趣爱好</h3>
                        <div class="xqah_nr">
                             <span>爱好旅游,象棋,游泳,特长是乒乓球 兴趣爱好: 看书,唱歌,跑步</span>
                        </div>
                   </div>          
              </div>
          </div>
     </div>
</div>
</body>
</html>

<script type="text/javascript">
/*!
 * jQuery blockUI plugin
 * Version 2.70.0-2014.11.23
 * Requires jQuery v1.7 or later
 *
 * Examples at: http://malsup.com/jquery/block/
 * Copyright (c) 2007-2013 M. Alsup
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Thanks to Amir-Hossein Sobhi for some excellent contributions!
 */

;(function() {
/*jshint eqeqeq:false curly:false latedef:false */
"use strict";

	function setup($) {
		$.fn._fadeIn = $.fn.fadeIn;

		var noOp = $.noop || function() {};

		// this bit is to ensure we don't call setExpression when we shouldn't (with extra muscle to handle
		// confusing userAgent strings on Vista)
		var msie = /MSIE/.test(navigator.userAgent);
		var ie6  = /MSIE 6.0/.test(navigator.userAgent) && ! /MSIE 8.0/.test(navigator.userAgent);
		var mode = document.documentMode || 0;
		var setExpr = $.isFunction( document.createElement('div').style.setExpression );

		// global $ methods for blocking/unblocking the entire page
		$.blockUI   = function(opts) { install(window, opts); };
		$.unblockUI = function(opts) { remove(window, opts); };

		// convenience method for quick growl-like notifications  (http://www.google.com/search?q=growl)
		$.growlUI = function(title, message, timeout, onClose) {
			var $m = $('<div class="growlUI"></div>');
			if (title) $m.append('<h1>'+title+'</h1>');
			if (message) $m.append('<h2>'+message+'</h2>');
			if (timeout === undefined) timeout = 3000;

			// Added by konapun: Set timeout to 30 seconds if this growl is moused over, like normal toast notifications
			var callBlock = function(opts) {
				opts = opts || {};

				$.blockUI({
					message: $m,
					fadeIn : typeof opts.fadeIn  !== 'undefined' ? opts.fadeIn  : 700,
					fadeOut: typeof opts.fadeOut !== 'undefined' ? opts.fadeOut : 1000,
					timeout: typeof opts.timeout !== 'undefined' ? opts.timeout : timeout,
					centerY: false,
					showOverlay: false,
					onUnblock: onClose,
					css: $.blockUI.defaults.growlCSS
				});
			};

			callBlock();
			var nonmousedOpacity = $m.css('opacity');
			$m.mouseover(function() {
				callBlock({
					fadeIn: 0,
					timeout: 30000
				});

				var displayBlock = $('.blockMsg');
				displayBlock.stop(); // cancel fadeout if it has started
				displayBlock.fadeTo(300, 1); // make it easier to read the message by removing transparency
			}).mouseout(function() {
				$('.blockMsg').fadeOut(1000);
			});
			// End konapun additions
		};

		// plugin method for blocking element content
		$.fn.block = function(opts) {
			if ( this[0] === window ) {
				$.blockUI( opts );
				return this;
			}
			var fullOpts = $.extend({}, $.blockUI.defaults, opts || {});
			this.each(function() {
				var $el = $(this);
				if (fullOpts.ignoreIfBlocked && $el.data('blockUI.isBlocked'))
					return;
				$el.unblock({ fadeOut: 0 });
			});

			return this.each(function() {
				if ($.css(this,'position') == 'static') {
					this.style.position = 'relative';
					$(this).data('blockUI.static', true);
				}
				this.style.zoom = 1; // force 'hasLayout' in ie
				install(this, opts);
			});
		};

		// plugin method for unblocking element content
		$.fn.unblock = function(opts) {
			if ( this[0] === window ) {
				$.unblockUI( opts );
				return this;
			}
			return this.each(function() {
				remove(this, opts);
			});
		};

		$.blockUI.version = 2.70; // 2nd generation blocking at no extra cost!

		// override these in your code to change the default behavior and style
		$.blockUI.defaults = {
			// message displayed when blocking (use null for no message)
			message:  '<h1>Please wait...</h1>',

			title: null,		// title string; only used when theme == true
			draggable: true,	// only used when theme == true (requires jquery-ui.js to be loaded)

			theme: false, // set to true to use with jQuery UI themes

			// styles for the message when blocking; if you wish to disable
			// these and use an external stylesheet then do this in your code:
			// $.blockUI.defaults.css = {};
			css: {
				padding:	0,
				margin:		0,
				width:		'30%',
				height:		'5%',
				top:		'50%',
				left:		'30%',
				textAlign:	'center',
				color:		'#000',
				border:		'3px solid #aaa',
				backgroundColor:'#fff'
				//cursor:		'wait'
			},

			// minimal style set used when themes are used
			themedCSS: {
				width:	'30%',
				top:	'40%',
				left:	'40%'
			},

			// styles for the overlay
			overlayCSS:  {
				backgroundColor:	'#000',
				opacity:			0.6,
				cursor:				'wait'
			},

			// style to replace wait cursor before unblocking to correct issue
			// of lingering wait cursor
			cursorReset: 'default',

			// styles applied when using $.growlUI
			growlCSS: {
				width:		'350px',
				top:		'10px',
				left:		'',
				right:		'10px',
				border:		'none',
				padding:	'5px',
				opacity:	0.6,
				cursor:		'default',
				color:		'#fff',
				backgroundColor: '#000',
				'-webkit-border-radius':'10px',
				'-moz-border-radius':	'10px',
				'border-radius':		'10px'
			},

			// IE issues: 'about:blank' fails on HTTPS and javascript:false is s-l-o-w
			// (hat tip to Jorge H. N. de Vasconcelos)
			/*jshint scripturl:true */
			iframeSrc: /^https/i.test(window.location.href || '') ? 'javascript:false' : 'about:blank',

			// force usage of iframe in non-IE browsers (handy for blocking applets)
			forceIframe: false,

			// z-index for the blocking overlay
			baseZ: 1000,

			// set these to true to have the message automatically centered
			centerX: true, // <-- only effects element blocking (page block controlled via css above)
			centerY: true,

			// allow body element to be stetched in ie6; this makes blocking look better
			// on "short" pages.  disable if you wish to prevent changes to the body height
			allowBodyStretch: true,

			// enable if you want key and mouse events to be disabled for content that is blocked
			bindEvents: true,

			// be default blockUI will supress tab navigation from leaving blocking content
			// (if bindEvents is true)
			constrainTabKey: true,

			// fadeIn time in millis; set to 0 to disable fadeIn on block
			fadeIn:  200,

			// fadeOut time in millis; set to 0 to disable fadeOut on unblock
			fadeOut:  400,

			// time in millis to wait before auto-unblocking; set to 0 to disable auto-unblock
			timeout: 0,

			// disable if you don't want to show the overlay
			showOverlay: true,

			// if true, focus will be placed in the first available input field when
			// page blocking
			focusInput: true,

            // elements that can receive focus
            focusableElements: ':input:enabled:visible',

			// suppresses the use of overlay styles on FF/Linux (due to performance issues with opacity)
			// no longer needed in 2012
			// applyPlatformOpacityRules: true,

			// callback method invoked when fadeIn has completed and blocking message is visible
			onBlock: null,

			// callback method invoked when unblocking has completed; the callback is
			// passed the element that has been unblocked (which is the window object for page
			// blocks) and the options that were passed to the unblock call:
			//	onUnblock(element, options)
			onUnblock: null,

			// callback method invoked when the overlay area is clicked.
			// setting this will turn the cursor to a pointer, otherwise cursor defined in overlayCss will be used.
			onOverlayClick: null,

			// don't ask; if you really must know: http://groups.google.com/group/jquery-en/browse_thread/thread/36640a8730503595/2f6a79a77a78e493#2f6a79a77a78e493
			quirksmodeOffsetHack: 4,

			// class name of the message block
			blockMsgClass: 'blockMsg',

			// if it is already blocked, then ignore it (don't unblock and reblock)
			ignoreIfBlocked: false
		};

		// private data and functions follow...

		var pageBlock = null;
		var pageBlockEls = [];

		function install(el, opts) {
			var css, themedCSS;
			var full = (el == window);
			var msg = (opts && opts.message !== undefined ? opts.message : undefined);
			opts = $.extend({}, $.blockUI.defaults, opts || {});

			if (opts.ignoreIfBlocked && $(el).data('blockUI.isBlocked'))
				return;

			opts.overlayCSS = $.extend({}, $.blockUI.defaults.overlayCSS, opts.overlayCSS || {});
			css = $.extend({}, $.blockUI.defaults.css, opts.css || {});
			if (opts.onOverlayClick)
				opts.overlayCSS.cursor = 'pointer';

			themedCSS = $.extend({}, $.blockUI.defaults.themedCSS, opts.themedCSS || {});
			msg = msg === undefined ? opts.message : msg;

			// remove the current block (if there is one)
			if (full && pageBlock)
				remove(window, {fadeOut:0});

			// if an existing element is being used as the blocking content then we capture
			// its current place in the DOM (and current display style) so we can restore
			// it when we unblock
			if (msg && typeof msg != 'string' && (msg.parentNode || msg.jquery)) {
				var node = msg.jquery ? msg[0] : msg;
				var data = {};
				$(el).data('blockUI.history', data);
				data.el = node;
				data.parent = node.parentNode;
				data.display = node.style.display;
				data.position = node.style.position;
				if (data.parent)
					data.parent.removeChild(node);
			}

			$(el).data('blockUI.onUnblock', opts.onUnblock);
			var z = opts.baseZ;

			// blockUI uses 3 layers for blocking, for simplicity they are all used on every platform;
			// layer1 is the iframe layer which is used to supress bleed through of underlying content
			// layer2 is the overlay layer which has opacity and a wait cursor (by default)
			// layer3 is the message content that is displayed while blocking
			var lyr1, lyr2, lyr3, s;
			if (msie || opts.forceIframe)
				lyr1 = $('<iframe class="blockUI" style="z-index:'+ (z++) +';display:none;border:none;margin:0;padding:0;position:absolute;width:100%;height:100%;top:0;left:0" src="'+opts.iframeSrc+'"></iframe>');
			else
				lyr1 = $('<div class="blockUI" style="display:none"></div>');

			if (opts.theme)
				lyr2 = $('<div class="blockUI blockOverlay ui-widget-overlay" style="z-index:'+ (z++) +';display:none"></div>');
			else
				lyr2 = $('<div class="blockUI blockOverlay" style="z-index:'+ (z++) +';display:none;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>');

			if (opts.theme && full) {
				s = '<div class="blockUI ' + opts.blockMsgClass + ' blockPage ui-dialog ui-widget ui-corner-all" style="z-index:'+(z+10)+';display:none;position:fixed">';
				if ( opts.title ) {
					s += '<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">'+(opts.title || '&nbsp;')+'</div>';
				}
				s += '<div class="ui-widget-content ui-dialog-content"></div>';
				s += '</div>';
			}
			else if (opts.theme) {
				s = '<div class="blockUI ' + opts.blockMsgClass + ' blockElement ui-dialog ui-widget ui-corner-all" style="z-index:'+(z+10)+';display:none;position:absolute">';
				if ( opts.title ) {
					s += '<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">'+(opts.title || '&nbsp;')+'</div>';
				}
				s += '<div class="ui-widget-content ui-dialog-content"></div>';
				s += '</div>';
			}
			else if (full) {
				s = '<div class="blockUI ' + opts.blockMsgClass + ' blockPage" style="z-index:'+(z+10)+';display:none;position:fixed"></div>';
			}
			else {
				s = '<div class="blockUI ' + opts.blockMsgClass + ' blockElement" style="z-index:'+(z+10)+';display:none;position:absolute"></div>';
			}
			lyr3 = $(s);

			// if we have a message, style it
			if (msg) {
				if (opts.theme) {
					lyr3.css(themedCSS);
					lyr3.addClass('ui-widget-content');
				}
				else
					lyr3.css(css);
			}

			// style the overlay
			if (!opts.theme /*&& (!opts.applyPlatformOpacityRules)*/)
				lyr2.css(opts.overlayCSS);
			lyr2.css('position', full ? 'fixed' : 'absolute');

			// make iframe layer transparent in IE
			if (msie || opts.forceIframe)
				lyr1.css('opacity',0.0);

			//$([lyr1[0],lyr2[0],lyr3[0]]).appendTo(full ? 'body' : el);
			var layers = [lyr1,lyr2,lyr3], $par = full ? $('body') : $(el);
			$.each(layers, function() {
				this.appendTo($par);
			});

			if (opts.theme && opts.draggable && $.fn.draggable) {
				lyr3.draggable({
					handle: '.ui-dialog-titlebar',
					cancel: 'li'
				});
			}

			// ie7 must use absolute positioning in quirks mode and to account for activex issues (when scrolling)
			var expr = setExpr && (!$.support.boxModel || $('object,embed', full ? null : el).length > 0);
			if (ie6 || expr) {
				// give body 100% height
				if (full && opts.allowBodyStretch && $.support.boxModel)
					$('html,body').css('height','100%');

				// fix ie6 issue when blocked element has a border width
				if ((ie6 || !$.support.boxModel) && !full) {
					var t = sz(el,'borderTopWidth'), l = sz(el,'borderLeftWidth');
					var fixT = t ? '(0 - '+t+')' : 0;
					var fixL = l ? '(0 - '+l+')' : 0;
				}

				// simulate fixed position
				$.each(layers, function(i,o) {
					var s = o[0].style;
					s.position = 'absolute';
					if (i < 2) {
						if (full)
							s.setExpression('height','Math.max(document.body.scrollHeight, document.body.offsetHeight) - (jQuery.support.boxModel?0:'+opts.quirksmodeOffsetHack+') + "px"');
						else
							s.setExpression('height','this.parentNode.offsetHeight + "px"');
						if (full)
							s.setExpression('width','jQuery.support.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"');
						else
							s.setExpression('width','this.parentNode.offsetWidth + "px"');
						if (fixL) s.setExpression('left', fixL);
						if (fixT) s.setExpression('top', fixT);
					}
					else if (opts.centerY) {
						if (full) s.setExpression('top','(document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px"');
						s.marginTop = 0;
					}
					else if (!opts.centerY && full) {
						var top = (opts.css && opts.css.top) ? parseInt(opts.css.top, 10) : 0;
						var expression = '((document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + '+top+') + "px"';
						s.setExpression('top',expression);
					}
				});
			}

			// show the message
			if (msg) {
				if (opts.theme)
					lyr3.find('.ui-widget-content').append(msg);
				else
					lyr3.append(msg);
				if (msg.jquery || msg.nodeType)
					$(msg).show();
			}

			if ((msie || opts.forceIframe) && opts.showOverlay)
				lyr1.show(); // opacity is zero
			if (opts.fadeIn) {
				var cb = opts.onBlock ? opts.onBlock : noOp;
				var cb1 = (opts.showOverlay && !msg) ? cb : noOp;
				var cb2 = msg ? cb : noOp;
				if (opts.showOverlay)
					lyr2._fadeIn(opts.fadeIn, cb1);
				if (msg)
					lyr3._fadeIn(opts.fadeIn, cb2);
			}
			else {
				if (opts.showOverlay)
					lyr2.show();
				if (msg)
					lyr3.show();
				if (opts.onBlock)
					opts.onBlock.bind(lyr3)();
			}

			// bind key and mouse events
			bind(1, el, opts);

			if (full) {
				pageBlock = lyr3[0];
				pageBlockEls = $(opts.focusableElements,pageBlock);
				if (opts.focusInput)
					setTimeout(focus, 20);
			}
			else
				center(lyr3[0], opts.centerX, opts.centerY);

			if (opts.timeout) {
				// auto-unblock
				var to = setTimeout(function() {
					if (full)
						$.unblockUI(opts);
					else
						$(el).unblock(opts);
				}, opts.timeout);
				$(el).data('blockUI.timeout', to);
			}
		}

		// remove the block
		function remove(el, opts) {
			var count;
			var full = (el == window);
			var $el = $(el);
			var data = $el.data('blockUI.history');
			var to = $el.data('blockUI.timeout');
			if (to) {
				clearTimeout(to);
				$el.removeData('blockUI.timeout');
			}
			opts = $.extend({}, $.blockUI.defaults, opts || {});
			bind(0, el, opts); // unbind events

			if (opts.onUnblock === null) {
				opts.onUnblock = $el.data('blockUI.onUnblock');
				$el.removeData('blockUI.onUnblock');
			}

			var els;
			if (full) // crazy selector to handle odd field errors in ie6/7
				els = $('body').children().filter('.blockUI').add('body > .blockUI');
			else
				els = $el.find('>.blockUI');

			// fix cursor issue
			if ( opts.cursorReset ) {
				if ( els.length > 1 )
					els[1].style.cursor = opts.cursorReset;
				if ( els.length > 2 )
					els[2].style.cursor = opts.cursorReset;
			}

			if (full)
				pageBlock = pageBlockEls = null;

			if (opts.fadeOut) {
				count = els.length;
				els.stop().fadeOut(opts.fadeOut, function() {
					if ( --count === 0)
						reset(els,data,opts,el);
				});
			}
			else
				reset(els, data, opts, el);
		}

		// move blocking element back into the DOM where it started
		function reset(els,data,opts,el) {
			var $el = $(el);
			if ( $el.data('blockUI.isBlocked') )
				return;

			els.each(function(i,o) {
				// remove via DOM calls so we don't lose event handlers
				if (this.parentNode)
					this.parentNode.removeChild(this);
			});

			if (data && data.el) {
				data.el.style.display = data.display;
				data.el.style.position = data.position;
				data.el.style.cursor = 'default'; // #59
				if (data.parent)
					data.parent.appendChild(data.el);
				$el.removeData('blockUI.history');
			}

			if ($el.data('blockUI.static')) {
				$el.css('position', 'static'); // #22
			}

			if (typeof opts.onUnblock == 'function')
				opts.onUnblock(el,opts);

			// fix issue in Safari 6 where block artifacts remain until reflow
			var body = $(document.body), w = body.width(), cssW = body[0].style.width;
			body.width(w-1).width(w);
			body[0].style.width = cssW;
		}

		// bind/unbind the handler
		function bind(b, el, opts) {
			var full = el == window, $el = $(el);

			// don't bother unbinding if there is nothing to unbind
			if (!b && (full && !pageBlock || !full && !$el.data('blockUI.isBlocked')))
				return;

			$el.data('blockUI.isBlocked', b);

			// don't bind events when overlay is not in use or if bindEvents is false
			if (!full || !opts.bindEvents || (b && !opts.showOverlay))
				return;

			// bind anchors and inputs for mouse and key events
			var events = 'mousedown mouseup keydown keypress keyup touchstart touchend touchmove';
			if (b)
				$(document).bind(events, opts, handler);
			else
				$(document).unbind(events, handler);

		// former impl...
		//		var $e = $('a,:input');
		//		b ? $e.bind(events, opts, handler) : $e.unbind(events, handler);
		}

		// event handler to suppress keyboard/mouse events when blocking
		function handler(e) {
			// allow tab navigation (conditionally)
			if (e.type === 'keydown' && e.keyCode && e.keyCode == 9) {
				if (pageBlock && e.data.constrainTabKey) {
					var els = pageBlockEls;
					var fwd = !e.shiftKey && e.target === els[els.length-1];
					var back = e.shiftKey && e.target === els[0];
					if (fwd || back) {
						setTimeout(function(){focus(back);},10);
						return false;
					}
				}
			}
			var opts = e.data;
			var target = $(e.target);
			if (target.hasClass('blockOverlay') && opts.onOverlayClick)
				opts.onOverlayClick(e);

			// allow events within the message content
			if (target.parents('div.' + opts.blockMsgClass).length > 0)
				return true;

			// allow events for content that is not being blocked
			return target.parents().children().filter('div.blockUI').length === 0;
		}

		function focus(back) {
			if (!pageBlockEls)
				return;
			var e = pageBlockEls[back===true ? pageBlockEls.length-1 : 0];
			if (e)
				e.focus();
		}

		function center(el, x, y) {
			var p = el.parentNode, s = el.style;
			var l = ((p.offsetWidth - el.offsetWidth)/2) - sz(p,'borderLeftWidth');
			var t = ((p.offsetHeight - el.offsetHeight)/2) - sz(p,'borderTopWidth');
			if (x) s.left = l > 0 ? (l+'px') : '0';
			if (y) s.top  = t > 0 ? (t+'px') : '0';
		}

		function sz(el, p) {
			return parseInt($.css(el,p),10)||0;
		}

	}


	/*global define:true */
	if (typeof define === 'function' && define.amd && define.amd.jQuery) {
		define(['jquery'], setup);
	} else {
		setup(jQuery);
	}

})();
</script>
