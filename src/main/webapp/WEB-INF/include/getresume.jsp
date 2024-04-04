<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="personResumeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">이력서 이름</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>
        	<img href="">
        	<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">연락처</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">주소</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
        </div>
        
        <div class="mb-3">
				  <label for="basic-url" class="form-label">포트폴리오 URL</label>
				  <div class="input-group">
				    <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
				    <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3 basic-addon4">
				  </div>
				  <div class="form-text" id="basic-addon4">Example help text goes outside the input group.</div>
				</div>
				
				<div class="input-group mb-3">
				  <span class="input-group-text" id="inputGroup-sizing-default">기술스택</span>
				  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
				</div>
				
				<div class="input-group">
				  <span class="input-group-text">자기소개</span>
				  <textarea class="form-control" aria-label="With textarea"></textarea>
				</div>
				
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary">합격</button>
      	<button type="button" class="btn btn-primary">불합격</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>