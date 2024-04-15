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

.linkDiv input {
	cursor: pointer;
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
		                      const requiredFields = document.querySelectorAll('#postForm [required]');
		                      let allFieldsFilled = true;
		                      requiredFields.forEach(function(field) {
		                          if (!field.value.trim()) {
		                              allFieldsFilled = false;
		                              field.classList.add('is-invalid');
		                          } else {
		                              field.classList.remove('is-invalid');
		                          }
		                      });

		                      if (!allFieldsFilled) {
		                          alert('모든 필수 항목을 입력해주세요.');
		                          event.preventDefault();
		                          return; 
		                      }

		                      var hiddenField = document.querySelector('input[type="hidden"][name="skillIdx"]');
		                      var checkboxes = document.querySelectorAll('input[type="checkbox"][name="skillIdx"]');
		                      var isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
		                      if (!isChecked) {
		                          document.getElementById('defaultSkillIdx').type = 'text';
		                          hiddenField.value = '0';
		                          hiddenField.disabled = false;
		                      } else {
		                          hiddenField.disabled = true;
		                      }

		                      alert('등록 되었습니다');
		                      var myModal = bootstrap.Modal.getInstance(document.getElementById('jobPost'));
		                      myModal.hide();
		                  });
					    document.querySelectorAll('.linkDiv').forEach(function(linkDiv) {
					        linkDiv.addEventListener('click', function(event) {
					            if (event.target && event.target.id.startsWith('btn-delete')) {
					                event.preventDefault();
					                alert('삭제 처리됨');
					                const postIdx = event.target.id.replace('btn-delete', ''); 
					                window.location.href = `/Company/MyPostDelete?post_idx=`+postIdx;
					            } else if (event.target) {
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
					<%@include file="/WEB-INF/include/cmypage_nav.jsp"%>
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

					<c:forEach var="list" items="${ response.list }">
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
					<div class="d-flex justify-content-center paging-bottom-container">
						<%@include file="/WEB-INF/include/post_paging.jsp"%>
					</div>
				</div>

			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
<%@include file="/WEB-INF/include/cmypage_nav_active.jsp"%>