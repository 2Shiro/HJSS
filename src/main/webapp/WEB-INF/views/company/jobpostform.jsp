<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="true"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form class="needs-validation container" novalidate id="postsub"
				method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<h2 class="modal-title" id="staticBackdropLabel">공고 등록하기</h2>
					<hr>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">공고명</label> <input
							type="email" class="form-control" id="post_name"
							placeholder="제목을 입력해주세요.">
					</div>
					<hr>
					<div class="my-1 mx-auto row">
						<div class="row">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>지원 자격</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>연봉</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>근무 조건</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>근무 시간</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">마감 일자</label> <input
							type="email" class="form-control" id="post_name"
							placeholder="제목을 입력해주세요.">
					</div>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">기업 소개</label> <input
							type="email" class="form-control" id="post_name"
							placeholder="제목을 입력해주세요.">
					</div>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">업무 소개</label> <input
							type="email" class="form-control" id="post_name"
							placeholder="제목을 입력해주세요.">
					</div>
					<div class="my-1 mx-auto row">
					<label for="skill-selcet" class="form-label">기술/자격 조건</label>
						<select class="form-select" aria-label="Default select example" id="skill-select">
							<option selected>Open this select menu</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="reset" id="btn-cancel"
						class="btn btn-danger float-end" data-bs-dismiss="modal">취소</button>
					<button type="submit" id="post-submit"
						class="btn btn-primary float-end me-2">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>