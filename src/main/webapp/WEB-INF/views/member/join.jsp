<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<div class="clear"></div>
<script src="/js/jquery.js"></script>
<script src="/js/member.js"></script>
<script>

</script>

<%-- 회원가입 페이지 --%>

<body class="join">

<form name="join_ok" method="post" action="join_ok" onsubmit="return join_check();">
<div class="joinForm">
<input type="text" name="username" id="username" class="textField" placeholder="아이디">
<input type=button class="CheckBtn" id="idck" onclick="idcheck();" value=중복확인 /><br/><%--<span id="idcheck"></span>--%>
<input type="text" name="nickname" id="nickname" class="textField" placeholder="닉네임">
<input type="password" name="password" id="password" class="textField" placeholder="비밀번호"><br>
<input type="password" name="pwCheck" id="pwCheck" class="textField" placeholder="비밀번호 확인"><br>
<input type="tel" name="mphone" class="textField" id="mphone"pattern="^[0][1][0]-\d{4}-\d{4}$" placeholder="휴대폰 번호 (010-****-****)"><br>
<input type="email" name="memail" id="memail" class="textField" placeholder="이메일"><br>
<input type="radio" name="mgender" id="male_gender" class="gender" value="male"><label id="male_gender">남</label>
<input type="radio" name="mgender" id="female_gender" class="gender" value="female"><label id="female_gender">여</label>
<br><br>
<input type="submit" class="submitBtn" value=회원가입>
</div>
</form>

</body>

