<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<table>
		<thead>주문내역
		</thead>
		<c:forEach items="${bookMenuList}" var="menu">
			<tr>
				<td>${menu.cafeMenu.menu.name}</td>
				<td>${menu.count}</td>
				<td>${menu.totalPrice }</td>
			</tr>
		</c:forEach>
		<tr>
			<th>총 액</th>
			<td id="total">${book.total}</td>
		</tr>
		<tr>
			<th>사용 가능한 마일리지</th>
			<td id="mymileage">${principal.user.mileage }</td>
			<td><input type="number" id="useMileage"></td>
		</tr>
		<tr>
			<td>좌석 배치도</td>
			<td><c:forEach items="${bookSeatList}" var="seat">
					<span>${seat.seat.name}</span>
				</c:forEach></td>
		</tr>

		<tr>
			<th>예약 카페</th>
			<td>${book.branch.name}</td>
		</tr>
	</table>
	<button type="button" id="confirmBtn">확인</button>

	<script>

	$("#useMileage").on('input',()=>{
		const use =$("#useMileage")
		const my = $("#mymileage")
		const tot = $("#total")
		
		var usemile =Number(use.val())
		var mymile = ${principal.user.mileage }
		var total = ${book.total}
		
		if(mymile-usemile>0){
			my.html(mymile-usemile)
		}else{
			use.val(mymile)
			my.html(0)
		}
		
		if(total-usemile>0){			
			tot.html(total-usemile)
		}else{
			tot.html(0)
			use.html(total-usemile)
		}
	})
</script>
</body>
</html>