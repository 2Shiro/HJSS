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
	<header
		class="d-flex flex-column flex-md-row justify-content-between align-items-center py-3 border-bottom">
		<c:choose>
			<c:when test="${sessionScope.login.type == 1}">
				<a href="/Company/Cmain"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto ms-3">
					<img alt="Logo" src="/images/logo.png" style="width: 150px;">
				</a>
			</c:when>
			<c:when test="${sessionScope.login.type == 2}">
				<a href="/Person/Pmain"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto ms-3">
					<img alt="Logo" src="/images/logo.png" style="width: 150px;">
				</a>
			</c:when>
			<c:otherwise>
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto ms-3">
					<img alt="Logo" src="/images/logo.png" style="width: 150px;">
				</a>
			</c:otherwise>
		</c:choose>
		<ul class="nav nav-pills mt-auto me-3">
			<c:choose>
				<c:when test="${sessionScope.isLoggedIn}">
					<li class="nav-item"><a
						class="mx-3 text-decoration-none text-black" href="/logout">로그아웃</a></li>

					<c:choose>
						<c:when test="${sessionScope.login.type == 1}">
							<li class="nav-item"><a
								class="mx-3 text-decoration-none text-black"
								href="/Company/Mypage?id=${sessionScope.login.id}">마이페이지</a></li>
						</c:when>
						<c:when test="${sessionScope.login.type == 2}">
							<li class="nav-item"><a
								class="mx-3 text-decoration-none text-black"
								href="/Person/Mypage?id=${sessionScope.login.id}">마이페이지</a></li>
						</c:when>
					</c:choose>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a
						class="mx-3 text-decoration-none text-black" href="/loginForm">로그인</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
	</header>
</body>
</html>