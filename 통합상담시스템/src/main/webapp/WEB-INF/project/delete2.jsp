<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-primary").on("click", function(event) {
			event.preventDefault(); // Prevent the default form submission

			var s_parents_pwd = $("#s_parents_pwd").val()
			s_parents_pwd = $.trim(s_parents_pwd);
			var s_parents_pwd_check = $("#s_parents_pwd_check").val();

			if (s_parents_pwd === "") {
				alert("비밀번호를 입력해주세요");
				$("#s_parents_pwd").focus();
				return false;
			} else if (s_parents_pwd !== s_parents_pwd_check) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#s_parents_pwd_check").focus();
				return false;
			}

			$.ajax({
				url : "passChk.do",
				type : "POST",
				dataType : "text",
				data : $("#Login").serialize(),

				success : function(data) {

					if (data === "false") {
						alert("비밀번호를 확인해주세요.");
					} else {
						if (confirm("탈퇴하시겠습니까?")) {
							$("#Login").submit();

							alert("탈퇴가 완료되었습니다.");

						}
					}
				},
				error : function() {
					//                    	alert(data);
					alert("서버 오류가 발생했습니다.");

				}
			});
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
	height: 50px;
	line-height: 50px;
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

.forgot {
	text-align: left;
	margin-bottom: 30px;
}

.botto-text {
	color: #ffffff;
	font-size: 14px;
	margin: auto;
}

.login-form .btn.btn-primary.reset {
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

#teacherRadio+label {
	font-weight: bold;
	font-size: 18px;
}

#parentRadio+label {
	font-weight: bold;
	font-size: 18px;
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
			<br> <br> <br> <br>
			<div class="login-form">
				<div class="main-div">
					<div class="panel">
						<h1 style="font-size: 50px;">회원탈퇴</h1>
						<br>
						<!--    <p>아이디와 비밀번호를 입력하세요.</p> -->
					</div>
					<form id="Login" name="Login" action="deleteForm2.do" method="post">
						<input type="hidden" name="s_parents_id"
							value="${s_parents.s_parents_id}">
						<div class="form-group">
							<input type="password" class="form-control" name="s_parents_pwd"
								id="s_parents_pwd" placeholder="Password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control"
								id="s_parents_pwd_check" placeholder="Password check">
						</div>
						<div class="div_button">
							<button type="submit" class="btn btn-primary">탈퇴</button>
						</div>
						<br>
						<div class="forgot">
							<a href="home.do">홈으로 돌아가기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>