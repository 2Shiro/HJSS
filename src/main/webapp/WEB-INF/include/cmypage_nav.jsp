<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="user">회원정보</button>
	</li>
	<li class="nav-item mx-auto mt-2">
		<button type="button" class="btn btn-outline-secondary" id="mypost">등록 공고 관리</button>
	</li>
	<li class="nav-item mx-auto mt-2">
		<button type="button" class="btn btn-outline-secondary" id="myparticipate">지원 받은 이력서</button>
	</li>
	<li class="nav-item mx-auto mt-2">
		<button type="button" class="btn btn-outline-secondary" id="scrap">스크랩한 구직자</button>
	</li>
</ul>

<script>
	const UserEl = document.getElementById("user");
	const MyPostEl = document.getElementById("mypost");
	const MyParticipateEl = document.getElementById("myparticipate");
	const ScrapEl = document.getElementById("scrap");
	
	UserEl.addEventListener('click', function(e) {
		alert('company mypage');
		location.href = '/Company/Mypage';
	});
	
	MyPostEl.addEventListener('click', function(e) {
		alert('mypost');
		location.href = '/Company/jobs';
	});
	
	MyParticipateEl.addEventListener('click', function(e) {
		alert('myparticipate');
		location.href = '/Company/MyParticipate';
	});
	
	ScrapEl.addEventListener('click', function(e) {
		alert('cscrap');
		location.href = '/Company/Scrap';
	});
</script>