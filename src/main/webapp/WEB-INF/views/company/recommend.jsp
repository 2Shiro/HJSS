<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script>
	document.addEventListener('DOMContentLoaded', function() {
		// 모든 skillsContainer 요소를 찾아서 순회합니다.
		var skillsContainers = document.querySelectorAll('.skillsContainer');
		skillsContainers.forEach(function(container) {
			// 각 container의 data-skills 속성에서 보유 스킬 데이터를 가져옵니다.
			var skills = container.getAttribute('data-skills').split(', ');

			// 보유 스킬 데이터를 순회하며 각 스킬을 버튼으로 생성합니다.
			skills.forEach(function(skill) {
				var button = document.createElement('button');
				button.className = 'btn btn-primary btn-sm m-1'; // 부트스트랩 클래스 추가
				button.textContent = skill;
				container.appendChild(button);
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
					<h2>추천 인재 목록</h2>
					<hr>
					<!-- 공고별 추천 인재 목록 출력 -->
					<c:forEach var="entry" items="${candidatesPerPost}">
						<h3>공고명: ${postNames[entry.key]}</h3>
						<p>
							마감일:
							<fmt:formatDate value="${deadlines[entry.key]}"
								pattern="yyyy-MM-dd" />
						</p>
						<div class="container mb-3">
							<c:forEach var="candidate" items="${entry.value}">
								<div class="row border mb-3 p-3">
									<div class="col-md-3">이름: ${candidate.pname}</div>
									<div class="col-md-3">이력서 제목: ${candidate.title}</div>
									<div class="col-md-3">연락처: ${candidate.phone}</div>
									<div class="col-md-3 skillsContainer" data-skills="${candidate.skills}">보유 스킬:</div>

								</div>
							</c:forEach>
							<!-- 후보자 목록이 비어있을 경우 메시지 표시 -->
							<c:if test="${fn:length(entry.value) == 0}">
								<div class="row">
									<div class="col">추천할 인재가 없네요....</div>
								</div>
							</c:if>
						</div>
					</c:forEach>

				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
