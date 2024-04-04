<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rolling Stone</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>

  *{text-align:center;
    padding : 0%;
    margin : 1%;}
 span{color:red;}
 
fieldset {

  display: block;
  margin-left: 2px;
  margin-right: 2px;
  padding-top: 0.35em;
  padding-bottom: 0.625em;
  padding-left: 0.75em;
  padding-right: 0.75em;
  border: 1px solname purple; (internal value);
  
  div{ text-align : left;
       wnameth : 100%;
  }

}

</style>
</head>
<body>
  <main>
  <span><a href="/main"><img src="/images/logo.png" style="wnameth:150px"></a></span>
   <h2>기업회원 가입</h2>
   <fieldset>
    <form action="/Company/Join"  name="join" name="join" method="post">
      <div><input type="text" name="type" value="1"></div>
      <div><span>*</span>아이디</div>
      <div><input type="text" name="id" placeholder="아이디"  value="sky" required>
      <div><span>*</span>비밀번호</div>
      <div><input type="password" name="password"  value="123" required></div>
     

      <div><span>*</span>이메일</div>
      <div><input type="text" name="user_email"  value="하늘" required></div>
      <div><span>*</span>사명</div>
      <div><input type="text" name="cname"  value="하늘" required></div>
      <div>업종</div>
      <div><input type="text" name="cate"  value="1"></div>
      <div>기업 로고</div>
      <div><input type="text" name="com_logo" value="123456" style="border:1px solname black"></div>
      <div><span>*</span>사업자번호</div>
      <div><input type="text" name="cnumber" value="1234" required></div>
      <div>회사 대표</div>
      <div><input type="text" name="crepresentive" value="몰라" ></div>
      <div><span>*</span>소재지</div>
      <div><input type="text" name="address" value="부산 어딘가"   required></div>
      <div><span>*</span>담당자님 성함</div>
      <div><input type="text" name="manager_name" value="마동석"  required></div>
      <div>담당자님 연락처</div>
      <div><input type="text" name="company_managerphone" value="010" ></div>
      <div>기업 규모(사원수 기준)</div>
      <div><input type="text" name="csize" value="1000" ></div>
      <div><span>*</span>설립 연도</div>
      <div><input type="date" name="cyear" value="2000" required></div>    
      <div>가입일</div>
      <div><input type="text" name="created_date" value=${ now } readonly></div>
      <span><input type="submit" value="작성완료" >
            <input type="button" onClick="location.href='/main'" value="HOME"></span>
    </fieldset>
    </form>
    <%@include file="/WEB-INF/include/footer.jsp" %>
  </main>


</body>
</html>