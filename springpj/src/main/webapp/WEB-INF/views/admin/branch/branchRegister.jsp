<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 추가</title>
</head>
<body>
	<%@include file="../../include/header.jsp"%>
	<div class="container">
		<h2>지점 추가</h2>
		<form action="insert" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="name">지점명:</label> <input type="text"
					class="form-control" id="name" placeholder="지점명" name="name">
			</div>
			<div class="input-box">
				<input type="hidden" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기">
			</div>
			<input type="text" id="sample6_address" name="addr" placeholder="주소"> <input
				type="hidden" id="sample6_detailAddress" placeholder="상세주소"> <input
				type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			<div class="form-group">
				<label for="phone">전화번호:</label> <input type="text"
					class="form-control" id="phone" placeholder="전화번호" name="phone">
			</div>
			<div class="form-group">
				<label for="manager">지점장명:</label> --> <input type="text"
					class="form-control" id="username" name="username"
					placeholder="지점장명">
			</div>

			<c:forEach begin="0" end="9" step="1" var="i">
				<c:forEach begin="0" end="9" step="1" var="j">
					<input type="checkbox" id="seatNum" name="seatNum"
						value="${i},${j}">
				</c:forEach>
				<br>
			</c:forEach>
			<button type="submit" class="btn btn-primary btn-sm">추가</button>
		</form>
	</div>
	<script type="text/javascript">


$(".btn").click(()=>{	
	var alpa = Array.from({ length: 26 }, (v, i) => String.fromCharCode(i + 65));
	var array=[]
	var setNumList=[];
	 $("input:checkbox[name=seatNum]:checked").each((i,ival)=>{
		 setNumList.push(ival.defaultValue)
	 })
	 
	 for (var str of setNumList){
		var pos = str.split(',');
	 	array.push(pos[0]);
	 }
	 //"username":$("#manager").val(),"seats" :array    [pos[0], pos[1],alpa[pos[0]]+pos[1] ]
	const data={
			"name" : $("#name").val(),
			"addr" : $(".addr").val(),
			"phone": $("#phone").val(),
			"username":$("#manager").val(),
			"seats" :array
	}
	console.log(data)
// 	$.ajax({
// 		type:"post",
// 		url:"insert",
// 		contentType: "application/json;charset=utf-8",
// 		traditional :true,
// 		data: JSON.stringify(data)
// 	}).done((res)=>{
// 		console.log(res)
// 	})
	
})
</script>
<script type="text/javascript" src="/js/address.js"></script>
</body>
</html>