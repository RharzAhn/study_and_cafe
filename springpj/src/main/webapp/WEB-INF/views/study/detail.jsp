<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="sec"
		uri="http://www.springframework.org/security/tags"%>
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

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal" />
	</sec:authorize>
	<div class="study_info">
		<p>진행중</p>
		<img class="study_img" src="${study.profile }">
		<p class="study_title">제목:${study.title}</p>
		<p class="study_info">소개:${study.info }</p>
		<ul>
			<li>지역 : ${study.local }</li>
			<li>스터디장 : ${study.leader.username }</li>
			<li>기간 : <fmt:formatDate value="${study.startDate}" />-<fmt:formatDate
					value="${study.endDate}" /></li>
			<li>제한인원 : ${study.limitCount }</li>
		</ul>
		<c:if test="${principal.user.id != study.leader.id }">
			<button type="button" id="applyBtn">참여 신청</button>
		</c:if>
	</div>

	<div class="study_content">${study.content}</div>
</body>
<style>
body {
	display: flex
}

img {
	width: 100px;
	height: 100px;
}
</style>
<script type="text/javascript">
	$("#applyBtn").click(()=>{
		if(${empty principal}){
			alert("로그인이 필요합니다.")
			return
		}
		
		if(confirm("${study.title}에 신청하시나요? \n 스터디 장에게 기본적인 정보가 제공될 수 있습니다."))
		{
			$.ajax({
				type:"post",
				url:"/study/apply",
				data:{
					"studyId":${study.id},
					"userId":${principal.user.id}
				}
			}).done((resp)=>{
				alert("신청이 완료되었습니다.")
			})
		}
	})
</script>
</html>