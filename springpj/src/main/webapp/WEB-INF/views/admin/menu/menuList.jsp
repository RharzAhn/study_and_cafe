<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>�޴� ����</h2>
		<table class="table table-hover" border="1">
			<thead>
				<tr>
					<th>�޴���ȣ</th>
					<th>�޴���</th>
					<th>����</th>
					<th>����</th>
					<th>����</th>
					<th>�޴�Ÿ��</th>
					<th>����</th>
					<th>����</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="menu">
					<tr>
						<td>${menu.id}</td>
						<td>${menu.name}</td>
						<td>${menu.intro}</td>
						<td><img class="menu_img" src="${menu.profile}" width="50px" height="10%"></td>
						<th>${menu.price}</th>
						<td>${menu.menuType}</td>
						<td><button type="button" class="btn btn-secondary btn-sm"
								id="update"
								onclick="location.href='/admin/menu/menuUpdate/${menu.id}'">����</button></td>
						<td><button type="button" class="btn btn-secondary btn-sm"
								id="delete"
								onclick="location.href='/admin/menu/delete/${menu.id}'">����</button></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="register">�߰�</button>
		</div>
	</div>

</body>

<script type="text/javascript">
	$("#register").click(function() {
		location.href = "../menu/menuRegister"
	});
</script>

</html>