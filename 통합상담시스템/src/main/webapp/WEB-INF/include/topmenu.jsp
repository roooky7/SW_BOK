<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}
</style>
</head>
<body>

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
			<th width="25%"><a href="home.do">home</th>
			<th width="25%"><a href="selectNoticeList.do">공지사항</th>
			<th width="25%"><a href="join.do">회원가입</th>
			<th width="25%"><a href="loginForm.do">로그인</th>
			<%
				} else if (ID1 != null) {
			%>
			<th width="20%"><a href="home.do">home</th>
			<th width="20%"><a href="selectNoticeList.do">공지사항</th>
			<th width="15%"><a href="selectInquiryList.do">문의사항</th>
			<th width="20%"><a href="mypage.do">마이페이지</th>
			<th width="20%"><a href="logout.do">로그아웃</th>
			<th width="20%"><a href="selectRsvtList.do">예약현황</th>

			<%
				} else {
			%>
			<th width="15%"><a href="home.do">home</th>
			<th width="15%"><a href="selectNoticeList.do">공지사항</th>
			<th width="15%"><a href="selectInquiryList.do">문의사항</th>
			<th width="15%"><a href="mypage.do">마이페이지</th>
			<th width="15%"><a href="logout.do">로그아웃</th>
			<th width="15%"><a href="calendar.do">예약현황</th>
			<th width="15%"><a href="insertRsvt.do">예약하기</th>
			<%
				}
			%>
			<%-- 			<%
				session.invalidate();
			%> --%>

		</tr>
	</table>
</body>
</html>