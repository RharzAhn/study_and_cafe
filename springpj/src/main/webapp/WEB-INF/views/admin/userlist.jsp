<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<table class="user_list">
	                <col width="15%"/>
	                <col width="*"/>
	                <col width="15%"/>
	                <col width="20%"/>
	            </colgroup>
	            <thead>
	            </thead>
	            <tbody>
	            <c:forEach items="${userlist}" var="user">
	            </c:forEach>
	            	<td colspan="9">조회된 결과가 없습니다</td>
	            </tbody>
	   </table>
	</div>
</body>
</html> --%>
