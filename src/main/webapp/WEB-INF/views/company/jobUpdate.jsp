<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-1 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/cmain_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3">
					<h2>공고 수정하기</h2>
					<hr>
					<form class="container">
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="title" class="form-label">공고명</label> <input
									type="text" class="form-control" id="title"
									value="프론트엔드 개발자 구합니다">
							</div>
						</div>
						<div class="container-fluid border">
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="career" class="col-form-label">지원자격</label>
								</div>
								<div class="col-3 my-3">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>

								<div class="col-1 my-3">
									<label for="pay" class="col-form-label">연봉</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control" id="pay"
										value="면접 후 결정">
								</div>
								<div class="col-2 my-3"></div>
							</div>
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="type" class="col-form-label">근무조건</label>
								</div>
								<div class="col-3 my-3">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>

								<div class="col-1 my-3">
									<label for="career" class="col-form-label">근무 시간</label>
								</div>
								<div class="col-3 my-3 d-flex">
									<input class="form-control" type="time" name="gowork"
										id="gowork" value="" required> <input
										class="form-control ms-3" type="time" name="gohome"
										id="gohome" value="" required>
								</div>
								<div class="col-2 my-3"></div>
							</div>
						</div>

						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="deadline" class="form-label">마감 일자</label> <input
									type="date" class="form-control" id="deadline"
									style="width: 30%">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="c_intro" class="form-label">기업 소개</label> <textarea rows="10" class="form-control" id="c_intro"
							name="c_intro" ></textarea>
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="job-intro" class="form-label">업무 소개</label><textarea rows="10" class="form-control" id="job-intro"
							name="job-intro" ></textarea>
							</div>
						</div>
						<p class="mb-0">기술/자격 조건</p>
						<div class="my-2 row" id="skills">
							<div class="col-auto">
								<input type="checkbox" class="btn-check" id="skill_1"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="skill_1">JAVA</label>
							</div>
							<div class="col-auto">
								<input type="checkbox" class="btn-check" id="skill_1"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="skill_1">JAVA</label>
							</div>
							<div class="col-auto">
								<input type="checkbox" class="btn-check" id="skill_1"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="skill_1">JAVA</label>
							</div>
							<div class="col-auto">
								<input type="checkbox" class="btn-check" id="skill_1"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="skill_1">JAVA</label>
							</div>

						</div>

						<div class="my-3 d-flex justify-content-center">
							<a href="/jobs" id="btn-list" class="btn btn-danger mx-3">취소</a>
							<button type="submit" id="btn-update"
								class="btn btn-secondary mx-3">수정</button>
						</div>
					</form>


				</div>




			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>