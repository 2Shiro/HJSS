<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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
    .tight-margin-right {
        margin-right: 0.5rem; /* 우측 마진 조절 */
    }

    .tight-margin-left {
        margin-left: 0.5rem; /* 좌측 마진 조절 */
    }
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-1 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/main_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row ">
				<div class="mt-5 ms-3">
					<h2>등록한 공고</h2>
					<div>
						<div class="d-grid col-6 mx-auto">
							<button class="btn btn-outline-dark btn-lg" style="height: 80px" type="button" data-bs-toggle="modal"
							data-bs-target="#staticBackdrop">새로운 공고등록</button>
						</div>
						<%@include file="/WEB-INF/views/company/jobpostform.jsp"%>
					</div>
				</div>

			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>