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

	<input type="date" name="bookdate">

	<input type="button" value="10:00">
	<input type="button" value="11:00">
	<input type="button" value="12:00">
	<input type="button" value="13:00">


	<form action="/book/bookMenu" method="get" id="frm">
		<input type="hidden" readonly name="studyId" id="studyId"> <input
			type="hidden" name="cafeId" value="${cafeId}">
		<input type="hidden" name="dateTime" id="dateTime">
		<c:forEach begin="0" end="9" var="i" step="1">
			<c:forEach begin="0" end="9" var="j" step="1">
				<input type="checkbox" name="seat" id="${i}${j}" disabled>
				<label for="${i}${j}"></label>
			</c:forEach>
			<br>
		</c:forEach>

		<div>선택한 좌석</div>
		<input type="text" readonly id="selectSeat">
		<button type="button" id="btnNextBook">버튼</button>

	</form>
</body>
<script type="text/javascript">
	<c:forEach items="${seats}" var="seat">
		var data = '${seat.name}'
		$("#${seat.x}${seat.y}").attr("disabled", false);
		$("#${seat.x}${seat.y}").val("${seat.name}")
	</c:forEach>
	
	$("input:button").click(function(event){
		var date = $("input[type='date']").val()
		var time = $(this).val()
		if(date==""){
			alert("날짜를 선택하세요")
			return;
		}
		var dateTime = date+" "+time
		$("#dateTime").val(dateTime)
		var data = {
				"dateTime":dateTime,
				"branchId":"${cafeId}"
			}
		$.ajax({
			type:"post",
			url:"/book/bookSeat",
			data: data
		}).done(function(resp){
				$("input[type=checkbox]").prop("checked", false); 
				
				$("#selectSeat").val("")
				<c:forEach items="${seats}" var="seat">
					var data = '${seat.name}'
					$("#${seat.x}${seat.y}").removeClass("aleady")
					$("#${seat.x}${seat.y}").attr("disabled", false);
					$("#${seat.x}${seat.y}").val("${seat.name}")
				</c:forEach>
			$.each(resp, (key,val)=>{
				
				if(val){
					var unable = "#"+val.x+val.y
					$(unable).addClass("aleady")
					$(unable).attr("disabled", true)
				}
			})
		})

	})

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
	
	$("#btnNextBook").click(()=>{
		if($("#studyId").val()==""){
			alert("스터디 그룹을 선택해주세요")
			return
		}
		if($("#dateTime").val()==""){
			alert("날짜 및 시간을 선택해주세요")
			return
		}
		if($("#selectSeat").val()==""){
			alert("좌석을 선택해주세요")
			return
		}
		
		$("#frm").submit()
	})

	
</script>
</html>