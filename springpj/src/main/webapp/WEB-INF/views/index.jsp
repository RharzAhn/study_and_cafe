<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>Insert title here</title>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
</head>
<body>
	<%@ include file="include/header.jsp"%>
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
 	
 	<br><a href="/admin/userlist">사용자 리스트 바로가기</a></br>
 	<br><a href="/admin/mileagelist">사용자 마일리지 바로가기</a></br>
 		<br><a >-----------------</a></br>
 	<br><a href="/user/userpage"> 유저 페이지 바로가기</a></br>
 	<br><a href="/user/usermilage">유저 마일리지 바로가기</a></br>
 	<br><a href="/user/userupdate">유저 수정,삭제 바로가기</a></br>
 	
 	<br><a href="/book/bookCafe">카페예약</a></br>
 	<br><a href="/admin/branch/branchList">브랜치 추가</a></br>
 	<br><a href="/book/bookSeat">좌석예약</a></br>
 			
</body>
</html>