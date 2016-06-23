$(function () {
    /* 菜单 */
    $('nav ul li').hover(function () {
        $(this).find('ul').show();
    }, function () {
        $(this).find('ul').hide();
    });
    /* 轮播 */
    $('#slide ul li').first().fadeIn();
    var t = setInterval(toRun, 3000);
    var iNow = 0;
    $('#btn span').hover(function () {
        $(this).addClass('curr').siblings().removeClass('curr');
        var index = $(this).index();
        $('#slide li').eq(index).fadeIn().siblings().fadeOut();
        clearInterval(t);
    }, function () {

        iNow = $(this).index();
        t = setInterval(toRun, 3000);
    });
    function toRun() {
        iNow++;
        if (iNow > 4) {
            iNow = 0;
        }
        $('#slide li').eq(iNow).fadeIn().siblings().fadeOut();
        $('#btn span').eq(iNow).addClass('curr').siblings().removeClass('curr');
    }
    
	$(".act_title a").each(
			function(index) {
				$(this).css("color",
						"#" + (Math.floor(Math.random() * 899999 + 100000)));
			});
	$(".hot_tag a").each(
			function(index) {
				$(this).css("color",
						"#" + (Math.floor(Math.random() * 899999 + 100000)));
			});
	$(".act_tag a").each(
			function(index) {
				$(this).css("color",
						"#" + (Math.floor(Math.random() * 899999 + 100000)));
			});

	$("#act_top_tab ul li").click(
			function() {
				var i = $(this).index();
				$("#act_top_tab ul li:not(eq(" + i + "))").removeClass(
						"act_top_tab_on");
				$("#act_top_tab ul li:not(eq(" + i + "))").addClass(
						"act_top_tab");

				$(this).removeClass("act_top_tab");
				$(this).addClass("act_top_tab_on");
				$("#act_top_list div").hide();
				$("#act_top_list div:eq(" + i + ")").fadeIn(500);

			});

	$(".act_top_list ul li").mousemove(function() {
		$(this).css("background", "#f8f8f8");
		$(this).css("border-bottom-color", "#333");
	});
	$(".act_top_list ul li").mouseleave(function() {
		$(this).css("background", "#fff");
		$(this).css("border-bottom-color", "#ccc");
	});

	$(".tags_list a").each(
			function() {
				$(this).css("color",
						"#" + (Math.floor(Math.random() * 899999 + 100000)));
			});

	$(".act_right span").each(
			function() {
				$(this).css("color",
						"#" + (Math.floor(Math.random() * 899999 + 100000)));
			});
	$(".links a").each(
			function() {
				// $(this).css("color","#"+(Math.floor(Math.random()*899999+100000)));
				$(this).css("background",
						"#" + (Math.floor(Math.random() * 899999 + 100000)));
				$(this).css("color", "#Fff");
			});

	$(".recommend_btn").click(function() {
		$(this).attr("disabled", "disabled");
		var id = $(this).attr("aid");
		$.get("commendAritcle.htm", {
			"id" : id
		}, function(data) {
			if (data = "ok") {
				alert("推荐成功，谢谢！");
			} else {
				alert("抱歉，推荐失败！");
			}
			$(".recommend_btn").removeAttr("disabled");
		});

	});
	$(".reply").on('click', function(e) {
		 e.preventDefault();
		var name = $(this).prev().text();
		// alert(name);
		$('#comment').text('@' + name);
	});
	$(window).scroll(function () {
        if ($(window).scrollTop() >= 400) {
            $('.back').fadeIn();
            // alert('a');
        } else {
            $('.back').fadeOut();
        }
    });
	$('.back').click(function() {
		$('html, body').animate({scrollTop:0});
	});
});
function checkMsg() {
	var username = document.getElementById("username").value;
	if (username == "") {
		alert("请问尊姓大名...");
		return false;
	}
	var mail_qq = document.getElementById("mail_qq").value;
	if (mail_qq == "") {
		alert("请问如何联系你呢...");
		return false;
	}
	var comment = document.getElementById("comment").value;
	if (comment == "") {
		alert("想给我说点什么呢...");
		return false;
	}

}

function checkComment() {
	var articleId = document.getElementById("articleId").value;
	if (articleId == "") {
		alert("没有这篇日志，不能评论哟...");
		return false;
	}
	var uname = document.getElementById("uname").value;
	if (uname == "") {
		alert("问尊姓大名...");
		return false;
	}
	var mail_qq = document.getElementById("mail_qq").value;
	if (mail_qq == "") {
		alert("请问如何联系你呢...");
		return false;
	}
	var comment = document.getElementById("comment").value;
	if (comment == "") {
		alert("想说点什么呢...");
		return false;
	}
}

