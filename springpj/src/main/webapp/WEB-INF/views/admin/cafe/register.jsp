<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 추가</title>
</head>
<body>
 <div class="container">
  <h2>지점 추가</h2>
  <form action="insert" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="id">지점번호:</label>
      <input type="text" class="form-control" id="title" placeholder="지점번호" name="title">
    </div>
    <div class="form-group">
      <label for="name">지점명:</label>
      <input type="text" class="form-control" id="name" placeholder="지점명" name="name" >
    </div>
        <div class="form-group">
      <label for="addr">주소:</label>
      <input type="text" class="form-control" id="addr" placeholder="주소" name="addr" >
    </div>
        <div class="form-group">
      <label for="phone">전화번호:</label>
      <input type="text" class="form-control" id="phone" placeholder="전화번호" name="phone" >
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