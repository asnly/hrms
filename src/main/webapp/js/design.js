var t = setTimeout("visual()",5000); //home 轮播计时器
var num = 0;						 //home 轮播变量
$(document).ready(function(){
	//停止轮播/开始轮播
	$(".m_visual").mouseenter(function(){
		clearTimeout(t);
	});
	$(".m_visual").mouseleave(function(){
		t = setTimeout("visual()",5000);
	});
	//点击轮播
	$(".v_next").click(function(){
		if (num < $(".visual ul li").length-1)
		{
			num++;
		}
		else
		{
			num = 0;
		}
		$(".visual ul").stop(true,false).animate({marginLeft:-num*1200});
		$(".pagenavi span").removeClass("on");
		$(".pagenavi span").eq(num).addClass("on");
	});
	$(".v_prev").click(function(){
		if (num != 0)
		{
			num--;
		}
		else
		{
			num = $(".visual ul li").length-1;
		}
		$(".visual ul").stop(true,false).animate({marginLeft:-num*1200});
		$(".pagenavi span").removeClass("on");
		$(".pagenavi span").eq(num).addClass("on");
	});
	$(".pagenavi span").mouseenter(function(){
		$(".pagenavi span").removeClass("on");
		$(this).addClass("on");
		num = $(this).index()
		$(".visual ul").stop(true,false).animate({marginLeft:-num*1200});
	});
	
	// 相册UL 长度
	$(".min_imgs ul").css("width",$(".min_imgs ul li").length*156-19);
	$(".min_imgs ul li").click(function(){
		$(".max_album ul li").removeClass("on");
		$(".max_album ul li").eq($(this).index()).addClass("on");
	});
	// 相册 
	var wid = 0;
	$(".btn_right").click(function(){
		if ($(".min_imgs ul li").length > 5 && wid+1 < ($(".min_imgs ul li").length-1) / 5)
		{
			wid++;
		}
		$(".min_imgs ul").css("margin-left",-wid*780);
	});
	$(".btn_left").click(function(){
		
		if (wid>0)
		{
			wid--;
		}
		$(".min_imgs ul").css("margin-left",-wid*780);
	});
	//日历
	$(".btn_view").click(function(){
		$(".date_view").hide();
		$(".board_view tr").removeClass("on");
		$(this).parent().parent().addClass("on");
		$(this).parent().parent().next("tr").show();
	});
	//经典案例
	$(".case ul").css("width",$(".case ul li").length*218);
	var b = 0;
	$(".case_next").click(function(){
		
		if ($(".case ul li").length > 5 && b+1 < ($(".case ul li").length-1) / 5)
		{
			b++;
		}
		$(".case ul").css("margin-left",-b*1073-18);
	});
	$(".case_prev").click(function(){
		
		if (b>0)
		{
			b--;
		}
		$(".case ul").css("margin-left",-b*(1073-18));
	});

	//pop
	$(".login_pop").css("height",$("body").height());
	$(".btn_close").click(function(){
		$(".login_pop").hide();
	});

	//邮箱/手机格式、
	$(".inp_keys").blur(function(){
		var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if (!reg.test($(".inp_keys").val()))
		{
			$(".ok").hide();
			$(".error").show();
		}
		else if (reg.test($(".inp_keys").val()))
		{
			$(".error").hide();
			$(".ok").show();
		}
	});
});
//自动轮播
function visual() {
	if (num < $(".visual ul li").length-1)
	{
		num++;
	}
	else
	{
		num = 0;
	}
	$(".visual ul").animate({marginLeft:-num*1200});
	$(".pagenavi span").removeClass("on");
	$(".pagenavi span").eq(num).addClass("on");
	t = setTimeout("visual()",5000);
}
