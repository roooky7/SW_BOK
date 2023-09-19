// 풀다운
function gnb(param,obj,btn,wrap,elem,scale,dur,meth,mno){
	var param = $(param);
	var obj = param.find(obj); 
	var btn = param.find(btn);
	var wrap = param.find(wrap);
	var elem = elem-1; // jsp 메뉴 코드가 1부터 시작하기 때문에
	var new_h = 0;
	var old_h = 65; // 메뉴높이
	var moresize = 100;
	var n = elem;
	var data = false;
	var isMain = location.href;
		isMain = isMain.substr(isMain.lastIndexOf("/"));	
		
		

	// 180802 3차메뉴 관련 추가
	$(function () {
		function check() {
			$("#tm li ul.th2 li ul").parent("li").addClass('row');
			$("#tm .dep").click(function () {
					$(this).parent().siblings().children('ul').slideUp(300);
					$(this).parent().parent().parent().siblings().children('ul').children('li').children('ul').slideUp(300);
					$(this).siblings("ul").slideToggle(300);
					$(this).parent('li').toggleClass("on");
					$("#tm .dep").removeClass("ov");
					$(this).toggleClass("ov");
					$(this).parent().parent().parent().siblings().children().children('li').toggleClass("on");
					$(this).parent().siblings("li").removeClass('on');
					$(this).parent().parent().parent().siblings().children().children('li').removeClass("on");
				return false;	
			});
		}	
		check();
	});
	

	function _current(s){
		if(mno == "") btn.removeClass("current"); else btn.eq(s).addClass("current");
	}

	function _open(){
		//btn.not(elem).removeClass("current").eq(elem).addClass("current");
		// height 가 가장 큰 박스의 height 를 저장
		//$.each(obj,function(){if(new_h < $(this).parent().outerHeight()) new_h = $(this).parent().outerHeight(); });
		// padding-top 연산 가능하게 타입 변환하여 저장
		//moresize = Number(obj.css("padding-top").substr(0,2))*2;
		//moresize = moresize+btn.height();
	

		//new_h--; // border 로 인해 1px 씩 증가하는것에 대응
		//obj.height(new_h-moresize); 
		wrap.stop().css({"height":"auto"});
		if(chaked_OS() == true) $("#touchArea").height($(window).height()).width($(window).width()).show();
		wrap.find(".animateLine").hide().show();

	}

	function _close(){
		wrap.stop(true,false).animate({"height":old_h},dur,meth);
		$("#touchArea").hide();
		btn.removeClass("current");
		obj.removeClass("ov");
		$("#tm li.th1").removeClass("on"); //180813 추가
		wrap.find(".animateLine").hide();

	}

	// 테블릿 터치 헨들링
	btn.bind("touchstart touchmove",function(event){
		if(chaked_OS() == true){
			if(data == false){
				data = true;
				_open();
				_current(n);
				$("#touchArea").bind("touchend",function(event){
					_close();
					_current(n);
					data = false;
					event.stopPropagation();
				});
				event.preventDefault();
			}else{
				data = false;
			}
		}
	});
	
	btn.bind("mouseenter focusin",function(event){
		if(chaked_OS() != true){
			elem = $(this).parent().index();
			_open();
			$("#tm li.th1").removeClass("on"); //180813 추가
			$(this).parent().addClass("on"); //180813 추가
		}
		event.stopPropagation();
	});

	wrap.bind("mouseleave",function(){
		$("#tm li.th1").removeClass("on"); //180813 추가
		_close();
		_current(n);
	});

	obj.bind("mouseenter",function(){
		btn.removeClass("current");
		obj.removeClass("ov");
		$("#tm li.th1").removeClass("on"); //180813 추가
		
		$(this).prev().addClass("current");
		$(this).addClass("ov");
		$(this).parent().addClass("on"); //180813 추가

		
	});

	obj.last().find(">li>a").last().bind("focusout",function(){
		_close();
		_current(n);
		
	});
	_current(n);
}


