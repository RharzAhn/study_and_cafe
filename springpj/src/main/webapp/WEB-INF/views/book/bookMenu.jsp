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
	<div class="container">
		<form action="/book/bookConfirm" method="post" id="selectMenuForm">
			<input type="hidden" name="studyId" value="${studyId}"> <input
				type="hidden" name="cafeId" value="${cafeId}"> <input
				type="hidden" name="bookdate" value="${dateTime}">
			<c:forEach items="${seatList}" var="seat">
				<input type="hidden" name="seat" value="${seat}">
			</c:forEach>
			<div class="menuForm">
				<div class="container selectMenu">
					<div class="row cafeMenu">
						<c:forEach items="${cafeMenus}" var="menu">
							<div class="card" style="width: 12rem;"
								onclick="addMenu('${menu.id}','${menu.menu.name}','${menu.menu.price}')">
								<img src="${menu.menu.profile}" class="card-img-top menu_img">
								<div class="card-body">
									<h5 class="card-title">${menu.menu.name}</h5>
									<p class="card-text">${menu.menu.price}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="orderForm">
					<div id="cafeOrderList"></div>
					<h3>결제 방식</h3>
					<div class="use-mile">
						<p>
							<b>사용가능 마일리지</b>
						</p>
						<p id="mymileage">${principal.user.mileage }</p>
						<p>
							<input type="number" id="useMileage" name="useMile" value="0">
						</p>
					</div>
					<div class="totalForm">
						<input type="text" value="0" id="totalPrice" name="totalPrice">
						<input type="hidden" value="0" id="totalHidden"> <input
							type="submit" id="submitBtn" value="결제">
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
	
	
	
	// 마일리지 계산 함수
	var mileCalcul = () => {
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
		
		if(total-usemile>=0){			//총 결제 금액이 입력된 마일리지 보다 클 때
			tot.val(total-usemile)
		}
		else if(total-usemile>=0 && mymile>=usemile){ //총 결제금액이 입력된 마일리지보다 높고, 입력된 마일리지가 가지고 있는 마일리지보다 클때
			use.val(usemile)
			my.html(0)
			tot.val(total-mymile)
		}
		else if(total>=mymile && total-usemile<0 && mymile>=usemile){ //총 결제금액이 입력된 마일리지보다 작고, 입력된 마일리지가 가지고 있는 마일리지보다 작을때 
			my.html(mymile-usemile)
			tot.val(total-mymile)
			//my.val(mymile-usemile)
		}else if(total>=mymile && total-usemile<0 && mymile<usemile){ //총 결제 금액이 입력된 마일리지 보다 작고, 입력된 마일리지가 가지고 있는 마일리지보다 클때
			use.val(mymile)
			my.html(0)
			tot.val(total-mymile)
		}
		else if(total<mymile && total-usemile<0 && mymile>=usemile){ //총 결제금액이 입력된 마일리지보다 작고, 입력된 마일리지가 가지고 있는 마일리지보다 작을때 
			use.val(total)
			my.html(mymile-total)
			tot.val(0)
			//my.val(mymile-usemile)
		}else if(total<mymile && total-usemile<0 && mymile<usemile){ //총 결제 금액이 입력된 마일리지 보다 작고, 입력된 마일리지가 가지고 있는 마일리지보다 클때
			use.val(total)
			my.html(mymile-total)
			tot.val(0)
		}
	}
	
	
	
	
		function addMenu(id,name,price){
			console.log($("."+id).length)
			if($("."+id).length==0){
			$("#cafeOrderList").append(`<div id="cafeOrder" class=`+id+`>
					<input type="text" readonly id="menuName"  value="`+name+`">
					<input type="text" readonly id="menuCount" value="1" name="count">
					<input type="hidden" readonly id="menuPrice" value="`+price+`" />
					<input type="text" readonly id="menuTotal" value="`+price+`" name="menuTotal"/>
					<input type="hidden" id="cafeMenuId" name="cafeMenuId" value="`+id+`">
					<div class="update-menu-btn"><a href="javascript:delMenu(`+id+`)" id="delMenu"><i class="fa-solid fa-xmark"></i></a>
					<a href="javascript:addCountMenu(`+id+`)" id="addCountMenu"><i class="fa-solid fa-plus"></i></a>
					<a href="javascript:subCountMenu(`+id+`)" id="subCountMenu"><i class="fa-solid fa-minus"></i></a></div>
				</div>`)
				
			var total = $("#totalPrice")
			var totalHidden = $("#totalHidden")
			total.val(Number(totalHidden.val())+Number(price))
			totalHidden.val(total.val())
			
			mileCalcul()
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
			total.val(Number(totalHidden.val())+Number(price.val()))
			
			totalHidden.val(total.val())
			mileCalcul()
		}
		
		function subCountMenu(id){
			var total = $("#totalPrice")
			var totalHidden= $("#totalHidden")
			var count = $("."+id).children('input:eq(1)')
			var price = $("."+id).children('input:eq(2)')
			var totprice = $("."+id).children('input:eq(3)')
			total.val(Number(totalHidden.val())-Number(count.val()=='1'?'0':price.val()))
			
			count.val(Number(count.val())-1<1?1:Number(count.val())-1)
			totprice.val(Number(count.val())*Number(price.val()))
			
			totalHidden.val(total.val())
			mileCalcul()
		}
		function delMenu(id){
			var total = $("#totalPrice")
			var totalHidden = $("#totalHidden")
			var totprice = $("."+id).children('input:eq(3)')
			total.val(Number(totalHidden.val())-Number(totprice.val()))
			$("."+id).remove()
			
			totalHidden.val(total.val())
			mileCalcul()
		}
		
		
		
	
		
		$("#useMileage").on('input',mileCalcul)
	</script>
</body>
</html>