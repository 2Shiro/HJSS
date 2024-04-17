<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 지원 현황</title>
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
						<th>이력서</th>
						<th>상태</th>
					</tr>
					<c:forEach var="pproposalList" items="${pproposalList}">   
						<tr>               
             <td> &nbsp &nbsp ${pproposalList.post_idx}</td>
         	   <td><a href="/ViewPost?id=${pproposalList.cid}&post_idx=${pproposalList.post_idx}">${pproposalList.post_name}</a></td>
             <td>${pproposalList.deadline}</td>
             <td><a href="/Person/MyResume?id=${pid}&nowpage=1" value="${pproposalList.resume_idx}">${pproposalList.resume_name}</a></td>
             <td>
             	<c:choose>
             		<c:when test="${pproposalList.status eq '합격'}">
             			<a href="" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#myStatusPassModal" value="${pproposalList.status}">${pproposalList.status}</a>
             		</c:when>
             		<c:when test="${pproposalList.status eq '불합격'}">
             			<a href="" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#myStatusFailModal" value="${pproposalList.status}">${pproposalList.status}</a>
             		</c:when>
             		<c:otherwise>
             			<a href="" class="text-decoration-none" data-bs-toggle="modal" data-bs-target="#myStatusOtherModal" value="${pproposalList.status}">${pproposalList.status}</a>
             		</c:otherwise>
             	</c:choose>
             </td>
         	</tr>
         </c:forEach>
				</table>
			</section>
		</div>
	</main>
	<c:forEach var="pproposalList" items="${pproposalList}"> 
	 		 <%@include file="/WEB-INF/include/getstatus.jsp" %>
	 </c:forEach>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>

<%@include file="/WEB-INF/include/pmypage_nav_active.jsp"%>