<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인재 추천</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/common.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.name-column {
	width: 20%;
}

.info-column {
	width: 30%;
}

.skill-column {
	width: 40%;
}

.action-column {
	width: 10%;
}
.linkDiv {

border: 1px solid #5215a6;
}
</style>
<script>
    $(document).ready(function() {
        const cid = $('#cid').val(); // 현재 사용자 ID

        // 인재 추천 목록 로드
        function loadRecommendationList() {
            var post_idx = $(this).closest('.linkDiv').data('post-idx');
            var candidateList = $('#candidateList');

            // 다른 linkDiv의 하위 목록은 숨김
            $('.linkDiv').not(this).each(function() {
                $(this).find('.candidateList').hide();
            });

            // 이전에 보여준 인재 목록을 비움
            candidateList.empty();

            // AJAX 요청을 통해 목록을 로드함
            $.ajax({
                url: 'LoadRecommend',
                type: 'GET',
                data: { post_idx: post_idx },
                success: function(candidates) {
                    var html = '';
                    $.each(candidates, function(index, candidate) {
                        var skillsHtml = '';
                        var skillsArray = candidate.skills.split(', ');
                        $.each(skillsArray, function(i, skill) {
                            skillsHtml += '<button type="button" class="btn btn-outline-primary btn-sm m-1">' + skill + '</button>';
                        });
                        html += '<table class="table fixed-width-table text-center mt-3">' +
                            '<thead class="table-secondary text-white">' +
                            '<tr>' +
                            '<th scope="col" class="name-column">이름</th>' +
                            '<th scope="col" class="info-column">이력서 정보</th>' +
                            '<th scope="col" class="skill-column">기술스택</th>' +
                            '<th scope="col" class="action-column">스크랩</th>' +
                            '</tr>' +
                            '</thead>' +
                            '<tbody>' +
                            '<tr>' +
                            '<td class="name-column text-center pt-3 align-middle"><img alt="profile" src="' + candidate.profile + '" style="height: 150px;">' +
                            '<p class="pt-3">' + candidate.pname + '</p></td>' +
                            '<td class="info-column align-middle"><a class="text-decoration-none text-dark" href="/Person/MyResumeDetail?resume_idx=' + candidate.resume_idx + '">' + candidate.title + '</a></td>' +
                            '<td class="skill-column align-middle">' + skillsHtml + '</td>' +
                            '<td class="action-column align-middle"><input class="btn btn-outline-secondary scrap-button" type="button" id="scrap-button-' + candidate.resume_idx + '" data-resume-idx="' + candidate.resume_idx + '" value="스크랩"></td>' +
                            '</tr>' +
                            '</tbody>' +
                            '</table>';
                    });
                    candidateList.html(html);

                    // forEach 루프를 추가합니다.
                    candidates.forEach(function(candidate) {
                        var buttonId = '#scrap-button-' + candidate.resume_idx;
                        var resume_idx = candidate.resume_idx;
                        var button = $(buttonId);
                        $.ajax({
                            url: `/Company/CheckScrap?resume_idx=` + resume_idx + `&cid=${cid}`,
                            type: 'GET',
                            dataType: 'json',
                            success: function(isScraped) {
                                button.data('scraped', isScraped);
                                button.toggleClass('btn-primary', isScraped)
                                    .toggleClass('btn-outline-secondary', !isScraped)
                                    .val(isScraped ? '스크랩 해제' : '스크랩');
                            },
                            error: function(error) {
                                console.error('Error:', error);
                            }
                        });

                        // 스크랩 버튼 클릭 시 동작
                        button.on('click', function() {
                            var isScraped = button.data('scraped');
                            if (isScraped) {
                                // 스크랩 삭제 요청
                                $.ajax({
                                    url: `/Company/ScrapDelete?resume_idx=` + resume_idx + `&cid=${cid}`,
                                    type: 'POST',
                                    success: function(response) {
                                        button.data('scraped', false);
                                        button.removeClass('btn-primary').addClass('btn-outline-secondary').val('스크랩');
                                        alert('스크랩이 해제되었습니다.');
                                    },
                                    error: function(error) {
                                        console.error('Error:', error);
                                        alert('오류가 발생했습니다. 다시 시도해주세요.');
                                    }
                                });
                            } else {
                                // 스크랩 추가 요청
                                $.ajax({
                                    url: '/Company/ScrapAdd',
                                    type: 'POST',
                                    contentType: 'application/json',
                                    data: JSON.stringify({ resume_idx: resume_idx, cid: cid }),
                                    success: function(response) {
                                        button.data('scraped', true);
                                        button.removeClass('btn-outline-secondary').addClass('btn-primary').val('스크랩 해제');
                                        alert('스크랩되었습니다.');
                                    },
                                    error: function(error) {
                                        console.error('Error:', error);
                                        alert('오류가 발생했습니다. 다시 시도해주세요.');
                                    }
                                });
                            }
                        });
                    });
                }
            });
        }

        // linkDiv를 클릭할 때 loadRecommendationList 함수를 호출하여 목록을 표시/숨김함
        $('.linkDiv').click(function() {
            var post_idx = $(this).closest('.linkDiv').data('post-idx');
            var candidateList = $('#candidateList');



            // 클릭한 linkDiv의 post-idx를 가져옴
            var currentPostIdx = $(this).closest('.linkDiv').data('post-idx');

            // 이전에 클릭한 linkDiv와 post-idx가 같은 경우에는 토글만 함
            if (candidateList.data('currentPostIdx') === currentPostIdx) {
            	
                // 현재 클릭한 linkDiv의 하위 목록을 토글
                candidateList.toggle();
            	
            	return;
            }

            // 현재 클릭한 linkDiv의 post-idx를 저장하여 다음에 클릭할 때 비교할 수 있도록 함
            candidateList.data('currentPostIdx', currentPostIdx);

            // 인재 추천 목록 로드 함수 호출
            loadRecommendationList.call(this);
        });
    });
</script>




</head>

<body>
	<%@include file="/WEB-INF/include/header.jsp"%>
	<main class="container-fluid">
		<div class="row">
			<!-- 사이드바 -->
			<nav class="col-2 bg-white sidebar vh-100 border-end">
				<div class="sidebar-sticky pt-3">
					<%@include file="/WEB-INF/include/cmain_nav.jsp"%>
				</div>
			</nav>

			<!-- 메인 섹션 -->
			<section class="col-md-9 ml-sm-auto col-lg-10 px-md-4 row">
				<div class="mt-5 ms-3 mb-5">
					<h2>추천 인재 목록</h2>
					<hr>
					<input type="hidden" value="${cid }" id="cid">
					<!-- 공고별 추천 인재 목록 출력 -->
					<c:forEach var="post" items="${candidatesPerPost}">
						<div
							class="row py-3 d-flex align-items-center linkDiv my-3"
							data-post-idx="${post.key}">
							<div class="col-3">
								<div></div>
								<p class="fs-4">공고명: ${postNames[post.key]}</p>
								<span> 마감일: <fmt:formatDate
										value="${deadlines[post.key]}" pattern="yyyy-MM-dd" />
								</span>
							</div>
							<div class="col-7 d-flex align-items-center fs-4">직무 소개 :
								${job_intros[post.key]}</div>
							<div class="col-1">
								<a class="btn btn-primary"
									href="/Company/MyPostDetail?post_idx=${post.key}">공고 확인</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="mb-3" id="candidateList">

				</div>
			</section>
		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>

<%@include file="/WEB-INF/include/cmain_nav_active.jsp"%>