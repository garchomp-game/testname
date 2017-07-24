

 $(function(){
	 var hoge=function(){
	 	$('#slider1').bxSlider({
	 		auto:true,
	 		speed:4000,
	 		pause:500,
	 	});
	 };
	 hoge();
	$('a[href^=#]').click(function(){
		var speed = 400;
		var href = $(this).attr("href");
		var target = $(href == "#" || href == ''? 'html' : href);
		var position = target.offset().top;
		$('body,html').animate({scrollTop:position},  'swing',speed);
		return hoge();
	});
});
