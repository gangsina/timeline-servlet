

$(document).ready(function(){
	
	
});

//公司部门
$(document).ready(function(){
$("#panel h3.bm").click(function(){
	     $(this).addClass("highlight")
		 .next().show()
		 .parent().siblings().children("h3").removeClass("highlight")
		 .next().hide();
		 return false;
	
	});
		});
//点击选择
$(document).ready(function () {
            $('.djxz').click(function () {
                $.blockUI({
                    message: $('#mmBox'),
                    css:{
                    	top:'1%'
                    }
                });
            });
});
//修改我的头像1
$(document).ready(function () {
            $('.sctp').click(function () {
                $.blockUI({
                    message: $('#tanchuBox')
                });
            });
});
//编辑部门
$(document).ready(function () {
            $('.bjbm').click(function () {
                $.blockUI({
                    message: $('#bmBox')
                });
            });
});
//停用
$(document).ready(function () {
            $('.icon_02').click(function () {
                $.blockUI({
                    message: $('#tyBox')
                });
            });
});

//生成密码
$(document).ready(function () {
            $('.icon_033').click(function () {
                $.blockUI({
                    message: $('#mmBox')
                });
            });
});
$(document).ready(function () {
            $('.pldr').click(function () {
                $.blockUI({
                    message: $('#plBox1')
                });
            });
});

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

//新增管理
$(document).ready(function () {
            $('.add').click(function () {
                $.blockUI({
                    message: $('#xzBox')
                });
            });
});
//上下班考勤统计
$(document).ready(function () {
            $('.dc').click(function () {
                $.blockUI({
                    message: $('#kqtjBox')
                });
            });
});
//新增员工薪资
$(document).ready(function () {
            $('.ygxz').click(function () {
                $.blockUI({
                    message: $('#ygxzBox')
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

//推荐内容更改
$(document).ready(function () {
            $('.nrgg').click(function () {
                $.blockUI({
                    message: $('#nrBox')
                });
            });
});


//财产修改
$(document).ready(function () {
            $('.xg').click(function () {
                $.blockUI({
                    message: $('#ccxgBox')
                });
            });
});
//财产详细
$(document).ready(function () {
            $('.xq').click(function () {
                $.blockUI({
                    message: $('#ccxqBox')
                });
            });
});



//考勤1
$(document).ready(function(){
	$(".wtg").hover(function(){
		$(this).parent().find("div.tck_wtg").fadeIn(200);
	},function(){
		$(this).parent().find("div.tck_wtg").fadeOut(200);
	});
});