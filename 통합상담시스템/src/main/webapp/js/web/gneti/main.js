$(document).ready(function(){

	//main visual
    var visualPrev = '.main_visual .prev';
    var visualNext = '.main_visual .next';
    var visualStop = '.main_visual .stop';
    var visualPlay = '.main_visual .play';
    $("#m_visual").on('init', function(event, slick) {
		$('.main_visual .page strong').text(slick.currentSlide+1);
		$('.main_visual .page span').text(slick.slideCount);
	  }).slick({
        slider: '.item',
        infinite: true,
        autoplaySpeed: 4000,
        speed: 500,
        autoplay: true,
        prevArrow: visualPrev,
        nextArrow: visualNext
    }).on('beforeChange', function (event, slick, currentSlide, nextSlide) {
		  $('.main_visual .page strong').text(nextSlide+1);
	  });
    $('.main_visual .control a').click(function(e) {
        slickControl($(this), '#m_visual', visualStop, visualPlay);
        e.preventDefault();
    });

    // main visual resize
    var delta = 100;
    var timer = null;
    $(window).on('resize', function() {
        clearTimeout(timer);
        timer = setTimeout(resizeDone, delta);
    });

    function resizeDone() {
        $("#visualSlide").slick('setPosition');
    }

	//popup
    var popupPrev = '.box_popup .prev';
    var popupNext = '.box_popup .next';
    var popupStop = '.box_popup .stop';
    var popupPlay = '.box_popup .play';
    $("#popupSlider").on('init', function(event, slick) {
		$('.box_popup .page strong').text(slick.currentSlide+1);
		$('.box_popup .page span').text(slick.slideCount);
	  }).slick({
        slider: '.item',
        infinite: true,
        autoplaySpeed: 4000,
        speed: 500,
        autoplay: true,
        prevArrow: popupPrev,
        nextArrow: popupNext
    }).on('beforeChange', function (event, slick, currentSlide, nextSlide) {
		  $('.box_popup .page strong').text(nextSlide+1);
	  });
    $('.box_popup .control a').click(function(e) {
        slickControl($(this), '#popupSlider', popupStop, popupPlay);
        e.preventDefault();
    });

	//바로가기1
    $("#linkSlider1").slick({
        slider: '.item',
        infinite: true,
        autoplaySpeed: 4000,
        slidesToShow: 6,
        speed: 500,
        autoplay: false,
        arrows: true,
        responsive: [
            { breakpoint: 1380, settings: { slidesToShow: 6 }},
            { breakpoint: 1024, settings: { slidesToShow: 5 }},
            { breakpoint: 960, settings: { slidesToShow: 4 }},
            { breakpoint: 768, settings: { slidesToShow: 3 }},
            { breakpoint: 660, settings: { slidesToShow: 2 }},
            { breakpoint: 480, settings: { slidesToShow: 3 }},
            { breakpoint: 420, settings: { slidesToShow: 2 }},
            { breakpoint: 320, settings: { slidesToShow: 1 }}
          ]
    });

    //banner
  	var bnPrev = '.bannerZone .prev';
  	var bnNext = '.bannerZone .next';
  	var bnStop = '.bannerZone .stop';
  	var bnPlay = '.bannerZone .play';
  	$("#bnSlider").slick({
  		slider: '.item',
  		infinite: true,
  		autoplay: true,
  		prevArrow: bnPrev,
  		nextArrow: bnNext,
  		slidesToShow: 4,
  		responsive: [
  			{ breakpoint: 1024, settings: { slidesToShow: 4 }},
  			{ breakpoint: 960, settings: { slidesToShow: 3 }},
  			{ breakpoint: 660, settings: { slidesToShow: 2 }},
  			{ breakpoint: 420, settings: { slidesToShow: 1 }}
  		  ]
  	});
  	$('.bannerZone .control a').click(function(e){
  		slickControl($(this), '#bnSlider', bnStop, bnPlay);
  		e.preventDefault();
  	});

	// 탭
	TabBox('notice', 'h2'); //공지사항
	TabBox('news', 'h3'); //포토뉴스
	TabBox('M_link2', 'h2'); //바로가기2
	TabBox('userSrv', 'h2'); //사용자서비스
});

// Tab Box JS
function TabBox(div, tit) {
  $tab = $('.' + div);

  $tab.find(tit).each(function() {
    $(this).find('a').on("focus click", function(e) {
      e.preventDefault(); //상단이동방지

      $(this).parent(tit).siblings('.list_box').removeClass('on');
      $(this).parent(tit).siblings().removeClass('current');
      $(this).parent(tit).next('.list_box').addClass('on');
      $(this).parent().addClass('current');
    });
  });
}

//팝업존
$(document).ready(function(){
	var param = "#popup";
	var obj = ".pop>li";
	var btn = param+" .control";
	var interval = 5000;
	var speed = 0;
	var viewSize = 1;
	var moreSize = 0;
	var dir = "x";
	var data = 0;
	var auto = true;
	var hover = false;
	var method = "easeInOutCubic";
	var op1 = false;
	stateScrollObj(param,obj,btn,interval,speed,viewSize,moreSize,dir,data,auto,hover,method,op1);
});

//배너존
// $(document).ready(function(){
// 	var param = "#mbanner";
// 	var obj = ".obj>li";
// 	var btn = param+" .control";
// 	var interval = 5000;
// 	var speed = 0;
// 	var viewSize = 1;
// 	var moreSize = 0;
// 	var dir = "x";
// 	var data = 0;
// 	var auto = true;
// 	var hover = false;
// 	var method = "easeInOutCubic";
// 	var op1 = false;
// 	stateScrollObj(param,obj,btn,interval,speed,viewSize,moreSize,dir,data,auto,hover,method,op1);
// });


// slider Control
function slickControl($this, slick, stop, play) {
    var $slick = $(slick); //slider wrap
    var $stop = $(stop); //Stop Button
    var $play = $(play); //Play Button
    var display = $this.css("display"); // button's display

    if ($this.is(stop)) {
        $stop.css('display', 'none');
        $play.delay(100).css('display', display);
        $slick.slick('slickPause');
    }
    if ($this.is(play)) {
        $play.css('display', 'none');
        $stop.delay(100).css('display', display);
        $slick.slick('slickPlay');
    }
}
