<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지원 받은 이력서</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}
h3 {
	font-weight: bold;
	margin: 10px;
}
</style>
</head>
<body>
<form action="/Person/Pass" method="POST">
<input type="hidden" name="resume_idx" value="${presumeVo.resume_idx}" />
<div class="" id="personResumeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">이력서 : ${presumeVo.title}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div>
        <div>
        	<img href="">
        	<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${psuerVo.pname}" readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${psuerVo.birth}"  readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${psuerVo.phone}"  readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${psuerVo.address}"  readonly>
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${userVo.user_email}"  readonly>
					</div>
        </div>
        
        <div class="mb-3">
				  <label for="basic-url" class="form-label">포트폴리오 URL</label>
				  <div class="input-group">
				    <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
				    <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4" value="${presumeVo.portfolio}"  readonly>
				  </div>
				  <div class="form-text" id="basic-addon4">Example help text goes outside the input group.</div>
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="inputGroup-sizing-default">기술스택</span>
				  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  readonly>
				</div>
				
				<div class="input-group">
				  <span class="input-group-text">자기소개</span>
				  <textarea class="form-control" aria-label="With textarea" value="${presumeVo.self_intro}"  readonly></textarea>
				</div>
				
      </div>
      <div>
      	&nbsp;&nbsp;
      		<div class="form-check ">
					  <input class="form-check-input" type="radio" name="status" id="flexRadioDefault1" value="1">
					  <label class="form-check-label" for="flexRadioDefault1">
					    합격
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2" value="2" checked>
					  <label class="form-check-label" for="flexRadioDefault2">
					    불합격
					  </label>
					</div>
					<input type="submit" class="btn btn-secondary result">
      </div>
    </div>
  </div>
</div>
</form>
</body>

</html>