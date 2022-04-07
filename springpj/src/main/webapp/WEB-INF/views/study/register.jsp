<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
        />
        <link rel="stylesheet" href="/css/index.css" />
        <link rel="stylesheet" href="/css/form.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
            rel="stylesheet"
            type="text/css"
        />
        <script
            type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"
        ></script>
</head>
<body>
	 <div class="header"></div>
     <div class="container">
     	<h1>스터디 그룹 만들기</h1>	
		<form action="/study/register" method="post"
			enctype="multipart/form-data" id="fmt">
			<input type="hidden" name="leaderId" value="${principal.user.username}" />
			<table class="input-header">
                <tr>
                    <th>그룹이름</th>
                    <td colspan="3"><input type="text" name="title" /></td>
                </tr>
                <tr>
                    <th>그룹소개</th>
                    <td colspan="3"><input type="text" name="info" /></td>
                </tr>
                <tr>
                    <th>시작일</th>
                    <td>
                        <input
                            type="date"
                            name="startDate"
                            id="startDate"
                        />
                    </td>
                    <th>종료일</th>
                    <td>
                        <input type="date" name="endDate" id="endDate" />
                    </td>
                </tr>
                <tr>
                    <th>제한인원</th>
                    <td colspan="3">
                        <input
                            type="number"
                            name="limitCount"
                            id="limitCount"
                        />
                    </td>
                </tr>
                <tr>
                    <th>프로필</th>
                    <td colspan="3">
                        <input type="file" name="file" id="file" />
                        <label for="file">
                            <i class="fas fa-image"></i>
                        </label>
                        <input type="text" readonly class="upload-name"></input>
                    </td>
                </tr>
            </table>
			<div id="content">내용 : <textarea rows="10" cols="100" name="content"></textarea></div>
            <button id="btnInsert" >등록하기</button>

<%-- 			제목 : <input type="text" name="title"><br> 
			시작일 : <input type="date" name="startDate"><br> 
			종료일 : <input type="date" name="endDate"><br> 
			그룹장 : <input type="text" name="username" value="${principal.user.username}"><br> 
			파일 : <input type="file" name="file"> 
			제한인원 수 : <input type="number" name="limitCount"><br> 
			내용 : <textarea rows="10" cols="5" name="content"></textarea>
			<button>전송</button> --%>
		</form>
	</div>
   <script
       type="text/javascript"
       src="node_modules/froala-editor/js/froala_editor.pkgd.min.js"
   ></script>
	
   <script>
       const navMenu = document.querySelector(".nav-menu");
       const nav = document.querySelector(".nav");
       const navContent = document.querySelector(".nav-content");
       navMenu.addEventListener("mouseover", () => {
           nav.style.background = "var(--color-main)";
           navContent.style.height = "150px";
           navContent.style.display = "flex";
       });
       navMenu.addEventListener("mouseout", () => {
           nav.style.background = "none";
           navContent.style.height = "0";
       });
       navContent.addEventListener("mouseover", () => {
           nav.style.background = "var(--color-main)";
           navContent.style.height = "150px";
           navContent.style.display = "flex";
       });
       navContent.addEventListener("mouseout", () => {
           nav.style.background = "none";
           navContent.style.height = "0";
       });

       let editor = new FroalaEditor("div#content", {
           heightMin:500,
           heightMax:600
       }, function () {
           console.log(editor.html.get());
       });
       $("#btnInsert").click(() => {
           console.log(editor.html.get());
       });

       $("#file").on("change", function () {
           var fileName = $("#file").val();
           $(".upload-name").val(fileName);
       });
   </script>	

</body>

</html>
<%@ include file="../include/footer.jsp" %>