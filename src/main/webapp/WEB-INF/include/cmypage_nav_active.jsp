<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	const url = window.location.href;
	
	if(url.includes('/Company/Mypage')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		UserEl.classList.remove('btn-outline-secondary');
		UserEl.classList.add('btn-secondary');
	}
	
	if (url.includes('/Company/MyPost')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		MyPostEl.classList.remove('btn-outline-secondary');
		MyPostEl.classList.add('btn-secondary');
	}
	
	if (url.includes('/Company/MyParticipate')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		MyParticipateEl.classList.remove('btn-outline-secondary');
		MyParticipateEl.classList.add('btn-secondary');
	}
	
	if (url.includes('/Company/MyScrap')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		ScrapEl.classList.remove('btn-outline-secondary');
		ScrapEl.classList.add('btn-secondary');
	}
</script>