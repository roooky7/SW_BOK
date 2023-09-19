//푸터슬라이딩박스
$(function () {
   function footer() {
      $('.footBtn button').click(function() {
            $(this).parent().siblings('div').children('div').slideUp(300);
            $(this).siblings("div").slideToggle(300);
            return false;
      });

       $('.footBtn').mouseleave(function(){
           $('.footBtn div').each(function() {
              if ($(this).css('display') == 'block') {
                 $('.footBtn div').hide();
                 }
             });
       });
   }
   footer();
});

//사용자별바로가기 181001
$(function () {
	function user_link() {
		$('.user_link h2').click(function() {
			$('.user_link h2').removeClass('current');
			$('.user_link .user_list').removeClass('on');
			$('.user_link #'+$(this).attr('class')).addClass('on');//해당 탭의 리스트
			$('.user_link .'+$(this).attr('class')).addClass('current');//탭 선택
		});

	}	
	user_link();
});

//지원청소식/학교소식 181002
$(function () {
	function news_list() {
		$('.news #news_list').click(function() {
			$('.news h2').removeClass('current');
			$('.news .news_list').removeClass('on');
			$('.news #'+$(this).attr('class')).addClass('on');//해당 탭의 리스트
			$('.news .'+$(this).attr('class')).addClass('current');//탭 선택
		});

	}	
	news_list();
});

//공지사항 탭기능 181002
$(function () {
	function news_list() {
		$('.notice #list_box').click(function() {
			$('.notice h2').removeClass('current');
			$('.notice .list_box').removeClass('on');
			$('.notice #'+$(this).attr('class')).addClass('on');//해당 탭의 리스트
			$('.notice .'+$(this).attr('class')).addClass('current');//탭 선택
		});

	}	
	news_list();
});

/*function subTab(){
  $("#sixTab a").click(function(){
      var _href = $(this).attr('href');
      var _class = $(_href).attr('class');
      $(this).parent().addClass('on').siblings().removeClass('on');
      $(_href).show().siblings('.'+ _class).hide();
      return false;
  });
};*/

$(document).ready(function(){

	//모바일 검색영역
	$('#open_sear').click(function(e){
		if($(window).width() < 1240){
			if($(this).hasClass('open')){
				$('#mobSearch').slideUp();
				$(this).removeClass('open').find('i').prop('class','xi-search');
				$(this).find('span').text('모바일검색 열기');
				$('#gnbShadow').fadeOut();
			}else{
				$('#mobSearch').slideDown();
				$(this).addClass('open').find('i').prop('class','xi-close');
				$(this).find('span').text('모바일검색 닫기');
				$('#gnbShadow').fadeIn();
			}
		}

		if($('#topmenu').css('display') == 'block'){
			$('html, body, #wrap, #topmenu, #shadow_device').removeAttr('style');
			$('.nav_mobile_close').fadeOut(200);
		}
		return false;
	});

  //웹 검색영역
	$('#open_sear2').click(function(e){
    $('#mobSearch').slideDown();
    $('#gnbShadow').fadeIn();
		return false;
	});

  //웹 검색영역
	$('#close_sear').click(function(e){
    $('#mobSearch').slideUp();
    $('#gnbShadow').fadeOut();
    return false;
	});

	$("#open_mn").on('click', function(){
		if($('#open_sear').hasClass('open')==true){
			$('#mobSearch').slideUp();
			$('#open_sear').removeClass('open').find('i').prop('class','xi-search');
			$('#open_sear').find('span').text('모바일검색 열기');
			$('#gnbShadow').fadeOut();
		}
	});
	
	//검색영역
	$('.search_btn button').click(function(){
		var confirm=$('#header .search').css('display');
		if(confirm=='block'){
			$('#header .search').hide();
		}else{
			$('#header .search').show();
		};
	});
	$('.search_close button').click(function(){
		$('#header .search').hide();
	});
	
	$('.btnSearch').click(function(){
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		if(special_pattern.test($('[name="searchValue"]').val()) == true){
    		alert('특수문자가 포함되어있습니다.');
			return false;
    	}
	});

	function searchGo( frm ) {

		if( !frm.query.value ) {
			alert("검색어를 입력해주세요.");
			frm.query.focus();
			return false;
		}

		return true;

	}

	// 맨위로 가기
	$('.btn_top').hide();
	$(window).scroll(function(){
		if($(this).scrollTop() > 200){
			$('.btn_top').fadeIn();
		}else{
			$('.btn_top').fadeOut();
		}
	});
	$('.top').click(function(){
		$('html, body').animate({scrollTop:0}, 400);
		return false;
	});

});

