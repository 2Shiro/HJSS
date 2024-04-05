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
				<div class="mt-5 mx-auto">
					<h2>이력서 수정하기</h2>
					<hr>
					<form class="container">
						<div class="form-floating my-3">
							<div class="mb-3 row">
								<div class="col">
									<label for="resume_name" class="form-label">이력서 제목</label> <input
										type="email" class="form-control" id="post_name"
										placeholder="제목을 입력해주세요.">

								</div>
								<div class="col-2">
									<label for="resume_publish" class="form-label">공개여부</label> <select
										class="form-select" aria-label="이력서 공개여부" id="resume_publish">
										<option selected value="1">공개</option>
										<option value="2">비공개</option>
									</select>
								</div>
							</div>
						</div>


						<div class="form-floating my-3">
							<div class="row mt-2">
								<div class="col-6 row d-flex align-items-center">
									<div class="col-md-auto">
										<img alt="Logo" src="${vo.profile}" style="height: 180px;">
									</div>
								</div>
								<div class="col-6 row ms-4">
									<div class="input-group mb-3 ">
										<span class="input-group-text text-center" id="pname">이름</span>
										<input type="text" class="form-control" id="pname"
											name="pname">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="birth">생년월일</span> <input
											type="text" class="form-control" id="birth" name="birth">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="phone">연락처</span> <input
											type="text" class="form-control" id="phone" name="phone">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="address">주소</span> <input
											type="text" class="form-control" id="address" name="address">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" id="user_email">이메일</span> <input
											type="email" class="form-control" id="user_email"
											name="user_email">
									</div>
								</div>
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="input-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="profile">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="portfolio" class="form-label">포트폴리오 주소</label> <input
									type="text" class="form-control" id="portfolio"
									name="portfolio" value="${ vo.portfolio}"
									placeholder="포트폴리오 주소를 입력해주세요.">
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mt-3 mx-auto row">
								<label for="skills" class="form-label">기술스택</label>
								<div class="mx-auto row" id="skills">
									<c:forEach var="skill" items="${ skill }">
										<div class="col-auto">
											<input type="checkbox" class="btn-check"
												id="skill_${skill.skill_idx }" value="${skill.skill_idx}"
												name="skillIdx" autocomplete="off"> <label
												class="btn btn-outline-primary"
												for="skill_${skill.skill_idx }">${skill.skill_name }</label>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="form-floating my-3">
							<div class="mb-3">
								<label for="self-intro" class="form-label">자기 소개</label>
								<textarea rows="10" class="form-control" id="self_intro"
									name="self_intro">${ vo.self_intro }</textarea>
							</div>
						</div>

						<div class="my-3 d-flex justify-content-center">
							<a href="/Person/ResumeDetail?resume_idx=${ vo.resume_idx }"
								id="btn-list" class="btn btn-danger mx-3">취소</a>
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