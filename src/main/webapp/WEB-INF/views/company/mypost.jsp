<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업 등록 공고 관리 페이지</title>
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

.linkDiv {
	padding: 10px;
	border-radius: 5px;
	transition: background-color .3s;
}

.linkDiv:hover {
	cursor: pointer;
}
</style>

<script type="text/javascript">
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						document.getElementById('postForm').addEventListener('submit', function(event) {
							  event.preventDefault();
							  alert('등록 되었습니다');
							  var myModal = bootstrap.Modal.getInstance(document.getElementById('jobPost'));
							  myModal.hide();
							  var postForm = document.getElementById('postForm');
							  postForm.submit();
							});
					    document.querySelectorAll('.linkDiv').forEach(function(linkDiv) {
					        linkDiv.addEventListener('click', function(event) {
					            if (event.target && event.target.id.startsWith('btn-delete')) {
					                event.preventDefault();
					                alert('삭제 처리됨');
					                const postIdx = event.target.id.replace('btn-delete', ''); // 동적으로 생성된 ID에서 post_idx를 추출합니다.
					                window.location.href = `/Company/MyPostDelete?post_idx=`+postIdx;
					            } else if (event.target) {
					                // 클릭된 요소에서 가장 가까운 .linkDiv의 ID를 찾아 마감기한 페이지로 이동합니다.
					                const postIdx = event.target.closest('[id^="jobDetailDiv"]').id.replace('jobDetailDiv', '');
					                window.location.href = `/Company/MyPostDetail?post_idx=`+postIdx;
					            }
					        });
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
					<%@include file="/WEB-INF/include/cmain_nav.jsp"%>
				</div>
			</nav>

			<!-- 메인 섹션 -->
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3">
					<h2>등록한 공고</h2>
					<hr>
					<div>
						<!-- 공고 등록 모달 출력 버튼 -->
						<div class="d-grid mx-auto container my-5">
							<button class="btn btn-outline-dark btn-lg shadow-sm"
								style="height: 80px" type="button" data-bs-toggle="modal"
								data-bs-target="#jobPost">새로운 공고등록</button>
						</div>
						<!-- 공고 등록 모달 include -->
						<%@include file="/WEB-INF/views/company/mypostwrite.jsp"%>
					</div>
					
					<c:forEach var="list" items="${ list }">
						<div class="linkDiv container border mb-3" id="jobDetailDiv${ list.post_idx }">
							<!-- 공고 리스트 시작 -->
							<div class="d-flex justify-content-between">
								<div class="row">
									<input type="text"
										class="form-control border-0 shadow-none mb-2 ms-3"
										value="${ list.post_name }" id="title${ list.post_idx }"> <input
										type="text" class="form-control border-0 shadow-none ms-3"
										value="마감기한 : ${ list.deadline }" id="deadline${ list.post_idx }">
								</div>
								<button id="btn-delete${ list.post_idx }"
									class="btn btn-dark align-self-center float-end mx-3">삭제</button>
							</div>
							<!-- 공고 리스트 끝 -->
						</div>
					</c:forEach>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>