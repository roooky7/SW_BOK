<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정 화면</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".btn-primary").click(
						function() {
							event.preventDefault();
							var s_parents_pwd = $("#s_parents_pwd").val()
							s_parents_pwd = $.trim(s_parents_pwd);
							var s_parents_pwd_check = $("#s_parents_pwd_check")
									.val();

							if (s_parents_pwd === "") {
								alert("비밀번호를 입력해주세요.");
								$("#s_parents_pwd").focus();
								return false;
							} else if (s_parents_pwd.length < 4
									|| !/[A-Za-z]/.test(s_parents_pwd)
									|| !/\d/.test(s_parents_pwd)) {
								alert("비밀번호는 영문과 숫자 조합으로 4자 이상이어야 합니다.");
								$("#s_parents_pwd").focus();
								return false;
							} else if (s_parents_pwd !== s_parents_pwd_check) {
								alert("비밀번호가 일치하지 않습니다.");
								$("#s_parents_pwd_check").focus();
								return false;
							}
							$("#s_parents_id").val(s_parents_id);
							$("#s_parents_pwd").val(s_parents_pwd);
							/*         $("#s_parents_nm").val(s_parents_nm);
							 $("#s_parents_cttpc").val(s_parents_cttpc); */

							// 폼이 모두 유효하면 폼을 제출
							$("form").submit();
							alert("회원정보 수정 완료! 재로그인 해주세요");
						});
			});
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
<style>
@font-face {
	font-family: 'S-Core Dream';
	src: url('font/SCDream4.otf') format('opentype');
}

body#LoginForm {
	background-color: #d6e5ff;
	font-family: 'S-Core Dream', sans-serif;
}

.form-heading {
	color: #fff;
	font-size: 23px;
}

.panel h2 {
	color: #444444;
	font-size: 18px;
	margin: 0 0 8px 0;
}

.panel p {
	color: #777777;
	font-size: 14px;
	margin-bottom: 30px;
	line-height: 24px;
}

.login-form .form-control {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 14px;
	height: 35px;
	/* line-height: 50px; */
}

.login-form .form-aa {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 14px;
	height: 50px;
	/* line-height: 50px; */
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 10px;
	/* Adjust the value to control the border roundness */
	margin: 10px auto 30px;
	max-width: 40%; /* 변경된 가로 크기를 원하는 값으로 조절하세요 */
	padding: 50px 70px 70px 71px;
	border: 3px solid darkgray; /* 진한 회색 테두리 설정 */
}

.login-type-selection {
	text-align: center; /* 가운데 정렬을 설정합니다. */
	margin-top: 20px; /* 원하는 여백을 조절하세요. */
}

.login-form .form-group {
	margin-bottom: 10px;
}

.login-form {
	text-align: center;
}

.forgot a {
	color: #777777;
	font-size: 14px;
	text-decoration: underline;
}

.login-form  .btn.btn-primary {
	background: #0073d0 none repeat scroll 0 0;
	border-color: #0073d0;
	color: #ffffff;
	font-size: 14px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0;
}

.login-form  .btn.btn-primary1 {
	background: #00008b none repeat scroll 0 0;
	border-color: #00008b;
	color: #ffffff;
	font-size: 14px;
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0;
}

.botto-text {
	color: #ffffff;
	font-size: 14px;
	margin: auto;
}

.login-form .btn.btn-primary.reset {
	background: #ff9900 none repeat scroll 0 0;
}

.login-form .btn.btn-primary1.reset {
	background: #ff9900 none repeat scroll 0 0;
}

.back {
	text-align: left;
	margin-top: 10px;
}

.back a {
	color: #444444;
	font-size: 13px;
	text-decoration: none;
}
</style>

<body>

	<header id="header">
		<div id="snb">
			<h1>
				<a href="./home.do" hidden=""> <img
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

	<div id="LoginForm">

		<div class="container">
			<div class="login-form">
				<div class="main-div">
					<div class="panel">
						<h1 style="font-size: 50px;">회원정보 수정</h1>
						<br>
						<!--    <p>아이디와 비밀번호를 입력하세요.</p> -->
					</div>
					<form id="Login" action="updateForm2.do" method="post">

						<div class="form-group">
							<input type="text" class="form-control" name="s_parents_id"
								id="s_parents_id" value="Id : ${s_parents.s_parents_id}"
								disabled="disabled"> <input type="hidden"
								name="s_parents_id" value="${s_parents.s_parents_id}">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="s_parents_pwd"
								id="s_parents_pwd" placeholder="Password"> <label>*영문,숫자
								조합 4자리 이상</label>
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								id="s_parents_pwd_check" placeholder="Password check">
						</div>
						<div class="form-group">
							연락처 <input type="text" class="form-control"
								name="s_parents_cttpc" id="s_parents_cttpc"
								value="${s_parents.s_parents_cttpc}">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="s_parents_nm"
								id="s_parents_nm" value="닉네임: ${s_parents.s_parents_nm}"
								disabled="disabled">
						</div>
						<%--         <div class="form-group" > 이름 
                  <input type="text"  name="s_parents_nm" class="form-control"
                     id="s_parents_nm" value="${s_parents.s_parents_nm}">
               </div> --%>
						<div class="form-group">
							<input type="text" class="form-control" name="chldren_nm"
								id="chldren_nm" value="자녀 이름 : ${s_parents.chldren_nm}"
								disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="chldren_schl"
								id="chldren_schl" value="자녀 학교 : ${s_parents.chldren_schl}"
								disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								value="관계 : ${s_parents.rel}" disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								value="자녀 학년 : ${s_parents.chldren_grade}학년" disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								value="자녀 반 : ${s_parents.chldren_clas}반" disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								value="자녀 성별 : ${s_parents.chldren_sexdstn}" disabled="disabled">
						</div>
						<div class="form-group">
							<input type="text" class="form-control"
								value="자녀 생년월일 : ${s_parents.chldren_brdt}" disabled="disabled">
						</div>
						<br>
						<div class="div_button">
							<button type="submit" class="btn btn-primary">수정</button>

						</div>
						<br> *비밀번호, 연락처만 수정가능 <br> *회원정보 관련 문의는 각 반 교사에 문의해주시기
						바랍니다.
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>