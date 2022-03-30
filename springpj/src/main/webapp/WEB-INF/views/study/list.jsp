<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<form action="/study/list" method="get">
		<select name="field">
			<option value="both">내용/제목</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select> <input type="text" name="word">
		<button type="submit">검색</button>
	</form>
	<c:forEach items="${test}" var="t">
		<h3>${t.study.id }</h3>
		<h3>${t.study.title }</h3>
	</c:forEach>
	<div class="study_my">
		<div class="study_item">
			<div class="study_item_status">진행중</div>
			<img class="study_item_img" src="/images/image1.jpg">
			<p class="study_item_title">얼음에 베인</p>
			<p class="study_item_content">설명설명</p>
		</div>
		<div class="insert_study">
			<a href="/study/register"> +
				<p>나만의 스터디 그룹 만들기</p>
			</a>
		</div>
	</div>

	<div class="study_list">
		<c:forEach var="study" items="${studies}">
			<div class="study_item">
				<div class="study_item_status">진행중</div>
				<img class="study_item_img" src="/images/image1.jpg" onclick="location.href='/study/detail?id=${study.id}'">
				<p class="study_item_title">제목 : ${study.title }</p>
				<p class="study_item_content">내용 : ${study.content }</p>
				<label for="like">${study.likes }</label>
				<button type="button" id="like" onclick="clickLike(${study.id})">하트</button>
			</div>
		</c:forEach>
	</div>
	<style>
img {
	width: 50px;
	height: 50px;
}

.study_list {
	display: flex;
	justify-content: space-between;
}
</style>
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
	</script>
</body>
</html>