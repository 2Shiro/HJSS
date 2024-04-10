<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 메인</title>
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

<style>
.resume {
	width: 500px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<!-- 세션에 따라 바뀌는 코드로 변경해야함 -->
					<%@include file="/WEB-INF/include/pmain_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<!-- 공고 보는 부분 -->
				<div class="mt-5 ms-3">
					<h2 class="text-center fw-semibold">
						<input type="text" class="border-0" id="title"
							value="${jobpostvo.post_name}">
					</h2>
					<hr>
					<div class="container">

						<div class="container-fluid border">
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="career" class="col-form-label">지원자격</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="career"
										value="${jobpostvo.career}" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="pay" class="col-form-label">연봉</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="pay"
										value="${jobpostvo.pay}" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="type" class="col-form-label">근무조건</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="type"
										value="${jobpostvo.job_type}" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="career" class="col-form-label">근무 시간</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="career"
										value="${jobpostvo.go_work} ~ ${jobpostvo.go_home}"
										readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
						</div>

						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="deadline" class="form-label">마감 일자</label> <input
									type="text" class="form-control" id="deadline"
									value="${jobpostvo.deadline}" readonly="readonly">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="c_intro" class="form-label">기업 소개</label> <input
									type="text" class="form-control" id="c_intro"
									value="${jobpostvo.c_intro}" readonly="readonly">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="job-intro" class="form-label">업무 소개</label> <input
									type="text" class="form-control" id="job-intro"
									value="${jobpostvo.job_intro}" readonly="readonly">
							</div>
						</div>
						<!-- 기술 테이블 정보 -->
						<p class="mb-0">기술/자격 조건</p>
						<div class="my-2 row" id="skills">
							<!-- 기술 여러개 -->
							<c:forEach var="jobnameList" items="${jobnameList}">
								<div class="col-auto">
									<input type="text" class="form-control text-center"
										style="padding: 5px 0px;" value="${jobnameList.skill_name}"
										readonly="readonly">
								</div>
							</c:forEach>
						</div>

						<!-- 기업 정보 가져와야함 -->
						<p class="mb-0">기업 정보</p>
						<div class="container-fluid border">
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="csize" class="col-form-label">사원수</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="csize"
										value="${companyVo.csize}" readonly="readonly">
								</div>
								<div class="col-1 my-3">
									<label for="crep" class="col-form-label">대표자</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="crep"
										value="${companyVo.crepresentive}" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="cyear" class="col-form-label">설립연도</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="cyear"
										value="${companyVo.cyear}" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="phone" class="col-form-label">전화번호</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="phone"
										value="${companyVo.cnumber}" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="address" class="col-form-label">주소</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="address"
										value="${companyVo.address}">
								</div>

								<div class="col-1 my-3">
									<label for="email" class="col-form-label">이메일</label>
								</div>
								<div class="col-3 my-3">
									<input type="email" class="form-control border-0" id="email"
										value="${companyVo.user_email}" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
						</div>
						<!-- 버튼도 구직자의 경우 지원하기 있어야함 -->
						<!-- 기업이면 자기껀 마이페이지로 가게 해야하나? -->
						<div class="my-3 d-flex justify-content-center">
							<!-- 드롭다운해야징 -->
							<c:if test="${sessionVo.type == 2}">
								<form action="/Person/JoinPost" method="POST">
									<input type="hidden" name="id" value="ps1" /> <input
										type="hidden" name="post_idx" value="${jobpostvo.post_idx}" />
									<div class="input-group mb-3 resume">
										<label class="input-group-text" for="inputGroupSelect01">이력서</label>
										<select name="resume_idx" class="form-select"
											id="presumeSelect">
											<option selected>==선택==</option>
											<c:forEach var="presumeVo" items="${presumeVo}">
												<option value="${presumeVo.resume_idx}">${presumeVo.title}</option>
											</c:forEach>
										</select>
									</div>
									<button type="submit" class="btn btn-primary mx-3">지원하기</button>
								</form>
							</c:if>
							<!-- history back 사용? -->
							<!-- 세션별로 다르게 -->
							<a href="/" id="btn-list" class="btn btn-outline-secondary mx-3">메인으로</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>