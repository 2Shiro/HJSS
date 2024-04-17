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
						<th>공고번호</th>
						<th>공고이름</th>
						<th>구직자이름</th>
						<th>이력서</th>
						<th>상태</th>
					</tr>
					<c:forEach var="myproposalList" items="${myproposalList}">   
						<tr>                
             <td>${myproposalList.post_idx}</td>
             <td>${myproposalList.post_name}</td>
             <td>${myproposalList.pname}</td>
             	<td>
             		<a href="/Person/GetResume?resume_idx=${myproposalList.resume_idx}" class="pop">이력서</a>
             	</td>
             <td>${myproposalList.status}</td>
         	</tr>
         </c:forEach>
				</table>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/getresume.jsp" %>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
<script>
	let popuplist = document.querySelectorAll('.pop');
	
	popuplist.forEach(function( popup ) {
			popup.onclick = function(e) {
				e.preventDefault();
				//alert(popup.href)
				
				let popOption = 'width = 800px, height=700px;, top=50%, left=80%, scrollbars=yes';
				let openUrl = popup.href
				window.open(openUrl, 'popresume', popOption);
		  }
	})

</script>
</html>

<%@include file="/WEB-INF/include/cmypage_nav_active.jsp"%>