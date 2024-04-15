<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 스크랩</title>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.name-column {
	width: 20%;
}

.info-column {
	width: 30%;
}

.skill-column {
	width: 40%;
}

.action-column {
	width: 10%;
}
</style>
<script>
	$(document).ready(
			function() {
				const pid = $('#pid').val(); // 현재 사용자 ID

				function updateScrapButtons() {
					$('.scrap-button').each(
							function() {
								const button = $(this);
								const post_idx = button.data('post-idx');

								// 스크랩 상태 확인 요청
								$.ajax({
									url : `/Person/CheckScrap?post_idx=`
											+ post_idx + '&pid=${pid}',
									type : 'GET',
									dataType : 'json',
									success : function(isScraped) {
										button.data('scraped', isScraped);
										button.toggleClass('btn-primary',
												isScraped).toggleClass(
												'btn-outline-secondary',
												!isScraped).val(
												isScraped ? '스크랩 해제' : '스크랩');
									},
									error : function(error) {
										console.error('Error:', error);
									}
								});
							});
				}

				updateScrapButtons(); // 페이지 로드 시 스크랩 버튼 상태 갱신

				$('.scrap-button').click(
						function() {
							const button = $(this);
							const post_idx = button.data('post-idx');
							const isScraped = button.data('scraped');

							if (isScraped) {
								// 스크랩 삭제 요청
								$.ajax({
									url : `/Person/ScrapDelete?post_idx=`
											+ post_idx + '&pid=${pid}',
									type : 'POST',
									success : function(response) {
										alert('스크랩이 해제되었습니다.');
										updateScrapButtons(); // 모든 스크랩 버튼 상태 갱신
									},
									error : function(error) {
										console.error('Error:', error);
										alert('오류가 발생했습니다. 다시 시도해주세요.');
									}
								});
							} else {
								// 스크랩 추가 요청
								$.ajax({
									url : '/Person/ScrapAdd',
									type : 'POST',
									contentType : 'application/json',
									data : JSON.stringify({
										post_idx : post_idx,
										pid : pid
									}),
									success : function(response) {
										alert('스크랩되었습니다.');
										updateScrapButtons(); // 모든 스크랩 버튼 상태 갱신
									},
									error : function(error) {
										console.error('Error:', error);
										alert('오류가 발생했습니다. 다시 시도해주세요.');
									}
								});
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
					<%@include file="/WEB-INF/include/pmypage_nav.jsp"%>
				</div>
			</nav>

			<!-- 메인 섹션 -->
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3 mb-5">
					<h2>스크랩한 공고 목록</h2>
					<hr>
					<input type="hidden" value="${pid }" id="pid">
					<table class="table fixed-width-table text-center mt-3">
						<thead class="table-secondary text-white">
							<tr>
								<th scope="col" class="name-column">회사이름</th>
								<th scope="col" class="info-column">공고 정보</th>
								<th scope="col" class="skill-column">기술스택</th>
								<th scope="col" class="action-column">스크랩</th>
							</tr>
						</thead>
						<c:forEach var="scrap" items="${ScrapList}">
							<tbody>
								<tr>
									<td class="name-column text-center pt-3 align-middle">
										<p class="pt-3">${scrap.cname}</p>
									<td class="info-column align-middle"><a
										href="/ViewPost?post_idx=${scrap.post_idx}&id=${scrap.id}"
										class="text-decoration-none text-dark">${scrap.post_name}</a></td>
									<td class="skill-column align-middle"><c:forEach
											var="skill" items="${fn:split(scrap.skills, ',')}"
											varStatus="status">
											<button type="button" class="btn btn-primary btn-sm m-1">${skill}</button>
										</c:forEach></td>
									<td class="action-column align-middle"><input
										class="btn btn-outline-secondary scrap-button" type="button"
										data-post-idx="${scrap.post_idx}" value="스크랩"></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>

			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>

<%@include file="/WEB-INF/include/pmain_nav_active.jsp"%>
