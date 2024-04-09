<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary {a}" id="main">채용공고</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="myresume">등록 이력서 관리</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="myproposal">지원한 공고</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="recommend">회사 추천</button>
	</li>
</ul>

<script>
	const MainEl = document.getElementById("main");
	const MyResumeEl = document.getElementById("myresume");
	const MyProposalEl = document.getElementById("myproposal");
	const RecommendEl = document.getElementById("recommend");
	//const BtnEl = document.querySelectAll(".btn");
	
	MainEl.addEventListener('click', function(e) {
		alert('pmain');
		location.href = '/Person/Pmain';
		//MainEl.removeClass("btn-outline-secondary");
		//MainEl.addClass("btn-secondary");
	});
	
	MyResumeEl.addEventListener('click', function(e) {
		alert('myresume');
		location.href = '/Person/MyResume';
		//btn();
	});
	
	MyProposalEl.addEventListener('click', function(e) {
		alert('myproposal');
		location.href = '/Person/MyProposal';
		//btn();
	});
	
	RecommendEl.addEventListener('click', function(e) {
		alert('recommend');
		location.href = '/Person/Recommend';
		//btn();
	});
</script>