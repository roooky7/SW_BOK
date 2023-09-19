<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.project.service.NoticeVO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<style>
@font-face {
	font-family: 'S-Core Dream';
	src: url('font/SCDream4.otf') format('opentype');
}

.important-row {
	color: red;
}

.normal-row {
	color: black;
}

/* 폰트 적용 */
body {
	font-family: 'S-Core Dream', sans-serif;
	font-size: 1em;
}

.rwd-table {
	margin: auto;
	min-width: 800px;
	max-width: 800px;
	border-collapse: collapse;
}

.rwd-table tr:first-child {
	border-top: 3px solid #22499d;
	background: #f8fafc;
	color: #000000;
}

.rwd-table tr {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	background-color: #f5f9fc;
}

.rwd-table tr:nth-child(odd):not(:first-child) {
	background-color: #ebf3f9;
}

.rwd-table th {
	display: none;
}

.rwd-table td {
	display: block;
	background-color: white;
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

.rwd-table th, .rwd-table td {
	padding: .5em 1em;
}

@media screen and (max-width: 601px) {
	.rwd-table tr:nth-child(2) {
		border-top: none;
	}
}

@media screen and (min-width: 600px) {
	.rwd-table tr:hover:not(:first-child) {
		background-color: #ffffcc;
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
	.rwd-table th, .rwd-table td {
		padding: 1em !important;
		text-align: center;
	}
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
	bottom: -1.5px;
	-webkit-animation: leftRight 2s linear infinite;
	animation: leftRight 2s linear infinite;
}

h6:after {
	content: "\25C0";
	position: absolute;
	font-size: 1em;
	right: -30px;
	bottom: -1.5px;
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
/* 검색 부분 스타일 */
.search-container {
	text-align: center;
	margin-top: 20px;
}

.search-select {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-right: 10px;
	font-family: 'S-Core Dream', sans-serif;
}

.search-input {
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-right: 10px;
	font-family: 'S-Core Dream', sans-serif;
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
</style>
<script type="text/javascript">
	function fn_egov_link_page(pageNo) {
		var searchCondition = "${searchCondition}";
		var searchKeyword = "${searchKeyword}";

		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/selectNoticeList.do'/>";
		document.listForm.action = document.listForm.action
				+ "?searchCondition=" + encodeURIComponent(searchCondition)
				+ "&searchKeyword=" + encodeURIComponent(searchKeyword);
		document.listForm.submit();
	}
</script>

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

</head>

<title><spring:message code="list.Title" /></title>
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

	<form:form commandName="vo" id="listForm" name="listForm" method="post">
		<div class="container">

			<h1 style="font-size: 50px;">
				<spring:message code="list.mainTitle" />
			</h1>

			<table class="rwd-table">
				<tbody>
					<tr>
						<th><spring:message code="list.list.table.id" /></th>
						<th><spring:message code="list.list.table.title" /></th>
						<th><spring:message code="list.list.table.regUser" /></th>
						<th><spring:message code="list.list.table.regDate" /></th>
						<th><spring:message code="list.list.table.readCount" /></th>
					</tr>
					<c:forEach var="notice" items="${noticeList}">
						<tr
							class="${notice.sort_order == 1 ? 'important-row' : 'normal-row'}">
							<td align="center">${notice.RN}</td>
							<td align="center"><a
								class="${notice.sort_order == 1 ? 'important-row' : 'normal-row'}"
								href="selectNotice.do?ntc_no=${notice.ntc_no}&rn=${notice.RN}">${notice.ntc_ttl}</a>
							</td>
							<td align="center">${notice.ntc_writer}</td>
							<td align="center">${notice.ntc_ymd}</td>
							<td align="center">${notice.ntc_cnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			<div id="paging" class="paging">
				<ui:pagination paginationInfo="${paginationInfo}" type="image"
					jsFunction="fn_egov_link_page" />
				<form:hidden path="pageIndex" />
			</div>
			<br> <br>
			<div>
				<c:choose>
					<c:when test="${teacher != null}">
						<h6>
							<a href="insertNotice.do" class="search-button"><spring:message
									code="list.link.create" /></a>
						</h6>
					</c:when>
				</c:choose>
			</div>
	</form:form>
	<form action="selectNoticeList.do" method="get">
		<div class="search-container">
			<select name="searchCondition" class="search-select">
				<option value="ntc_ttl"><spring:message
						code="list.search.title" /></option>
				<option value="ntc_cn"><spring:message
						code="list.search.condition" /></option>
			</select> <input name="searchKeyword" type="text" class="search-input" />
			<button type="submit" class="search-button">
				<spring:message code="list.search.button" />
			</button>
		</div>
		<br> <br>
	</form>
	<a href="selectNoticeList.do?lang=en"><img src="img/usa.png"
		width=50px /></a>&nbsp;&nbsp;&nbsp;
	<a href="selectNoticeList.do?lang=ko"><img src="img/kk.png"
		width=50px /></a>&nbsp;&nbsp;&nbsp;
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
