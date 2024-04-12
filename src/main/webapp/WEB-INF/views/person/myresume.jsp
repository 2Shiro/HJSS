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
.linkDiv input {
	cursor: pointer;
}
.linkDiv:hover {
	cursor: pointer;
}
</style>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    // 이력서 제출 폼 이벤트 리스너
document.getElementById('resumeFormsub').addEventListener('submit', function(event) {
    // 필수 필드가 모두 채워졌는지 확인
    const requiredFields = document.querySelectorAll('#resumeFormsub [required]');
    let allFieldsFilled = true;
    requiredFields.forEach(function(field) {
        if (!field.value.trim()) {
            allFieldsFilled = false; // 필수 필드 중 하나라도 비어있으면 false
            field.classList.add('is-invalid'); // 유효하지 않은 필드에 클래스 추가
        } else {
            field.classList.remove('is-invalid'); // 유효한 필드에는 클래스 제거
        }
    });

    // 필수 필드가 모두 채워지지 않았다면 경고 메시지를 띄우고 기본 이벤트 중지
    if (!allFieldsFilled) {
        alert('모든 필수 항목을 입력해주세요.');
        event.preventDefault(); // 기본 폼 제출 이벤트 중지
        return; 
    }

    // 체크박스가 선택되었는지 확인
    var hiddenField = document.querySelector('input[type="hidden"][name="skillIdx"]');
    var checkboxes = document.querySelectorAll('input[type="checkbox"][name="skillIdx"]');
    var isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
    if (!isChecked) {
        // 체크박스가 하나도 선택되지 않았다면 hidden 필드를 텍스트로 변경하고 기본값 설정
        document.getElementById('defaultSkillIdx').type = 'text';
        hiddenField.value = '0';
        hiddenField.disabled = false;
    } else {
        // 체크박스가 선택되었다면 hidden 필드 비활성화
        hiddenField.disabled = true;
    }

    // 모든 검사가 통과되면 등록되었다는 알림을 띄우고, 모달 창을 닫음
    alert('등록 되었습니다');
    var myModal = bootstrap.Modal.getInstance(document.getElementById('resumeForm'));
    myModal.hide();
});

    
    
    
    
    
    
    // 삭제 링크 이벤트 리스너
    document.querySelectorAll('.linkDiv').forEach(function(linkDiv) {
        linkDiv.addEventListener('click', function(event) {
            if (event.target && event.target.id.startsWith('btn-delete')) {
                event.preventDefault();
                alert('삭제 처리됨');
                const resumeIdx = event.target.id.replace('btn-delete', '');
                window.location.href = `/Person/MyResumeDelete?resume_idx=` + resumeIdx;
            } else if (event.target) {
                const resumeIdx = event.target.closest('[id^="resumeDetailDiv"]').id.replace('resumeDetailDiv', '');
                window.location.href = `/Person/MyResumeDetail?resume_idx=` + resumeIdx;
            }
        });
    });

    // 파일 입력과 이미지 미리보기 기능
    var fileInput = document.getElementById('file');
    var previewArea = document.querySelector('.col-md-auto img');
    var defaultImage = '/images/logo.png';

    fileInput.addEventListener('change', function(e) {
        if (fileInput.files.length === 0) {
            previewArea.src = defaultImage;
            return;
        }

        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(e) {
            previewArea.src = e.target.result;
        };

        reader.readAsDataURL(file);
    });
      
    
});

</script>
<script type="text/javascript">
document.getElementById('resumeFormsub').addEventListener('submit', function(e) {
    var hiddenField = document.querySelector('input[type="hidden"]');
    // 체크박스를 모두 선택합니다. 체크박스의 정확한 선택자를 지정해야 합니다.
    var checkboxes = document.querySelectorAll('input[type="checkbox"][name="skillIdx"]'); // 'name="skillIdx"'는 예시이며, 실제 체크박스의 name 속성에 맞게 변경해야 합니다.

    // skillIdx가 선택되었는지 확인합니다.
    var isChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);

    // skillIdx가 하나도 체크되지 않았다면, 숨겨진 필드를 활성화하여 기본값 0을 전송합니다.
    if (!isChecked) {
        document.getElementById('defaultSkillIdx').type = 'text';
        hiddenField.value = '0'; // 기본값을 0으로 설정합니다.
        hiddenField.disabled = false; // 숨겨진 필드를 활성화합니다.
    } else {
        // 여기서 선택된 체크박스에 따라 필요한 조치를 취할 수 있습니다.
        hiddenField.disabled = true; // 기본값을 전송하지 않도록 숨겨진 필드를 비활성화합니다.
    }
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
					<%@include file="/WEB-INF/include/pmypage_nav.jsp"%>
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
					<c:forEach var="list" items="${list}">
						<div class="linkDiv container border mb-3"
							id="resumeDetailDiv${list.resume_idx}">
							<!-- 공고 리스트 시작 -->
							<div class="row">
								<div class="col-9">
									<input type="text"
										class="form-control-lg border-0 shadow-none mb-2 ms-3 w-100"
										value="${list.title}" id="title${list.resume_idx}">
								</div>
								<div class="col-3 d-flex justify-content-end">
									<c:choose>
										<c:when test="${list.publish == 1}">
											<!-- 값이 1일 경우 공개중 버튼 표시 -->
											<button id="btn-publish${list.resume_idx}"
												class="btn btn-success mx-1">공개중</button>
										</c:when>
										<c:when test="${list.publish == 2}">
											<!-- 값이 2일 경우 비공개중 버튼 표시 -->
											<button id="btn-publish${list.resume_idx}"
												class="btn btn-warning mx-1">비공개중</button>
										</c:when>
									</c:choose>
									<button id="btn-delete${list.resume_idx}" class="btn btn-dark">삭제</button>
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

<%@include file="/WEB-INF/include/pmypage_nav_active.jsp"%>