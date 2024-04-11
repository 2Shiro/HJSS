<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>HJSS</title>
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
  #btn   {
    input{   
      color:white;
     background-color:#5215a6;
     opacity: 70%;
     border : 2px solid grey;
     border-radius :10px;
     margin-right : 25px;
     margin-left:25px;
     }
  }
  form {
     margin-bottom: 270px;
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
  <span class="input-group-text" id="inputGroup-sizing-sm">아이디</span>
  <input type="text" class="form-control" name="id"
         aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
    <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
  <input type="password" class="form-control" name="password"
         aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
      <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">이름</span>
  <input type="text" class="form-control" aria-label="Sizing example input" 
         name="pname" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">생년월일</span>
  <input type="date" class="form-control"  name="birth"
         aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">전화번호</span>
  <input type="text" class="form-control" aria-label="Sizing example input"
         name="phone" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">주소</span>
  <input type="text" class="form-control" aria-label="Sizing example input" 
         name="address" aria-describedby="inputGroup-sizing-sm">
</div>
     <div class="input-group input-group-sm mb-3">
  <span class="input-group-text" id="inputGroup-sizing-sm">이메일</span>
  <input type="email" class="form-control" aria-label="Sizing example input"
         name="user_email" aria-describedby="inputGroup-sizing-sm">
</div>

  <input type="hidden" name="created_date" value=${ now } readonly>

      <div id="btn"><input type="submit" value="작성완료"> 
           <input type="button" onClick="location.href='/'"value="home"></div></div>
   </form>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   </main>
</body>
</html>