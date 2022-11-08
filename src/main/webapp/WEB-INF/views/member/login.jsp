<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<link rel="stylesheet" type="text/css" href="/css/login2.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

<div class="clear"></div>

<html>
<head>
<title></title>
</head>
<body class="login">
<script src="/js/jquery.js"></script>
<script>
   function login_check() {
      if ($.trim($('#username').val()) == '') {//trim()함수는 양쪽 공백을 제거
         alert('아이디를 입력하세요!');
         $('#username').val('').focus();
         return false;
      }

      if ($.trim($('#password').val()) == '') {
         alert('비밀번호를 입력하세요!');
         $('#password').val('').focus();
         return false;
         
      }
   }
</script>
<c:if test="${empty id}"> <%--id가 비어 있다면~ 로그인 전 화면 --%>
<div class="loginForm">
<form method="post" class="loginFormin" action="/loginOk" onsubmit="return login_check();" enctype="application/x-www-form-urlencoded" >
<input type="text" name="username" id="username" class="textField" placeholder="아이디" autocomplete="on"><br>
<input type="password" name="password" id="password" class="textField" placeholder="비밀번호" autocomplete="on"><br>
<input type=submit class="submitBtn" value=로그인>
<input type=checkbox name="remember-me" id="remember-me" class="checkbox" value=로그인상태유지><span>로그인 상태 유지</span><br>
<br>
<hr></hr>
<br>

</form> 
<button name="googlelogin" id="googlelogin" class="googleloginBtn" onclick="location.href ='/oauth2/authorization/google'"><i class="fab fa-google"></i> 구글로 로그인</a></button>
<button name="naverlogin" id="googlelogin" class="googleloginBtn" onclick="location.href ='/oauth2/authorization/naver'"><img class="nlogin" src="/images/member/btnWNaver.png" alt="naver" style="height: 15px; width: 15px;"> 네이버로 로그인</button>
<div class="links">
<input type="button" class="a" value="회원가입" onclick="location='/join';" />
<input type="button" class="a" value="비밀번호 찾기" onclick="location='/findPwd';" />
</div>
</div>
</c:if>

<c:if test="${!empty id}"> <%--만약 로그인 된 상태로 주소창에 입력해서 로그인창에 접근한다면 보여지는 화면--%>
<div>
${id}님 로그인을 환영합니다.<br>
</div>
<div>
<a href="/logout">[로그아웃]</a>
<a href="/board_list">[게시판]</a><br>
<a href="/mypage">[마이페이지]</a><br>
<a href="/customer_main">[고객센터]</a><br>
</div>
</c:if>

</body>
</html>
