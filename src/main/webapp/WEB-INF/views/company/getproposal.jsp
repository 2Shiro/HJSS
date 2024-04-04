<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원 받은 이력서</title>
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
h3 {
	font-weight: bold;
	margin: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/cmypage_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<!-- 회사 공고별 지원한 사람들 -->
				<h3>지원 현황</h3>
				<table class="table table-hover">
					<tr class="table-primary">
						<th>번호</th>
						<th>공고이름</th>
						<th>구직자이름</th>
						<th>이력서</th>
						<th>상태</th>
					</tr>
					<c:forEach var="proposalList" items="${proposalList}">   
						<tr>                
             <td>${proposalList.pro_idx}</td>
             <td>${proposalList.id}</td>
             <td>${proposalList.post_id}</td>
             <td><a href="" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#personResumeModal">${proposalList.resume_id}</a></td>
             <td>${proposalList.status}</td>
         	</tr>
         </c:forEach>
				</table>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/getresume.jsp" %>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>