<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>



<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAH9_5Tw4NicbJS8gNnWZ16wOIBQ1JEAs&libraries=places&callback=myMap"
	async defer></script>

<script type="text/javascript" defer>
	var autocomplete;
	function myMap(addr) {

		var lat;
		var lng;
		
		document.getElementById('autocomplete').value = addr
		
		autocomplete = new google.maps.places.Autocomplete((document
				.getElementById('autocomplete')), {
			types : [ 'geocode' ]
		});

		autocomplete.addListener('place_changed', function() {
			var place = autocomplete.getPlace();

			lat = place.geometry.location.lat();
			lng = place.geometry.location.lng();
		});
		console.log(lat, lng)

		if (!addr) {
			var myLatlng = new google.maps.LatLng(35.837143, 128.558612);
		} else {
			var myLatlng = new google.maps.LatLng(lat, lng);
		}
		var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼 

		var mapOptions = {
			zoom : zoomLevel,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapOptions);

		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map
		});
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
	}

	// 	function fillInAddress() {
	// 		// Get the place details from the autocomplete object.
	// 		var place = autocomplete.getPlace();

	// 		lat= place.geometry.location.lat();
	// 		lng = place.geometry.location.lng();
	// 	}
</script>
</head>
<body>


	<div id="locationField">
		<input id="autocomplete" placeholder="Enter your address" type="text">
	</div>

	<input class="field" id="lat" />
	<input class="field" id="lng" />

	<div id="googleMap" style="width: 50%; height: 350px;"></div>



	<form action="/admin/book/bookCafe" method="get">
		<div class="container">
			<h2>예약 하기</h2>
			<table class="table table-hover" border="1">
				<thead>
					<tr>
						<th>지점번호</th>
						<th>지점명</th>
						<th>주소</th>
						<th>지역</th>
						<th>전화번호</th>
						<th>매장사진</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="cafe">
						<tr>
							<td>${cafe.id}</td>
							<td>${cafe.name}</td>
							<td>${cafe.addr}</td>
							<th>지역</th>
							<td>${cafe.phone}</td>
							<td>링크</td>
							<td><input type="radio" name="pick" id="radio"
								onclick="mapping('${cafe.id}','${cafe.addr}')"></td>
							<!-- 테스트가 함수이름? 버튼눌럿을때 어떻게값을담는지 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="form-group text-right">
				<button type="button" class="btn btn-secondary btn-sm" id="submit">전송</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" defer>

		let cafe_num = null
		function mapping(num, addr) {
			cafe_num = num
			myMap(addr)
		}
	
		$("#submit").click(function() {
			console.log(cafe_num)
			//location.href = "../book/test?cafeId="+cafe_num;
			location.href = "../book/bookSeat?id=" + cafe_num;
		}) // " "안에있는 주소의 의미??
		// location.href = 뒤에 제대로된 경로를 쓰면 거기다가 id값을 던지는??
	</script>
</body>
</html>
<%@ include file="../include/footer.jsp" %>