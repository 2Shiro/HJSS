<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>HJSS</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
.main {
	text-align: center;
	padding: 0;
	margin: 0 auto;
}

.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}
.input-group-sm {
	width: 400px;
	margin: 0 auto;
}

form {
	margin-bottom: 270px;
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
				<a href="/"> <img alt="Logo" src="/images/logo.png"
					style="width: 150px;">
				</a>
			</div>
			<h2>개인회원 가입</h2>
			<form action="/Person/Join" method="post" name="join">
				<div class="input-group-sm mb-3">
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>아이디</span> <input type="text" class="form-control"
							name="id" id="id" required autocomplete='off'
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm">
					</div>
					<label id="idck"></label>
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>비밀번호</span> <input type="password"
							class="form-control" name="password" id="pw1" required
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm">
					</div>

					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>비밀번호확인</span> <input type="password"
							class="form-control" name="passwordck" id="pw2" required
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm">
					</div>
					<label id="pwck"></label>

					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>이름</span> <input type="text" class="form-control"
							aria-label="Sizing example input" required autocomplete='off'
							name="pname" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>생년월일</span> <input type="date" class="form-control"
							name="birth" required autocomplete='off'
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>전화번호</span> <input type="text" class="form-control"
							aria-label="Sizing example input" required autocomplete='off'
							name="phone" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>주소</span> <input type="text" class="form-control"
							aria-label="Sizing example input" required autocomplete='off'
							name="address" aria-describedby="inputGroup-sizing-sm">
					</div>
					<div class="input-group input-group-sm mb-3">
						<span class="input-group-text" id="inputGroup-sizing-sm"><span
							class="star">*</span>이메일</span> <input type="text" class="form-control"
							aria-label="Sizing example input" autocomplete='off'
							name="user_email" aria-describedby="inputGroup-sizing-sm">
					</div>

					<input type="hidden" name="created_date" value=${ now } readonly>
					<button type="submit" class="btn btn-primary"
						style="background-color: #5215a6; color: white; border: white;">작성완료</button>
					<button type="button" class="btn btn-outline-secondary"
						onClick="location.href='/Person/LoginForm'">개인로그인</button>
					<button type="button" class="btn btn-outline-secondary"
						onClick="location.href='/'">HOME</button>
				</div>
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
							url : "/Person/Join",
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