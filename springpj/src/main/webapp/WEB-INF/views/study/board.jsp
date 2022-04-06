<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	${study.title}

	<form action="/study/board/register" method="post" id="frm">
		<input type="hidden" name="studyId" value="${study.id}">
		<textarea id="content" name="content"></textarea>
		<div id="content"></div>
		<button type="button" id="btnInsert">전송</button>
	</form>


	<div id="boardResult">#</div>
</body>

<script>
let editor = new FroalaEditor("div#content", {
    heightMin:150,
    heightMax:150,
    imageUploadURL:'/study/board/imgupload',
    imageUploadParam:'file',
    imageUploadMethod:'post',
    imageAllowedTypes:['jpeg','jpg','png'],

}, function () {
    console.log(editor.html.get());
});


$("#btnInsert").click(() => {
	$.ajax({
		type:"post",
		url:"/study/board/register",
		data:{
			"study":${study.id},
			"writer":"${principal.user.username}",
			"content": editor.html.get()
		}
	}).done((resp)=>{
		alert("등록이 완료되었습니다.")
		init();
// 		location.href="/study/board/"+"${study.id}"
	})
	
});
	const init= ()=>{
		$.ajax({
			type: "get",
			url : "/study/board/${study.id}",
			dataType:"JSON",
			cotentType: "application/json; charset=utf-8",
			success:function(resp){
				var str= "<table class='table table-hover mt-3'>";
				$.each(resp, (key,val)=>{
					str+="<tr>";
					str+="<td>"+val.writer+"</td>";
					str+="<td>"+val.content+"</td>";
					str+="<td>"+val.regdate+"</td>";
					if("${sessionScope.sUser.username}"==val.writer){
						str+="<td><a href='javascript:fdel("+val.id+")'>삭제</a></td>";
					}
					str+="</tr>";
				})
				str+="</table>";
				$("#boardResult").html(str);	
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}

	init();
	function fdel(rno){
		$.ajax({
			type:"delete",
			url:"/replies/"+rno,
		}).done((resp)=>{
			alert("댓글 삭제 완료");
			init();
		}).fail(()=>{
			alert("댓글 삭제 실패")
		})
	}
</script>
</html>