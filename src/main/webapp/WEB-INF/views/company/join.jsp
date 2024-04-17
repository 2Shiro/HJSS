<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rolling Stone</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
.main {
	text-align: center;
	padding: 0;
	margin: 0 auto;
}

span {
	color: red;
}

.sticky-footer {
	bottom: 0;
	width: 100%;
}

.input-group-sm {
	width: 400px;
	margin: 0 auto;
}

form {
	margin: 50px;
}

.star {
	color: red;
}
</style>

</head>
<body>
	<main class="container-fluid">
		<div class="main">
			<div>
				<a href="/main"> <img src="/images/logo.png"
					style="width: 150px">
				</a>
			</div>

			<h2>기업회원 가입</h2>

			<form action="/Company/Join" id="join" name="join" method="post">

				<div>
					<input type="hidden" name="type" value="1">
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>아이디</span> <input type="text" class="form-control"
						id="id" name="id" required aria-label="Sizing example input"
						autocomplete='off' aria-describedby="inputGroup-sizing-default"
						required> <label id="idck"></label>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>비밀번호</span> <input type="password"
						oninput="pwCheck()" id="pw1" class="form-control" name="password"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" required>
				</div>
				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>비밀번호 확인</span> <input type="password"
						oninput="pwCheck()" id="pw2" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" required> <label
						id="pwck"></label>
				</div>


				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>이메일</span> <input type="text" class="form-control"
						name="user_email" aria-label="Sizing example input"
						autocomplete='off' aria-describedby="inputGroup-sizing-default"
						required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>사명</span> <input type="text" class="form-control"
						name="cname" aria-label="Sizing example input" autocomplete='off'
						aria-describedby="inputGroup-sizing-default" required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>사업자번호</span> <input type="number"
						class="form-control" name="cnumber"
						aria-label="Sizing example input" autocomplete='off'
						aria-describedby="inputGroup-sizing-default" required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>회사 대표</span> <input type="text" class="form-control"
						name="crepresentive" aria-label="Sizing example input"
						autocomplete='off' aria-describedby="inputGroup-sizing-default"
						required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>소재지</span> <input type="text" class="form-control"
						name="address" aria-label="Sizing example input"
						autocomplete='off' aria-describedby="inputGroup-sizing-default"
						required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>담당자님 성함</span> <input type="text"
						class="form-control" name="manager_name"
						aria-label="Sizing example input" autocomplete='off'
						aria-describedby="inputGroup-sizing-default" required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>담당자님 연락처</span> <input type="text"
						class="form-control" name="company_managerphone"
						aria-label="Sizing example input" autocomplete='off'
						aria-describedby="inputGroup-sizing-default" required>
				</div>

				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>기업 규모(사원수 기준)</span> <input type="number"
						class="form-control" name="csize"
						aria-label="Sizing example input" autocomplete='off'
						aria-describedby="inputGroup-sizing-default" required>
				</div>
				<div class="input-group-sm mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default"><span
						class="star">*</span>설립 연도</span> <input type="date" class="form-control"
						name="cyear" aria-label="Sizing example input" autocomplete='off'
						aria-describedby="inputGroup-sizing-default" required>
				</div>
				<input type="hidden" class="form-control" name="created_date"
					value=${ now } readonly aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" required>

				<button type="submit" class="btn btn-primary"
					style="background-color: #5215a6; color: white; border: white;">작성완료</button>
				<button type="button" class="btn btn-outline-secondary"
					onClick="location.href='/Company/LoginForm'">기업로그인</button>
				<button type="button" class="btn btn-outline-secondary"
					onClick="location.href='/'">HOME</button>

			</form>

		</div>
	</main>
	<%@include file="/WEB-INF/include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var isIdDuplicated = false; // 아이디 중복 상태를 추적하는 변수

					$('form[name="join"]').submit(function(e) {
						e.preventDefault(); // 폼의 기본 제출 동작을 방지

						if (isIdDuplicated) {
							alert("중복된 아이디입니다. 다른 아이디를 사용해주세요.");
							return; // 중복된 아이디인 경우 여기서 함수 종료
						}

						// 필수 입력 필드 검사
						var formData = $(this).serializeArray();
						var isFormValid = true;

						formData.forEach(function(input) {
							if (!input.value) {
								isFormValid = false; // 빈 필드 발견
							}
						});

						if (!isFormValid) {
							alert("회원가입에 실패했습니다. 다시 시도해주세요.");
							return; // 여기서 함수 종료
						}

						// AJAX 요청
						$.ajax({
							type : "POST",
							url : "/Company/Join",
							data : $.param(formData),
							success : function(response) {
								alert('회원가입이 완료되었습니다.');
								window.location.href = '/'; // 메인 페이지로 리디렉션
							},
							error : function(xhr, status, error) {
								alert('회원가입에 실패했습니다. 다시 시도해주세요.');
							}
						});
					});

					$('#id').keyup(
							function() {
								let id = $('#id').val();

								$.ajax({
									url : "/CheckId",
									type : "post",
									data : {
										id : id
									},
									dataType : 'json',
									error : function() {
										$("#idck").html('오류').css('color',
												'red');
									},
									success : function(result) {
										if (result == 1) {
											$("#idck").html('이미 사용중인 아이디입니다.')
													.css('color', 'red');
											isIdDuplicated = true; // 아이디가 중복된 상태로 설정
										} else {
											$("#idck").html('사용가능한 아이디입니다.')
													.css('color', 'blue');
											isIdDuplicated = false; // 아이디가 중복되지 않은 상태로 설정
										}
									}
								})
							})

					$('#pw2').on('keyup', function pwCheck() {
						var pw1 = $('#pw1').val();
						var pw2 = $('#pw2').val();

						if (pw1 == pw2) {
							$('#pwck').html('비밀번호 일치').css('color', 'blue')
						} else {
							$('#pwck').html('비밀번호 불일치').css('color', 'red')
						}
					})
				});
	</script>


</body>


</html>

