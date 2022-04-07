<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<a href="/admin/userlist" class="btn"></a> 
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
	            </tbody>
	   </table>
	</div>
	<div>
	
	<form action="/admin/userdelete" method="post">
		<br>
			<input type="text" name="deleteid" id="deletetext" placeholder="삭제할 회원의 고유번호를 입력하세요"></br>
		</br>
		<a> 
			<input type="button" onclick="admindelete()" name="delete" id="delete">삭제
		</a>
		</br>
	</form>
	
	</div>
	<script type="text/javascript">
	function admindelete(){
	    if(!jQuery.isNumeric($("#deletetext").val())){
	            alert("숫자가 아닙니다.")
	            return
	        }
	        $.ajax({
	            type: "post",
	            url: "/admin/admindelete",
	            data: {
					"id" : $("#deletetext").val()
				}
	        }).done(function(res){
	        	if(res=="success"){
	        		alert("삭제 성공")
	        	}else{
	        		alert("없는 번호입니다.")
	        	}
	        	location.href="/admin/userlist"
	        }); 
	}	
	</script>
	
</body>
</html>

 --%>