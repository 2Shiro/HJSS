<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="resumeForm" data-bs-backdrop="true"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="resumeFormLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form class="needs-validation container" action="/Person/InsertResume?id=${id }" novalidate
				id="resumeFormsub" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<h2 class="modal-title" id="resumeFormLabel">이력서 등록하기</h2>
					<hr>
					<div class="my-1 mx-auto row">
						<div class="col">
							<label for="resume_name" class="form-label">이력서 제목</label> <input
								type="text" class="form-control" id="post_name" name="title"
								placeholder="제목을 입력해주세요.">

						</div>
						<div class="col-2">
							<label for="resume_publish" class="form-label">공개여부</label> <select
								class="form-select" aria-label="이력서 공개여부" id="publish" name="publish">
								<option selected value="1">공개</option>
								<option value="2">비공개</option>
							</select>
						</div>
					</div>
					<hr>
					<div class="my-1 mx-auto row">

						<div class="row mt-2">
							<div class="col-6 row d-flex align-items-center">
								<div class="col-md-auto">
									<img alt="Logo" src="/images/logo.png" style="height: 180px;">
								</div>
							</div>
							<div class="col-6 row ms-4">
								<div class="input-group mb-3 ">
									<span class="input-group-text text-center" id="pname">이름</span>
									<input type="text" class="form-control" id="pname" name="pname"
										readonly="readonly" value="${ info.pname }">
								</div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="birth">생년월일</span><input
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
										readonly="readonly" value="${ user.user_email }"
										name="user_email">
								</div>
							</div>
						</div>
						<div class="row mt-2">
							<div class="input-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="profile">
							</div>
						</div>
						<div class="mt-3 mx-auto row">
							<label for="portfolio" class="form-label">포트폴리오 주소</label> <input
								type="text" class="form-control" id="portfolio" name="portfolio"
								placeholder="포트폴리오 주소를 입력해주세요.">
						</div>
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
						<div class="mt-3 mx-auto row">
							<label for="self-intro" class="form-label">자기 소개</label>
							<textarea rows="10" class="form-control" id="self_intro"
								name="self_intro"></textarea>
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