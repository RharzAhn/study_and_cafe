<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/index.css" />
<link rel="stylesheet" href="/css/study_list.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
</head>
<body>
	<div class="header">
	    <h1>STUDY GROUP</h1>
	    <span></span>
	    <p>스터디그룹에 가입해서 다양한 혜택을 받아보세요</p>
	</div>
	
	<div id="search">
		<form action="/study/list" method="get">
			<select name="field">
				<option value="both">내용/제목</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="word" placeholder="검색어를 입력하세요">
			<button type="submit">검색</button>
			<button><i class="fa-solid fa-magnifying-glass"></i></button>
		</form>
	</div>
	
	<div class="study_my">
		<c:forEach items="${joins}" var="joiner">
			<div class="study_item">
				<img class="study_item_img" src="${joiner.study.profile }"
					onclick="myStudyEnter(${joiner.study.id })">
				<p class="study_item_title">${joiner.study.title }</p>
				<p class="study_item_content">${joiner.study.content}</p>
				<c:if test="${joiner.joinStatus=='WAITING'}">
				대기중
			</c:if>
			</div>
		</c:forEach>
		<div class="insert_study">
			<button type="button" id="btnMkStudy">
				+
				<p>나만의 스터디 그룹 만들기</p>
			</button>
		</div>
	</div>
	<article>
		<div class="order">
            <select name="order" id="order">
                <option value="likes">인기순</option>
            </select>
        </div>

		<div class="study-items">
			<c:forEach var="study" items="${studies}">
				<div class="study-item">
					<div class="study-status">진행중</div>
					<img class="study-profile" src="${study.profile }"
						onclick="location.href='/study/detail?id=${study.id}'">
					<p class="study-title">제목 : ${study.title }</p>
					<p class="study-info">내용 : ${study.content }</p>
					<ul>
						<li>지역</li>
						<li>기간</li>
						<li>멤버수</li>
					</ul>
					<div class="likes">
						<i id="like" class="fa-regular fa-heart"></i>
						<label for="like">${study.likes }</label>
						<button type="button" id="like" onclick="clickLike(${study.id})">하트</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<ul class="paging">
	         <li class="prev"><i class="fas fa-angle-left"></i></li>
	         <li>1</li>
	         <li>2</li>
	         <li>3</li>
	         <li>4</li>
	         <li>5</li>
	         <li class="next"><i class="fas fa-angle-right"></i></li>
	     </ul>
	</article>

	<script type="text/javascript">
		function clickLike(id){
			$.ajax({
				type:"post",
				url:"/study/checkLike",
				data:{
					"studyId": id,
					"userId": 1
				}
			}).done((res)=>{
				location.href="/study/list"
			})
		}
		
		$("#btnMkStudy").click(()=>{
			if(${empty principal}){
				alert("로그인이 필요합니다.")
				return
			}
			location.href="/study/register"
		})
		
		
		function myStudyEnter(id){
			$.ajax({
				type:"post",
				url:"/study/"+id,
				data:{
					"id":id
				}
			}).done((res)=>{
				if(res=="success"){
					location.href="/study/"+id					
				}else{
					alert("가입된 멤버가 아닙니다.")
				}
			})
		}
	</script>

	<!--         <div class="container">
            <div id="my-study">
                <div class="main-my-study">
                    <img src="images/bookex.jpg" />
                    <p class="study-title">독서모임스터디</p>
                </div>
                <div class="my-studyies">
                    <div class="my-study">
                        <img src="images/bookex.jpg" />
                        <p class="study-title">독서어쩌구</p>
                    </div>
                </div>
                <div class="insert-my-study">
                    <i class="fa-solid fa-plus"></i>
                </div>
            </div>

            <div id="search">
                <form action="/study/list">
                    <select name="field" id="field">
                        <option value="both">제목/내용</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input
                        type="text"
                        name="word"
                        placeholder="검색어를 입력하세요"
                    />
                    <button>
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <article>
                <div class="order">
                    <select name="order" id="order">
                        <option value="likes">인기순</option>
                    </select>
                </div>
                <div class="study-items">
                    <div class="study-item">
                        <div class="study-status">진행중</div>
                        <div class="study-profile">
                            <img src="images/bookex.jpg" />
                        </div>
                        <div class="content">
                            <p class="study-title">독서모임스터디</p>
                            <p class="study-info">
                                모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱
                            </p>
                            <ul>
                                <li>지역 : 부산 동래구</li>
                                <li>기간 : 2031.15.21-44.11.22</li>
                                <li>멤버수 : 2/3</li>
                            </ul>

                            <div class="likes">
                                <i id="like" class="fa-regular fa-heart"></i>
                                <label for="like">10</label>
                            </div>
                        </div>
                    </div>
                    <div class="study-item">
                        <div class="study-status">진행중</div>
                        <div class="study-profile">
                            <img src="images/bookex.jpg" />
                        </div>
                        <div class="content">
                            <p class="study-title">독서모임스터디</p>
                            <p class="study-info">
                                모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱
                            </p>
                            <ul>
                                <li>지역 : 부산 동래구</li>
                                <li>기간 : 2031.15.21-44.11.22</li>
                                <li>멤버수 : 2/3</li>
                            </ul>

                            <div class="likes">
                                <i id="like" class="fa-regular fa-heart"></i>
                                <label for="like">10</label>
                            </div>
                        </div>
                    </div>
                    <div class="study-item">
                        <div class="study-status">진행중</div>
                        <div class="study-profile">
                            <img src="images/bookex.jpg" />
                        </div>
                        <div class="content">
                            <p class="study-title">독서모임스터디</p>
                            <p class="study-info">
                                모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱
                            </p>
                            <ul>
                                <li>지역 : 부산 동래구</li>
                                <li>기간 : 2031.15.21-44.11.22</li>
                                <li>멤버수 : 2/3</li>
                            </ul>

                            <div class="likes">
                                <i id="like" class="fa-regular fa-heart"></i>
                                <label for="like">10</label>
                            </div>
                        </div>
                    </div>
                    <div class="study-item">
                        <div class="study-status">진행중</div>
                        <div class="study-profile">
                            <img src="images/bookex.jpg" />
                        </div>
                        <div class="content">
                            <p class="study-title">독서모임스터디</p>
                            <p class="study-info">
                                모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱
                            </p>
                            <ul>
                                <li>지역 : 부산 동래구</li>
                                <li>기간 : 2031.15.21-44.11.22</li>
                                <li>멤버수 : 2/3</li>
                            </ul>

                            <div class="likes">
                                <i id="like" class="fa-regular fa-heart"></i>
                                <label for="like">10</label>
                            </div>
                        </div>
                    </div>

                    <div class="study-item">
                        <div class="study-status">진행중</div>
                        <div class="study-profile">
                            <img src="images/bookex.jpg" />
                        </div>
                        <div class="content">
                            <p class="study-title">독서모임스터디</p>
                            <p class="study-info">
                                모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱모여소덕소도서더걱
                            </p>
                            <ul>
                                <li>지역 : 부산 동래구</li>
                                <li>기간 : 2031.15.21-44.11.22</li>
                                <li>멤버수 : 2/3</li>
                            </ul>

                            <div class="likes">
                                <i id="like" class="fa-regular fa-heart"></i>
                                <label for="like">10</label>
                            </div>
                        </div>
                    </div>
                </div>

                <ul class="paging">
                    <li class="prev"><i class="fas fa-angle-left"></i></li>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li class="next"><i class="fas fa-angle-right"></i></li>
                </ul>
            </article>
        </div>
        <script>
        const navMenu = document.querySelector(".nav-menu");
        const nav = document.querySelector(".nav");
        const navContent = document.querySelector(".nav-content");
        navMenu.addEventListener("mouseover", () => {
            nav.style.background = "var(--color-main)";
            navContent.style.height = "150px";
            navContent.style.display = "flex";
        });
        navMenu.addEventListener("mouseout", () => {
            nav.style.background = "none";
            navContent.style.height = "0";
        });
        navContent.addEventListener("mouseover", () => {
            nav.style.background = "var(--color-main)";
            navContent.style.height = "150px";
            navContent.style.display = "flex";
        });
        navContent.addEventListener("mouseout", () => {
            nav.style.background = "none";
            navContent.style.height = "0";
        });
    </script> -->
</body>
</html>
<%@ include file="../include/footer.jsp" %>