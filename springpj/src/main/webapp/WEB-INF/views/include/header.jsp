<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
        />
	
</head>
<body>
	<%@taglib prefix="sec"
		uri="http://www.springframework.org/security/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>
	<header>
		<ul style="display: flex">
			<li><a href="/menu/list">메뉴 보기</a></li>
			<li><a href="/book/list">예약 하기</a></li>
			<li><a href="/cafe/list">전국지점찾기</a></li>
			<li><a href="/study/list">스터디 그룹</a></li>
			<li><a href="/user/joiner">신청알림</a></li>
			<sec:authorize access="isAnonymous()">
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/join">회원가입</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃(${principal.user.username})</a></li>
			</sec:authorize>
			<li>
			<button type="button" onclick="alertBtn()">알람</button>
			</li>
		</ul>
	</header>
	<!-- <input id="inputMsgBox" style="width: 250px;" type="text" onkeypress="inputMsgBox_onkeypress()">
    <input id="sendButton" value="Send" type="button" onclick="sendButton_onclick()">
    <input id="disconnectButton" value="Disconnect" type="button" onclick="disconnectButton_onclick()">
    <br/>
    <textarea id="chatBoxArea" style="width: 100%;" rows="10" cols="50" readonly="readonly"></textarea> -->
    
<!--     <script src="/js/socket.js"></script> -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		function alertBtn(){
			$.ajax({
				type:"post",
				url:"/user/joinerAlert",
				data:{
					"username" : '${principal.user.username}'
				}
			}).done((res)=>{
				console.log(res)
			})
			Swal.fire({
				position: 'top-end',
				html:''
			})
		}
	</script>
</body>
</html>