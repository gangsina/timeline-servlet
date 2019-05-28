
//头部弹出框
$(document).ready(function(){
	$(".login_02").hover(function(){
		$(this).addClass("hover").find("div.tck_01").fadeIn();
	},function(){
		$(this).removeClass("hover").find("div.tck_01").fadeOut();
	});
	
	$(".exit").hover(function(){
		$(this).addClass("hover").find("div.tck_02").fadeIn();
	},function(){
		$(this).removeClass("hover").find("div.tck_02").fadeOut();
	});
});
//返回顶部
$(document).ready(function(){
	/*返回顶部*/
	$('#roll_top').hide();
	$(window).scroll(function () {
		if ($(window).scrollTop() > 300) {
			$('#roll_top').fadeIn(400);//当滑动栏向下滑动时，按钮渐现的时间
		} else {
			$('#roll_top').fadeOut(0);//当页面回到顶部第一屏时，按钮渐隐的时间
		}
	});
	$('#roll_top').click(function () {
		$('html,body').animate({
			scrollTop : '0px'
		}, 300);//返回顶部所用的时间 返回顶部也可调用goto()函数
	});
});
function goto(selector){
	$.scrollTo ( selector , 1000);	
}

//左边banner
(function($){   
    $.fn.extend({     
         yx_rotaion: function(options) {   
		    //默认参数
            var defaults = {
			     /**轮换间隔时间，单位毫秒*/
                 during:2000,
				 /**是否显示左右按钮*/
                 btn:true,
				 /**是否显示焦点按钮*/
                 focus:true,
				 /**是否显示标题*/
                 title:true,
				 /**是否自动播放*/
                 auto:true				 
            }        
            var options = $.extend(defaults, options);   
            return this.each(function(){
			    var o = options;   
				var curr_index = 0;
                var $this = $(this);				
                var $li = $this.find("li");
                var li_count = $li.length;
				$this.css({position:'relative',overflow:'hidden',width:$li.find("img").width(),height:$li.find("img").height()});
				$this.find("li").css({position:'absolute',left:0,top:0}).hide();
			    $li.first().show();
			    $this.append('<div class="yx-rotaion-btn"><span class="left_btn"><\/span><span class="right_btn"></span><\/div>');
				if(!o.btn) $(".yx-rotaion-btn").css({visibility:'hidden'});
                if(o.title) $this.append(' <div class="yx-rotation-title"><\/div><a href="" class="yx-rotation-t"><\/a>');
                if(o.focus) $this.append('<div class="yx-rotation-focus"><\/div>');
				var $btn = $(".yx-rotaion-btn span"),$title = $(".yx-rotation-t"),$title_bg = $(".yx-rotation-title"),$focus = $(".yx-rotation-focus");
				//如果自动播放，设置定时器
				if(o.auto) var t = setInterval(function(){$btn.last().click()},o.during);
                $title.text($li.first().find("img").attr("alt"));	
				$title.attr("href",$li.first().find("a").attr("href"));				
				
               // 输出焦点按钮
               for(i=1;i<=li_count;i++){
                 $focus.append('<span>'+i+'</span>');
               }
               // 兼容IE6透明图片   
               if($.browser.msie && $.browser.version == "6.0" ){
                  $btn.add($focus.children("span")).css({backgroundImage:'url(images/ico.gif)'});
               }		
               var $f = $focus.children("span");
               $f.first().addClass("hover");
               // 鼠标覆盖左右按钮设置透明度
               $btn.hover(function(){
	              $(this).addClass("hover");
               },function(){
	              $(this).removeClass("hover");
               });
			   //鼠标覆盖元素，清除计时器
               $btn.add($li).add($f).hover(function(){
                if(t) clearInterval(t);
               },function(){
                if(o.auto) t = setInterval(function(){$btn.last().click()},o.during);
               });
			   //鼠标覆盖焦点按钮效果
               $f.bind("mouseover",function(){
	             var i = $(this).index();
	             $(this).addClass("hover");
	             $focus.children("span").not($(this)).removeClass("hover");
	             $li.eq(i).fadeIn(1000);
                 $li.not($li.eq(i)).fadeOut(1000);	
	             $title.text($li.eq(i).find("img").attr("alt"));
	             curr_index = i;
               });
			   //鼠标点击左右按钮效果
               $btn.bind("click",function(){
                 $(this).index() == 1?curr_index++:curr_index--;
	             if(curr_index >= li_count) curr_index = 0;
	             if(curr_index < 0) curr_index = li_count-1;
                 $li.eq(curr_index).fadeIn(1000);
	             $li.not($li.eq(curr_index)).fadeOut(1000);	
	             $f.eq(curr_index).addClass("hover");
	             $f.not($f.eq(curr_index)).removeClass("hover");
	             $title.text($li.eq(curr_index).find("img").attr("alt"));
				 $title.attr("href",$li.eq(curr_index).find("a").attr("href"));	
               });
 
            });   
        }   
    });   
       
})(jQuery);
	  
