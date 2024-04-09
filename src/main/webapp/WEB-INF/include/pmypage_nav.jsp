<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="user">회원정보</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="myresume">등록 이력서 관리</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="myproposal">지원한 공고</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="scrap">스크랩한 회사</button>
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
	
	UserEl.addEventListener('click', function(e) {
		alert('person mypage');
		location.href = '/Person/Mypage?id=' + sessionid;
		//UserEl.removeClass("btn-outline-secondary");
		//UserEl.addClass("btn-secondary");
	});
	
	MyResumeEl.addEventListener('click', function(e) {
		alert('myresume');
		location.href = '/Person/MyResume?id=' + sessionid;
		//btn();
	});
	
	MyProposalEl.addEventListener('click', function(e) {
		alert('myproposal');
		location.href = '/Person/MyProposal?id=' + sessionid;
		//btn();
	});
	
	ScrapEl.addEventListener('click', function(e) {
		alert('pscrap');
		location.href = '/Person/Scrap?id=' + sessionid;
		//btn();
	});
</script>