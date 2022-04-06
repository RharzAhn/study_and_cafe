<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<form action="/study/register" method="post"
		enctype="multipart/form-data" id="fmt">
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
</html>
<%@ include file="../include/footer.jsp" %>