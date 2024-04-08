<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ vo.pname }님의 회원탈퇴</title>
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
							value="${ vo.pname }님의 회원탈퇴" readonly>
					</h2>
					<hr>
					<form  action="/Person/Delete?id=${ vo.id }" method="POST">
						<div class="my-1 mx-auto row">
							<div class="row mt-2  d-flex justify-content-center">
								<div class="col-10 row ms-4" >
									<div class="input-group mb-3 ">
										<textarea class="form-control border-0 shadow-none mb-2" id="warning" name="warning" readonly style="height: 500px; text-align: center;">
													⚠ 회원탈퇴 경고문
													
											• 회원탈퇴 후 개인정보는 즉시 영구삭제됩니다
											
											• 정보는 영구삭제되기에 복구가 불가합니다
											
											• 재가입은 언제든지 가능합니다
											
											• 신중하게 생각하시고 결정해주십시오
											
											• 정말로 탈퇴 하시겠습니까?
										</textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-primary float-end me-2"  value="영구탈퇴" />
							<input type="button" value="취소" id="goMypage" class="btn btn-secondary float-end" />
						</div>
					</form>
				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	
	<script>
		const goListEl = document.getElementById('goMypage');
		goListEl.addEventListener('click', function(e) {
			location.href = '/Person/Mypage';
		})
	</script>
</body>
</html>