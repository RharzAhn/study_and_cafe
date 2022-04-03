<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
 <div class="container">
  <h2>메뉴수정</h2>
  <form action="/admin/menu/menuUpdate" method="post" enctype="multipart/form-data" id="fmt">
    <div class="form-group">
      <label for="id">메뉴번호:</label>
      <input type="text" class="form-control" id="id" value="${menu.id}" name="id" readonly>
    </div>
    <div class="form-group">
      <label for="name">메뉴명:</label>
      <input type="text" class="form-control" id="name" value="${menu.name}" name="name" >
    </div>
    <div class="form-group">
      <label for="intro">설명:</label>
      <input type="text" class="form-control" id="intro" value="${menu.intro}" name="intro" >
    </div>
    <div class="form-group">
      <label for="file">사진:</label>
      <input type="file" class="form-control" id="file" placeholder="사진" name="file" >
    </div>
    <div class="form-group">
      <label for="price">가격:</label>
      <input type="text" class="form-control" id="price" value="${menu.price}" name="price" >
    </div>
    <div class="form-group">
        <label for="menuType">메뉴타입:</label>
		<select name="menuType">
			<option value="COFFEE" selected>커피</option>
			<option value="LATTE">라떼</option>
			<option value="TEA">티</option>
			<option value="ADE">에이드</option>
			<option value="JUICE">쥬스</option>
			<option value="SMOOTHIE">스무디</option>
			<option value="DESSERT">디저트</option>
			<option value="ETC">기타</option>
		  </select>
    </div>
    <div class="form-group">
<!--       <label for="manager">지점장명:</label> -->
<!--       <input type="text" class="form-control" id="manager" name="manager" placeholder="지점장명"> -->
    </div>

    <button type="button" class="btn btn-primary btn-sm" id="update" >수정</button>
  </form>
</div>
</body>
<script type="text/javascript">
	$("#update").click(function() {
		if($("#name").val()==""){
			alert("메뉴명을 입력하세요");
			$("#name").focus();
			return false;
		}
		if($("#intro").val()==""){
			alert("설명 입력하세요");
			$("#intro").focus();
			return false;
		}
		if($("#file").val()==""){
			alert("이미지를 첨부하세요");
			$("#file").focus();
			return false;
		}
		if($("#price").val()==""){
			alert("가격을 입력하세요");
			$("#price").focus();
			return false;
		}
		if(!jQuery.isNumeric($("#price").val())) {
			alert("가격을 숫자로 입력하세요.");
			$("#price").focus();
			$('#price').val('');
            return false;
		}
		
		$("#fmt").submit();
	});
</script>

</html>