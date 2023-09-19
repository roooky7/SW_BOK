<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="pageTitle">
	<spring:message code="comExtMsg.webSocket.Title" />
</c:set>

<!DOCTYPE html>
<html>
<head>
<title>${pageTitle}into</title>
<!--WebSocket messenger into -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="<c:url value='/css/egovframework/com/ext/msg/button.css'/>" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script>
	$(document).ready(function() {
		console.log("시작합니다");
		/* 채팅 입장 버튼 제어 - 시작 */
		var list = [];
		$.ajax({ // 오늘 날짜의 예약 리스트를 받아오는
			url : "selectTodayRsvtList.do",
			type : "post",
			dataType : 'json',
			async : false,
			success : function(result) {
				list = result;
				console.log(list); // 결과 json 데이터 접근 방법 , [index].key
			} // success() 종료
		}); //ajax 종료 

		function hasRsvt(now) {
			var result = false;
			// Return : 날짜에 해당되는 인덱스 여부 - T / F

			for (var i = 0; i < list.length; i++) {
				var startTime = list[i].rsvt_dt + " " + list[i].rsvt_hr;
				var endTime = list[i].rsvt_dt + " " + list[i].rsvt_fhr;

				startTime = new Date(startTime);
				endTime = new Date(endTime);

				//console.log("i : " + i + " -- " + (now >= startTime && now < endTime))

				/* Ver2. 아래는 목록 별 다수 개의 버튼을 통제할 때 사용*/
				if (now >= startTime && now < endTime) {
					result = true;
					break;
				}
				;
			}
			;
			console.log(result);
			return result;
		}
		;

		// 실질적 '입장 버튼' 제어 함수
		function buttonController() {
			var now = getNow(); // 현재 날짜

			var result = hasRsvt(now); // 예약에 일치한 시간대인지 체크

			if (result) {
				$('#connectMsgBtn').attr("disabled", false);
			} else {
				$('#connectMsgBtn').attr("disabled", true);
			}
			;

		}
		; // buttonController() 마지막

		// 현재 시간을 추출하는 함수 - buttonController 내부에서 사용됨
		function getNow() {
			var now = new Date();
			var nowYear = now.getFullYear();
			var nowMonth = now.getMonth() + 1; // 월
			var nowDay = now.getDate(); // 일
			var nowHour = now.getHours(); // 시
			var nowMin = now.getMinutes(); // 분
			var nowSec = now.getSeconds(); // 초

			nowMonth = plusZero(nowMonth); //만들었던 함수 적용
			nowDay = plusZero(nowDay);
			nowHour = plusZero(nowHour);
			nowMin = plusZero(nowMin);
			nowSec = plusZero(nowMin);

			// 2023-09-04 06:00:00
			var day = nowYear + "-" + nowMonth + "-" + nowDay;
			var time = nowHour + ":" + nowMin + ":" + nowSec;
			var now_Time = day + " " + time;
			var result = new Date(now_Time);

			return result;
		}
		;

		// 날짜 및 시간의 형태를 맞추어 주는 ex> 6월 6 -> 06
		function plusZero(time) {
			var time = time.toString(); // 시간을 숫자에서 문자로 바꿈
			if (time.length < 2) { //2자리 보다 작다면
				time = '0' + time; //숫자앞 0을 붙여줌
				return time; //값을 내보냄
			} else {
				return time; //2자리라면 값을 내보냄
			}
			;
		}
		;

		setInterval(buttonController, 1000); // interval 단위는 1000 -> 1초

		$('#connectMsgBtn').click(function() {
			var form = $("form[name=msgForm]");
			form.attr("action", "<c:url value='/websocketMessengerMain.do'/>");
			form.attr("method", "post");
			form.submit();
		});
	});
</script>

</head>
<body>
	<form name="msgForm" id="msgForm" action="<c:url value='  '/>"
		method="post">
		<c:if test="${loginVO!= null}">
		${loginVO.name}<spring:message code="comExtMsg.webSocketInto.msg1" />
			<input type="button" id="connectMsgBtn" name="connectMsgBtn"
				value="<spring:message code="comExtMsg.webSocket.btnInto" />" />
		</c:if>
		<c:if test="${loginVO==null}">
			<spring:message code="comExtMsg.webSocketInto.msg2" />
			<br />
			<!-- 접속 후 가능한 메뉴입니다.  -->
			<spring:message code="comExtMsg.webSocketInto.msg3" />
			<!-- 로그인 후 이용해주시기 바랍니다. -->
		</c:if>
		<input type="hidden" name="name" value="${loginVO.name}">
	</form>
</body>
</html>