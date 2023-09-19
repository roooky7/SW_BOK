<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 화면</title>
<!-- 레이아웃 CSS -->
<link rel="stylesheet" href="./css/member.css" media="all">
<link rel="stylesheet" href="./css/jquery-confirm.min.css" media="all">
<link rel="stylesheet" href="./css/jquery-ui.min.css" />
<!-- 팝업  -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$(".btn-primary").click(function() {
			event.preventDefault();
			var s_parents_id = $.trim($("#s_parents_id").val());
			var s_parents_pwd = $.trim($("#s_parents_pwd").val());

			if (s_parents_id === "") {
				alert("아이디를 입력해주세요.");
				$("#s_parents_id").focus();
				return false;
			}
			if (s_parents_pwd === "") {
				alert("비밀번호를 입력해주세요.");
				$("#s_parents_pwd").focus();
				return false;
			}
			$.ajax({
				type : "POST",
				data : {
					s_parents_id : s_parents_id,
					s_parents_pwd : s_parents_pwd
				}, // Send data as an object
				url : "loginOk2.do",
				dataType : "text",

				success : function(result) {
					if (result === "ok") {
						alert(s_parents_id + "님 로그인 성공");
						location.href = "home.do";
					} else {
						alert("아이디 또는 비밀번호 오류");
						location.href = "loginForm2.do";
					}
				},
				error : function(xhr, status, error) {
					console.error("AJAX Error:", status, error);
					alert("회원 정보가 존재하지 않습니다.");
				}
			});
		});
	});
</script>
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

<body id="LoginForm">

	<div class="tab_st">
		<ul style="padding: 0; width: 40%; margin: 0 auto;">
			<li><a href="loginForm.do" title="교사">교사</a></li>
			<li class="on"><a href="loginForm2.do" title="학부모">학부모</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="login-form">
			<div class="main-div">
				<div class="panel">
					<h1>로그인</h1>
					<br>
					<!--    <p>아이디와 비밀번호를 입력하세요.</p> -->
				</div>
				<form id="Login">

					<div class="form-group">


						<input type="text" class="form-control" name="s_parents_id"
							id="s_parents_id" placeholder="Id">

					</div>

					<div class="form-group">

						<input type="password" class="form-control" name="s_parents_pwd"
							id="s_parents_pwd" placeholder="Password">

					</div>
					<div class="div_button">
						<button type="submit" class="btn btn-primary">LOGIN</button>
					</div>
					<br>
					<div class="forgot">
						<a href="join.do">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>