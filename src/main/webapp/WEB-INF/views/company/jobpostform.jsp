<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="jobPost" data-bs-backdrop="true"
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
									<input type="text" class="form-control" id="pay"
										value="면접 후 결정">
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
								<div class="col-md-8 d-flex">
									<input class="form-control" type="time" name="gowork"
										id="gowork" value="" required> <input
										class="form-control ms-3" type="time" name="gohome"
										id="gohome" value="" required>
								</div>
							</div>
						</div>
					</div>
					<div class="my-1 mx-auto row">
						<label for="deadline" class="form-label">마감 일자</label> <input
							type="date" class="form-control" id="deadline">
					</div>
					<div class="my-1 mx-auto row">
						<label for="c_intro" class="form-label">기업 소개</label> <input
							type="email" class="form-control" id="c_intro"
							placeholder="제목을 입력해주세요.">
					</div>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">업무 소개</label> <input
							type="email" class="form-control" id="post_name"
							placeholder="제목을 입력해주세요.">
					</div>
					<div class="my-1 mx-auto row">
						<div class="col-auto">
							<input type="checkbox" class="btn-check" id="skill_1"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="skill_1">JAVA</label>
						</div>
						<div class="col-auto">
							<input type="checkbox" class="btn-check" id="skill_2"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="skill_2">JAVA</label>
						</div>
						<div class="col-auto">
							<input type="checkbox" class="btn-check" id="skill_3"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="skill_3">JAVA</label>
						</div>
						<div class="col-auto">
							<input type="checkbox" class="btn-check" id="skill_4"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="skill_4">JAVA</label>
						</div>
						<div class="col-auto">
							<input type="checkbox" class="btn-check" id="skill_5"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="skill_5">JAVA</label>
						</div>
						<div class="col-auto">
							<input type="checkbox" class="btn-check" id="skill_6"
								autocomplete="off"> <label
								class="btn btn-outline-primary" for="skill_6">JAVA</label>
						</div>
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