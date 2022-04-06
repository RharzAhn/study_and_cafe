<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${study.title}</title>
<link
	href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>
<link>
<link rel="stylesheet" href="/css/board.css" />
</head>

<body>
	<div class="container">
		<section class="study-item">
			<div class="study-profile">
				<img src="${study.profile}">
			</div>
			<div class="content">
				<p class="study-title">${study.title}</p>
				<p class="study-info">${study.info}</p>
				<p class="study-date">
					<fmt:formatDate value="${study.startDate}" pattern="yyyy-MM-dd" />
					-
					<fmt:formatDate value="${study.endDate}" pattern="yyyy-MM-dd" />
				<p class="study-joined">/${study.limitCount}</p>
				<p class="study-mile">
					현재 <b>${study.mileage}</b> 마일리지 적립 중 🏃‍♂️
				</p>

			</div>
		</section>

		<form action="/study/board/register" method="post" id="frm">
			<input type="hidden" name="studyId" value="${study.id}">
			<textarea id="content" name="content" style="display: none"></textarea>
			<div id="content"></div>
			<button type="button" id="btnInsert">전송</button>
		</form>

		<div id="board-list"></div>
		<!-- container -->
</body>
<%@include file="../include/footer.jsp"%>
<script>
let editor = new FroalaEditor("div#content", {
    height:150,
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
				$.each(resp, (key,val)=>{
				var str = `<div class="board-item">
                <div class="board-header">
                    <div class="profile">
                        <img src="`+val.writer+`" />
                        <div>
                            <p class="writer">`+val.writer+`</p>
                            <p class="date">`+val.regdate+`</p>
                            
                        </div>
                    </div>`
                    if("${principal.user.username}"==val.writer){
	                    strt+=`<div class="board-btn">
	                        <button class="board-delete">삭제하기</button>
	                        <button class="board-upadate">수정하기</button>
	                    </div>`
					}
                   str+=`
                </div>
                <div class="board-content">
                    ${val.contnet}
                </div>
                <div class="more-reply">
                    댓글 1
                    <i class="fa-solid fa-chevron-down"></i>
                </div>
                <div class="board-footer">
                    <input
                        type="text"
                        name="reply"
                        placeholder="내용을 입력해 주세요"
                    />
                    <button id="replyBtn">
                        <i class="fa-solid fa-circle-plus"></i>
                    </button>
                </div>
            </div>
        </div>`
				
				
				
				
// 				var str= "<table class='table table-hover mt-3'>";
// 				$.each(resp, (key,val)=>{
// 					str+="<tr>";
// 					str+="<td>"+val.writer+"</td>";
// 					str+="<td>"+val.content+"</td>";
// 					str+="<td>"+val.regdate+"</td>";
// 					if("${principal.user.username}"==val.writer){
// 						str+="<td><a href='javascript:fdel("+val.id+")'>삭제</a></td>";
// 					}
// 					str+="</tr>";
// 				})
// 				str+="</table>";
				$("#board-list").html(str);	
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