/* ///////////////////////////////////////////////////////////////////////////////////////////////////////////

// 언어

/////////////////////////////////////////////////////////////////////////////////////////////////////////// */
$(function(){
	site_code();
});

/* 유틸메뉴_언어선택 */
function site_code(){
    $('.site_code button').click(function() {
        $(this).next().slideToggle(300);
    });
};

/* function valueEmpty */
jQuery.fn.valueEmpty = function() {
    if (jQuery.trim(jQuery(this).val()).length < 1 ) {
        return true;
    } else {
        return false;
    }
};

/* function number and comma */
function numComma(data){
	if (jQuery.trim(data).length > 3 ) {
    	var returnValue = "";
        var commaValue = ""+data;
        for(idx=commaValue.length-1,chk=0;idx>=0;idx--,chk++){
        	if(chk == 3){
        		chk=0;
        		returnValue = commaValue.substr(idx,1) + "," + returnValue;
        	} else {
        		returnValue = commaValue.substr(idx,1) + returnValue;
        	}
        }
        return returnValue;
    } else {
        return data;
    }
}

$(function () {
	/* function onlyNumber */
	$(".onylNum").change(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
})

//파일 다운로드
function mfn_fileDownload(fileKey){
	if(fileKey != "" || fileKey == null){
		location.href="/common/fileDownload.do?fileKey="+fileKey;	
	}
};

//게시판 컬럼확장으로 추가된 이메일 컬럼의 유효성 검증
function CheckEMail (emailStr) 
{  
	// 전자메일 패턴. 사용자이름@도메인 의 형식을 검사함  
	var emailPat=/^(.+)@(.+)$/;
	// 포함되지 말아야할 특수문자들 ( ) < > @ , ; : \ " . [ ]  
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";  
	// 포함될 수 있는 특수문자들 (나머지)  
	var validChars="\[^\\s" + specialChars + "\]";  
	// 아래의 경우는 사용자 이름에 따옴표가 있는 경우. RFC표준사항임  
	var quotedUser="(\"[^\"]*\")"; 
	// 도메인 대신 IP를 사용할 수있음  
	// 예를 들어 laday@[210.120.253.10]은 올바른 메일 주소 "[", "]"이 반드시 필요 
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;  
	// 기본적인 아토믹에 해당됨  
	var atom=validChars + '+';  
	// 사용자로 사용될 수 있는 문자를 나타냄  
	var word="(" + atom + "|" + quotedUser + ")";  
	// 사용자의 패턴을 나타냄. 위의 워드가 .단위로 여러개 올 수있음  
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$");  
	// 아래의 것은 일반적인 도메인 패턴에 해당됨  
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");  
	// @을 기준으로 사용자와 도메인으로 나눔. 편의를 위함  
	var matchArray=emailStr.match(emailPat);  
	if (matchArray==null) 
	{    
	// 두개 이상 또는 @이 아예 없는 경우   
		alert("메일주소 형식이 잘못되어 있습니다 (공백 및 @과 .을 확인해 보세요)");    
		return false; 
	}  
	var user=matchArray[1];  
	var domain=matchArray[2];  
	// 사용자 부분이 제대로 되었는지 검사  
	if (user.match(userPat)==null) 
	{    
		alert("메일 아이디가 올바르지 않습니다");    
		return false;  
	} 
	// 도메인 부분이 IP로 되어 있는 경우 
	var IPArray=domain.match(ipDomainPat);  
	if (IPArray!=null) 
	{    
		for (var i=1;i<=4;i++) 
		{      
			if (IPArray[i]>255) 
			{        
				alert("IP 주소 형식이 올바르지 않습니다");        
				return false;      
			}    
		}    
		return true;  
	}  
	// 도메인 이름이 심볼릭 네임인 경우 올바르지 않음  
	var domainArray=domain.match(domainPat);  
	if (domainArray==null) 
	{    
		alert("도메인 형식이 올바르지 않습니다");   
		return false; 
	}  
	// 도메인 형식 검사에 통과했더라도, 마지막 세개 또는 두개의 문자(com, net, kr등등)  
	// 까지 올바른지 검사. 최상위 도메인은 반드시 세글자 아니면 두 글자임  
	var atomPat=new RegExp(atom,"g");  
	var domArr=domain.match(atomPat);  
	var len=domArr.length;  
	if (domArr[domArr.length-1].length<2 ||    domArr[domArr.length-1].length>3) 
	{    
		alert("도메인 주소의 마지막 필드는 반드시 세글자 도메인 또는 두글자 나라이어야 합니다.");    
		return false; 
		
		
	}  
	// 호스트이름이 있는지 검사  
	if (len<2) 
	{    
		alert("호스트 이름이 존재하지 않습니다. 호스트 이름은 반드시 2글자 이상이어야 합니다");    
		return false;  
	}  
	
	return true;
}


//팝업 쿠키 저장
function setCookie(cookieName, value){
    var exdays = 1;
    var exdate = new Date();
    var day = exdate.getDate() * 1;
    exdate.setDate(day + exdays);
//  var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toUTCString()); 
    document.cookie = cookieName + "=" + cookieValue;
}

// 쿠키조회
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

// 팝업 닫기(쿠키설정)
$(document).on('click', '.popupCookieSet', function() {
	var popValue = $(this).attr("data-seq");
	var cookieNM = "popCookie"+popValue;
	
//	setCookie(cookieNM, "hide", "1");
	setCookie(cookieNM, "hide");
	$("#popupNormal"+popValue).parent().remove();
});

//배너 리스트
$(document).on("click",".bannerZone .control .list",function(){
	
	data = $('#searchForm').serialize();	
	
 // 배차 추가 템플릿(팝업) ajax
	$.ajax({
		type : "post",
		url : "/common/ba/banner/selectBannerViewList.do",
		data : data,
		success : function(data) {
			$.confirm({
				title : '<h3 class="tit1"><h3>',
				boxWidth : '40%', 
				useBootstrap : false,
				content : data,
 				buttons : {
 					close : {
						text: '닫기',
						btnClass: 'btn-dark popClose'
					}
				},
			})
		},
		error : function(data) {
			alert("오류가 발생하였습니다.\n관리자에게 문의하세요.");
		}		
	});	
	
});


//웹취약점 보완 target=_blank 속성 일시 rel="noopener noreferrer" 추가 스크립트 
//noopener : Y/N, noreferrer : Y/N, targetId : 입력/미입력
function noOpenerReferrer(noopener,noreferrer,targetId){
	var rel_noopener = "";
	var rel_noreferrer = "";
	var rel_space = "";
	var rel_run_count = 0;
 if(noopener == "Y"){
 	rel_noopener = "noopener"; 
 	rel_run_count += 1;
 }
 if(noreferrer == "Y"){
 	rel_noreferrer = "noreferrer";
 	rel_run_count += 1;
 }
 if(rel_run_count>1){
 	rel_space = " ";
 }
 if(targetId != ""){
 	$(targetId).find('[target*=_blank]').attr('rel',rel_noopener+rel_space+rel_noreferrer);
 }else{
 	$('[target*=_blank]').attr('rel',rel_noopener+rel_space+rel_noreferrer);
 }
}

// 웹취약점 보완추가 스크립트 (2021.10.06)
// 태그의 속성을 추가한다.
// 입려값은 태그값, 속성값의 배열이다.
function addTagAttribute(tagName, attrName, valueName){
	
	for(var i = 0; i < tagName.length ; i++ ) {
		// 해당 태그요소를 가져온다.
		var tag = document.getElementsByTagName(tagName[i]);
		
		for(var j = 0; j < tag.length ; j++ ) {
			for(var k = 0; k < attrName.length ; k++ ) {
				for(var l = 0; l < valueName.length ; l++ ) {
			
					var beforeAttr = tag[j].getAttribute(attrName[k]);
				
					// 태그 속성을 변경하여준다.
					if(beforeAttr == null
						|| beforeAttr == "undefined"
						|| beforeAttr == "") {
			    		tag[j].setAttribute(attrName[k], valueName[l]);
					} else {
			    		tag[j].setAttribute(attrName[k], beforeAttr + ' ' + valueName[l]);
					}
				}
			}
		}
	}
}


function privateInfoLimit(checkVal,msg){
	if(checkVal == undefined){
		alert("다음과 같은 이유로 게시물이 차단되었습니다."
				+"\n개인정보보호법 제29조에 따라서 개인정보가 노출되지 않도록"
				+"\n하고 있습니다. 개인정보나 불건전 키워드가 포함되지 않았는지,"
				+"\n불법 프로그램에 노출되어 있지 않았는지 "
				+"\n다시 한 번 확인해주시기 바랍니다.");
	}else{
		alert(msg);
	}
}

$(function () {
	$.ajax({url:"/common/ie_end.jsp",
		success:function(result) {
			$("#wrap").prepend(result);
	}});
})