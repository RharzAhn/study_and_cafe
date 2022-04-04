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
<%@ include file="../include/header.jsp" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<form action="/study/list" method="get">
		<select name="field">
			<option value="both">내용/제목</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select> <input type="text" name="word">
		<button type="submit">검색</button>
	</form>

	<div class="study_my">
		<c:forEach items="${joins}" var="joiner">
			<div class="study_item">
			<img class="study_item_img" src="${joiner.study.profile }" onclick="myStudyEnter(${joiner.study.id })">
			<p class="study_item_title">${joiner.study.title }</p>
			<p class="study_item_content">${joiner.study.content}</p>
			<c:if test="${joiner.joinStatus=='WAITING'}">
				대기중
			</c:if>
		</div>
		</c:forEach>
		<div class="insert_study">
			<button type="button" id="btnMkStudy"> +
				<p>나만의 스터디 그룹 만들기</p>
			</button>
		</div>
	</div>

	<div class="study_list">
		<c:forEach var="study" items="${studies}">
			<div class="study_item">
				<div class="study_item_status">진행중</div>
				<img class="study_item_img" src="${study.profile }" onclick="location.href='/study/detail?id=${study.id}'">
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
		
		$("#btnMkStudy").click(()=>{
			if(${empty principal}){
				alert("로그인이 필요합니다.")
				return
			}
			location.href="/study/register"
		})
		
		
		function myStudyEnter(id){
			location.href="/study/board/"+id
// 			$.ajax({
// 				type:"get",
// 				url:"/study/board/"+id,
// 				data:{
// 					"id":id
// 				}
// 			}).done((res)=>{
// 				if(res=="success"){
// 					location.href="/study/"+id
// 				}else{
// 					alert("가입된 멤버가 아닙니다.")
// 				}
// 			})
		}
	</script>
</body>
</html>