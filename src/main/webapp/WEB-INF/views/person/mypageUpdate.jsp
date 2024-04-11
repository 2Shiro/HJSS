<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.pname }님의 마이페이지 수정</title>
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
							value="${ vo.pname }님의 마이페이지 수정" readonly>
					</h2>
					<hr>
					<form action="/Person/Update?id=${ vo.id }" method="POST">
						<div class="my-1 mx-auto row">
							<div class="row mt-2  d-flex justify-content-center">
								<div class="col-6 row ms-4" >
									<div class="input-group mb-3 ">
										<span class="input-group-text text-center" >이름</span>
										<input type="text" class="form-control" id="pname" name="pname" value="${ vo.pname }" readonly style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >아이디</span>
										<input type="text" class="form-control" id="id" name="id" value="${ vo.id }" readonly style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >비밀번호</span>
										<input type="password" class="form-control" id="password" name="password" value="${ vo.password }" style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >전화번호</span>
										<input type="text" class="form-control" id="phone" name="phone" value="${ vo.phone }" style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >이메일</span>
										<input type="text" class="form-control" id="user_email" name="user_email" value="${ vo.user_email }" style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >주소</span>
										<input type="text" class="form-control" id="address" name="address" value="${ vo.address }" style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >생년월일</span>
										<input type="text" class="form-control" id="birth" name="birth" value="${ vo.birth }" readonly style="height: 70px; text-align: center;">
									</div>
									<div class="input-group mb-3">
										<span class="input-group-text" >생성일</span>
										<input type="text" class="form-control" id="created_date" name="created_date" value="${ vo.created_date }" readonly style="height: 70px; text-align: center;">
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary float-end me-2"  value="수정" />
							<input type="button" value="뒤로" id="goMypage" class="btn btn-secondary float-end" />
						</div>
					</form>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	
	<script>
		const goListEl = document.getElementById('goMypage');
		const id = document.getElementById('id').value;
		goListEl.addEventListener('click', function(e) {
			location.href = '/Person/Mypage?id='+id;
		})
	</script>
</body>
</html>