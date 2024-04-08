<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="main">채용공고</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="mypost">등록 공고 관리</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="myparticipate">지원 받은 이력서</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="recommend">인재 추천</button>
	</li>
</ul>

<script>
	const MainEl = document.getElementById("main");
	const MyPostEl = document.getElementById("mypost");
	const MyParticipateEl = document.getElementById("myparticipate");
	const RecommendEl = document.getElementById("recommend");
	
	MainEl.addEventListener('click', function(e) {
		alert('cmain');
		location.href = '/Company/Cmain';
	});
	
	MyPostEl.addEventListener('click', function(e) {
		alert('mypost');
		location.href = '/Company/MyPost';
	});
	
	MyParticipateEl.addEventListener('click', function(e) {
		alert('myparticipate');
		location.href = '/Company/MyParticipate';
	});
	
	RecommendEl.addEventListener('click', function(e) {
		alert('recommend');
		location.href = '/Company/Recommend';
	});
</script>