<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약 페이지</title>
<script type="text/javascript">
	$.ajax

	$(function() {
		$("#tDatepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd', // 출력 형식 설정
					language : 'kr', // 언어 설정 (한국어)
					autoclose : true, // 선택 후 자동으로 닫힘
					todayHighlight : true // 오늘 날짜 강조
					,
					showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
					,
					showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
					,
					changeYear : true //option값 년 선택 가능
					,
					changeMonth : true //option값  월 선택 가능                
					,
					showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
					,
					buttonText : "선택" //버튼 호버 텍스트              
					,
					yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
					,
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 텍스트
					,
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip
					,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 텍스트
					,
					dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
							'토요일' ] //달력의 요일 Tooltip
					,
					minDate : "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
					,
					maxDate : "1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
				});
	});
	$(function() {
		$('#stimepicker').timepicker({
			timeFormat : 'HH:mm:ss',
			interval : 60,
			minTime : '09:00:00',
			maxTime : '17:00:00',
			defaultTime : '09:00:00',
			//dynamic: true,
			dropdown : true,
			scrollbar : true,
			change : onChange
		});
	});

	function onChange() {
		var start_time = $('#stimepicker').val();

		switch (start_time) {
		case '09:00:00':
			$('#etimepicker').val('10:00:00');
			break;
		case '10:00:00':
			$('#etimepicker').val('11:00:00');
			break;
		case '11:00:00':
			$('#etimepicker').val('12:00:00');
			break;
		case '12:00:00':
			$('#etimepicker').val('13:00:00');
			break;
		case '13:00:00':
			$('#etimepicker').val('14:00:00');
			break;
		case '14:00:00':
			$('#etimepicker').val('15:00:00');
			break;
		case '15:00:00':
			$('#etimepicker').val('16:00:00');
			break;
		case '16:00:00':
			$('#etimepicker').val('17:00:00');
			break;
		case '17:00:00':
			$('#etimepicker').val('18:00:00');
			break;
		}
	}
</script>
<style>
@font-face {
	font-family: 'S-Core Dream';
	src: url('font/SCDream4.otf') format('opentype');
}

body {
	font-family: 'S-Core Dream', sans-serif;
	background: #d6e5ff;
}

.rwd-table {
	margin: auto;
	min-width: 800px;
	max-width: 800px;
	border-collapse: collapse;
}

.rwd-table tr {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	background-color: #f5f9fc;
}

.rwd-table th {
	width: 150px;
	font-size: 1.5em;
	background-color: #f8fafc;
	color: #000000;
	padding: .5em 1em;
	border-left: 3px solid #22499d;
	padding: 1em !important;
	text-align: center;
}

.rwd-table td {
	display: block;
	font-size: 1em;
	background-color: white;
	padding: .5em 1em;
	color: #000000;
}

.rwd-table td:first-child {
	margin-top: .5em;
}

.rwd-table td:last-child {
	margin-bottom: .5em;
}

.rwd-table td:before {
	content: attr(data-th) ": ";
	font-weight: bold;
	width: 120px;
	display: inline-block;
	color: #000;
}

.rwd-table th, .rwd-table td {
	text-align: left;
}

.rwd-table {
	color: #333;
	border-radius: .4em;
	overflow: hidden;
}

.rwd-table tr {
	border-color: #bfbfbf;
}

.rwd-table tr td:first-child {
	color: #0000FF; /* 남색을 나타내는 CSS 색상 코드 (#0000FF) */
}

.rwd-table td:before {
	display: none;
}

.rwd-table th, .rwd-table td {
	padding: .25em .5em;
}

.rwd-table th:first-child, .rwd-table td:first-child {
	padding-left: 0;
}

.rwd-table th:last-child, .rwd-table td:last-child {
	padding-right: 0;
}

.rwd-table td {
	padding: 1em !important;
	text-align: left;
}

h1 {
	text-align: center;
	font-size: 3.5em;
	color: #000080;
}

.container {
	display: block;
	text-align: center;
}

h6 {
	display: inline-block;
	position: relative;
	text-align: center;
	font-size: 0.8em;
	font-size: 1em;
	color: #000080;
}

h6:before {
	content: "\25b6";
	position: absolute;
	font-size: 1em;
	left: -30px;
	bottom: 9px;
	-webkit-animation: leftRight 2s linear infinite;
	animation: leftRight 2s linear infinite;
}

h6:after {
	content: "\25C0";
	position: absolute;
	font-size: 1em;
	right: -30px;
	bottom: 9px;
	-webkit-animation: leftRight 2s linear infinite reverse;
	animation: leftRight 2s linear infinite reverse;
}

@
-webkit-keyframes leftRight { 0% {
	-webkit-transform: translateX(0)
}

25






















































































%
{
-webkit-transform






















































































:






















































































translateX




















































































(






















































































-10px






















































































)






















































































}
75






















































































%
{
-webkit-transform






















































































:






















































































translateX




















































































(






















































































10px






















































































)






















































































}
100






















































































%
{
-webkit-transform






















































































:






















































































translateX




















































































(






















































































0






















































































)






















































































}
}
@
keyframes leftRight { 0% {
	transform: translateX(0)
}

25






















































































%
{
transform






















































































:






















































































translateX




















































































(






















































































-10px






















































































)






















































































}
75






















































































%
{
transform






















































































:






















































































translateX




















































































(






















































































10px






















































































)






















































































}
100






















































































%
{
transform






















































































:






















































































translateX




















































































(






















































































0






















































































)






















































































}
}
.search-button {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #00008B;
	color: #ffffcc;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	font-family: 'S-Core Dream', sans-serif;
}

