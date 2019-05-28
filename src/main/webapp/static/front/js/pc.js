//头部弹出框
$(document).ready(function(){
	$(".exit").hover(function(){
		$(this).addClass("hover").find("div.tck_02").fadeIn(200);
	},function(){
		$(this).removeClass("hover").find("div.tck_02").fadeOut(200);
	});
});

//筛选
$(document).ready(function(){
	$(".shaix").hover(function(){
		$(this).addClass("hover").find("div.tck_03").fadeIn(200);
	},function(){
		$(this).removeClass("hover").find("div.tck_03").fadeOut(200);
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

//首页选项卡
$(function () {
   $('.tab ul.menu li').click(function(){
        //获得当前被点击的元素索引值
        var Index = $(this).index();
		//给菜单添加选择样式
	    $(this).addClass('active').siblings().removeClass('active');
		//显示对应的div
		$('.tab').children('div').eq(Index).show().siblings('div').hide();
   
   });
});
//修改头像
$(function(){

	$(".xgtx_01").hover(function(){
		$(this).addClass("xgtx_02").find("div.xgtx_01").hide(500);
	},function(){
		$(this).removeClass("xgtx_02").find("div.xgtx_01").show(600);
	});
	
});
//修改性别
$(function(){
    $("#xg0").click(function(){
	    $("#div10").show();
        $("#div9").hide();
	});
	$("#qx0").click(function(){
	    $("#div10").hide();
        $("#div9").show();
	})
});

//修改出生年月
$(function(){
    $("#xg10").click(function(){
	    $("#div12").show();
        $("#div11").hide();
	});
	$("#qx10").click(function(){
	    $("#div12").hide();
        $("#div11").show();
	})
});

//修改地址
$(function(){
    $("#xg").click(function(){
	    $("#div2").show();
        $("#div1").hide();
	});
	$("#qx").click(function(){
	    $("#div2").hide();
        $("#div1").show();
	})
});

//修改联系电话
$(function(){
    $("#xg2").click(function(){
	    $("#div4").show();
        $("#div3").hide();
	});
	$("#qx2").click(function(){
	    $("#div4").hide();
        $("#div3").show();
	})
});
//修改QQ
$(function(){
    $("#xg3").click(function(){
	    $("#div6").show();
        $("#div5").hide();
	});
	$("#qx3").click(function(){
	    $("#div6").hide();
        $("#div5").show();
	})
});

//修改座机号
$(function(){
    $("#xg5").click(function(){
	    $("#div14").show();
        $("#div13").hide();
	});
	$("#qx5").click(function(){
	    $("#div14").hide();
        $("#div13").show();
	})
});

//修改出生地
$(function(){
    $("#xg6").click(function(){
	    $("#div16").show();
        $("#div15").hide();
	});
	$("#qx6").click(function(){
	    $("#div16").hide();
        $("#div15").show();
	})
});
//修改兴趣爱好
$(function(){
    $("#xg4").click(function(){
	    $("#div8").show();
        $("#div7").hide();
	});
	$(".Button5").click(function(){
	    $("#div8").hide();
        $("#div7").show();
	})
});


//修改我的头像1
$(document).ready(function () {
            $('.xgtx_01').click(function () {
                $.blockUI({
                    message: $('#tanchuBox')
                });
            });
});
$(document).ready(function () {
            $('.xgtx').click(function () {
                $.blockUI({
                    message: $('#tanchuBox')
                });
            });
});
//修改我的头像2
$(document).ready(function () {
            $('.Button').click(function () {
                $.blockUI({
                    message: $('#tanchuBox2')
                });
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

//我的考勤待处理选项卡
$(function () {
   $('.tab1 ul.menu li').click(function(){
        //获得当前被点击的元素索引值
        var Index = $(this).index();
		//给菜单添加选择样式
	    $(this).addClass('active').siblings().removeClass('active');
		//显示对应的div
		$('.tab1').children('div').eq(Index).show().siblings('div').hide();
   
   });
});

//请假申请弹出框1
$(document).ready(function () {
            $('.dp').click(function () {
                $.blockUI({
                    message: $('#qjsqBox')
                });
            });
});

//未通过原因弹出1
$(document).ready(function(){
	$(".tckBox").hover(function(){
		$(this).addClass("hover").find("div.tck_wtg").fadeIn(200);
	},function(){
		$(this).removeClass("hover").find("div.tck_wtg").fadeOut(200);
	});
});

//工作记录展开收起
$(function() {
    $("#toggle").click(function() {
        $(this).text($("#content").is(":hidden") ? "收起 》" : "展开 》");
        $("#content").slideToggle();
    });
	$("#toggle2").click(function() {
        $(this).text($("#content").is(":hidden") ? "收起 》" : "展开 》");
        $("#content2").slideToggle();
    });
	$("#toggle3").click(function() {
        $(this).text($("#content").is(":hidden") ? "收起 》" : "展开 》");
        $("#content3").slideToggle();
    });
});

//我的工作记录选项卡
$(function () {
   $('.tab2 ul.menu li').click(function(){
        //获得当前被点击的元素索引值
        var Index = $(this).index();
		//给菜单添加选择样式
	    $(this).addClass('active').siblings().removeClass('active');
		//显示对应的div
		$('.tab2').children('div').eq(Index).show().siblings('div').hide();
   
   });

});

//请假查看进度
$(document).ready(function(){
	$(".tckBox").hover(function(){
		$(this).addClass("hover").find("div.tck_jd").fadeIn(200);
	},function(){
		$(this).removeClass("hover").find("div.tck_jd").fadeOut(200);
	});
});


//详细信息
$(function(){

	$li1 = $(".apply_nav .apply_array");
	$window1 = $(".apply .apply_w");
	$left1 = $(".apply .img_l");
	$right1 = $(".apply .img_r");
	
	$window1.css("width", $li1.length*112);

	var lc1 = 0;
	var rc1 = $li1.length-1;
	
	$left1.click(function(){
		if (lc1 < 1) {
			alert("已经是第一张图片");
			return;
		}
		lc1--;
		rc1++;
		$window1.animate({left:'+=112px'}, 1000);
	});

	$right1.click(function(){
		if (rc1 < 1){
			alert("已经是最后一张图片");
			return;
		}
		lc1++;
		rc1--;
		$window1.animate({left:'-=112px'}, 1000);
	});

})

