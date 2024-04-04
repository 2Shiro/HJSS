<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
   .main {
      text-align: center;
   }
   span{color:red;}
   
</style>
<meta charset="UTF-8">
<title>Rolling Stone</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<main>
   <div class= "main">
            <a href="/">
                 <img alt="Logo" src="/images/logo.png" style="width:150px;">
             </a>
   <h2>개인회원 가입</h2>
   <form action=""  method="post"  >                                                                                                                                                                                                                                                                                                               in">
      <div><input type="hidden" id="type_number" value=2></div>
      <div><span>*</span>이름</div>
      <div><input type="text" id="name"required></div>
      <div>생년월일</div>
      <div><input type="date" id="birth"required></div>
      <div>전화번호</div>
      <div><input type="text" id="phone"required></div>
      <div>주소</div>
      <div><input type="text" id="address"required></div>
      <div><span>*</span>아이디</div>
      <div><input type="text" id="id"required></div>
      <div><span>*</span>비밀번호</div>
      <div><input type="password" id="password" required></div>
      <div><span>*</span>비밀번호 확인</div>
      <div><input type="password" id="password" required></div>
      <div><span>*</span>이메일</div>
      <div><input type="text" id="email"required></div>
      <div><input="submit" value="작성완료">
           <input type="button" onClick="location.href='/'" value="HOME"></div>
      
   </form>
   <%@include file="/WEB-INF/include/footer.jsp" %>
   </div>
   </main>
</body>
</html>
