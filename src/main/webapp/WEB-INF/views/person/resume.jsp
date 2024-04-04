<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 관리 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common.css" />
<style>
.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}

.tight-margin-right {
	margin-right: 0.5rem;
}

.tight-margin-left {
	margin-left: 0.5rem;
}

#resumeDetailDiv {
	padding: 10px;
	border-radius: 5px;
	transition: background-color .3s;
}

#resumeDetailDiv:hover {
	cursor: pointer;
}
</style>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('resumeFormsub').addEventListener(
				'submit',
				function(event) {
					event.preventDefault();
					alert('등록 되었습니다');
					var myModal = bootstrap.Modal.getInstance(document
							.getElementById('resumeForm'));
					myModal.hide();
				})
		document.getElementById('resumeDetailDiv').addEventListener('click',
				function(event) {

					if (event.target && event.target.id === 'btn-delete') {

						event.preventDefault();
						alert('삭제 처리됨');
					} else {
						window.location.href = '/Person/resumeDetail';
					}
				});
	});
</script>

</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<!-- 사이드바 -->
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/pmain_nav.jsp"%>
				</div>
			</nav>

			<!-- 메인 섹션 -->
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3">
					<h2>이력서 관리</h2>
					<hr>
					<div>
						<!-- 공고 등록 모달 출력 버튼 -->
						<div class="d-grid mx-auto container my-5">
							<button class="btn btn-outline-dark btn-lg shadow-sm"
								style="height: 80px" type="button" data-bs-toggle="modal"
								data-bs-target="#resumeForm">새 이력서 등록</button>
						</div>
						<!-- 공고 등록 모달 include -->
						<%@include file="/WEB-INF/views/person/resumeForm.jsp"%>
					</div>
					<div class="container border" id="resumeDetailDiv">
						<!-- 공고 리스트 시작 -->
						<div class="d-flex justify-content-between">
							<div>
								<input type="text"
									class="form-control border-0 shadow-none mb-2"
									value="백앤드 개발자 구합니다." id="title"> <input type="text"
									class="form-control border-0 shadow-none"
									value="마감기한 : 2024-04-11" id="deadline">
							</div>
							<div class="align-self-center float-end mx-3">
								<button id="btn-publish" class="btn btn-success">공개중</button>
								<button id="btn-delete" class="btn btn-dark">삭제</button>
							</div>
						</div>
						<!-- 공고 리스트 끝 -->
					</div>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>