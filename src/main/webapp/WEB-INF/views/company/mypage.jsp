<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.cname }님의 마이페이지</title>
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
							value="${ vo.cname }님의 마이페이지" readonly>
					</h2>
					<hr>
					<div class="my-1 mx-auto row">
						<div class="row mt-2">
							<div class="col-2 row d-flex align-items-center">
								<div class="col-md-auto">
									<img alt="Logo" src="${ vo.com_logo }" style="height: 30px;">
								</div>
							</div>
							<div class="col-5 row ms-4" >
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="cname">기업명</span>
									<input type="text" class="form-control" id="cname" name="cname" value="${ vo.cname }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="cnumber">사업자 번호</span>
									<input type="text" class="form-control" id="cnumber" name="cnumber" value="${ vo.cnumber }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="id">아이디</span>
									<input type="text" class="form-control" id="id" name="id" value="${ vo.id }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="password">비밀번호</span>
									<input type="text" class="form-control" id="password" name="password" value="${ vo.password }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="crepresentive">대표자</span>
									<input type="text" class="form-control" id="crepresentive" name="crepresentive" value="${ vo.crepresentive }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="address">주소</span>
									<input type="text" class="form-control" id="address" name="address" value="${ vo.address }" readonly style="height: 70px;">
								</div>
							</div>
							<div class="col-5 row ms-4">
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="manager_name">담당자</span>
									<input type="text" class="form-control" id="manager_name" name="manager_name" value="${ vo.manager_name }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="company_managerphone">담당자 번호</span>
									<input type="text" class="form-control" id="company_managerphone" name="company_managerphone" value="${ vo.company_managerphone }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="user_email">이메일</span>
									<input type="text" class="form-control" id="user_email" name="user_email" value="${ vo.user_email }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="csize">규모</span>
									<input type="text" class="form-control" id="csize" name="csize" value="${ vo.csize }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="cyear">창립일</span>
									<input type="text" class="form-control" id="cyear" name="cyear" value="${ vo.cyear }" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="created_date">생성일</span>
									<input type="text" class="form-control" id="created_date" name="created_date" value="${ vo.created_date }" readonly style="height: 70px;">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary float-end me-2" href = "/Company/UpdateForm?id=${ vo.id }" />수정</a>
						<a class="btn btn-danger float-end me-2" href = "/Company/DeleteForm?id=${ vo.id }" />탈퇴</a>
					</div>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>