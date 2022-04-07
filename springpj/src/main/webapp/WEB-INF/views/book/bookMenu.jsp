<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/book.css" rel="stylesheet" />
</head>
<body>
	<div class="header">
		<h1>BOOK CAFE</h1>
		<span></span>
		<p>스터디그룹에 가입해서 다양한 혜택을 받아보세요</p>
	</div>
	
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


		<h3>결제 방식</h3>

		<div>
			<p>사용 가능한 마일리지</p>
			<p id="mymileage">${principal.user.mileage }</p>
			<p>
				<input type="number" id="useMileage" name="useMile" value="0">
			</p>
		</div>



		<input type="text" value="0" id="totalPrice" name="totalPrice">
		<input type="hidden" value="0" id="totalHidden"> <input
			type="submit" id="submitBtn" value="결제">
	</form>

	<script>
		function addMenu(id,name,price){
			console.log($("."+id).length)
			if($("."+id).length==0){
			$("#cafeOrderList").append(`<div id="cafeOrder" class=`+id+`>
					<input type="text" readonly id="menuName"  value="`+name+`">
					<input type="text" readonly id="menuCount" value="1" name="count">
					<input type="text" readonly id="menuPrice" value="`+price+`" />
					<input type="text" readonly id="menuTotal" value="`+price+`" name="menuTotal"/>
					<input type="hidden" id="cafeMenuId" name="cafeMenuId" value="`+id+`">
					<a href="javascript:delMenu(`+id+`)" id="delMenu">삭제</a>
					<a href="javascript:addCountMenu(`+id+`)" id="addCountMenu">추가</a>
					<a href="javascript:subCountMenu(`+id+`)" id="subCountMenu">빼기</a>
				</div>`)
				
			var total = $("#totalPrice")
			var totalHidden = $("#totalHidden")
			total.val(Number(total.val())+Number(price))
			
			totalHidden.val(total.val())
			}
			
		}
		
		function addCountMenu(id){
			var total = $("#totalPrice")
			var totalHidden = $("#totalHidden")
			var count = $("."+id).children('input:eq(1)')
			var price = $("."+id).children('input:eq(2)')
			var totprice = $("."+id).children('input:eq(3)')
			
			count.val(Number(count.val())+1)
			totprice.val(Number(count.val())*Number(price.val()))
			total.val(Number(total.val())+Number(price.val()))
			
			totalHidden.val(total.val())
		}
		
		function subCountMenu(id){
			var total = $("#totalPrice")
			var totalHidden= $("#totalHidden")
			var count = $("."+id).children('input:eq(1)')
			var price = $("."+id).children('input:eq(2)')
			var totprice = $("."+id).children('input:eq(3)')
			total.val(Number(total.val())-Number(count.val()=='1'?'0':price.val()))
			
			count.val(Number(count.val())-1<1?1:Number(count.val())-1)
			totprice.val(Number(count.val())*Number(price.val()))
			
			totalHidden.val(total.val())
		}
		function delMenu(id){
			var total = $("#totalPrice")
			var totalHidden = $("#totalHidden")
			var totprice = $("."+id).children('input:eq(3)')
			total.val(Number(total.val())-Number(totprice.val()))
			$("."+id).remove()
			
			totalHidden.val(total.val())
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		$("#useMileage").on('input',()=>{
			const use =$("#useMileage")
			const my = $("#mymileage")
			const tot = $("#totalPrice")
			
			var usemile =Number(use.val())
			var mymile = ${principal.user.mileage }
			var total = Number($("#totalHidden").val())
			
			if(mymile-usemile>0){
				my.html(mymile-usemile)
			}else{
				use.val(mymile)
				my.html(0)
			}
			
			if(total-usemile>0){			
				tot.val(total-usemile)
			}else{
				tot.val(0)
				use.val(total)
				my.html(usemile-total)
			}
		})
		
	</script>
</body>
</html>