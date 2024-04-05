<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="jobPost" data-bs-backdrop="true"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form class="needs-validation container"
				action="/Company/JobPost?id=${id }" novalidate id="postForm"
				method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<h2 class="modal-title" id="staticBackdropLabel">공고 등록하기</h2>
					<hr>
					<div class="my-1 mx-auto row">
						<label for="post_name" class="form-label">공고명</label> <input
							type="text" class="form-control" id="post_name" name="post_name"
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
									<input type="text" class="form-control" id="career"
										name="career">
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>연봉</h5>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control" id="pay" name="pay">
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<h5>근무 조건</h5>
								</div>
								<div class="col-md-8">
									<select class="form-select" aria-label="job_type" id="job_type"
										name="job_type">
										<option selected>선택</option>
										<option value="정규직">정규직</option>
										<option value="계약직">계약직</option>
									</select>
								</div>
							</div>
							<div class="col-6 row d-flex align-items-center ms-4">
								<div class="col-md-4">
									<h5>근무 시간</h5>
								</div>
								<div class="col-md-8 d-flex">
									<input class="form-control" type="time" name="go_work"
										id="gowork" required> <input
										class="form-control ms-3" type="time" name="go_home"
										id="gohome" required>
								</div>
							</div>
						</div>
					</div>
					<div class="my-1 mx-auto row">
						<label for="deadline" class="form-label">마감 일자</label> <input
							type="date" class="form-control" id="deadline" name="deadline">
					</div>
					<div class="my-1 mx-auto row">
						<label for="c_intro" class="form-label">기업 소개</label>
						<textarea rows="10" class="form-control" id="c_intro"
							name="c_intro" placeholder="기업소개를 입력해주세요."></textarea>

					</div>
					<div class="my-1 mx-auto row">
						<label for="job_intro" class="form-label">업무 소개</label>
						<textarea rows="10" class="form-control" id="job_intro"
							name="job_intro" placeholder="업무소개를 입력해주세요."></textarea>
					</div>
					<div class="mt-3 mx-auto row">
						<c:forEach var="skill" items="${ skill }">
							<div class="col-auto">
								<input type="checkbox" class="btn-check" id="skill_${skill.skill_idx }" value="${skill.skill_idx}" name="skillIdx"
									autocomplete="off"> <label
									class="btn btn-outline-primary" for="skill_${skill.skill_idx }">${skill.skill_name }</label>
							</div>
						</c:forEach>
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