<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="d-flex flex-column flex-md-row justify-content-between align-items-center py-3 border-bottom">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto ms-3">
        <img alt="Logo" src="/images/logo.png" style="width:150px;">
    </a>
   
    <ul class="nav nav-pills mt-auto me-3">
        <li class="nav-item"><a class="btn" href="#">로그아웃</a></li>
        <li class="nav-item"><a class="btn" href="#">마이페이지</a></li>
    </ul>
    
<%--    
 로그인 세션 구현 되면 쓰세요 로그인 / 로그아웃 상태에 따른 헤더 변화


<ul class="nav nav-pills mt-auto me-3">
    <c:choose>
        <!-- 사용자가 로그인한 경우 -->
        <c:when test="${sessionScope.isLoggedIn}">
            <li class="nav-item"><a class="btn" href="#">로그아웃</a></li>
            <li class="nav-item"><a class="btn" href="#">마이페이지</a></li>
        </c:when>
        <!-- 사용자가 로그인하지 않은 경우 -->
        <c:otherwise>
            <li class="nav-item"><a class="btn" href="#">로그인</a></li>
        </c:otherwise>
    </c:choose>
</ul>


 --%>
    
    
    
</header>
</body>
</html>