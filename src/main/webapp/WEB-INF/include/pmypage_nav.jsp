<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="user">회원정보</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="myresume">등록 이력서 관리</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="myproposal">지원한 공고</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="scrap">스크랩한 회사</button>
	</li>
	<li class="nav-item mx-auto">
        <input type="hidden" value="${ sessionScope.login.id }" id="sessionid">
    </li>
</ul>

<script>
	const UserEl = document.getElementById("user");
	const MyResumeEl = document.getElementById("myresume");
	const MyProposalEl = document.getElementById("myproposal");
	const ScrapEl = document.getElementById("scrap");
	const sessionid = document.getElementById("sessionid").value;
	var NavEl = document.querySelectorAll(".navc");
	
	UserEl.addEventListener('click', function(e) {
		//alert('person mypage');
		location.href = '/Person/Mypage?id=' + sessionid;
	});
	
	MyResumeEl.addEventListener('click', function(e) {
		//alert('myresume');
		location.href = '/Person/MyResume?id=' + sessionid;
	});
	
	MyProposalEl.addEventListener('click', function(e) {
		//alert('myproposal');
		location.href = '/Person/MyProposal?id=' + sessionid;
	});
	
	ScrapEl.addEventListener('click', function(e) {
		//alert('pscrap');
		location.href = '/Person/Scrap?id=' + sessionid;
	});
</script>