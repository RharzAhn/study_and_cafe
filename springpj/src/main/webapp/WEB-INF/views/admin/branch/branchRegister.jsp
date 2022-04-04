<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 추가</title>
</head>
<body>
<%@include file="../../include/header.jsp" %>
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
	
	<c:forEach begin="0" end="9" step="1" var="i">
		<c:forEach begin="0" end="9" step="1" var="j">
			<input type="checkbox" id="seatNum" name="seatNum" value="${i},${j}">
		</c:forEach>
		<br>
	</c:forEach>
    <button type="button" class="btn btn-primary btn-sm">추가</button>
  </form>
</div>
<script type="text/javascript">
function bfs(array){
	var arr = Array.from({ length: 26 }, (v, i) => String.fromCharCode(i + 65));
	var seat =[]
	const dx=[1,-1,0,0]
	const dy=[0,0,1,-1]
	var maps=[]
	
	for(var i=0; i<10; i++){
		var mapCol=[]
		for(var j=0; j<10; j++){
			mapCol.push(0)
		}
		maps.push(mapCol)
	}
	for (var num=0; num<array.length; num++){
		var x=array[num][0]
		var y=array[num][1]
		maps[x][y]=2
	}
	console.log(maps)
	var count=1
	
	for(var i=0; i<10; i++){
		for(var j=0; j<10; j++){
			console.log(i,j)
			if(maps[i][j]==2){
				var str=arr.shift()
				seat.push(str+count)
				maps[i][j]=0
				var que=[]
				var start=[i,j]
				que.push(start)
				for(var i=0; i<que.length; i++){
					console.log(que[i])
				}
				
				count+=1
				while(que){
					const p = que.shift()
					const x= p[0]
					const y=p[1]
					seat.push(str+count)
					for (var k=0 ; k<4; k++){
						const next_x = x+dx[k]
						const next_y = y+dy[k]
						
						if ((next_x<10 && next_x>=0) && (next_y<10 && next_y>=0)){
							if(maps[next_x][next_y]==2){
								console.log(maps)
								var next=[next_x,next_y]
								que.push(next)
								maps[x][y]=0
								console.log(maps)
								
								
								for(var i=0; i<que.length; i++){
									console.log(que[i])
								}
								console.log(maps)
							}
						}
					}
					
				}
				count=0
			}
		}
	}
}


$(".btn").click(()=>{	
	var array=[]
	var setNumList=[];
	 $("input:checkbox[name=seatNum]:checked").each((i,ival)=>{
		 setNumList.push(ival.defaultValue)
	 })
	 
	 for (var str of setNumList){
		var pos = str.split(',');
	 	array.push([Number(pos[0]), Number(pos[1])]);
	 }
	console.log(array)
	bfs(array)
})
</script>
</body>
</html>