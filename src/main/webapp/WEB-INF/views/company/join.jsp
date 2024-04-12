<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rolling Stone</title>
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
        <input type="text" class="form-control" name="id" required aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" >
        <button type="button" id="btnIdCheck" class="btn btn-outline-secondary" value="중복확인">중복확인</button>
      </div>
      <div id="idck"></div>
    
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>비밀번호</span>
           <input type="password" class="form-control" name="password" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
      </div>
    
      
     <div class="input-group-sm mb-3">

           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>이메일</span>
           <input type="text" class="form-control" name="user_email" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">

      </div>
      
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>사명</span>
              <input type="text" class="form-control" name="cname" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
    
      <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>사업자번호</span>
           <input type="text" class="form-control" name="cnumber" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
    
      <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>회사 대표</span>
              <input type="text" class="form-control" name="crepresentive" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
     
     <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>소재지</span>
              <input type="text" class="form-control" name="address" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
    
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>담당자님 성함</span>
             <input type="text" class="form-control" name="manager_name" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
      </div>
    
     <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>담당자님 연락처</span>
              <input type="text" class="form-control" name="company_managerphone" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
      </div>
   
     <div class="input-group-sm mb-3">
              <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>기업 규모(사원수 기준)</span>
              <input type="text" class="form-control" name="csize" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
      </div>
   
      <div class="input-group-sm mb-3">
           <span class="input-group-text" id="inputGroup-sizing-default"><span class="star">*</span>설립 연도</span>
           <input type="date" class="form-control" name="cyear" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
      </div>   
           <input type="hidden" class="form-control"  name="created_date"
             value=${ now } readonly aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
      
      <button type="submit" class="btn btn-primary" style="background-color:#5215a6; color : white; border:white;" onClick="alert('가입완료')">작성완료</button>
      <button type="button" class="btn btn-outline-secondary" onClick="location.href='/Company/LoginForm'">기업로그인</button>
      <button type="button" class="btn btn-outline-secondary" onClick="location.href='/'">HOME</button>
       
    </form>

    <%@include file="/WEB-INF/include/footer.jsp" %>
  </div>
  </main>




</body>


</html>

