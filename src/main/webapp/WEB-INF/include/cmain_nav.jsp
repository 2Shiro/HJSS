<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<ul class="nav flex-column">
	<li class="nav-item mx-auto">
		<button type="button" class="btn btn-secondary navc" id="main">채용공고</button>
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
		//id랑 그런거 필요
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
	
	var navc = document.getElementsByClassName("navc");

    function handleClick(event) {
      console.log(event.target);
      // console.log(this);
      // 콘솔창을 보면 둘다 동일한 값이 나온다

      console.log(event.target.classList);

      if (event.target.classList[1] === "clicked") {
        event.target.classList.removeClass("btn-outline-secondary");
        event.target.classList.addClass("btn-secondary");
      } else {
        for (var i = 0; i < navc.length; i++) {
        	navc[i].classList.removeClass("btn-secondary");
        }
        event.target.classList.addClass("btn-outline-secondary");
      }
    }

    function init() {
      for (var i = 0; i < navc.length; i++) {
    	  navc[i].addEventListener("click", handleClick);
      }
    }

    init();
</script>