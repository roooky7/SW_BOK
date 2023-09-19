<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>통합 상담 시스템</title>
<meta name="keywords" content="통합 상담 시스템">
<meta name="description" content="통합 상담 시스템 홈페이지에 오신 것을 환영합니다. ">
<meta name="robots" content="index,follow">
<meta property="og:title" content="통합 상담 시스템">
<meta property="og:description" content="통합 상담 시스템 홈페이지에 오신 것을 환영합니다.">
<meta property="og:type" content="website">
<meta property="og:url" content="Project/home.do">
<meta property="og:site_name" content="통합 상담 시스템">

<link rel="stylesheet" href="./css/web/gneti/common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/con_common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/layout.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/page_view.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/sub.css" media="all">

<script type="text/javascript" src="./js/gne/html5shiv.js"></script>
<script type="text/javascript" src="./js/gne/jquery.min.js"></script>
<script type="text/javascript" src="./js/gne/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="./js/gne/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/gne/jquery.form.min.js"></script>
<script type="text/javascript" src="./js/gne/sub.js"></script>
<script type="text/javascript" src="./js/gne/jquery.bxslider.js"></script>
<script type="text/javascript" src="./js/web/gneti/common.js?v=20221217"></script>
<script type="text/javascript" src="./js/web/gneti/slick.min.js"></script>
<script type="text/javascript" src="./js/web/gneti/topmenu.js"></script>
<!--메뉴동작-->
<script type="text/javascript" src="./js/gne/script.js"></script>
<!--자주사용 스크립트-->
<script type="text/javascript" src="./js/gne/common-scroll.js"></script>
<!--스크롤롤링-->
<script type="text/javascript" src="./js/gne/modernizr-2.6.2.min.js"></script>
<!--익스8이하지원-->
<script type="text/javascript" src="./js/gne/jquery.bpopup.min.js"></script>
<script type="text/javascript" src="./js/gne/wauto.js"></script>
<script type="text/javascript" src="./js/gne/noOpenerReferrer.js"></script>
</head>
<body>
	<!-- 바로가기 -->
	<div id="skipArea">
		<a href="#gnb">메인메뉴 바로가기</a> <a href="#container">본문으로 바로가기</a>
	</div>
	<!-- //바로가기 -->
	<div id="shadow_device"></div>
	<div id="wrap">
		<!-- header  -->



		<header id="header">
			<div id="snb">
				<h1>
					<a href="./home.do"> <img
						src="./images/web/gneti/common/logo.png" alt="통합 상담 시스템"></a>
				</h1>
				<!--//230614-->
			</div>

			<!-- pc -->
			<nav id="gnb">
				<div id="gnbwrap">
					<h2 class="blind">주 메뉴</h2>
					<div id="animate" class="nobg">
						<div id="tnb">
							<!-- PC 메뉴 생성 -->
							<!--START-->
							<%
								Object ID1 = session.getAttribute("teacher");
							Object ID2 = session.getAttribute("s_parents");
							System.out.println("getAttribute-교사 :" + ID1);
							System.out.println("getAttribute-학부모 :" + ID2);
							%>
							<table>
								<tr>

									<%
										if (ID1 == null && ID2 == null) {
									%>

									<ul id="tm">
										<li class="th1"><a class="th1_lnk" href="home.do">홈페이지</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectNoticeList.do">공지사항</a></li>
										<li class="th1"><a class="th1_lnk" href="join.do">회원가입</a></li>
										<li class="th1"><a class="th1_lnk" href="loginForm.do">로그인</a></li>
									</ul>
									<%
										} else if (ID1 != null) {
									%>
									<ul id="tm">
										<li class="th1"><a class="th1_lnk" href="home.do">홈페이지</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectNoticeList.do">공지사항</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectInquiryList.do">문의사항</a></li>
										<li class="th1"><a class="th1_lnk" href="mypage.do">관리자페이지</a>
										</th>
										<li class="th1"><a class="th1_lnk"
											href="selectRsvtList.do">예약현황</a>
										</th>
										<li class="th1"><a class="th1_lnk" href="logout.do">로그아웃</a>
										</th>
									</ul>
									<%
										} else {
									%>
									<ul id="tm">
										<li class="th1"><a class="th1_lnk" href="home.do">홈페이지</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectNoticeList.do">공지사항</a></li>
										<li class="th1"><a class="th1_lnk"
											href="selectInquiryList.do">문의사항</a></li>
										<li class="th1"><a class="th1_lnk" href="mypage.do">마이페이지</a>
										</th>
										<li class="th1"><a class="th1_lnk" href="insertRsvt.do">예약하기</a>
										</th>
										<li class="th1"><a class="th1_lnk" href="logout.do">로그아웃</a>
										</th>
									</ul>
									<%
										}
									%>
								</tr>
							</table>


							<!--END-->
							<!-- PC 메뉴 생성 -->
						</div>
					</div>
				</div>
			</nav>
			<script type="text/javascript">
                  var param = "#gnbwrap";
                  var obj = ".th2";
                  var btn = ".th1>a";
                  var wrap = "#animate";
                  var elem = 01; // th1 메뉴코드, index로 사용
                  var scale = 1000; // 입력한 해상도 이하애서 실행 안함
                  var dur = 1000; // 애니메이션 진행 속도
                  var meth = "easeOutExpo"; // 애니메이션 진행 타입
                  var mno = "";
                  gnb(param,obj,btn,wrap,elem,scale,dur,meth,mno);
              </script>
		</header>

		<!-- shadow-->
		<div id="gnbShadow"></div>

		<!-- //header  -->

		<!-- container -->
		<a href="#none" name="sub_container" title="본문으로 바로가기" class="hid"
			tabindex="-1"></a>
		<div id="sub_container_wrap">
			<div class="sub_content_wrap">

				<!-- sub Content -->
				<div id="sub_container">
					<section id="sub_content">
						<div class="title_area">
							<div class="location">
								<a href="/gneti/main.do" class="home"> <i class="xi-home"
									aria-hidden="true"></i> <span class="hid">홈</span>
								</a> <span id="menuTitle" style="display: none;">예약안내</span> <span
									id="currMenuId" style="display: none;">12611</span>
							</div>
							<h1 class="pageTitle">예약안내</h1>



							<link href="./css/web/common/print.css" rel="stylesheet"
								type="text/css" media="print" />
							<script type="text/javascript">