// 모바일
function gnb_open(param,obj,btn,index1,index2,index3,dur,meth,mno){
	var param = $(param);
	var obj = $(obj);
	var btn = $(btn);
	var index1 = index1-1;
	var index2 = index2;
	var index3 = index3;
	var n = index1;
	var w = 0;
	var data = false;
	var str = location.href;
	var notbad = false;

	if(str.match("sitemap")){
		notbad = true;
	}
	param.find(".th2").hide();

	var _open = function(){
		obj.css({'overflow':'visible'}).animate({left:w},dur,meth);
		$('#topmenu #gnb_device li ul').css({opacity:1});
		$('#topmenu #gnb_device li ul').css({"width":"auto"});
		$('#topmenu #gnb_device li ul li ul').show();
		$("#shadow_device, .nav_mobile_close").stop(true,true).fadeIn(dur/2);
		$("#shadow_device").css({"z-index":1001});
		$("html,body").css({"overflow":"hidden","height":$(window).height()});
		param.css({opacity:1,'display':'block',height:$(window).height()});
		param.find(".th3").hide();
		
		if(notbad != true){ param.stop(true,true).delay(dur/2).animate({scrollTop:param.find(".th1_lnk").eq(index1).offset().top},dur,meth); }

		if(mno != "" && notbad != true){
			var tobj = param.find(".th1_lnk").eq(index1).next().find(">li").eq(index2).find(".th3");
			if(tobj.is($(".th3"))){
				tobj.find("a").eq(index3).addClass("ov");
				param.stop(true,true).delay(dur).animate({scrollTop:tobj.parent().offset().top},dur,meth,function(){
					tobj.slideDown(150);
				});
			}
		}

		data = true;

	};

	var _close = function(){
		obj.stop(true,true).animate({left:0},dur,meth,function(){
			if(mno != "" && notbad != true){
				param.find(".th1_lnk").not(n).removeClass("ov").eq(n).addClass("ov").next().show();
			}else{
				param.find(".th1_lnk").removeClass("ov").next().hide();
			}
		});

		$("#shadow_device, .nav_mobile_close").stop(true,true).fadeOut(dur/2,function(){
			$("html,body").removeAttr("style");
			obj.removeAttr("style");
			$("#shadow_device").css({"z-index":999});
			data = false;
		});

		param.stop(true,true).delay(dur).animate({opacity:0,scrollTop:0},0,meth).css({"display":"none"});

	};

	btn.unbind().bind("touchend click",function(event){
		$("#header").queue(_open).dequeue();
		event.preventDefault();
	});
	
	// 터치 아웃 영역
	$("#shadow_device, .nav_mobile_close").unbind().bind("click touchmove",function(event){
		$("#header").queue(_close).dequeue();
		event.preventDefault();
		event.stopPropagation();
	});

	param.find("a").bind("click",function(event){
		if($("#topmenu:animated").size()){ return false; }
		event.stopPropagation();
		
	})


	// 트리메뉴 컨트롤
	if(mno != "" && notbad != true){ 
		param.find(".th1_lnk").not(index1).next().hide().eq(index1).show().prev().addClass("ov");
	}

	param.find(".th1_lnk").bind("click",function(event){
		n = $(this).parent().index();
		if($(this).next().attr("class") == "th2"){			
			param.find(".th1_lnk").not(n).removeClass("ov").next().stop(true,true).delay(150).slideUp(150);
			param.find(".th1_lnk").eq(n).addClass("ov").next().stop(true,true).slideDown(150);	
			if($(this).next().attr("class") != "th2"){
				event.preventDefault();
			}
		}else{
			var url = $(this).attr("href");
			var target = $(this).attr("target");
			if(target == "_blank"){
				var newWindow = window.open("about:blank");
				newWindow.location.href=url;
			}else{
				location.href=url;
			}
		}
	
		event.preventDefault();
		event.stopPropagation();
			
	});

	param.find(".th2>li>a").bind("click",function(event){
		if($(this).next().attr("class") == "th3"){
			if($(this).next().css("display") != "block"){
				$(this).next().slideDown(150);
			}else{
				$(this).next().slideUp(150);
			}
			event.preventDefault();	
			event.stopPropagation();
		}
	});
}

$(document).ready(function(){
				
	var ismain = "";
	var code2 = 0;
	var code3 = 0;

	if(ismain != ""){
		code2 = $("a[data-thiscode='"+ismain.substr(0,8)+"']").parent().index(); //01
;
		code3 = $("a[data-thiscode='"+ismain.substr(0,11)+"']").parent().index();
	}

	var param = "#topmenu";
	var obj = "#wrap";
	var btn = "#open_mn";
	var index1 = 01
; // th1 메뉴코드, index로 사용
	var index2 = code2; // th1 메뉴코드, index로 사용
	var index3 = code3; // th1 메뉴코드, index로 사용
	var dur = 300; // 애니메이션 진행 속도
	var meth = "easeOutExpo"; // 애니메이션 진행 타입
	
	gnb_open(param,obj,btn,index1,index2,index3,dur,meth,"");

	//gnb스크롤
	var winScollTop = 40;//snb 높이
	var headNewH = 80;//스크롤시 헤더의 높이
	var h1OldTop = 65;//로고의 기존top수치
	var h1NewTop = 25;//로고의 스크롤시 top수치
	var h1OldTop_mo = 68;//모바일로고의 기존top수치
	var h1NewTop_mo = 26;//모바일로고의 스크롤시 top수치
	var btnOldTop_mo = 62;//모바일 메뉴버튼의 기존top수치
	var btnNewTop_mo = 21;//모바일 메뉴버튼의 스크롤시 top수치

});