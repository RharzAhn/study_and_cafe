<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<form action="/study/register" method="post"
		enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br> 시작일 : <input
			type="date" name="startDate"><br> 종료일 : <input
			type="date" name="endDate"><br> 그룹장 : <input type="text"
			name="username" value="${principal.user.username}"><br> 파일 : <input
			type="file" name="file"> 제한인원 수 : <input type="number"
			name="limitCount"><br> 내용 :
		<textarea rows="10" cols="5" name="content"></textarea>
		<button>전송</button>
	</form>
</body>
</html>