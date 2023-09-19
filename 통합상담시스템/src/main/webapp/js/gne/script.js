// 모바일 테이블
$(function(){
	if(chaked_OS() == true){
		if($(window).width() < 768){
			$.each($(".respond_table"),function(){
				var table = $(this);
				var caption = table.find("caption");
				var create_tr = "";
				var create_th = "";
				var create_td = "";

				$.each(table.find("tr"),function(){
					var tr = $(this);

					$.each(tr.find("[data-title]"),function(){
						var td = $(this);

						create_th = "<th scope='row'>"+td.attr("data-title")+"</th>";
						create_td = "<td>"+td.html()+"</td>";
						create_tr += "<tr>"+create_th+create_td+"</tr>";
					});
				});

				table.html(create_tr);
				table.prepend(caption+"<colgroup><col width='20%' /><col /></colgroup>");
			});
		}
	}
});


// 사이버투어 모바일과 PC버전 주소가 다름
$(document).ready(function(){
	var param = $("#hall_href");
	var href1 = "/html/cyber/hall/hall.html";
	var href2 = "/html/cyber/hall/m_hall.html";

	function replace_href(){
		if($(window).width() < 1000 ){
			param.attr("href",href2);
		}else{
			param.attr("href",href1);
		}
	}

	$(window).resize(function(){ replace_href(); });

	replace_href();
});


/* flow label */
$(document).ready(function(){
	if(!$("label").is(".flow")) return false;
	
	var o1 = $("label.flow");
	var o2 = $("label.flow").next();
	
	o1.css({"position":"absolute"});

	o1.bind("click focusin",function(){
		$(this).css({"visibility":"hidden"});
	});
	o2.bind("click focusin",function(){
		$(this).prev().css({"visibility":"hidden"});
	});

	o2.bind("focusout",function(){
		if($(this).val() == ""){
			$(this).prev().css({"visibility":"visible"});
		}
	});

	if(o2.val() != "") o1.css({"visibility":"hidden"});
});

/* 모바일에서 정상적인 테이블 뷰가 가능하도록 */
function responseTable(){
	if(return_width()<1000){
	if(location.href.match('bbs')) return false;

		var param = $(".tbl_basic");

		$.each(param,function(){
			if($(this).parent().parent().attr("class") != "responseTable"){
				$(this).wrap("<div style='position:relative' class='responseTable'></div>");
				$(this).wrap("<div style='width:100%;min-width:730px' class='table_scroll_x'></div>"); // pc 컨텐츠 영역에 맞춤
			}

			$(this).parent().parent().height($(this).outerHeight()+20);
		});

		fleXenv.initByClass("responseTable");

		// 터치 이벤트 
		var startX,startY;
		
		function getCoord(e,c) {
		    return /touch/.test(e.type) ? (e.originalEvent || e).changedTouches[0]['page' + c] : e['page' + c];
		}
	 
		$(".responseTable").on('touchstart', function(event) {
		    startX = getCoord(event, 'X');
		    startY = getCoord(event, 'Y');
		}).on('touchend', function (event) {
		    if (Math.abs(getCoord(event, 'X') - startX) < 20 && Math.abs(getCoord(event, 'Y') - startY) < 20) {
		       $(window).stop(true,false).animate({top:startY},0);
		       //event.preventDefault();
		    }
		});
	}
}

// 굴러온 데이터 반환 
function return_data(data){
	return data;
};

// 메뉴코드 반환 [반드시 필요함 건들지말것]
function mno(n,data){
	if(data != null){
		var href = data;
	}else{
		var href = location.href;
	}
	var sitemap = [];

	if(!href.match("sitemap")){
		href = href.substr(href.lastIndexOf("sub"));
		href = href.split("sub")[1].split("_");
		if(href[n] != undefined) href = Number(href[n].substr(0,2));
		return href;
	}else{
		sitemap[0] = 6;
		if(href.match("sitemap_11")) sitemap[1] = 1;
		if(href.match("sitemap_12")) sitemap[1] = 2;
		if(href.match("sitemap_13")) sitemap[1] = 3;
		if(href.match("sitemap_14")) sitemap[1] = 4;
		if(href.match("sitemap_15")) sitemap[1] = 5;
		return sitemap[n];
	}
}

/*
인수에 반응하여 index 반환
작은 수 부터 배열로 적는다 [360,1024,1200]
*/
function return_rw(n){
	var rw = 0;
	for(var i=0; i<n.length; i++){
		if(n[i] <= return_width()) rw = i;
	}
	return rw;
}

/* 너비값 전달 */
function return_width(){
	var w = $(window).width(); return w;
}

/* 높이값 전달 */
function return_height(){
	var h = $(window).height(); return h;
}

