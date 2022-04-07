<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입하세요</title>
</head>
<body>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
        />
        <link rel="stylesheet" href="css/index.css" />
        <link rel="stylesheet" href="css/join.css" />
    </head>
    <body>
        <nav>
            <div class="logo"></div>
        </nav>
			<section class="joinform">
				<form action="/joinProc" method="post">
				<h3 onclick="location.href='/index'">BOOK</h3>
				<p>하나의 아이디로 북 서비스를 즐겨보세요</p>
				<div class="input-boxes">
					<div class="input-box">
						<input type="text" name="username" id="username" placeholder="아이디" />
						<button type="button" id="btnIdCheck">중복확인</button>
					</div>
					<div class="input-box">
						<input type="text" name="nick" id="nick" placeholder="닉네임" />
					</div>
			
					<input type="password" name="password" id="password"
						placeholder="비밀번호" />
					<div class="input-box">
						<input type="password" name="pass_check" id="pass_check"
							placeholder="비밀번호 확인" /> <label for="pass_check">
							<i class="fa-solid fa-circle-check"></i>
						</label>
					</div>
					<div class="input-box">
						<input type="text" name="email1" id="email1" placeholder="이메일" />@
						<select name="email2" id="email2">
							<option value="@naver.com">naver.com</option>
							<option value="@google.com">google.com</option>
							<option value="@daum.net">daum.net</option>
						</select>
					</div>
					<div class="input-box">
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기">
					</div>
						<input type="text" id="sample6_address" placeholder="주소"> <input
							type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					</div>
					<div class="input-box">
						<select class="form-control role" id="role" name="role">
							<option value="ROLE_USER" selected>사용자</option>
							<option value="ROLE_MANAGER">매니저</option>
						</select>
					</div>
					<button type="button" value="회원가입" id="btnJoin">회원가입</button>
					<button type="reset">초기화</button>
				</form>
	</section>
</body>
	<script type="text/javascript" src="../js/member.js"></script>
    <script>
					function sample6_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if (data.userSelectedType === 'R') {
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraAddr !== '') {
												extraAddr = ' (' + extraAddr
														+ ')';
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document
													.getElementById("sample6_extraAddress").value = extraAddr;

										} else {
											document
													.getElementById("sample6_extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample6_postcode').value = data.zonecode;
										document
												.getElementById("sample6_address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById(
												"sample6_detailAddress")
												.focus();
									}
								}).open();
					}
				</script>



</html>