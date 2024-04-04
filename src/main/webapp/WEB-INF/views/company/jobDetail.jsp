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
<link rel="stylesheet" href="/css/common.css" />
</head>
<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/cmain_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3">
					<h2 class="text-center fw-semibold">
						<input type="text" class="border-0" id="title"
							value="백엔드 개발자 구합니다">
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
										value="신입" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="pay" class="col-form-label">연봉</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="pay"
										value="면접 후 결정" readonly="readonly">
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
										value="정규직" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="career" class="col-form-label">근무 시간</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="career"
										value="09:00 ~ 18:00" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
						</div>

						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="deadline" class="form-label">마감 일자</label> <input
									type="text" class="form-control" id="deadline"
									value="2024-04-11 09:00:00" readonly="readonly">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="c_intro" class="form-label">기업 소개</label> <input
									type="text" class="form-control" id="c_intro" value="기업 소개란"
									readonly="readonly">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="job-intro" class="form-label">업무 소개</label> <input
									type="text" class="form-control" id="job-intro" value="업무 소개란"
									readonly="readonly">
							</div>
						</div>
						<p class="mb-0">기술/자격 조건</p>
						<div class="my-2 row" id="skills">
							<div class="col-auto">
								<input type="text" class="form-control text-center"
									style="padding: 5px 0px;" value="Javascript"
									readonly="readonly">
							</div>
							<div class="col-auto">
								<input type="text" class="form-control text-center"
									style="padding: 5px 0px;" value="SQL" readonly="readonly">
							</div>
							<div class="col-auto">
								<input type="text" class="form-control text-center"
									style="padding: 5px 0px;" value="JAVA" readonly="readonly">
							</div>
							<div class="col-auto">
								<input type="text" class="form-control text-center"
									style="padding: 5px 0px;" value="HTML" readonly="readonly">
							</div>

						</div>
						<p class="mb-0">기업 정보</p>
						<div class="container-fluid border">
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="csize" class="col-form-label">사원수</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="csize"
										value="12" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="crep" class="col-form-label">대표자</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="crep"
										value="아무개" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="cyear" class="col-form-label">설린연도</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="cyear"
										value="2024" readonly="readonly">
								</div>

								<div class="col-1 my-3">
									<label for="phone" class="col-form-label">전화번호</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control border-0" id="phone"
										value="010-1234-5678" readonly="readonly">
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
										value="부산시 부산진구">
								</div>

								<div class="col-1 my-3">
									<label for="email" class="col-form-label">이메일</label>
								</div>
								<div class="col-3 my-3">
									<input type="email" class="form-control border-0" id="email"
										value="example@green.com" readonly="readonly">
								</div>
								<div class="col-2 my-3"></div>
							</div>
						</div>
						<div class="my-3 d-flex justify-content-center">
							<a href="/jobs" id="btn-list"
								class="btn btn-outline-secondary mx-3">목록</a> <a
								href="/jobUpdate" id="btn-list"
								class="btn btn-outline-primary mx-3">수정</a>
						</div>
					</div>


				</div>




			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>