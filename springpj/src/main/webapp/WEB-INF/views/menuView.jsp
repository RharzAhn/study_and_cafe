<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>메뉴 보기</title>
</head>
<body>
	<ul>
		<li><a href="/menuView?type=COFFEE">커피</a></li>
	</ul>
	<c:forEach items="${list}" var="menu">
	<div>
		<div><img class="menu_img" src="${menu.profile}" width="50px" height="10%"></div>
		<div>${menu.name}</div>
		<div>${menu.intro}</div>
		<div>${menu.price}</div>
	</div>
	</c:forEach>
</body>
</html>