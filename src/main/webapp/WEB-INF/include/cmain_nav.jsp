<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="main">채용공고</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="mypost">등록 공고 관리</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="myparticipate">지원 받은 이력서</button>
	</li>
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-outline-secondary navc" id="recommend">인재 추천</button>
	</li>
	  <li class="nav-item mx-auto">
        <input type="hidden" value="${ sessionScope.login.id }" id="sessionid">
    </li>
</ul>

<script>
	const MainEl = document.getElementById("main");
	const MyPostEl = document.getElementById("mypost");
	const MyParticipateEl = document.getElementById("myparticipate");
	const RecommendEl = document.getElementById("recommend");
	const sessionid = document.getElementById("sessionid").value;
	var NavEl = document.querySelectorAll('.navc');
	
	MainEl.addEventListener('click', () => {
		//alert('cmain');
		location.href = '/Company/Cmain';
	});
	
	MyPostEl.addEventListener('click', () => {
		//alert('mypost');
		location.href = '/Company/MyPost?id=' + sessionid;
	});
	
	MyParticipateEl.addEventListener('click', () => {
		//alert('myparticipate');
		location.href = '/Company/MyParticipate?id=' + sessionid;
	});
	
	RecommendEl.addEventListener('click', () => {
		//alert('recommend');
		location.href = '/Company/Recommend?id=' + sessionid;
	});
</script>