<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/header.jsp" %>
	${study.title}

	<form action="/study/board/register" method="post">
		<%@include file="../include/editor.jsp"%>
	</form>
</body>

<script>
let editor = new FroalaEditor("div#content", {
    heightMin:150,
    heightMax:150
}, function () {
    console.log(editor.html.get());
});
$("#btnInsert").click(() => {
    console.log(editor.html.get());
});
</script>
</html>