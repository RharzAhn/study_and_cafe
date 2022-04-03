<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메뉴추가</title>
</head>
<body>
 	<div class="container">
 		 <h2>메뉴추가</h2>
 		 <form action="insert" method="post" enctype="multipart/form-data">
  			 <div class="form-group">
   				  <label for="id">메뉴번호:</label>
   				  <input type="text" class="form-control" id="id" placeholder="메뉴번호" name="id">
   			 </div>
  			 <div class="form-group">
     			 <label for="name">메뉴명:</label>
     			<input type="text" class="form-control" id="name" placeholder="메뉴명" name="name" >
   			</div>
        	<div class="form-group">
      			<label for="intro">설명:</label>
      			<input type="text" class="form-control" id="intro" placeholder="설명" name="intro" >
    		</div>
        	<div class="form-group">
      			<label for="file">사진:</label>
      			<input type="file" class="form-control" id="file" placeholder="사진" name="file" >
    		</div>
            <div class="form-group">
      			<label for="price">가격:</label>
      			<input type="text" class="form-control" id="price" placeholder="가격" name="price" >
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

    		<button type="submit" class="btn btn-primary btn-sm">추가</button>
  		</form>
</div>

</body>
</html>