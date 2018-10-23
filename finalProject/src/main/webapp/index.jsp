
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">인덱스 페이지</h1>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
	
<jsp:forward page="WEB-INF/views/member/memberLogin.jsp" />
	
	<%-- <jsp:forward page="WEB-INF/views/sign/signWright.jsp" /> --%>

	<%-- <jsp:forward page="WEB-INF/views/sign/signApprovalList.jsp"/>
	<jsp:forward page="WEB-INF/views/sign/signReceive.jsp"/>
	<jsp:forward page="WEB-INF/views/sign/empty.jsp"/> --%>
	 <%-- <jsp:forward page="WEB-INF/views/facing/facingList.jsp"/>
	  --%>
	<%--  <jsp:forward page="WEB-INF/views/board/insertBoard.jsp"/>
	 --%> <!-- <h1 align="center">인덱스 페이지</h1>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<a href="login.me">로그인페이지</a>
	<a href="boardList.bo">게시판으로 이동</a> -->

	<%-- <jsp:forward page="WEB-INF/views/member/memberLogin.jsp" /> --%>

	<!-- <button onclick="location.href='test.te'">가니</button> -->
	<!--
		<jsp:forward page="WEB-INF/views/facing/facing.jsp"/>
		<jsp:forward page ="WEB-INF/views/personManagement/vacation.jsp"/>
		<jsp:forward page="WEB-INF/views/personManagement/test.jsp"/>
		<a href="facinglist.ms">facing</a>
		<a href="department.pm">department</a>
	-->
<%-- 	<jsp:forward page="WEB-INF/views/jh/mail.jsp"/> 

 --%>
	<!--
		<a href="calendar.ca">일정</a>
		<a href="addressBook.ad">주소록</a>
	-->
</body>

</html>