<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/css/class_admin.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>
	<div id="wrap">
		<form method="get" action="/admin/admin_classTeacher">
			<div>
				<h1 id="name-tag">강사 관리</h1>
			</div>
			<hr class="hr-line">
			<div class="category">
				<ul class="province_1">
					<li><a href="admin_classTeacher">강사 관리</a></li>
					<li><a href="admin_classField">필드 클래스 관리</a></li>
					<li><a href="admin_classOnline">온라인 클래스 관리</a></li>
				</ul>
			</div>
			<br/>
			<div class="subject">
				<h1 class="cList_title">강사 전체 목록</h1>
				<br />
				<div class="cList_count">총 강사 수: ${listcount} 명</div>

				<div id="cList_menu">
					<div id="btn01">
						<input class="btn" type="button" value="강사 등록"
							onclick="location='admin_insertTeacher';" />
					</div>
				</div>
				<br /> <br />
				<table id="cList_t">
					<tr id="cList_a">
						<th>강사 고유번호</th>
						<th>강사명</th>
						<th>강사 성별</th>
						<th>강사 등록 날짜</th>
						<th>수정/삭제</th>
					</tr>
					<tr>
						<td><br /></td>
					</tr>
					<c:if test="${!empty tlist}">
						<c:forEach var="t" items="${tlist}">
							<tr>
								<td align="center">${t.tno}</td>
								<td align="center">${t.tname}</td>
								<td align="center">${t.tgender}</td>
								<td align="center">${t.tdate}</td>
								<td align="center"><input type="button" class="modifybtn"
									value="수정" onclick="location='admin_editTeacher?tno=${t.tno}';" />
									<input type="button" class="modifybtn" value="삭제"
									onclick="if(confirm('정말로 삭제할까요?') == true)
                     {location='admin_teacher_del?tno=${t.tno}&page=${page}';}else{ return ;}" /></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty tlist}">
						<tr>
							<th colspan="5">강사 목록이 없습니다.</th>
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
							<a href="admin_classTeacher?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}"><${a}></c:if>

							<c:if test="${a != page}">
								<a href="admin_classTeacher?page=${a}">[${a}]</a>&nbsp;
    </c:if>
						</c:forEach>

						<c:if test="${page>=maxpage}">[다음]</c:if>
						<c:if test="${page<maxpage}">
							<a href="admin_classTeacher?page=${page+1}">[다음]</a>
						</c:if>
					</c:if>

					<%--검색후 페이징 --%>
					<c:if test="${(!empty find_field) || (!empty find_name)}">
						<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
						<c:if test="${page >1}">
							<a
								href="admin_classTeacher?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}"><${a}></c:if>
							<%--현재 쪽번호가 선택된 경우 --%>

							<c:if test="${a != page}">
								<%--현재 쪽번호가 선택 안된 경우 --%>
								<a
									href="admin_classTeacher?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
						</c:forEach>

						<c:if test="${page>=maxpage}">[다음]</c:if>
						<c:if test="${page<maxpage}">
							<a
								href="admin_classTeacher?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
						</c:if>
					</c:if>
				</div>
				<br/>
				<div id="cFind_wrap">
					<select name="find_field" class="class-title">
						<option value="tname"
							<c:if test="${find_field=='tname'}">${'selected'}</c:if>>강사명</option>
						<option value="tgender"
							<c:if test="${find_field=='tgender'}"> ${'selected'}</c:if>>강사 성별</option>
					</select> <input name="find_name" id="find_name" size="14"
						value="${find_name}" /> <input type="submit" value="검색"
						class="searchbtn" /> <input class="searchbtn" type="button"
						value="전체목록" onclick="location='/admin/admin_classTeacher?page=${page}';" />

				</div>
			</div>
		</form>
	</div>
</body>
<div style="margin: 8% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>