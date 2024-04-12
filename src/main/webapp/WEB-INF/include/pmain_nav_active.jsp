<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	const url = window.location.href;
	
	if(url.includes('/Person/Pmain') || url.includes('/ViewPost')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		MainEl.classList.remove('btn-outline-secondary');
		MainEl.classList.add('btn-secondary');
	}
	
	if (url.includes('/Person/MyResume')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		MyResumeEl.classList.remove('btn-outline-secondary');
		MyResumeEl.classList.add('btn-secondary');
	}
	
	if (url.includes('/Person/MyProposal')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		MyProposalEl.classList.remove('btn-outline-secondary');
		MyProposalEl.classList.add('btn-secondary');
	}
	
	if (url.includes('/Person/Recommend')) {
		for (var i = 0; i < NavEl.length; i++) {
			if(NavEl[i].classList.contains('btn-secondary')) {
				NavEl[i].classList.remove('btn-secondary');
				NavEl[i].classList.add('btn-outline-secondary');
			}
		}
		RecommendEl.classList.remove('btn-outline-secondary');
		RecommendEl.classList.add('btn-secondary');
	}
</script>