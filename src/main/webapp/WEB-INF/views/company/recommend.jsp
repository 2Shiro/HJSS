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
				<div class="mt-5 ms-3 mb-5">
					<h2>추천 인재 목록</h2>
					<hr>
					<input type="hidden" value="${cid }" id="cid">
					<!-- 공고별 추천 인재 목록 출력 -->
					<c:forEach var="post" items="${candidatesPerPost}">
						<div class="row border border-dark py-3 d-flex align-items-center">
							<div class="col-3">
								<div></div>
								<p class="fs-3">공고명: ${postNames[post.key]}</p>
								<span> 마감일: <fmt:formatDate
										value="${deadlines[post.key]}" pattern="yyyy-MM-dd" />
								</span>
							</div>
							<div class="col-7 d-flex align-items-center fs-4">직무 소개 :
								${job_intros[post.key]}</div>
							<div class="col-1">
								<a class="btn btn-primary"
									href="/Company/MyPostDetail?post_idx=${post.key}">공고 확인</a>
							</div>
						</div>
						<div class="mb-3">
							<c:forEach var="resume" items="${post.value}">
								<table class="table fixed-width-table text-center mt-3">
									<thead class="table-secondary text-white">
										<tr>
											<th scope="col" class="name-column">이름</th>
											<th scope="col" class="info-column">이력서 정보</th>
											<th scope="col" class="skill-column">기술스택</th>
											<th scope="col" class="action-column">스크랩</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="name-column text-center pt-3 align-middle"><img
												alt="profile" src="${resume.profile}" style="height: 150px;">
												<p class="pt-3">${resume.pname}</p>
												<p>만 ${candidateAges[resume.resume_idx]}세</p></td>
											<td class="info-column align-middle"><a
												class="text-decoration-none text-dark"
												href="/Person/MyResumeDetail?resume_idx=${resume.resume_idx}">${resume.title}</a></td>
											<td class="skill-column align-middle"><c:forEach
													var="skill" items="${fn:split(resume.skills, ',')}"
													varStatus="status">
													<button type="button" class="btn btn-primary btn-sm m-1">${skill}</button>
												</c:forEach></td>
											<td class="action-column align-middle"><input
												class="btn btn-outline-secondary scrap-button" type="button"
												data-resume-idx="${resume.resume_idx}" value="스크랩">
											</td>
										</tr>
									</tbody>

								</table>
							</c:forEach>

							<!-- 후보자 목록이 비어있을 경우 메시지 표시 -->
							<c:if test="${fn:length(post.value) == 0}">
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
<script>
	$(document)
			.ready(
					function() {
						const cid = $('#cid').val(); // 현재 사용자 ID

						$('.scrap-button')
								.each(
										function() {
											const button = $(this);
											const resume_idx = button
													.data('resume-idx'); // data-resume-idx 속성으로부터 resume_idx를 가져옴

											// 스크랩 상태 확인 요청
											$
													.ajax({
														url : `/Company/CheckScrap?resume_idx=${resume_idx}&cid=${cid}`,
														type : 'GET',
														dataType : 'json',
														success : function(
																isScraped) {
															button.data(
																	'scraped',
																	isScraped);
															button
																	.toggleClass(
																			'btn-primary',
																			isScraped)
																	.toggleClass(
																			'btn-outline-secondary',
																			!isScraped);
															button
																	.val(isScraped ? '스크랩 해제'
																			: '스크랩');
														},
														error : function(error) {
															console.error(
																	'Error:',
																	error);
														}
													});
										});

						$('.scrap-button')
								.click(
										function() {
											const button = $(this);
											const resume_idx = button
													.data('resume-idx');
											const isScraped = button
													.data('scraped');

											if (isScraped) {
												// 스크랩 삭제 요청
												$
														.ajax({
															url : `/Company/ScrapDelete?resume_idx=${resume_idx}&cid=${cid}`,
															type : 'POST',
															success : function(
																	response) {
																alert('스크랩이 해제되었습니다.');
																button
																		.data(
																				'scraped',
																				false)
																		.toggleClass(
																				'btn-primary',
																				false)
																		.toggleClass(
																				'btn-outline-secondary',
																				true)
																		.val(
																				'스크랩');
															},
															error : function(
																	error) {
																console
																		.error(
																				'Error:',
																				error);
																alert('오류가 발생했습니다. 다시 시도해주세요.');
															}
														});
											} else {
												// 스크랩 추가 요청
												$
														.ajax({
															url : '/Company/ScrapAdd',
															type : 'POST',
															contentType : 'application/json',
															data : JSON
																	.stringify({
																		resume_idx : resume_idx,
																		cid : cid
																	}),
															success : function(
																	response) {
																alert('스크랩되었습니다.');
																button
																		.data(
																				'scraped',
																				true)
																		.toggleClass(
																				'btn-primary',
																				true)
																		.toggleClass(
																				'btn-outline-secondary',
																				false)
																		.val(
																				'스크랩 해제');
															},
															error : function(
																	error) {
																console
																		.error(
																				'Error:',
																				error);
																alert('오류가 발생했습니다. 다시 시도해주세요.');
															}
														});
											}
										});
					});
</script>
</html>
