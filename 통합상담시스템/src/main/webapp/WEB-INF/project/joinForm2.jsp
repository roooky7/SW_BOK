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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(document).ready(
				function() {
					// DatePicker 초기화
					$('#chldren_brdt').datepicker(
							{

								dateFormat : 'yymmdd', // 출력 형식 설정
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
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ] //달력의 월 부분 텍스트
								,
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ] //달력의 월 부분 Tooltip
								,
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ] //달력의 요일 텍스트
								,
								dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
										'금요일', '토요일' ] //달력의 요일 Tooltip
								,
								minDate : "-20Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
								,
								maxDate : "+0D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
							});
				});
	});
	$(function() {
		// 중복체크 여부를 저장하는 변수
		var isIdChecked = false;
		var isNmChecked = false;

		// 아이디 중복 체크 버튼 클릭 시
		$("#btn_idCheck2").click(
				function() {
					// 입력한 아이디 값 가져오기
					var s_parents_id = $("#s_parents_id").val();
					s_parents_id = $.trim(s_parents_id);

					// 아이디 값이 비어있는 경우
					if (s_parents_id === "") {
						alert("아이디를 입력하세요");
						$("#s_parents_id").focus();
						return false;
					}
					if (!/^[A-Za-z0-9]{4,}$/.test(s_parents_id)) {
						alert("아이디는 영문과 숫자 조합으로 4자 이상이어야 합니다.");
						$("#s_parents_id").focus();
						return false;
					}

					// AJAX를 사용하여 서버에 아이디 중복 체크 요청
					$.ajax({
						type : "POST",
						url : "idCheck2.do",
						data : {
							s_parents_id : s_parents_id
						},
						dataType : "text",

						// AJAX 요청 성공 시
						success : function(data) {
							$("#idCheck2").css({
								display : "inline",
								color : "white"
							});

							if (data === "yes") {
								// 이미 사용 중인 아이디인 경우
								$("#idCheck2").html(
										"<b>" + s_parents_id
												+ "은(는) 이미 사용 중인 아이디입니다.</b>");
								$("#idCheck2").css("color", "red");
								isIdChecked = false; // 중복 아이디가 있다고 설정
							} else {
								// 사용 가능한 아이디인 경우
								$("#idCheck2").html(
										"<b>" + s_parents_id
												+ "은(는) 사용 가능한 아이디입니다.</b>");
								$("#idCheck2").css("color", "gray");
								isIdChecked = true; // 중복 아이디가 없다고 설정
							}
						}
					});
				});
		// 중복체크 여부를 저장하는 변수

		// 닉네임 중복 체크 버튼 클릭 시
		$("#btn_nmCheck").click(
				function() {
					// 입력한 아이디 값 가져오기
					var s_parents_nm = $("#s_parents_nm").val();
					s_parents_nm = $.trim(s_parents_nm);

					// 아이디 값이 비어있는 경우
					if (s_parents_nm === "") {
						alert("닉네임 입력하세요");
						$("#s_parents_nm").focus();
						return false;
					}

					// AJAX를 사용하여 서버에 아이디 중복 체크 요청
					$.ajax({
						type : "POST",
						url : "nmCheck2.do",
						data : {
							s_parents_nm : s_parents_nm
						},
						dataType : "text",

						// AJAX 요청 성공 시
						success : function(data) {
							$("#nmCheck").css({
								display : "inline",
								color : "white"
							});

							if (data === "yes") {
								// 이미 사용 중인 아이디인 경우
								$("#nmCheck").html(
										"<b>" + s_parents_nm
												+ "은(는) 이미 사용 중인 닉네임입니다.</b>");
								$("#nmCheck").css("color", "red");
								isNmChecked = false; // 중복 아이디가 있다고 설정
							} else {
								// 사용 가능한 아이디인 경우
								$("#nmCheck").html(
										"<b>" + s_parents_nm
												+ "은(는) 사용 가능한 닉네임입니다.</b>");
								$("#nmCheck").css("color", "gray");
								isNmChecked = true; // 중복 아이디가 없다고 설정
							}
						}
					});
				});
		// 회원가입 버튼 클릭 시
		$(document)
				.ready(
						function() {
							$(".btn-primary")
									.click(
											function() {
												var s_parents_id = $(
														"#s_parents_id").val();
												var s_parents_pwd = $(
														"#s_parents_pwd").val();
												var s_parents_pwd_check = $(
														"#s_parents_pwd_check")
														.val();
												var s_parents_nm = $(
														"#s_parents_nm").val();
												var s_parents_cttpc = $(
														"#s_parents_cttpc")
														.val();
												var rel = $(
														"input[name='rel']:checked")
														.val();
												var chldren_nm = $(
														"#chldren_nm").val();
												var chldren_schl = $(
														"#chldren_schl").val();
												var chldren_grade = $(
														"input[name='chldren_grade']:checked")
														.val();
												var chldren_clas = $(
														"input[name='chldren_clas']:checked")
														.val();
												var chldren_sexdstn = $(
														"input[name='chldren_sexdstn']:checked")
														.val();
												var chldren_brdt = $(
														"#chldren_brdt").val();

												s_parents_id = $
														.trim(s_parents_id);
												s_parents_pwd = $
														.trim(s_parents_pwd);

												// 아이디와 비밀번호 검증
												if (s_parents_id === "") {
													alert("아이디를 입력하세요");
													$("#s_parents_id").focus();
													return false;
												}
												if (s_parents_pwd === "") {
													alert("비밀번호를 입력하시오.");
													$("#s_parents_pwd").focus();
													return false;
												} else if (s_parents_pwd.length < 4
														|| !/[A-Za-z]/
																.test(s_parents_pwd)
														|| !/\d/
																.test(s_parents_pwd)) {
													alert("비밀번호는 영문과 숫자 조합으로 4자 이상이어야 합니다.");
													$("#s_parents_pwd").focus();
													return false;
												}
												if (s_parents_pwd !== s_parents_pwd_check) {
													alert("비밀번호가 일치하지 않습니다.");
													$("#ts_parents_pwd_check")
															.focus();
													return false;
												}
												if (s_parents_nm === "") {
													alert("닉네임을 입력하세요.");
													$("#s_parents_nm").focus();
													return false;
												}
												// 아이디 중복 체크 여부 확인
												if (!isIdChecked) {
													alert("아이디 중복 체크를 해주세요.");
													return false; // 폼 제출 방지
												}
												if (!isNmChecked) {
													alert("닉네임 중복 체크를 해주세요.");
													return false; // 폼 제출 방지
												}

												// 나머지 폼 검증 로직 추가

												if (s_parent_cttpc === "") {
													alert("연락처를 입력하세요.");
													$("#s_parent_cttpc")
															.focus();
													return false;
												}

												if (!role) {
													alert("관계를 선택하세요.");
													return false;
												}
												if (chldren_nm === "") {
													alert("자녀 이름을 입력하세요.");
													$("#chldren_nm").focus();
													return false;
												}

												if (chldren_schl === "") {
													alert("자녀 학교를 입력하세요.");
													$("#chldren_schl").focus();
													return false;
												}
												if (!chldren_grade) {
													alert("자녀 학년을 선택하세요.");
													return false;
												}
												if (!chldren_clas) {
													alert("자녀 반을 선택하세요.");
													return false;
												}
												if (!chldren_sexdstn) {
													alert("자녀 성별을 선택하세요.");
													return false;
												}
												if (chldren_brdt === "") {
													alert("자녀 생년월일을 선택하세요.");
													$("#chldren_brdt").focus();
													return false;
												}
												// 아이디와 비밀번호 값을 폼 필드에 설정
												$("#s_parents_id").val(id);
												$("#s_parents_pwd").val(pass);

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

.login-form  .btn.btn-primary2 {
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

.login-form .btn.btn-primary2.reset {
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
					<h1>학부모 회원가입</h1>
					<br>
					<!--    <p>아이디와 비밀번호를 입력하세요.</p> -->
				</div>
				<form id="Login" action="joinForm2.do" method="post">

					<div class="form-group">
						<input type="text" class="form-control" name="s_parents_id"
							id="s_parents_id" placeholder="Id">
						<button type="button" id="btn_idCheck2" class="btn btn-primary1">Id
							중복체크</button>
						<label style="display: none;" id="idCheck2">중복체크결과</label><br>
						<label>*영문,숫자 조합 4자리 이상</label>
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
						<input type="text" class="form-control" name="s_parents_nm"
							id="s_parents_nm" placeholder="Name">
						<button type="button" id="btn_nmCheck" class="btn btn-primary2">닉네임
							중복체크</button>
						<label style="display: none;" id="nmCheck">중복체크결과</label><br>
						<label>*닉네임 앞에 (학년-반)을 입력해주세요</label>
					</div>


					<div class="form-group">
						<input type="text" class="form-control" name="s_parents_cttpc"
							id="s_parents_cttpc" placeholder="010-0000-0000">
					</div>

					<div class="form-group">
						<input type="text" class="form-control" name="chldren_nm"
							id="chldren_nm" placeholder="자녀 이름">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="chldren_schl"
							id="chldren_schl" placeholder="자녀 학교">
					</div>
					<div>관계</div>
					<div class="form-group">
						<div class="form-control">
							<input type="radio" name="rel" id="rel" value="부">부 <input
								type="radio" name="rel" id="rel" value="모">모 <input
								type="radio" name="rel" id="rel" value="그 외">그 외
						</div>
					</div>
					<div class="form-group" class="form-control">
						<div>자녀 학년</div>
						<div class="form-aa">
							<input type="radio" name="chldren_grade" id="chldren_grade"
								value=1>1학년 <input type="radio" name="chldren_grade"
								id="chldren_grade" value=2>2학년 <input type="radio"
								name="chldren_grade" id="chldren_grade" value=3>3학년<br>
							<input type="radio" name="chldren_grade" id="chldren_grade"
								value=4>4학년 <input type="radio" name="chldren_grade"
								id="chldren_grade" value=5>5학년 <input type="radio"
								name="chldren_grade" id="chldren_grade" value=6>6학년
						</div>
					</div>
					<div class="form-group" class="form-control">
						<div>자녀 반</div>
						<div class="form-control">
							<input type="radio" name="chldren_clas" id="chldren_clas" value=1>1반
							<input type="radio" name="chldren_clas" id="chldren_clas" value=2>2반
							<input type="radio" name="chldren_clas" id="chldren_clas" value=3>3반
						</div>
					</div>
					<div class="form-group" class="form-control">
						<div>자녀 성별</div>
						<div class="form-control">
							<input type="radio" name="chldren_sexdstn" id="chldren_sexdstn"
								value="남">남 <input type="radio" name="chldren_sexdstn"
								id="chldren_sexdstn" value="여">여
						</div>
						<div class="form-group">
							<label for="chldren_brdt">자녀 생년월일</label> <input type="text"
								name="chldren_brdt" id="chldren_brdt" class="form-control"
								readonly>
						</div>
					</div>
					<br>
					<div class="div_button">
						<button type="submit" class="btn btn-primary">가입</button>
					</div>
					<br>
				</form>
			</div>
		</div>
	</div>

</body>
</html>