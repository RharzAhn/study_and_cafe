<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>메뉴 보기</title>
</head>
<body>
        <div class="container article">
            <div class="category">
                <ul>
                    <li>
                        <a href="/menuView">
                        <label for="total">전체</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=COFFEE">
                        <label for="coffee">커피</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=LATTE">
                        <label for="latte">라떼</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=TEA">
                        <label for="tea">티</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=ADE">
                        <label for="ade">에이드</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=JUICE">
                        <label for="juice">주스</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=SMOOTHIE">
                        <label for="smoothie">스무디</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=DESSERT">
                        <label for="dessert">디저트</label></a>
                    </li>
                    <li>
                        <a href="/menuView?type=ETC">
                        <label for="etc">기타</label></a>
                    </li>
                </ul>
            </div>

            <article>
            
				<c:forEach items="${list}" var="menu">
					<div class="menu-list">
						<div class="menu-item">
							<div class="menutype">${menu.menuType}</div>
							<div>
								<img class="menu-profile" src="${menu.profile}" width="50px" height="10%">
							</div>
							<p class="menu-title">${menu.name}</p>
							<p class="menu-price">${menu.price}</p>
							<p class="menu-info">${menu.intro}</p>
						</div>
					</div>	
				</c:forEach>            
            </article>
        </div>
</body>
</html>
