<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 추천</title>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.name-column {
	width: 20%;
}

.info-column {
	width: 40%;
}

.btn-column {
	width: 20%;
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
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/pmain_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
				<input type="hidden" value="${pid }" id="pid">
				<div>
					<table class="table text-center mt-3 rec-table">
						<thead class="table-secondary text-white">
							<tr>
								<th scope="col" class="name-column">회사이름</th>
								<th scope="col" class="info-column text-start">공고 정보</th>
								<th scope="col" class="btn-column">버튼</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${ response.list }">
								<tr style="height: 200px;">
									<td class="name-column text-center align-middle">
										<p>${ list.cname }</p>
									</td>
									<td class="info-column align-middle text-start px-0 mx-0">
										<h3>${list.post_name }</h3>
										<div class="row">
											<p class="col-auto">${list.career }</p>
											<p class="col-auto mx-2">${list.job_type }</p>
											<p class="col-auto mx-2">${list.pay }</p>
											<p class="col-auto">~ ${list.deadline }</p>
										</div> <c:forEach var="skill" items="${fn:split(list.skills, ',')}"
											varStatus="status">
											<c:if test="${not skill.trim().equals('무자격 지원가능')}">
												<button type="button" class="btn btn-primary btn-sm m-1">${skill}</button>
											</c:if>
										</c:forEach>
									</td>
									<td class="btn-column align-middle">
										<div>
											<input class="btn btn-outline-secondary scrap-button"
												type="button" data-post-idx="${list.post_idx}" value="스크랩">
										</div>
										<div class="mt-3">
											<a href="/ViewPost?post_idx=${list.post_idx}&id=${list.id}"
												class="btn btn-success" type="button">지원하기</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="d-flex justify-content-center">
					<%@include file="/WEB-INF/include/precommend_paging.jsp"%>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>

<%@include file="/WEB-INF/include/pmain_nav_active.jsp"%>