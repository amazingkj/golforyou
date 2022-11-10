<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/login2.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />  
<meta charset="UTF-8">
<title>GolForYou</title>
</head>
<script src="/js/jquery.js"></script>
<script src="/js/member.js"></script>
<body class="adminmember">
<br><br><br><br><br><br><br><br>
<div class="downheader">
<div class="loginForm" >
<form name="adminRole" method="post" action="/admin/member_ok" onsubmit="return checkinput();">

관리자 권한을 부여해 줄<br> 일반 회원 아이디를 입력하세요<br><br>
<input type="text" id="adminRole" name="adminRole"class="textField" >
<input type="submit" class="submitBtn" value=권한설정>

</form>
</div>
</div>
<br><br><br><br><br><br>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />  
</body>
</html>