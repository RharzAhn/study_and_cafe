<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h2>유저 목록</h2>
	<li class="nav-item">
	   <a class="nav-link" href="/admin/mileagelist">회원조회</a></li>
	   	<input type="button" class="btn_user_update" 
		onclick="delMile('${user.username}')" value="수정"></td>
	<input type="button" class="btn_user_delete" 
	onclick="delMile('${user.username}')" value="삭제"></td>
	<table class="user_list">
	<colgroup>
	                <col width="15%"/>
	                <col width="*"/>
	                <col width="15%"/>
	                <col width="20%"/>
	            </colgroup>
	            <thead>
	            <tr>
		            <th scope="col"> 고유번호</th>
		            <th scope="col"> 아이디</th>
		            <th scope="col"> 닉네임</th>
		            <th scope="col"> 주소</th>
		            <th scope="col"> 이메일</th>
		            <th scope="col"> 마일리지</th>
		            <th scope="col"> 권한</th>
		            <th scope="col"> 가입일</th>
	            </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${userlist}" var="user">
	            <tr>
	            	<td class="id">${user.id }</td>
	            	<td class="username">${user.username }</td>
	            	<td class="nick">${user.nick }</td>  
	            	<td class="addr">${user.addr }</td>  
	            	<td class="email">${user.email }</td>  
	            	<td class="mileage">${user.mileage }</td> 
	            	<td class="role">${user.role }</td>  
	            	<td class="regdate">${user.regdate }</td>  
	            </tr>
	            </c:forEach>
	            	<td colspan="9">조회된 결과가 없습니다</td>
	            </tr>
	            </tbody>
	   </table>
	   <a href="/admin/userlist" class="btn"></a>
	  
	   
	</div>
</body>
</html>