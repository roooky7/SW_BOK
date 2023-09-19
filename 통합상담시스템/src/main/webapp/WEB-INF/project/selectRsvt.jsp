<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.project.service.RsvtVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>

<link rel="stylesheet" href="./css/web/gneti/common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/con_common.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/layout.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/main.css" media="all">
<link rel="stylesheet" href="./css/web/gneti/main_widget.css"
	media="all">
<link rel="stylesheet" href="./css/com/jquery/jquery-ui.min.css"
	media="all">

<script type="text/javascript" src="./js/gne/html5shiv.js"></script>
<script type="text/javascript" src="./js/gne/jquery.min.js"></script>
<script type="text/javascript" src="./js/gne/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="./js/gne/jquery-ui.min.js"></script>
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
	width: 130px;
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
	font-family: 'S-Core Dream', sans-serif;
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
	color: #0000FF;
}

.rwd-table td:before {
	display: none;
}

.rwd-table th, .rwd-table td {
	display: table-cell;
	padding: .25em .5em;
}

.rwd-table th:first-child, .rwd-table td:first-child {
	padding-left: 0;
}

.rwd-table th:last-child, .rwd-table td:last-child {
	padding-right: 0;
}

.rwd-table th {
	padding: 1em !important;
	text-align: center;
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
	bottom: 9px;
	right: -30px;
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

textarea {
	font-size: 20px;
	width: 500px;
	height: 100px;
	font-family: 'S-Core Dream', sans-serif;
}

option {
	font-family: 'S-Core Dream', sans-serif;
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
			gnb(param, obj, btn, wrap, elem, scale, dur, meth, mno);
		</script>
	</header>



	<h1 style="font-size: 50px;">상담 예약 페이지</h1>

	<form action="updateRsvt.do" method="post">
		<input type="hidden" name="id" value="${rsvt.rsvt_no}">

		<table class="rwd-table">
			<tbody>

				<tr>
					<td>글 번호</td>
					<td><input name="rsvt_no" type="text" value="${rsvt.rsvt_no}"
						disabled="disabled" /></td>
				</tr>

				<tr>
					<td>제목</td>
					<td><input name="pst_ttl_nm" type="text"
						value="${rsvt.rsvt_cn}" size="52" /></td>
				</tr>

				<tr>
					<td>학부모</td>
					<td>${rsvt.s_parents_id}</td>
				</tr>

				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="40" name="rsvt_cn">${rsvt.rsvt_cn}</textarea></td>
				</tr>

				<tr>
					<td>등록일</td>
					<td>${rsvt.rsvt_dt}</td>
				</tr>
			</tbody>

		</table>
	</form>

	<br>


	<div class="center" style="text-align: center; margin-top: 10px;">

		<tr>
			<div>
				<c:choose>
					<c:when
						test="${s_parents != null && s_parents.s_parents_id==rsvt.s_parents_id}">
						<h6>
							<input type="submit" class="search-button" value="수정">
						</h6>
					</c:when>
				</c:choose>
			</div>
		</tr>
		<br> <br>

		<c:choose>
			<c:when test="${s_parents != null}">
				<a href="insertRsvt.do" class="search-button">등록</a>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when
				test="${s_parents != null && s_parents.s_parents_id==rsvt.s_parents_id}">
				<a href="deleteRsvt.do?rsvt_no=${rsvt.rsvt_no}"
					class="search-button">삭제</a>
			</c:when>
		</c:choose>
		<a href="selectRsvtList.do" class="search-button">목록</a>
	</div>


</body>
</html>