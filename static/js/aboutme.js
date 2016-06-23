$(function(){

	// 设置每个section 高度
	var clientHeight = document.documentElement.clientHeight;
	var sections = $('section');
	var len = sections.length;
	for (var i = 0; i < len; i++) {
		sections[i].style.height = clientHeight + 'px';
	};

	var sTop = $(window).scrollTop();
	var times = sTop/clientHeight;
	$('#top_naviagtion ul .dot:eq('+times+')').addClass('current');

	checkScroll(len,clientHeight);
	//平滑滚动导航
	$('.nav_link').bind('click',function(event){
		$('.up').fadeIn(100);
		$('.down').fadeIn(100);
		var $anchor = $(this);
		$('#top_naviagtion ul').find('.current').removeClass('current');
		$anchor.find('.dot').addClass('current');
		$('html, body').stop().animate({scrollTop: $($anchor.attr('href')).offset().top}, 600 ,function(){
			checkScroll(len,clientHeight);
		});
		event.preventDefault();
	});

	$('.up').bind('click',function(event){
		$('.down').fadeIn(100);
		var dis = $(window).scrollTop() - clientHeight;
		$('html, body').stop().animate({scrollTop: dis }, 300);
		var idx = $('#top_naviagtion ul .dot').index($('.current')) - 1;
		if (idx == 0) {
			$('.up').fadeOut(100);
		};
		$('#top_naviagtion ul .current').removeClass('current');
		$('#top_naviagtion ul .dot:eq('+idx+')').addClass('current');
		event.preventDefault();
	});
	$('.down').bind('click',function(event){
		$('.up').fadeIn(100);
		var dis = $(window).scrollTop() + clientHeight;
		$('html, body').stop().animate({scrollTop: dis }, 300);
		var idx = $('#top_naviagtion ul .dot').index($('.current')) + 1;
		if (idx == 4) {
			$('.down').fadeOut(100);
		};
		$('#top_naviagtion ul .current').removeClass('current');
		$('#top_naviagtion ul .dot:eq('+idx+')').addClass('current');
		event.preventDefault();
	});
});

function checkScroll(len,clientHeight){
	if ($(window).scrollTop() == 0) {
		$('.up').fadeOut();
	};
	if ($(window).scrollTop() == (len-1)*clientHeight) {
		$('.down').fadeOut();
	};
};