<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/home.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
</head>
<body>
	<header>
		<div class="nav">
			<ul class="container nav-menu">
				<li><a href="#">
						<p class="kor">카페소개</p>
						<p class="en">ABOUT US</p>
				</a></li>
				<li><a href="#">
						<p class="kor">예약</p>
						<p class="en">BOOK</p>
				</a></li>
				<div class="header-index">
					<a href="../index">BOOK</a>
				</div>
				<li><a href="#">
						<p class="kor">스터디그룹</p>
						<p class="en">STUDY GROUP</p>
				</a></li>
				<li><a href="#">
						<p class="kor">마이페이지</p>
						<p class="en">MY PAGE</p>
				</a></li>
			</ul>
		</div>
		<div class="nav-content">
			<ul class="container nav-menu-content">
				<li><a href="/menuView">메뉴</a> <a href="/book/bookCafe">전국지점찾기</a></li>
				<li><a href="">예약하기</a></li>
				<div class="header-index"></div>
				<li><a href="../study/list">스터디목록</a></li>
				<sec:authorize access="isAnonymous()">
					<li><a href="/login">로그인</a> <a href="/join">회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="/logout">로그아웃(${principal.user.username})</a>
						<a href="../user/user">마이페이지(${principal.user.username})</a>
						<c:if test="${principal.user.role == 'ROLE_ADMIN' }">
						<a href="/admin/admin">관리자페이지(${principal.user.username})</a>
						</c:if>
						<c:if test="${principal.user.role == 'ROLE_MANAGER' }">
						<a href="/manager/manager">매니저페이지(${principal.user.username})</a>
						</c:if>
					</li>
				</sec:authorize>
				</li>
			</ul>
		</div>
	</header>

	<script>
        const navMenu = document.querySelector(".nav-menu");
        const nav = document.querySelector(".nav");
        const navContent = document.querySelector(".nav-content");
        navMenu.addEventListener("mouseover", () => {
            nav.style.background = "var(--color-main)";
            navContent.style.height = "150px";
            navContent.style.display = "flex";
        });
        navMenu.addEventListener("mouseout", () => {
            nav.style.background = "none";
            navContent.style.height = "0";
        });
        navContent.addEventListener("mouseover", () => {
            nav.style.background = "var(--color-main)";
            navContent.style.height = "150px";
            navContent.style.display = "flex";
        });
        navContent.addEventListener("mouseout", () => {
            nav.style.background = "none";
            navContent.style.height = "0";
        });
    </script>
</body>
</html>