.search-button:hover {
	background-color: #0000FF;
}

textarea {
	font-family: 'S-Core Dream', sans-serif;
	font-size: 20px;
	width: 500px; /* 원하는 너비로 조절 */
	height: 100px;
}
</style>

<link rel="stylesheet" href="./css/web/gneti/common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/con_common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/layout.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/main.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/main_widget.css"
	media="all">
<!-- <link rel="stylesheet" href="./css/com/jquery/jquery-ui.min.css"
	media="all"> -->

<script type="text/javascript" src="./js/gne/html5shiv.js"></script>
<!-- <script type="text/javascript" src="./js/gne/jquery.min.js"></script> -->
<script type="text/javascript" src="./js/gne/jquery.easing.1.3.js"></script>
<!-- <script type="text/javascript" src="./js/gne/jquery-ui.min.js"></script> -->
<script type="text/javascript" src="./js/gne/jquery.form.min.js"></script>
<script type="text/javascript" src="./js/web/gneti/common.js?v=20221217"></script>
<script type="text/javascript" src="./js/web/gneti/slick.min.js"></script>
<script type="text/javascript" src="./js/web/gneti/main.js"></script>
<script type="text/javascript" src="./js/web/gneti/topmenu.js"></script>
<!--메뉴동작-->
<script type="text/javascript" src="./js/gne/script.js"></script>
<!--자주사용 스크립트-->
<script type="text/javascript" src="./js/gne/common-scroll.js"></script>
<!--스크롤롤링-->
<script type="text/javascript" src="./js/gne/modernizr-2.6.2.min.js"></script>
<!--익스8이하지원-->
<script type="text/javascript" src="./js/gne/noOpenerReferrer.js"></script>

<style>
@font-face {
	font-family: 'S-Core Dream';
	src: url('font/SCDream4.otf') format('opentype');
}

.normal-row {
	color: black;
}

/* 폰트 적용 */
body {
	font-family: 'S-Core Dream', sans-serif;
	font-size: 1em;
}

/* Basic Styling */
body {
	background: #d6e5ff;
}

h1 {
	text-align: center;
	font-size: 50px;
	color: #000080;
}
</style>

</head>
<body>
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
		<!-- <script type="text/javascript">
			var param = "#gnbwrap";
			var obj = ".th2";
			var btn = ".th1>a";
			var wrap = "#animate";
			var elem = 01; // th1 메뉴코드, index로 사용
			var scale = 1000; // 입력한 해상도 이하애서 실행 안함
			var dur = 1000; // 애니메이션 진행 속도
			var meth = "easeOutExpo"; // 애니메이션 진행 타입
			var mno = "";
			gnb(param, obj, btn, wrap, elem, scale, dur, meth, mno);
		</script> -->
	</header>






	<h1 style="font-size: 50px;">예약 상담</h1>
	<form action="insertRsvt.do" id="insert" method="post">
		<table class="rwd-table">
			<!-- <tbody> -->

			<tr>
				<th>예약 제목</th>
				<td><input name="pst_ttl_nm" type="text" size="30" /></td>
			</tr>

			<tr>
				<th>학부모</th>
				<td><input name="s_parents_id"
					value="${s_parents.s_parents_id}" type="text" size="10"
					readonly="readonly" /></td>
			</tr>

			<!-- 	<tr>
					<th>예약 일시</th>
					<td><input type="text" id="tDatepicker" size="10" /> -날짜를
						선택해주세요.</td>
					<td><h4>
							<input type="text" name="START_TIME" id="stimepicker" value=""
								maxlength="10" class="setDatePicker">~<input type="text"
								name="END_TIME" id="etimepicker" value="" maxlength="10"
								class="setDatePicker">
						</h4>-예약된 날짜는 캘린더로 확인 할 수 있습니다.</td>
				</tr> -->
			<tr>
				<th>예약 일시</th>
				<td align="left"><input type="text" name="rsvt_dt"
					id="tDatepicker" size="10" /> <input type="text" name="rsvt_hr"
					id="stimepicker" value="" maxlength="10" class="setDatePicker" />
					~ <input type="text" name="rsvt_fhr" id="etimepicker" value=""
					maxlength="10" class="setDatePicker" readonly="readonly" /></td>
			</tr>

			<tr>
				<th>교사</th>
				<td><input name="teacher_id" type="text" size="10" />${teacher.teacher_nm}</td>
			</tr>

			<tr>
				<th>문의 내용</th>
				<td><textarea rows="5" cols="40" name="rsvt_cn"></textarea></td>
			</tr>

			<!-- </tbody> -->
		</table>
		<div style="text-align: center; margin-top: 10px;">

			<h6>
				<input class="search-button" type="submit" value="등록">
			</h6>
		</div>
	</form>
	<br>
	<br>
	<div style="text-align: center; margin-top: 10px;">
		<a href="selectRsvtList.do" class="search-button">예약목록</a>
	</div>

</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
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
			<a href="" class="top"><i class="xi-arrow-up" aria-hidden="true"></i>TOP</a>
		</div>
	</div>
</footer>
</html>