//随手美图	  
function SlideShow(c) {
    var a = document.getElementById("slideContainer"), f = document.getElementById("slidesImgs").getElementsByTagName("li"), h = document.getElementById("slideBar"), n = h.getElementsByTagName("li"), d = f.length, c = c || 3000, e = lastI = 0, j, m;
    function b() {
        m = setInterval(function () {
            e = e + 1 >= d ? e + 1 - d : e + 1;
            g()
        }, c)
    }
    function k() {
        clearInterval(m)
    }
    function g() {
        f[lastI].style.display = "none";
        n[lastI].className = "";
        f[e].style.display = "block";
        n[e].className = "on";
        lastI = e
    }
    f[e].style.display = "block";
    a.onmouseover = k;
    a.onmouseout = b;
    h.onmouseover = function (i) {
        j = i ? i.target : window.event.srcElement;
        if (j.nodeName === "LI") {
            e = parseInt(j.innerHTML, 10) - 1;
            g()
        }
    };
    b()
};
//弹出验证码
$(function () {
            $("#yzmput").click(function (event) {
                $(".tck_03").show();
                event.stopPropagation();
            });
            $(document).click(function () {
                $(".tck_03").hide();
            });
			
});

//发布新主题弹出框
$(document).ready(function () {
            $('.fbzt').click(function () {
                $.blockUI({
                    message: $('#tijiaocheckbox')
                });
            });
});

//随手拍

$(".zp_box").live('mouseenter',function(){
	$(this).children().stop(false,true);
	$(this).children(".pop_tit").slideDown("fast");
}).live('mouseleave',function(){
	$(this).children().stop(false,true);
	$(this).children(".pop_tit").slideUp("fast");
});

$('.pages a').live('click',function(){
		var url = $(this).attr('href');
		if(!url) return;
		if(url=='javascript:void(0);') return;
		$(this).attr('href','javascript:void(0);');
		gotopage(url);
});

//随手拍图片展
$(document).ready(function () {
    $('.zp_box').click(function () {
        $("#tpzBOX").show();
                $.blockUI({
                    message: $('#tpzBOX')
                });
        //$(".ThumbPicBorder .jCarouselLite.FlLeft").css("left", "").css("width","");
        //$(".ThumbPicBorder #ThumbPic").css("left", "").css("width", "");
        //$(".ThumbPicBorder #ThumbPic li").css("left", "").css("width", "").css("float","").css("height","");
            });
});


//-------------------------------------------------------------随手拍图片展

