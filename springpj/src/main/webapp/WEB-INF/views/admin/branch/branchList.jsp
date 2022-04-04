<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>지점 관리</title>
</head>
<body>
	<div class="container">
		<h2>지점 관리</h2>
		<table class="table table-hover" border="1">
			<thead>
				<tr>
					<th>지점번호</th>
					<th>지점명</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>지점장명</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="branch">
					<tr>
						<td>${branch.id}</td>
						<td>${branch.name}</td>
						<td>${branch.addr}</td>
						<td>${branch.phone}</td>
						<td>${branch.manager.username}</td>
						<td><button type="button" class="btn btn-secondary btn-sm"
								id="update"
								onclick="location.href='/admin/branch/branchUpdate/${branch.id}'">수정</button></td>
						<td><button type="button" class="btn btn-secondary btn-sm"
								id="delete"
								onclick="location.href='/admin/branch/delete/${branch.id}'">삭제</button></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="register">추가</button>
		</div>
	</div>

</body>

<script type="text/javascript">
	$("#register").click(function() {
		location.href = "../branch/branchRegister"
	});
</script>

</html>