function goPrint() {
	var popW = 763;  
	var popH = 632; 
	var popX  = (document.body.clientWidth / 2) - (popW / 2) + window.screenLeft; // 팝업창 X 좌표 계산
	var popY  = (document.body.clientHeight / 2) - (popH) + window.screenTop; // 팝업창 Y 좌표 계산
	var referer = encodeURIComponent(location.href); 
	
	window.open("/gneti/pr/printPage.do?referer="+referer, "printPage",'top='+popY+',left='+popX+',width='+popW+',height='+popH+',scrollbars=yes');	

}

function goSns(shareTy){ 
	var htmlTitle = '경상남도교육청교육연수원';
	var title = ''; // 메뉴타이틀의 경우 스크립트 추가되어 오류  <span>알림·참여</span>;
	var menuTitle = '행사안내';
	var mi = '12611';
	var _br2  = encodeURIComponent('\n'); 
	var linkUrl = location.href;
	
	if(linkUrl.indexOf('?') > -1) {
		if(linkUrl.indexOf('mi=') < 0) {
			linkUrl = linkUrl + '&mi=' +mi	
		}
	} else {
		if(linkUrl.indexOf('mi=') < 0) {
			linkUrl = linkUrl + '?mi=' +mi	
		}
	}
	
	linkUrl = encodeURIComponent(linkUrl);
	
	if(menuTitle != '메뉴명없음') {
		title = htmlTitle + ' : ' + menuTitle;
	} else {
		title = htmlTitle;
	}
	
	title = encodeURIComponent(title);

	if(shareTy == "fbook") {
		window.open('https://www.facebook.com/sharer/sharer.php?u='+ linkUrl, 'facebook', 'width=626,height=436,noreferrer');
	} else if(shareTy == "twt") {
		window.open('https://twitter.com/intent/tweet?url='+ linkUrl + '&text=' + title + '&original_referer=' + linkUrl, 'twitter', 'width=626,height=436,noreferrer');
	} else if(shareTy == "kkot") {
		window.open('https://story.kakao.com/s/share?url='+ linkUrl + '&text=' + title, 'kakaostory', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600,noreferrer');
	} else if(shareTy == "band") {
		window.open('http://band.us/plugin/share?body='+ title + _br2 + linkUrl + '&route=' + linkUrl, 'band', 'width=410, height=540, resizable=no,noreferrer');
	} else if(shareTy == "blog") {
		window.open('https://share.naver.com/web/shareView.nhn?url='+ linkUrl + '&title='+title, 'band', 'width=410, height=540, resizable=no,noreferrer');
	}
}
</script>
						</div>
						<!-- 서브 페이지 내용 -->
						<div class="subCntBody clearfix">
							<!-- 서브콘텐츠 -->

							<div id="cntntsView">






								<div class="sv_calendar_view">


									<link rel="stylesheet" type="text/css"
										href="./css/co/sv/webcalendar.css?v=20230213" />


									<!-- 날짜 -->
									<div class="calendar2">
										<div class="calendar-left">
											<button id="caltoday" class="prev button-left button-today"
												onclick="javascript:callResvCal('2023/09/08')">오늘</button>
											<button class="prev"
												onclick="javascript:callResvCal('2023/08/01')">이전달</button>
											<button class="next button-right"
												onclick="javascript:callResvCal('2023/10/01')">다음달</button>
										</div>
										<div class="calendar-center">
											<span class="calendar_date"><h2>2023년09월</h2></span> <input
												type="hidden" class="year" value="2023"> <input
												type="hidden" class="month" value="09">
										</div>
									</div>
									<!-- //날짜 -->

									<!-- 달력 -->
									<table class="common_calendar">
										<caption>행사안내</caption>
										<colgroup>
											<col style="width: 14.2%;">
											<col style="width: 14.3%;">
											<col style="width: 14.3%;">
											<col style="width: 14.3%;">
											<col style="width: 14.3%;">
											<col style="width: 14.3%;">
											<col style="width: 14.3%;">
										</colgroup>
										<thead>
											<tr>
												<th class="sun" scope="col">일</th>
												<th scope="col">월</th>
												<th scope="col">화</th>
												<th scope="col">수</th>
												<th scope="col">목</th>
												<th scope="col">금</th>
												<th scope="col">토</th>
											</tr>
										</thead>
										<tbody>
											<tr>

												<td></td>

												<td></td>

												<td></td>

												<td></td>

												<td></td>

												<td><input type="hidden" name="date" value="2023/09/01">
													<ul>

														<li class="day">1</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/02">
													<ul>

														<li class="sat">2</li>
													</ul></td>

											</tr>
											<tr class="week">

												<td><input type="hidden" name="date" value="2023/09/03">
													<ul>

														<li class="sun">3</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/04">
													<ul>

														<li class="day">4</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/05">
													<ul>

														<li class="day">5</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/06">
													<ul>

														<li class="day">6</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/07">
													<ul>

														<li class="day">7</li>

													</ul></td>

												<td class="today"><div class="hid">오늘</div> <input
													type="hidden" name="date" value="2023/09/08">
													<ul>

														<li class="day">8</li>
														<li style="background-color: #FF0000"><a
															class="event" href="#" title="일정 상세보기"
															onkeydown="javascript:moveDetail(event,'Rsvt');"
															onclick="javascript:schdulInfo('Rsvt'); return false;">상담</a></li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/09">
													<ul>

														<li class="sat">9</li>
													</ul></td>

											</tr>
											<tr class="week">

												<td><input type="hidden" name="date" value="2023/09/10">
													<ul>

														<li class="sun">10</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/11">
													<ul>

														<li class="day">11</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/12">
													<ul>

														<li class="day">12</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/13">
													<ul>

														<li class="day">13</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/14">
													<ul>

														<li class="day">14</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/15">
													<ul>

														<li class="day">15</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/16">
													<ul>

														<li class="sat">16</li>
													</ul></td>

											</tr>
											<tr class="week">

												<td><input type="hidden" name="date" value="2023/09/17">
													<ul>

														<li class="sun">17</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/18">
													<ul>

														<li class="day">18</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/19">
													<ul>

														<li class="day">19</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/20">
													<ul>

														<li class="day">20</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/21">
													<ul>

														<li class="day">21</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/22">
													<ul>

														<li class="day">22</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/23">
													<ul>

														<li class="sat">23</li>
													</ul></td>

											</tr>
											<tr class="week">

												<td><input type="hidden" name="date" value="2023/09/24">
													<ul>

														<li class="sun">24</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/25">
													<ul>

														<li class="day">25</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/26">
													<ul>

														<li class="day">26</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/27">
													<ul>

														<li class="day">27</li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/28">
													<ul>

														<li class="day">28</li>

														<li style="background-color: #FF0000"><a
															class="event" href="#" title="일정 상세보기"
															onkeydown="javascript:moveDetail(event,'holiday');"
															onclick="javascript:schdulInfo('holiday'); return false;">추석연휴</a></li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/29">
													<ul>

														<li class="day">29</li>

														<li style="background-color: #FF0000"><a
															class="event" href="#" title="일정 상세보기"
															onkeydown="javascript:moveDetail(event,'holiday');"
															onclick="javascript:schdulInfo('holiday'); return false;">추석</a></li>
													</ul></td>

												<td><input type="hidden" name="date" value="2023/09/30">
													<ul>

														<li class="sat">30</li>

														<li style="background-color: #FF0000"><a
															class="event" href="#" title="일정 상세보기"
															onkeydown="javascript:moveDetail(event,'holiday');"
															onclick="javascript:schdulInfo('holiday'); return false;">추석연휴</a></li>
													</ul></td>

											</tr>
										</tbody>
									</table>
								</div>

								<form id="schdulManageForm" name="schdulManageForm"
									method="post">
									<input type="hidden" name="mi" value="12611"> <input
										type="hidden" id="sysId" name="sysId" value="gneti"> <input
										type="hidden" id="year" name="year" value=""> <input
										type="hidden" id="month" name="month" value=""> <input
										type="hidden" id="schdulSeq" name="schdulSeq" value="">
									<input type="hidden" id="date" name="date" value="">
								</form>

								<script type="text/javascript">
//이전달 / 다음달
function callResvCal(iDate) {
	
	if (!!iDate)
		$("#date").val(iDate);
 	
 	$.ajax({
		type : "POST",
    datatype : "json",
		data : $("#schdulManageForm").serialize(),
	  	 url : "/gneti/sv/schdulView/webSchdulCalendar.do",
	 success : function(obj) {
			$(".sv_calendar_view").empty();
			$(".sv_calendar_view").html(obj);
			
			 var dateObj = new Date();
			 var year = dateObj.getFullYear();
			 var month = ("0" + (dateObj.getMonth() + 1)).slice(-2);	 
			 var day = ("0" + dateObj.getDate()).slice(-2);;
			 var today = year + "/" + month + "/" + day;
			 
			 if(today == iDate){
				 $('#caltoday').addClass('button-today');
			 }else{
				 $('#caltoday').removeClass('button-today');
			 }
			 
		},
	   error : function(data) {
				alert("9월 고정값입니다.");
		}
	});
 	
 	
}
function moveDetail(event,schdulSeq) {
	var event=(event.keyCode ? event.keyCode : event.which);
	if(event == "13"){
		if(schdulSeq != "holiday"){
			$("#schdulSeq").val(schdulSeq);
			$("#schdulManageForm").attr("action", "/gneti/sv/schdulView/schdulDetailView.do?mi=").submit();
		}else{
			alert("기본 공휴일은 상세보기가 없습니다.");			
		}
	}
}
function schdulInfo(schdulSeq) {
	if(schdulSeq != "holiday"){
	$("#schdulSeq").val(schdulSeq);
	$("#schdulManageForm").attr("action", "/gneti/sv/schdulView/schdulDetailView.do?mi=12611").submit();
	}else{
		alert("기본 공휴일은 상세보기가 없습니다.");
	}
}

function moveDetail(event,schdulSeq) {
	var event=(event.keyCode ? event.keyCode : event.which);
	if(event == "13"){
		if(schdulSeq != "Rsvt"){
			$("#schdulSeq").val(schdulSeq);
			$("#schdulManageForm").attr("action", "/gneti/sv/schdulView/schdulDetailView.do?mi=").submit();
		}else{
			alert("15:00 ~ 16:00, 2-1 준영아빠.");			
		}
	}
}
function schdulInfo(schdulSeq) {
	if(schdulSeq != "Rsvt"){
	$("#schdulSeq").val(schdulSeq);
	$("#schdulManageForm").attr("action", "/gneti/sv/schdulView/schdulDetailView.do?mi=12611").submit();
	}else{
		alert("15:00 ~ 16:00, 2-1 준영아빠.");
	}
}


</script>
							</div>
							<!-- //서브콘텐츠 -->
						</div>
						<!-- //서브 페이지 내용 끝 -->
					</section>
				</div>
				<!-- //sub Content 끝 -->
			</div>
			<!-- //container -->
			<!-- footer -->



			<footer id="footer">
				<div class="area_footer">
					<div class="box_footer">
						<div class="box_footer_left">
							<div class="footer_link">
								<div class="footer_link">
									<ul>
										<li class="point"><a
											href="/gneti/na/ntt/selectNttList.do?mi=12583&bbsId=4888">개인정보처리방침</a></li>
										<li><a
											href="/gneti/cm/cntnts/cntntsView.do?mi=12569&cntntsId=6640">찾아오시는길</a></li>
									</ul>
								</div>
							</div>
							<div class="box_info clearfix">
								<address>주소 : (우) 대구광역시 알파시티1로 170 TEL : 055-279-9001</address>
								<p class="copyright">Copyright ⓒ 대구디지털혁신진흥원 All rights
									reserved.</p>
							</div>
						</div>
					</div>

					<!-- top 버튼 위치이동 -->
					<div class="btn_top">
						<a href="" class="top"><i class="xi-arrow-up"
							aria-hidden="true"></i>TOP</a>
					</div>
				</div>
			</footer>


			<!-- // footer -->
		</div>
	</div>
</body>
</html>