//缩略图滚动事件
$(document).ready(function () {
	$(".jCarouselLite").jCarouselLite({
		btnNext: "#btnNext",
		btnPrev: "#btnPrev",
		scroll: 1,
		speed: 240,
		circular: false,
		visible: 10
	});
	var currentImage;
	var currentIndex = -1;
	
	//显示大图(参数index从0开始计数)
	function showImage(index){
	
		//更新当前图片页码
		$(".CounterCurrent").html(index + 1);
	
		//隐藏或显示向左向右鼠标手势
		var len = $('#OriginalPic img').length;
		if(index == len - 1){
			$("#aNext").hide();
		}else{
			$("#aNext").show();
		}
	
		if(index == 0){
			$("#aPrev").hide();
		}else{
			$("#aPrev").show();
		}
	
		//显示大图            
		if(index < $('#OriginalPic img').length){
			var indexImage = $('#OriginalPic p')[index];
	
			//隐藏当前的图
			if(currentImage){
				if(currentImage != indexImage){
					$(currentImage).css('z-index', 2);	
					$(currentImage).fadeOut(0,function(){
						$(this).css({'display':'none','z-index':1})
					});
				}
			}
	
			//显示用户选择的图
			$(indexImage).show().css({'opacity': 0.4});
			$(indexImage).animate({opacity:1},{duration:200});
	
			//更新变量
			currentImage = indexImage;
			currentIndex = index;
	
			//移除并添加高亮
			$('#ThumbPic img').removeClass('active');
			$($('#ThumbPic img')[index]).addClass('active');
	
			//设置向左向右鼠标手势区域的高度                        
			//var tempHeight = $($('#OriginalPic img')[index]).height();
			//$('#aPrev').height(tempHeight);
			//$('#aNext').height(tempHeight);                        
		}
	}
	
	//下一张
	function ShowNext(){
		var len = $('#OriginalPic img').length;
		var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
		showImage(next);
	}
	
	//上一张
	function ShowPrep(){
		var len = $('#OriginalPic img').length;
		var next = currentIndex == 0 ? (len - 1) : currentIndex - 1;
		showImage(next);
	}
	
	//下一张事件
	$("#aNext").click(function(){
		ShowNext();
		if($(".active").position().left >= 144 * 10){
			$("#btnNext").click();
		}
	});
	
	//上一张事件
	$("#aPrev").click(function(){
		ShowPrep();
		if($(".active").position().left <= 144 * 10){
			$("#btnPrev").click();
		}
	});
	
	//初始化事件
	$(".OriginalPicBorder").ready(function(){
		ShowNext();
	
		//绑定缩略图点击事件
		$('#ThumbPic li').bind('click',function(e){
			var count = $(this).attr('rel');
			showImage(parseInt(count) - 1);
		});
	});
	
	$(function () {
            $("#tpzBOX").hide();
        });
  
});
(function($){$.fn.jCarouselLite=function(o){o=$.extend({btnPrev:null,btnNext:null,btnGo:null,mouseWheel:false,auto:null,speed:200,easing:null,vertical:false,circular:true,visible:3,start:0,scroll:1,beforeStart:null,afterEnd:null},o||{});return this.each(function(){var b=false,animCss=o.vertical?"top":"left",sizeCss=o.vertical?"height":"width";var c=$(this),ul=$("ul",c),tLi=$("li",ul),tl=tLi.size(),v=o.visible;if(o.circular){ul.prepend(tLi.slice(tl-v-1+1).clone()).append(tLi.slice(0,v).clone());o.start+=v}var f=$("li",ul),itemLength=f.size(),curr=o.start;c.css("visibility","visible");f.css({overflow:"hidden",float:o.vertical?"none":"left"});ul.css({margin:"0",padding:"0",position:"relative","list-style-type":"none","z-index":"1"});c.css({overflow:"hidden",position:"relative","z-index":"2",left:"0px"});var g=o.vertical?height(f):width(f);var h=g*itemLength;var j=g*v;f.css({width:f.width(),height:f.height()});ul.css(sizeCss,h+"px").css(animCss,-(curr*g));c.css(sizeCss,j+"px");if(o.btnPrev)$(o.btnPrev).click(function(){return go(curr-o.scroll)});if(o.btnNext)$(o.btnNext).click(function(){return go(curr+o.scroll)});if(o.btnGo)$.each(o.btnGo,function(i,a){$(a).click(function(){return go(o.circular?o.visible+i:i)})});if(o.mouseWheel&&c.mousewheel)c.mousewheel(function(e,d){return d>0?go(curr-o.scroll):go(curr+o.scroll)});if(o.auto)setInterval(function(){go(curr+o.scroll)},o.auto+o.speed);function vis(){return f.slice(curr).slice(0,v)};function go(a){if(!b){if(o.beforeStart)o.beforeStart.call(this,vis());if(o.circular){if(a<=o.start-v-1){ul.css(animCss,-((itemLength-(v*2))*g)+"px");curr=a==o.start-v-1?itemLength-(v*2)-1:itemLength-(v*2)-o.scroll}else if(a>=itemLength-v+1){ul.css(animCss,-((v)*g)+"px");curr=a==itemLength-v+1?v+1:v+o.scroll}else curr=a}else{if(a<0||a>itemLength-v)return;else curr=a}b=true;ul.animate(animCss=="left"?{left:-(curr*g)}:{top:-(curr*g)},o.speed,o.easing,function(){if(o.afterEnd)o.afterEnd.call(this,vis());b=false});if(!o.circular){$(o.btnPrev+","+o.btnNext).removeClass("disabled");$((curr-o.scroll<0&&o.btnPrev)||(curr+o.scroll>itemLength-v&&o.btnNext)||[]).addClass("disabled")}}return false}})};function css(a,b){return parseInt($.css(a[0],b))||0};function width(a){return a[0].offsetWidth+css(a,'marginLeft')+css(a,'marginRight')};function height(a){return a[0].offsetHeight+css(a,'marginTop')+css(a,'marginBottom')}})(jQuery);


//查看更多评论
$(function() {
    $("#toggle").click(function() {
        $(this).text($("#content").is(":hidden") ? "收起更多评论 》" : "查看更多评论 》");
        $("#content").slideToggle();
    });
});

//select美化
	$(function(){
		$(".select dt").click(function(event){
		 $(".xiala").show();
		 event.stopPropagation();
       });
          $(document).click(function () {
                $(".xiala").hide();
		});
	});
	$(function(){
		$(".xiala a").click(function(){
		 $(".select dt").attr("id",$(this).attr("id"));
		$(".select dt").html($(this).html());
		});		
});
