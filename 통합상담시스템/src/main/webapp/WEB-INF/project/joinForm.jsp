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
<script>
	$(function() {
		// 중복체크 여부를 저장하는 변수
		var isIdChecked = false;

		// 아이디 중복 체크 버튼 클릭 시
		$("#btn_idCheck").click(
				function() {
					// 입력한 아이디 값 가져오기
					var teacher_id = $("#teacher_id").val();
					teacher_id = $.trim(teacher_id);

					// 아이디 값이 비어있는 경우
					if (teacher_id === "") {
						alert("아이디를 입력하세요");
						$("#teacher_id").focus();
						return false;
					}
					if (!/^[A-Za-z0-9]{4,}$/.test(teacher_id)) {
						alert("아이디는 영문과 숫자 조합으로 4자 이상이어야 합니다.");
						$("#teacher_id").focus();
						return false;
					}

					// AJAX를 사용하여 서버에 아이디 중복 체크 요청
					$.ajax({
						type : "POST",
						url : "idCheck.do",
						data : {
							teacher_id : teacher_id
						},
						dataType : "text",

						// AJAX 요청 성공 시
						success : function(data) {
							$("#idCheck").css({
								display : "inline",
								color : "white"
							});

							if (data === "yes") {
								// 이미 사용 중인 아이디인 경우
								$("#idCheck").html(
										"<b>" + teacher_id
												+ "은(는) 이미 사용 중인 아이디입니다.</b>");
								$("#idCheck").css("color", "red");
								isIdChecked = false; // 중복 아이디가 있다고 설정
							} else {
								// 사용 가능한 아이디인 경우
								$("#idCheck").html(
										"<b>" + teacher_id
												+ "은(는) 사용 가능한 아이디입니다.</b>");
								$("#idCheck").css("color", "gray");
								isIdChecked = true; // 중복 아이디가 없다고 설정
							}
						}
					});
				});

		// 회원가입 버튼 클릭 시
		$(document).ready(
				function() {
					$(".btn-primary").click(
							function() {
								event.preventDefault();
								var teacher_id = $("#teacher_id").val();
								var teacher_pwd = $("#teacher_pwd").val();
								var teacher_pwd_check = $("#teacher_pwd_check")
										.val();
								var teacher_nm = $("#teacher_nm").val();
								var teacher_cttpc = $("#teacher_cttpc").val();
								var teacher_grade = $(
										"input[name='teacher_grade']:checked")
										.val();
								var teacher_clas = $(
										"input[name='teacher_clas']:checked")
										.val();

								teacher_id = $.trim(teacher_id);
								teacher_pwd = $.trim(teacher_pwd);

								// 아이디와 비밀번호 검증
								if (teacher_id === "") {
									alert("아이디를 입력하세요");
									$("#teacher_id").focus();
									return false;
								}
								if (teacher_pwd === "") {
									alert("비밀번호를 입력하시오.");
									$("#teacher_pwd").focus();
									return false;
								} else if (teacher_pwd.length < 4
										|| !/[A-Za-z]/.test(teacher_pwd)
										|| !/\d/.test(teacher_pwd)) {
									alert("비밀번호는 영문과 숫자 조합으로 4자 이상이어야 합니다.");
									$("#teacher_pwd").focus();
									return false;
								}

								if (teacher_pwd !== teacher_pwd_check) {
									alert("비밀번호가 일치하지 않습니다.");
									$("#teacher_pwd_check").focus();
									return false;
								}

								// 아이디 중복 체크 여부 확인
								if (!isIdChecked) {
									alert("아이디 중복 체크를 해주세요.");
									return false; // 폼 제출 방지
								}

								// 이름, 연락처, 학년, 반 필드 검증
								if (teacher_nm === "") {
									alert("이름을 입력하세요.");
									$("#teacher_nm").focus();
									return false;
								}

								if (teacher_cttpc === "") {
									alert("연락처를 입력하세요.");
									$("#teacher_cttpc").focus();
									return false;
								}

								if (!teacher_grade) {
									alert("학년을 선택하세요.");
									return false;
								}

								if (!teacher_clas) {
									alert("반을 선택하세요.");
									return false;
								}
								// 아이디와 비밀번호 값을 폼 필드에 설정
								$("#teacher_id").val(teacher_id);
								$("#teacher_pwd").val(teacher_pwd);

								// 폼이 모두 유효하면 폼을 제출
								$("form").submit();
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
	height: 40px; /* Updated height value */
	line-height: 40px; /* Updated line-height value */
}

.login-form .form-aa {
	background: #f7f7f7 none repeat scroll 0 0;
	border: 1px solid #d4d4d4;
	border-radius: 4px;
	font-size: 14px;
	height: 100px;
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
	background: #0073d0 none repeat scroll 0 0;
	border-color: #0073d0;
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

<body id="LoginForm">

	<div class="container">
		<div class="login-form">
			<div class="main-div">
				<div class="panel">
					<h1>교사 회원가입</h1>
					<br>
					<!--    <p>아이디와 비밀번호를 입력하세요.</p> -->
				</div>
				<form id="Login" action="joinForm.do" method="post">

					<div class="form-group">
						<input type="text" class="form-control" name="teacher_id"
							id="teacher_id" placeholder="Id">
						<button type="button" id="btn_idCheck" class="btn btn-primary1">Id
							중복체크</button>
						<label style="display: none;" id="idCheck">중복체크결과</label><br>
						<label>*영문,숫자 조합 4자리 이상</label>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="teacher_pwd"
							id="teacher_pwd" placeholder="Password"> <label>*영문,숫자
							조합 4자리 이상</label>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="teacher_pwd_check"
							placeholder="Password check">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="teacher_nm"
							id="teacher_nm" placeholder="Name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="teacher_cttpc"
							id="teacher_cttpc" placeholder="010-0000-0000">
					</div>
					<div class="form-group" class="form-control">
						<div>학년</div>
						<div class="form-aa">

							<input type="radio" name="teacher_grade" id="teacher_grade"
								value=1>1학년 <input type="radio" name="teacher_grade"
								id="teacher_grade" value=2>2학년 <input type="radio"
								name="teacher_grade" id="teacher_grade" value=3>3학년<br>
							<input type="radio" name="teacher_grade" id="teacher_grade"
								value=4>4학년 <input type="radio" name="teacher_grade"
								id="teacher_grade" value=5>5학년 <input type="radio"
								name="teacher_grade" id="teacher_grade" value=6>6학년
						</div>
					</div>

					<div class="form-group" class="form-control">
						<div>반</div>
						<div class="form-control">
							<input type="radio" name="teacher_clas" id="teacher_clas" value=1>1반
							<input type="radio" name="teacher_clas" id="teacher_clas" value=2>2반
							<input type="radio" name="teacher_clas" id="teacher_clas" value=3>3반
						</div>
					</div>
					<br>
					<div class="div_button">
						<button type="submit" class="btn btn-primary">가입</button>
						<!--        <button type="reset" class="btn btn-primary">취소</button> -->
					</div>
					<br>

				</form>
			</div>
		</div>
	</div>

</body>
</html>