<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택화면</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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

.panel {
	text-align: center;
}

.panel .square-button {
	width: 200px; /* Adjust the width as needed */
	height: 200px;
	border-radius: 2rem;
	/*    display: inline-block; */
}

.panel {
	/* text-align: center; */
	
}

.panel h2 {
	color: #444444;
	font-size: 18px;
	margin: 0 0 8px 0;
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
	max-width: 60%; /* 변경된 가로 크기를 원하는 값으로 조절하세요 */
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
/*  .login-form .square-button {
    width: 700px; /* Adjust the width as needed */
height


:

 

700px


; /* Adjust the height as needed */
padding


:

 

0


; /* Remove padding to maintain square shape */
border-radius


:

 

10


%; /* To create rounded corners, adjust as needed */
color


:

 

#00008b


;
}
* /

.div_button1, .div_button2 {
	margin: 10px;
	display: inline-block; /* Display buttons side by side */
	color: #0073d0;
}

.panel .aa {
	align-self: center;
}
</style>

<body id="LoginForm">

	<div class="login-type-selection"></div>


	<div class="panel">
		<br> <br> <br> <br> <br> <br>
		<h1>회원가입 유형 선택</h1>
		<br> <br> <br>

		<div style="display: flex; justify-content: center;" class="aa">
			<div class="div_button1"
				style="display: inline-block; margin-right: 10px;">
				<a href="joinForm.do"><button
						class="btn btn-primary square-button"
						style="background-color: #0073d0; font-size: 25px;">교사</button></a>
			</div>
			<div class="div_button2"
				style="display: inline-block; margin-left: 10px;">
				<a href="joinForm2.do"><button
						class="btn btn-primary square-button"
						style="background-color: #0073d0; font-size: 25px;">학부모</button></a>
			</div>
		</div>
	</div>

</body>
</html>