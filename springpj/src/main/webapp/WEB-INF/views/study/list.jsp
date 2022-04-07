<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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

	<div class="container">

		<div id="my-study">
			<div class="my-studyies">
				<c:forEach items="${joins}" var="join">
					<div class="my-study" onclick="myStudyEnter('${join.study.id}')">
						<img src="${join.study.profile }" />
						<p class="study-title">${join.study.title }</p>
					</div>
				</c:forEach>
			</div>
			<div class="insert-my-study">
				<button type="button" id="btnMkStudy">
					<i class="fa-solid fa-plus"></i>
				</button>
			</div>
		</div>

		<%-- <div class="study_my">
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
		</div> --%>

		<div id="search">
			<form action="/study/list" method="get">
				<select name="field" id="field">
					<option value="both">내용/제목</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="text" name="word" placeholder="검색어를 입력하세요">
				<!-- <button type="submit">검색</button> -->
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
				<c:forEach var="study" items="${studies}">
					<fmt:formatDate value="${study.startDate}" pattern="yyyy.MM.dd"
						var="start" />
					<fmt:formatDate value="${study.endDate}" pattern="yyyy.MM.dd"
						var="end" />
					<div class="study-item">
						<div class="study-status">진행중</div>
						<img class="study-profile" src="${study.profile }"
							onclick="location.href='/study/detail?id=${study.id}'">
						<div class="content">
							<p class="study-title">${study.title}</p>
							<p class="study-info">${study.info }</p>
							<ul>
								<li>지역 : 부산</li>
								<li>기간 : ${start}-${end}</li>
								<li>제한인원 : ${study.limitCount }</li>
							</ul>
							<div class="likes">
								<i id="like" class="fa-regular fa-heart"></i> <label for="like">${study.likes }</label>
								<button type="button" id="like" onclick="clickLike(${study.id})">하트</button>
							</div>
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
	</div>

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
				location.href="/login"
				return
			}
			location.href="/study/register"
		})
		
		
		function myStudyEnter(id){
			$.ajax({
				type:"post",
				url:"/study/confirm",
				data:{
					"id": id
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
</body>
</html>
<%@ include file="../include/footer.jsp"%>