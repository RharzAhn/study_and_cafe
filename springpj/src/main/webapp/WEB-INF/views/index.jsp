<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>Insert title here</title>
</head>
<body>
 	여기까지된다면 성공!
 	<form action="/views/user/join" method="post">
 		<button type="button" class="btn btn-primary btn-sm" id="btnjoin">회원가입</button>
	</form>
	<form action="/views/user/login" method="post">
 		<button type="button" class="btn btn-primary btn-sm" id="btnLogin">로그인</button>
	</form>
	<form action="/views/user/logout" method="post">
		<button type="button" class="btn btn-primary btn-sm" id="btnLogout">로그아웃</button>
	</form>
</body>
</html>