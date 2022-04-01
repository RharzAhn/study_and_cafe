<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 수정</title>
<script src="https://maps.googleapis.com/maps/api/js?key=API_KEY&callback=myMap"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAH9_5Tw4NicbJS8gNnWZ16wOIBQ1JEAs&callback=myMap"></script>
</head>
<body>
 <div class="container">
  <h2>지점 수정</h2>
  <form action="/admin/branch/branchUpdate" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="id">지점번호:</label>
      <input type="text" class="form-control" id="id" value="${branch.id}" name="id" readonly>
    </div>
    <div class="form-group">
      <label for="name">지점명:</label>
      <input type="text" class="form-control" id="name" placeholder="${branch.name}" name="name" >
    </div>
        <div class="form-group">
      <label for="addr">주소:</label>
      <input type="text" class="form-control" id="addr" placeholder="${branch.addr}" name="addr" >
    </div>
        <div class="form-group">
      <label for="phone">전화번호:</label>
      <input type="text" class="form-control" id="phone" placeholder="${branch.phone}" name="phone" >
    </div>
        <div class="form-group">
<!--       <label for="manager">지점장명:</label> -->
<!--       <input type="text" class="form-control" id="manager" name="manager" placeholder="지점장명"> -->
    </div>

    <button type="submit" class="btn btn-primary btn-sm" id="update">수정</button>
  </form>
</div>

</body>
</html>