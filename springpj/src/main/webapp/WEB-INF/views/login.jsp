<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<div class="container">
<h2>로그인</h2>
<form action="/loginProc" method="post">

		<div class="form-group">
			<label for="username">아이디:</label> 
			<input type="text" class="form-control"
				id="username" placeholder="Enter username" name="username">
		</div>
		<div class="form-group">
			<label for="password">비밀번호:</label> <input type="password"
				class="form-control" id="password" placeholder="Enter password"
				name="password">
		</div>
		<button type="submit" class="btn btn-primary btn-sm" id="btnLogin">로그인</button>
		<button type="button" class="btn btn-secondary btn-sm" id="join">회원가입</button>
	</form>
</div>
<script type="text/javascript" src="/js/member.js"></script>
<script type="text/javascript">
	$("#join").click(function() {

		location.href = "/join"

	});

</script>

