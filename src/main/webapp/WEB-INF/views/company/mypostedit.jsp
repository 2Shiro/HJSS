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
					<h2>공고 수정하기</h2>
					<hr>
					<form class="container"
						action="/Company/MyPostUpdate?post_idx=${vo.post_idx}">
						<input type="hidden" value="${vo.post_idx }" name="post_idx">
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="title" class="form-label">공고명</label>
								<input type="text" class="form-control" id="title" name="post_name" value="${vo.post_name }" required>
									
							</div>
						</div>
						<div class="container-fluid border">
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="career" class="col-form-label">지원자격</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control" id="career" required
										name="career" value="${vo.career }">
								</div>

								<div class="col-1 my-3">
									<label for="pay" class="col-form-label">연봉</label>
								</div>
								<div class="col-3 my-3">
									<input type="text" class="form-control" id="pay" name="pay" required
										value="${vo.pay }">
								</div>
								<div class="col-2 my-3"></div>
							</div>
							<div class="row">
								<div class="col-2 my-3"></div>
								<div class="col-1 my-3">
									<label for="type" class="col-form-label">근무조건</label>
								</div>
								<div class="col-3 my-3">
									<select class="form-select" aria-label="job_type" id="job_type" required
										name="job_type">
										<option>선택</option>
										<option value="정규직"
											<c:if test="${vo.job_type == '정규직'}">selected</c:if>>정규직</option>
										<option value="계약직"
											<c:if test="${vo.job_type == '계약직'}">selected</c:if>>계약직</option>
									</select>
								</div>

								<div class="col-1 my-3">
									<label for="career" class="col-form-label">근무 시간</label>
								</div>
								<div class="col-3 my-3 d-flex">
									<input class="form-control" type="time" name="go_work"
										id="go_work" value="${vo.go_work }" required> <input
										class="form-control ms-3" type="time" name="go_home"
										id="go_home" value="${vo.go_home }" required>
								</div>
								<div class="col-2 my-3"></div>
							</div>
						</div>

						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="deadline" class="form-label">마감 일자</label> <input
									type="date" class="form-control" id="deadline" required
									value="${vo.deadline }" name="deadline" style="width: 30%">
							</div>
						</div>
						<p class="mb-0">기술/자격 조건</p>
						<div class="my-2 row" id="skills">
							<c:forEach var="skill" items="${allSkills}">
								<div class="col-auto">
									<input type="checkbox" class="btn-check"
										id="skill_${skill.skill_idx }" value="${skill.skill_idx}"
										name="skillIdx" autocomplete="off" 
										<c:forEach var="postSkills" items="${postSkills}">
							                <c:if test="${skill.skill_idx == postSkills.skill_idx}">
							                    checked="checked"
							                </c:if>
							            </c:forEach>>
									<label class="btn btn-outline-primary"
										for="skill_${skill.skill_idx }">${skill.skill_name}</label>
								</div>
							</c:forEach>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="c_intro" class="form-label">기업 소개</label>
								<textarea rows="10" class="form-control" id="c_intro"
									name="c_intro" required>${vo.c_intro }</textarea>
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="job_intro" class="form-label">업무 소개</label>
								<textarea rows="10" class="form-control" id="job_intro"
									name="job_intro" required>${vo.job_intro }</textarea>
							</div>
						</div>


						<div class="my-3 d-flex justify-content-center">
							<a href="#" id="btn-list" class="btn btn-danger mx-3"
								onclick="history.back(); return false;">취소</a>
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