<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 마이페이지</title>
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
							value="마이페이지" readonly>
					</h2>
					<hr>
					<div class="my-1 mx-auto row">
						<div class="row mt-2">
							<div class="col-2 row d-flex align-items-center">
								<div class="col-md-auto">
									<img alt="Logo" src="/images/naver.png" style="height: 30px;">
								</div>
							</div>
							<div class="col-5 row ms-4" >
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="cname">기업명</span>
									<input type="text" class="form-control" id="cname" name="cname" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="cnum">사업자 번호</span>
									<input type="text" class="form-control" id="cnum" name="cnum" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="cid">ID</span>
									<input type="text" class="form-control" id="cid" name="cid" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="crepresentive">대표자</span>
									<input type="text" class="form-control" id="crepresentive" name="crepresentive" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="caddress">주소</span>
									<input type="email" class="form-control" id="caddress" name="caddress" readonly style="height: 70px;">
								</div>
							</div>
							<div class="col-5 row ms-4">
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="mname">담당자</span>
									<input type="text" class="form-control" id="mname" name="mname" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="mnum">담당자 번호</span> <input
										type="text" class="form-control" id="mnum" name="mnum" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="address">규모</span> <input
										type="text" class="form-control" id="address" name="address" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="cyear">창립일</span> <input
										type="text" class="form-control" id="cyear" name="cyear" readonly style="height: 70px;">
								</div>
								<div class="input-group mb-3" style="height: 70px;">
									&nbsp;
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" id="post-submit"
						class="btn btn-primary float-end me-2">수정</button>
					<button type="reset" id="btn-cancel"
						class="btn btn-danger float-end" data-bs-dismiss="modal">삭제</button>
				</div>

			</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>