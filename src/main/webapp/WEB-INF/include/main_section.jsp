<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<c:forEach var="mainPageList" items="${mainPageList}">
			<!-- 간격 정하는 방식을 바꾸는게 좋을 것 같음 -->
			<div class="col-3 my-3 cardinterval">
				<div class="card" style="width: 20rem; height: 300px;">
					<img src="${mainPageList.com_logo}" class="card-img-top" alt="이상함" style="height:100px;">
					<div class="card-body">
						<h5 class="card-title">${mainPageList.post_name}</h5>
						<p class="card-text">
							경력: ${mainPageList.career}<br>
							타입: ${mainPageList.job_type}
						</p>
						<a href="/ViewPost?post_idx=${mainPageList.post_idx}&id=${mainPageList.id}" class="btn btn-primary">보기</a>
					</div>
				</div>
			</div>
		</c:forEach>