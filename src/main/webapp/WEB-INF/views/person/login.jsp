<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.sticky-footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}
*{ text-align: center;
   margin: 0 auto;}

  input{ margin-top : 8%;
         text-align : center;
         border : 2px solid grey;
         border-radius :10px;
         }
  table
  
  a {text-decoration-line:none;
     color : grey;}
  
#logch{ td:first-child{border-bottom:7px solid #5215a6; }
         td:nth-child(2){border-bottom:7px solid lightgrey;}
         td{width:150px;} 
}  
#btn{ 
	input{
		width:120px;
        color:white;
        background-color:#5215a6;
        }
}
  .log {
  	margin: 0 auto;
  }
  
table tr{ td { text-align:center;} }
          }  
          
footer{ 
	position:absolute;
	bottom:0px;
}

</style>
</head>
<body>
<div class="main">
         <div>
            <a href="/">
                 <img alt="Logo" src="/images/logo.png" style="width:150px;">
             </a><br><br><br>
<main>

</hr>
<table id="logch">
  <tr>
    <td ><a href="/Person/loginForm" id="perlog">개인회원</a></td>
    <td ><a href="/Company/loginForm" id="comlog">기업회원</a></td>
  </tr>
</table>
   <form  action="/Person/login" method="post" id="login">
   <div class="log">
     <table>
       <tr>
         <td colspan="2"><input type="text" id="id" name="id" 
                    style="width: 250px;" placeholder="아이디"></td>
       <tr>
         <td colspan="2"><input type="password" id="password" name="password" 
                    style="width: 250px;" placeholder="비밀번호"></td>
       </tr>
       <tr id="btn">
         <td><br><button type="submit" class="btn btn-primary" style="background-color:#5215a6; color : white; border:white; width : 120px;">작성완료</button>
         <td><br><button type="button" class="btn btn-primary"  onClick="location.href='/Person/joinForm'" style="background-color:#5215a6; color : white; border:white; width: 120px;">
              회원가입</button></td>
        </tr>     
     </table> 
     </div>  
   </form>
 </main>

 <%@include file="/WEB-INF/include/footer.jsp" %>

</body>
</html>