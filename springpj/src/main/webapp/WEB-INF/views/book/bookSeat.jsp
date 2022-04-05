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

form input:disabled+label {
	cursor: default;
	background-color: red;
}

form input:checked+label {
	background-color: yellow;
}

form label {
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
	<button type="button" onclick="selectStudy()">그룹 선택</button>
	
	

	<form action="/book/bookMenu" method="get">
		<input type="hidden" readonly name="studyId" id="studyId" >
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
	
	
	$("input:radio").click(function() {
		var stduyTitle = $("#studyTitle").val()
		console.log(stduyTitle)
		console.log("text")
	})
	
	
	var studyTitle;
	function selectStudy(){
		Swal.fire({
			position: 'center',
			html:`
				<c:forEach items="${joinerList}" var="joiner" >
				<input type="radio" id="studyTitle" name="studyTitle" value="${joiner.study.id}">
				<label for="studyTitle">${joiner.study.title}</label>
			</c:forEach>
			`
		}).then((value)=>{
			var studyId = $("input[type='radio']:checked").val();
			$("#studyId").val(studyId)
		})
	}
</script>
</html>