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
	document.addEventListener('DOMContentLoaded', function() {
		document.getElementById('resumeFormsub').addEventListener('submit', function(event) {
			  event.preventDefault();
			  alert('등록 되었습니다');
			  var myModal = bootstrap.Modal.getInstance(document.getElementById('resumeForm'));
			  myModal.hide();
			  var postForm = document.getElementById('resumeFormsub');
			  postForm.submit();
			});
	    document.querySelectorAll('.linkDiv').forEach(function(linkDiv) {
	        linkDiv.addEventListener('click', function(event) {
	            if (event.target && event.target.id.startsWith('btn-delete')) {
	                event.preventDefault();
	                alert('삭제 처리됨');
	                const resumeIdx = event.target.id.replace('btn-delete', ''); // 동적으로 생성된 ID에서 resume_idx를 추출합니다.
	                window.location.href = `/Person/MyResumeDelete?resume_idx=`+resumeIdx;
	            } else if (event.target) {
	                // 클릭된 요소에서 가장 가까운 .linkDiv의 ID를 찾아 마감기한 페이지로 이동합니다.
	                const resumeIdx = event.target.closest('[id^="resumeDetailDiv"]').id.replace('resumeDetailDiv', '');
	                window.location.href = `/Person/MyResumeDetail?resume_idx=`+resumeIdx;
	            }
	        });
	    });
	    
	 // 파일 인풋 필드를 선택
	    var fileInput = document.getElementById('file');
	    // 이미지를 미리보여줄 위치를 선택
	    var previewArea = document.querySelector('.col-md-auto img');

	    // 기본 이미지 URL 설정
	    var defaultImage = '/images/logo.png';

	    // 파일 인풋 필드에 변화가 생기면 실행할 함수
	    fileInput.addEventListener('change', function(e) {
	        // 파일이 선택되지 않았다면, 미리보기를 기본 이미지로 설정
	        if (fileInput.files.length === 0) {
	            previewArea.src = defaultImage;
	            return; // 함수 실행을 여기서 중단
	        }
	        
	        // 선택된 파일을 가져옴
	        var file = e.target.files[0];
	        // FileReader 객체 생성
	        var reader = new FileReader();

	        // 파일이 읽히면 실행될 함수 정의
	        reader.onload = function(e) {
	            // 미리보기 이미지의 src 속성을 읽은 파일의 내용으로 설정
	            previewArea.src = e.target.result;
	        }

	        // FileReader로 파일 읽기를 시작함
	        reader.readAsDataURL(file);
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
						<%@include file="/WEB-INF/views/person/myresumewrite.jsp"%>
					</div>
					<c:forEach var="list" items="${ list }">
					<div class="linkDiv container border mb-3" id="resumeDetailDiv${ list.resume_idx }">
						<!-- 공고 리스트 시작 -->
						<div class="d-flex justify-content-between">
							<div>
								<input type="text"
									class="form-control-lg border-0 shadow-none mb-2 ms-3"
									value="${ list.title }" id="title${ list.resume_idx }">
							</div>
							<div class="align-self-center float-end mx-3">
								<button id="btn-publish${ list.resume_idx }" class="btn btn-success">공개중</button>
								<button id="btn-delete${ list.resume_idx }" class="btn btn-dark">삭제</button>
							</div>
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