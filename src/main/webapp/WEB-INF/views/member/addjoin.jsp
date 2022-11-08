<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<div class="clear"></div>
<script src="/js/jquery.js"></script>
<script src="/js/member.js"></script>
<script>

</script>

<%-- 회원가입 페이지 --%>

<body class="join">

<form name="join_ok" method="post" action="addjoin_ok" onsubmit="return joinOauth_check();">
<div class="joinForm">
<span> 추가 정보를 제출하세요! </span><br><br>

<input type="text" name="nickname" id="nickname" class="textField" placeholder="닉네임" value="${m.nickname}">
<input type="tel" name="mphone" class="textField" id="mphone"pattern="^[0][1][0]-\d{4}-\d{4}$" placeholder="휴대폰 번호 (010-****-****)" value="${m.mphone}"><br>
<select id="mAddr" name="maddr" class="textField" selected="${m.maddr}">
			<option value="서울" <c:if test="${select_zone =='Seoul'}">${'selected'}
        			 </c:if>>서울</option>
					<option value="경기" <c:if test="${select_zone =='gg'}">${'selected'}
        			 </c:if>>경기</option>
					<option value="인천" <c:if test="${select_zone =='incheon'}">${'selected'}
        			 </c:if>>인천</option>
					<option value="그외" <c:if test="${select_zone =='etc'}">${'selected'}
        			 </c:if>>그외</option>
</select>
<br><br>
<input type="submit" class="submitBtn" value=제출>
</div>
</form>

</body>

