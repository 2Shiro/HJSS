<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary" id="user">회원정보</button>
	</li>
	<li class="nav-item mx-auto mt-2">
		<button type="button" class="btn btn-outline-secondary" id="mypost">등록
			공고 관리</button>
	</li>
	<li class="nav-item mx-auto mt-2">
		<button type="button" class="btn btn-outline-secondary"
			id="myparticipate">지원 받은 이력서</button>
	</li>
	<li class="nav-item mx-auto mt-2">
		<button type="button" class="btn btn-outline-secondary" id="scrap">스크랩한
			구직자</button>
	</li>
	<li class="nav-item mx-auto"><input type="hidden"
		value="${ sessionScope.login.id }" id="sessionid"></li>
</ul>

<script>
	const UserEl = document.getElementById("user");
	const MyPostEl = document.getElementById("mypost"); // 올바른 변수명 사용
	const MyParticipateEl = document.getElementById("myparticipate");
	const ScrapEl = document.getElementById("scrap");
	const sessionid = document.getElementById("sessionid").value;

	UserEl.addEventListener('click', function(e) {
		alert('company mypage');
		location.href = '/Company/Mypage?id=' + sessionid;;
	});

	MyPostEl.addEventListener('click', function(e) { // 수정된 부분
		alert('mypost');
		location.href = '/Company/MyPost?id=' + sessionid; // 경로도 확인 필요
	});

	MyParticipateEl.addEventListener('click', function(e) {
		alert('myparticipate');
		location.href = '/Company/MyParticipate?id=' + sessionid;
	});

	ScrapEl.addEventListener('click', function(e) {
		alert('cscrap');
		location.href = '/Company/MyScrap?id=' + sessionid;
	});
</script>
