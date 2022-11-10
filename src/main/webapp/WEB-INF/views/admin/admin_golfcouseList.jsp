<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<style>
#wrap {
	margin-top: 200px;
	margin-left: 200px;
}
</style>

<meta charset="UTF-8">
<title>골프장 전체 목록</title>
<link rel="stylesheet" href="/css/golfcouse_admin.css">
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
<br />
<br />
</head>
<body>
	<form method="get" action="admin_golfcouseList">
		<div id="wrap">
			<h1 class="gcList_title">골프장 전체 목록</h1>
			<br />
			<div class="gcList_count">총 골프장 개수: ${listcount} 개</div>
			<div id="gcList_menu">
				<div id="btn01">
					<input class="btn" type="button" value="골프장 등록"
						onclick="location='/admin/admin_insertGolfcouse';" />
				</div>

			</div>

			<br /> <br />
			<table id="gcList_t">
				<tr id="gcList_a">
					<th >번호</th>
				
					<th >골프장명</th>
					<th>지역명</th>
					<th>개장년도</th>
					<th>수정/삭제</th>
					<th>상세페이지</th>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<c:if test="${!empty gclist}">
					<c:forEach var="gc" items="${gclist}">
						<tr>
							<td align="center">${gc.gc_no}</td>
							
							<td align="center">${gc.gc_title}</td>
							<td align="center" >${gc.gc_area}</td>
							<td align="center">${gc.gc_date}</td>
							
							<td align="center"><input type="button" class="modifybtn"
								value="수정" onclick="location='/admin/admin_editGolfcouse?gc_no=${gc.gc_no}';"/> <input
								type="button" class="modifybtn" value="삭제"
								onclick="if(confirm('정말로 삭제할까요?') == true)
							{location='/admin/admin_golfcouse_del?gc_no=${gc.gc_no}&page=${page}';}else{ return ;}" /></td>
							<td align="center"><input type="button" class="modifybtn"
								value="상세페이지이동" onclick="location='/admin/admin_golfcouseDetail?gc_no=${gc.gc_no}';"/>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty gclist}">
					<tr>
						<th colspan="5">골프장 목록이 없습니다.</th>
					</tr>
				</c:if>
			</table>
			<br /> <br />
			<%--페이징(쪽나누기)--%>
			<div id="gcList_paging">
				<%--검색전 페이징 --%>
				<c:if test="${(empty find_field)&&(empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a href="admin_golfcouseList?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="admin_golfcouseList?page=${a}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="admin_golfcouseList?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%--검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a
							href="admin_golfcouseList?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						<%--현재 쪽번호가 선택된 경우 --%>

						<c:if test="${a != page}">
							<%--현재 쪽번호가 선택 안된 경우 --%>
							<a
								href="admin_golfcouseList?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="admin_golfcouseList?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>

			</div>
			<div id="gcFind_wrap">
				<select name="find_field" class="golfcouse-title">
					<option value="gc_title"
						<c:if test="${find_field=='gc_title'}">
   ${'selected'}</c:if>>골프장명</option>
					<option value="gc_area"
						<c:if test="${find_field=='gc_area'}">
   ${'selected'}</c:if>>지역</option>
				</select> <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" value="검색"
					class="searchbtn" /> <input class="searchbtn" type="button"
					value="전체목록" onclick="location='admin_golfcouseList?page=${page}';" />

			</div>

		</div>
	</form>
</body>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>
				