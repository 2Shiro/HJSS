<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<section class="col-sm-5 col-9 px-md-4 row">
		<c:forEach var="mainPageList" items="${mainPageList}">
			<div class="col-3 my-3">
				<div class="card" style="width: 18rem;">
					<img src="/images/${mainPageList.com_logo}.png" class="card-img-top" alt="이상함">
					<div class="card-body">
						<h5 class="card-title">${mainPageList.post_name}</h5>
						<p class="card-text">
							경력: ${mainPageList.career}<br>
							타입: ${mainPageList.job_type}
						</p>
						<a href="#" class="btn btn-primary">보기</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</section>