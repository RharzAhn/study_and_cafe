<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../include/header.jsp" %>
<body>
	<form action="/book/bookAll" method="post">
		<input type="text" name="studyId" value="${studyId}"> <input
			type="text" name="cafeId" value="${cafeId}">
		<c:forEach items="${seatList}" var="seat">
			<input type="text" name="seat" value="${seat}">
		</c:forEach>
		<c:forEach items="${cafeMenus}" var="menu" >
			${menu.menu.profile}
			${menu.menu.menuType}
			${menu.menu.name}
			${menu.menu.price}
			<input type="checkbox" name="menuList" value="${menu.id}"></br>
		</c:forEach>
		
		<input type="submit" value="전송">
	</form>
</body>
</html>