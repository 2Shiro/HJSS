<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rolling Stone</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
   .main {
       text-align:center;
       padding : 0;
       margin : 0 auto;      
    }
 span{color:red;}

 .input-group-sm {
      width: 400px;
      margin: 0 auto;
 }
 
  form{ 
        margin : 50px; 
        }
  .star{
       color : red;
  } 
  


</style>

</head>
<body>
  <main>
  <div class="main">
     <div>
        <a href="/main">
           <img src="/images/logo.png" style="width:150px">
        </a>
     </div>
     
  <h2>기업회원 가입</h2>
   
    <form action="/Company/Join" id="join" name="join" method="post" >
      
      <div><input type="hidden" name="type" value="1"></div>
      
     <div class="input-group-sm mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>아이디</span>
        <input type="text" class="form-control" id="id" name="id" required aria-label="Sizing example input" 
               aria-describedby="inputGroup-sizing-default" required >
        <label id="idck"></label>
      </div>
    
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>비밀번호</span>
           <input type="password" oninput="pwCheck()" id="pw1" class="form-control" name="password" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
      </div>
           <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>비밀번호 확인</span>
           <input type="password" oninput="pwCheck()"  id="pw2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
           <label id="pwck"></label>
      </div>
    
      
     <div class="input-group-sm mb-3">

           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>이메일</span>
           <input type="text" class="form-control" name="user_email" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >

      </div>
      
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>사명</span>
              <input type="text" class="form-control" name="cname" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
         </div>
    
      <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>사업자번호</span>
           <input type="text" class="form-control" name="cnumber" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
         </div>
    
      <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>회사 대표</span>
              <input type="text" class="form-control" name="crepresentive" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
         </div>
     
     <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>소재지</span>
              <input type="text" class="form-control" name="address" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
         </div>
    
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>담당자님 성함</span>
             <input type="text" class="form-control" name="manager_name" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
      </div>
    
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>담당자님 연락처</span>
              <input type="text" class="form-control" name="company_managerphone" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
      </div>
   
     <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>기업 규모(사원수 기준)</span>
              <input type="text" class="form-control" name="csize" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
      </div>
   
      <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>설립 연도</span>
           <input type="date" class="form-control" name="cyear" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
      </div>   
           <input type="hidden" class="form-control"  name="created_date"
             value=${ now } readonly aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required >
      
      <button type="submit" class="btn btn-primary" style="background-color:#5215a6; color : white; border:white;">작성완료</button>
      <button type="button" class="btn btn-outline-secondary" onClick="location.href='/Company/LoginForm'">기업로그인</button>
      <button type="button" class="btn btn-outline-secondary" onClick="location.href='/'">HOME</button>
       
    </form>

    <%@include file="/WEB-INF/include/footer.jsp" %>
  </div>
  </main>
<script>

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
				}else if(result == 0){
					$("#idck").html('사용가능한 아이디입니다.').css('color','blue');					
				}else if(result == null){
					$("#idck").html('아이디를 입력해주세요').css('color','red');
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

