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
					<%@include file="/WEB-INF/include/pmain_nav.jsp"%>
				</div>
			</nav>
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3">
					<div class="row">
						<div class="my-1 mx-auto row">
							<div class="col-10">
								<h2 class="fw-semibold">
									<input type="text" class="border-0 w-100" id="title"
										value="${ vo.title }" readonly="readonly">
								</h2>
							</div>
							<div class="col-2">
								<input type="text" class="form-control border-0" id="publish"
									readonly="readonly"
									value="공개여부설정 : <c:choose><c:when test='${vo.publish == 1}'>공개</c:when><c:when test='${vo.publish == 2}'>비공개</c:when><c:otherwise>상태 미정</c:otherwise>
				              </c:choose>">
							</div>
						</div>

					</div>
					<hr>
					<div class="my-1 mx-auto row">

						<div class="row mt-2">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<img alt="profile" src="${vo.profile}" style="height: 180px;">
								</div>
							</div>
							<div class="col-6 row ms-4">
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="pname">이름</span>
									<input type="text" class="form-control" id="pname" name="pname"
										readonly="readonly" value="${ info.pname }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="birth">생년월일</span> <input
										type="text" class="form-control" id="birth" name="birth"
										readonly="readonly" value="${ info.birth }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="phone">연락처</span> <input
										type="text" class="form-control" id="phone" name="phone"
										readonly="readonly" value="${ info.phone }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="address">주소</span> <input
										type="text" class="form-control" id="address" name="address"
										readonly="readonly" value="${ info.address }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="user_email">이메일</span> <input
										type="email" class="form-control" id="user_email"
										readonly="readonly" value="${ userVo.user_email }"
										name="user_email">
								</div>
							</div>
						</div>

						<div class="my-1 mx-auto row">
							<label for="portfolio" class="form-label">포트폴리오 주소</label> <a
								class="form-control text-decoration-none text-dark"
								id="portfolio" href="${vo.portfolio}">${vo.portfolio}</a>
						</div>
						<div class="my-1 mx-auto row">
							<label for="skills" class="form-label">기술스택</label>
							<div class="mt-3 mx-auto row" id="skills">
								<c:forEach var="skill" items="${ skill }">
									<div class="col-auto">
										<input type="checkbox" class="btn-check"
											id="skill_${skill.skill_idx }" value="${skill.skill_idx}"
											name="skillIdx" autocomplete="off" readonly="readonly">
										<label class="btn btn-outline-primary"
											for="skill_${skill.skill_idx }">${skill.skill_name }</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="my-1 mx-auto row">
							<label for="self-intro" class="form-label">업무 소개</label>
							<textarea rows="10" class="form-control" id="job-intro"
								readonly="readonly" name="self-intro">${ vo.self_intro }</textarea>
						</div>

						<c:choose>
							<c:when test="${sessionVo.type == 1}">
								<div class="my-3 d-flex justify-content-center">
									<a href="/Company/Recommend?id=cp1" id="btn-list"
										class="btn btn-outline-secondary mx-3">목록</a>
								</div>
							</c:when>
							<c:when test="${sessionVo.type == 2}">
								<div class="my-3 d-flex justify-content-center">
									<a href="/Person/MyResume?id=${id}&nowpage=1" id="btn-list"
										class="btn btn-outline-secondary mx-3">목록</a> <a
										href="/Person/MyResumeEdit?resume_idx=${vo.resume_idx}"
										id="btn-update" class="btn btn-outline-primary mx-3">수정</a>
								</div>
							</c:when>
							<c:otherwise>
								<a href="/" id="btn-list" class="btn btn-outline-secondary mx-3">메인으로</a>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>

<%@include file="/WEB-INF/include/pmypage_nav_active.jsp"%>