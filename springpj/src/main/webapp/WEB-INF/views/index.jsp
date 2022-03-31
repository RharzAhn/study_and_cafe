<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
</head>
<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
	<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/join">회원가입</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃(${principal.user.username})</a></li>
			</sec:authorize>
 	여기까지된다면 성공!
 </body>
</html>