<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../include/header.jsp"%>
<body>
	<form action="/book/bookConfirm" method="post">
		<input type="text" name="studyId" value="${studyId}"> <input
			type="text" name="cafeId" value="${cafeId}"> <input
			type="text" name="bookdate" value="${dateTime}">
		<c:forEach items="${seatList}" var="seat">
			<input type="text" name="seat" value="${seat}">
		</c:forEach>
		<c:forEach items="${cafeMenus}" var="menu">
			<div class="cafeMenu"
				onclick="addMenu('${menu.id}','${menu.menu.name}','${menu.menu.price}')">
				${menu.menu.profile} ${menu.menu.menuType} ${menu.menu.name}
				${menu.menu.price}</div>
		</c:forEach>
		<div id="cafeOrderList"></div>

		<input type="text" value="0" id="totalPrice"> <input
			type="submit" id="submitBtn" value="전송">
	</form>

	<script>
		function addMenu(id,name,price){
			console.log($("."+id).length)
			if($("."+id).length==0){
			$("#cafeOrderList").append(`<div id="cafeOrder" class=`+id+`>
					<input type="text" readonly id="menuName"  value="`+name+`">
					<input type="text" readonly id="menuCount" value="1" name="count">
					<input type="text" readonly id="menuPrice" value="`+price+`" />
					<input type="text" readonly id="menuTotal" value="`+price+`" name="totalPrice"/>
					<input type="hidden" id="cafeMenuId" name="cafeMenuId" value="`+id+`">
					<a href="javascript:delMenu(`+id+`)" id="delMenu">삭제</a>
					<a href="javascript:addCountMenu(`+id+`)" id="addCountMenu">추가</a>
					<a href="javascript:subCountMenu(`+id+`)" id="subCountMenu">빼기</a>
				</div>`)
			var total = $("#totalPrice")
			total.val(Number(total.val())+Number(price))
			}
			
		}
		var total = $("#totalPrice")
		
		function addCountMenu(id){
			var count = $("."+id).children('input:eq(1)')
			var price = $("."+id).children('input:eq(2)')
			var totprice = $("."+id).children('input:eq(3)')
			count.val(Number(count.val())+1)
			totprice.val(Number(count.val())*Number(price.val()))
			total.val(Number(total.val())+Number(price.val()))
		}
		
		function subCountMenu(id){
			var count = $("."+id).children('input:eq(1)')
			var price = $("."+id).children('input:eq(2)')
			var totprice = $("."+id).children('input:eq(3)')
			total.val(Number(total.val())-Number(count.val()=='1'?'0':price.val()))
			
			count.val(Number(count.val())-1<1?1:Number(count.val())-1)
			totprice.val(Number(count.val())*Number(price.val()))
		}
		function delMenu(id){
			var totprice = $("."+id).children('input:eq(3)')
			total.val(Number(total.val())-Number(totprice.val()))
			$("."+id).remove()
		}
		
	</script>
</body>
</html>