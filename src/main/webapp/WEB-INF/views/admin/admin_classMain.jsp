<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>골프 클래스 관리자 페이지 메인</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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
			<br/>
				<h1 class="cList_title">클래스 전체 목록</h1>
				<br />
				<div class="cList_count">총 클래스 수: ${listcount} 개</div>
				<br />
				<br />
				<table id="cList_t">
					<tr id="cList_a">
						<th style="width: 20%; color:#56F569; font-size:1em;">클래스 종류</th>
						<th style="width: 14%; color:#56F569; font-size:1em;">강사 고유번호</th>
						<th style="width: 12%; color:#56F569; font-size:1em;">강사명</th>
						<th style="width: 53%; color:#56F569; font-size:1em;">클래스명</th>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<c:if test="${!empty alist}">
						<c:forEach var="a" items="${alist}">
							<tr>
								<td align="center">${a.classtype}</td>
								<td align="center">${a.tno}</td>
								<td align="center">${a.tname}</td>
								<td align="center">${a.atitle}</td>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty alist}">
						<tr>
							<th colspan="5">클래스 목록이 없습니다.</th>
						</tr>
					</c:if>
				</table>
				<br /> <br />
				<%--페이징(쪽나누기)--%>
				<div id="cList_paging">
					<%--검색전 페이징 --%>
					<c:if test="${(empty find_field)&&(empty find_name)}">
						<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
						<c:if test="${page >1}">
							<a href="admin_classMain?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}"><${a}></c:if>

							<c:if test="${a != page}">
								<a href="admin_classMain?page=${a}">[${a}]</a>&nbsp;
    </c:if>
						</c:forEach>

						<c:if test="${page>=maxpage}">[다음]</c:if>
						<c:if test="${page<maxpage}">
							<a href="admin_classMain?page=${page+1}">[다음]</a>
						</c:if>
					</c:if>

					<%--검색후 페이징 --%>
					<c:if test="${(!empty find_field) || (!empty find_name)}">
						<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
						<c:if test="${page >1}">
							<a
								href="admin_classMain?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}"><${a}></c:if>
							<%--현재 쪽번호가 선택된 경우 --%>

							<c:if test="${a != page}">
								<%--현재 쪽번호가 선택 안된 경우 --%>
								<a
									href="admin_classMain?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
						</c:forEach>

						<c:if test="${page>=maxpage}">[다음]</c:if>
						<c:if test="${page<maxpage}">
							<a
								href="admin_classMain?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
						</c:if>
					</c:if>
				</div>
				<br/>
			</div>
		</form>
	</div>
</body>
<div style="margin: 3% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>