<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/home.css" />
</head>
<body>
	<%@ include file="include/header.jsp"%>
	
	<div class="main">
            <div class="container">
                <div class="icon"></div>
                <div class="counter">
                    <p class="counter-number"></p>
                    <p class="counter-info">
                        <b>현재 운영 중</b>인<br />스터디 그룹 수
                    </p>
                    <p class="counter-number"></p>
                    <p class="counter-info">
                        <b>현재 참여 중</b>인<br />스터디 멤버
                    </p>
                </div>
                <ul class="bottom-menu">
                    <li><a href="#cafe-system">카페시스템</a></li>
                    |
                    <li><a href="#poplar-study">추천스터디그룹</a></li>
                    |
                    <li><a href="#cafe-interial">카페인테리어</a></li>
                </ul>
            </div>
        </div>

        <div id="cafe-system">
            <div class="container">
                <div class="book-system">
                    <div class="title">
                        <p>북시스템</p>
                        <p>BOOK<br />SYSTEM</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="popular-study">
            <div class="container">
                <div class="study-card">
                    <div class="study-profile">
                        <img src="../images/bookex.jpg" />
                        <div class="deco"></div>
                    </div>
                    <div class="study-content">
                        <p class="study-status">진행중</p>
                        <p class="study-title">독서모임스터디</p>
                        <span class="study-info"
                            >모여서 독서를 하고 토론을 해주는 모임모여서 독서를
                            하고 토론을 해주는 모임</span
                        >
                        <div class="study-detail">
                            <ul>
                                <li>지역 : 부산동래구</li>
                                <li>기간 : 22.12.32-22.03.15</li>
                                <li>멤버수 : 2/2</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 	
<!--  	<br><a href="/admin/userlist">사용자 리스트 바로가기</a></br> -->
<!--  	<br><a href="/admin/mileagelist">사용자 마일리지 바로가기</a></br> -->
<!--  		<br><a >-----------------</a></br> -->
<!--  	<br><a href="/user/userpage"> 유저 페이지 바로가기</a></br> -->
<!--  	<br><a href="/user/usermilage">유저 마일리지 바로가기</a></br> -->
<!--  	<br><a href="/user/userupdate">유저 수정,삭제 바로가기</a></br> -->
 		<script>
 			 var memberCountConTxt = 200;

 	        $({ val: 0 }).animate(
 	            { val: memberCountConTxt },
 	            {
 	                duration: 2000,
 	                step: function () {
 	                    var num = numberWithCommas(Math.floor(this.val));
 	                    $(".counter-number").text(num);
 	                },
 	                complete: function () {
 	                    var num = numberWithCommas(Math.floor(this.val));
 	                    $(".counter-number").text(num);
 	                },
 	            }
 	        );

 	        function numberWithCommas(x) {
 	            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	        }
 	    </script>
</body>
</html>