/* OS 체크 불린값 전달 window 폰, window 기반 태블릿pc 에서 테스트가 필요함 */
function chaked_OS(){
	var device = navigator.userAgent;

	var str = device.split(";");
		str = str[0].split("(");
		str = str[1].split(" ");

	var chkOS = false;

	if(str[0] != "Windows" && str[0] != "Macintosh" && str[0] != "compatible"){
		chkOS = true; // 데스크탑이 아닐 때 true
	}

	return chkOS;
}

/* MSIE 9이하 버전체크 */
function ms_ver(){
	if(navigator.userAgent.match('MSIE')){
		var msie = navigator.userAgent;
		var ms_ver = msie.substr(msie.lastIndexOf('MSIE')).split('MSIE')[1];
			ms_ver = Number(ms_ver.split('.')[0]);

		return ms_ver;
	}else{
		return null;
	}
}


/*********팝업관련 자바스크립트 소스****************/
function close_layer(num){
	document.getElementById(num).style.display = 'none';

	//쿠키굽기
	setCookie(num, 'done' , 1); 
}
function close_layer2(num){
	document.getElementById(num).style.display = 'none';

}
function link_target(url,target){
	if(target=='_blank'){
		window.open(url,'','noreferrer');
	}else if(target=='_self'){
		location.href=url;
	}else{
		opener.location.href=url;
	}
}
/*********팝업관련 자바스크립트 소스****************/


//페이스북
function facebookOpen_local(titl,href){
	var titl = $(titl).text();
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace ('"', '&quot;');
	titl = encodeURIComponent(titl);
	var link = encodeURIComponent(href); 
	var url = "http://www.facebook.com/sharer.php?u=" + link + "&t=" + titl;
	snswindowOpen (url, 900, 450, 'no');
}

//twitter
function twitterOpen_local(titl,href){
	var titl = $(titl).text();
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace ('"', '&quot;');
	titl = titl.replace('&gt;','>');
	titl = titl.replace('&gt;','>');
	titl = encodeURIComponent(titl);
	var link = encodeURIComponent(href); 
	var url = "http://twitter.com/share?text=" + titl + "&url=" + link;
	snswindowOpen (url, 800, 400, 'yes');
}

//페이스북
function facebookOpen(){
	// var titl = $("#location h3").text();
	// titl = titl.replace('"', '&quot;');
	// titl = titl.replace('"', '&quot;');
	// titl = encodeURIComponent(titl);
	// var link = encodeURIComponent(location.href); 
	// var url = "http://www.facebook.com/sharer.php?u=" + link + "&t=" + titl;
	var link = encodeURIComponent(location.href); 
	var url = "http://www.facebook.com/sharer.php?u="+link;
	snswindowOpen (url, 900, 450, 'no');
}
//twitter
function twitterOpen(){
	var titl = $("#location h3").text();
	titl = titl.replace('"', '&quot;');
	titl = titl.replace('"', '&quot;');
	titl = titl.replace('&gt;','>');
	titl = titl.replace('&gt;','>');
	titl = encodeURIComponent(titl);
	var link = encodeURIComponent(location.href); 
	var url = "http://twitter.com/share?text=" + titl + "&url=" + link;
	snswindowOpen (url, 800, 400, 'yes');
}
function snswindowOpen(){
	var nUrl; var nWidth; var nHeight; var nLeft; var nTop; var nScroll;
	nUrl = arguments[0];
	nWidth = arguments[1];
	nHeight = arguments[2];
	nScroll = (arguments.length > 3 ? arguments[3] : "no");
	nLeft = (arguments.length > 4 ? arguments[4] : (screen.width/2 - nWidth/2));
	nTop = (arguments.length > 5 ? arguments[5] : (screen.height/2 - nHeight/2));
	winopen=window.open(nUrl, 'SNS', "left="+nLeft+",top="+nTop+",width="+nWidth+",height="+nHeight+",scrollbars="+nScroll+",toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,noreferrer");
}


function admissionFormCheck()
{
	var f = document.admissionForm;
	if(f.n_name.value.length<1)
	{
		alert("이름을 입력해 주세요");
		f.n_name.focus();
		return false;
	}

	if(f.jumin_num.value.length != 13)
	{
		alert("주민번호는 숫자만 입력해 주세요");
		f.jumin_num.focus();
		return false;
	}
	return true;
}

//이미지 클릭시 원본 크기로 팝업 보기
function doImgPop(img){ 
 img1= new Image(); 
 img1.src=(img); 
 imgControll(img); 
} 
  
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
}

function viewImage(img){ 
 W=img1.width; 
 H=img1.height; 
 O="width="+W+",height="+H+",scrollbars=yes,noreferrer"; 
 imgWin=window.open("","",O); 
 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
 imgWin.document.close();
}