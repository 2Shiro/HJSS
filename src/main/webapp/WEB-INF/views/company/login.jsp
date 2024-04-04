<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
 <h2>로그인</h2>
 <main>
   <form action="/login" method="post" id="clogin">
     <div>아이디</div>
     <div><input type="text" id="id" name="id"></div>
     <div>비밀번호</div>
     <div><input type="password" id="password" name="password"></div>
     <div><input type="submit" value="로그인">
          <input type="button" value="회원가입" onClick="location.href='/Company/JoinForm'"></div>
   </form>
 </main>
 <%@include file="/WEB-INF/include/footer.jsp" %>

</body>
</html>