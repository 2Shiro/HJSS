<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/pmypage_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<!-- 나의 지원 현황 -->
				<h2>나의 지원 현황</h2>
				<table class="table table-hover">
					<tr class="table-primary">
						<th>번호</th>
						<th>공고이름</th>
						<th>마감일자</th>
						<th>상태</th>
					</tr>
					<c:forEach var="i" begin="1" end="8">   
						<tr>       
<%--              <c:choose> --%>
<%--                 <c:when test=""> --%>
<!--                     <tr> -->
<%--                 </c:when> --%>
<%--                 <c:when test=""> --%>
<!--                     <tr class="table-info"> -->
<%--                 </c:when> --%>
<%--                 <c:otherwise> --%>
<!--                     <tr class="table-secondary"> -->
<%--                 </c:otherwise> --%>
<%--              </c:choose> --%>
         
             <td> &nbsp &nbsp 번호</td>
             <td>공고이름</td>
             <td>마감일자</td>
             <td><a href="" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#myStatusModal">상태</a></td>
         	</tr>
         </c:forEach>
				</table>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/getstatus.jsp" %>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>