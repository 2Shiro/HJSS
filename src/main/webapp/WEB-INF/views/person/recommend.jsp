<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 회원 메인</title>
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
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/pmain_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<c:forEach var="list" items="${ jobPosts }">
					<div class="linkDiv container border mb-3"
						id="jobDetailDiv${ list.post_idx }">
						<!-- 공고 리스트 시작 -->
						<div class="d-flex justify-content-between">
							<div class="row">
								<input type="text"
									class="form-control border-0 shadow-none mb-2 ms-3"
									value="${ list.post_name }" id="title${ list.post_idx }"
									readonly="readonly"> <input type="text"
									class="form-control border-0 shadow-none ms-3"
									value="마감기한 : ${ list.deadline }"
									id="deadline${ list.post_idx }" readonly="readonly">
							</div>
							<button id="btn-delete${ list.post_idx }"
								class="btn btn-dark align-self-center float-end mx-3">삭제</button>
						</div>
						<!-- 공고 리스트 끝 -->
					</div>
				</c:forEach>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>

<%@include file="/WEB-INF/include/pmain_nav_active.jsp"%>