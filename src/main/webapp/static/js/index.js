
//员工风采
/*
$(".zp_box").hover (
function () {
	$(this).children().stop(false,true);
	$(this).children(".pop_tit").slideDown("fast");
	},
function () {
	$(this).children().stop(false,true);
	$(this).children(".pop_tit").slideUp("fast");
	}					
	)
	*/
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


/*导航*/
$(function(){
	$(".menu ul li").append("<b class='pngFix'></b><p class='pngFix'></p>");
	
	$(".menu ul li").hover(function(){
		if($(this).attr("class") != "current"){
			$(this).children("p").stop().animate({left:"0px"},200);
			$(this).children("a").css({color:"#cdcdcd"},900);
		}
	},function(){
		if($(this).attr("class") != "current"){
			$(this).children("p").stop().animate({left:"-164px"},300);
			$(this).children("a").css({color:"#cdcdcd"},900);
		}
	});

	$(".menu ul li.current").unbind("hover");
});

function setNav(id){
	var navList = $(".menu ul li");
	$(navList).eq(id-1).addClass("current");
}
$(function(){
    $(".menu").mouseover(function(){
	    $("ul.aft").show();
	}).mouseout(function(){
	    $("ul.aft").hide();
	})
})