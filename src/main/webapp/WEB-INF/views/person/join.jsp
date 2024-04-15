<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>HJSS</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
   .main {
       text-align:center;
       padding : 0;
       margin : 0 auto;
       }

 .input-group-sm {
      width: 400px;
      margin: 0 auto;
 }
  form {
     margin-bottom: 270px;
  }
   .star{
     color:red;
     }
 </style>
</head>
<body>
<main>
   <div class="main">
         <div>
            <a href="/">
                 <img alt="Logo" src="/images/logo.png" style="width:150px;">
             </a> </div>
   <h2>개인회원 가입</h2>
   <form action="/Person/Join" method="post">
    <div class="input-group-sm mb-3">
      <div class="input-group input-group-sm mb-3">
 		<span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>아이디</span>
  		<input type="text" class="form-control" name="id" id="id" required
      	   aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  </div>
      	<label id="idck"></label>
	  <div class="input-group input-group-sm mb-3">
 	   <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>비밀번호</span>
 	   <input type="password" class="form-control" name="password" id="pw1" required
           aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  </div>

	  <div class="input-group input-group-sm mb-3">
 	   <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>비밀번호확인</span>
 	   <input type="password" class="form-control" name="passwordck" id="pw2" required
              aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	  </div>	
	  <label id="pwck"></label>
	
      <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>이름</span>
  <input type="text" class="form-control" aria-label="Sizing example input" required
         name="pname" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>생년월일</span>
  <input type="date" class="form-control"  name="birth" required
         aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>전화번호</span>
  <input type="text" class="form-control" aria-label="Sizing example input" required
         name="phone" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>주소</span>
  <input type="text" class="form-control" aria-label="Sizing example input" required 
         name="address" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm"><span class="star">*</span>이메일</span>
  <input type="text" class="form-control" aria-label="Sizing example input"
         name="email" aria-describedby="inputGroup-sizing-sm">
</div>

  <input type="hidden" name="created_date" value=${ now } readonly>


      <button type="submit" class="btn btn-primary" style="background-color:#5215a6; color : white; border:white;">작성완료</button>
      <button type="button" class="btn btn-outline-secondary" onClick="location.href='/Person/LoginForm'">개인로그인</button>
      <button type="button" class="btn btn-outline-secondary" onClick="location.href='/'">HOME</button>
      </div>
   </form>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   </main>
   
<script type="text/javascript">

$('#id').keyup(function(){
	let id = $('#id').val();
	
	
	$.ajax({
		url : "/CheckId",
		type : "post",
		data : {id:id},
		dataType : 'json',
		error : function(){
			$("#idck").html('오류').css('color','red');
		},
		success : function(result){
			if(result == 1){
				$("#idck").html('이미 사용중인 아이디입니다.').css('color','red');
			}
			else{
				$("#idck").html('사용가능한 아이디입니다.').css('color','blue');
				
			}
		}
	})
})


	$('#pw2').on('keyup',function pwCheck(){
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		
		if(pw1==pw2){
			$('#pwck').html('비밀번호 일치').css('color','blue')
		}else{
			$('#pwck').html('비밀번호 불일치').css('color','red')
		}
	})
</script>

</body>
</html>