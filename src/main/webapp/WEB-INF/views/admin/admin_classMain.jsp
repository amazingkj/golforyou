<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>골프 클래스 관리자 페이지 메인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/css/class_admin.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>
	<div id="wrap">
		<form method="get" action="/admin_classMain">
			<div>
				<h1 id="name-tag">골프 클래스 관리</h1>
			</div>
			<hr class="hr-line">
			<div class="category">
				<ul class="province_1">
					<li><a href="admin_classTeacher">강사 관리</a></li>
					<li><a href="admin_classField">필드 클래스 관리</a></li>
					<li><a href="admin_classOnline">온라인 클래스 관리</a></li>
				</ul>
			</div>
			<div class="subject">
				<div class="subject-01">
					

				
					
				</div>

			</div>
			

		</form>
	</div>
</body>
<div style="margin: 8% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>