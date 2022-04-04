<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
input[type="checkbox"] {
	display: none;
}

input:disabled+label {
	cursor: default;
	background-color: red;
}

input:checked+label {
	background-color: yellow;
}

label {
	cursor: pointer;
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: black;
}

.aleady+label {
	background-color: blue !important;
	cursor: default;
}
</style>
<body>
	<%@include file="../include/header.jsp"%>
	<form action="/book/bookMenu" method="get">
	<input type="hidden" name="cafeId" value="${cafeId}">
	<c:forEach begin="0" end="9" var="i" step="1">
		<c:forEach begin="0" end="9" var="j" step="1">
			<input type="checkbox" name="seat" id="${i}${j}" disabled>
			<label for="${i}${j}"></label>
		</c:forEach>
		<br>
	</c:forEach>

	<div>선택한 좌석</div>
	<input type="text" readonly id="selectSeat">
	<button type="submit" id="btnNextBook">버튼</button>
	</form>
</body>
<script type="text/javascript">
	<c:forEach items="${seats}" var="seat">
	var data = '${seat.name}'
	<c:choose>
	<c:when test="${seat.book==null}">
	$("#${seat.x}${seat.y}").attr("disabled", false);
	$("#${seat.x}${seat.y}").val("${seat.name}")
	</c:when>

	<c:otherwise>
	$("#${seat.x}${seat.y}").addClass("aleady")
	$("#${seat.x}${seat.y}").attr("disabled", true);
	</c:otherwise>
	</c:choose>
	</c:forEach>

	$("input:checkbox").click(function() {
		var selectList = $("#selectSeat").val()
		if ($(this).is(":checked")) {
			$("#selectSeat").val(selectList + " "+ $(this).val())			
		} else {
			$("#selectSeat").val(selectList.slice(0, -3))
		}
	})
</script>
</html>