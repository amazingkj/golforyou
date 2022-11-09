<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet" href="/css/class_admin.css">
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>
	<form method="get" action="admin_classList">
		<div id="wrap">
			<h1 class="cList_title">클래스 전체 목록</h1>
			<br />
			<div class="cList_count">총 클래스 개수: ${listcount} 개</div>
			<div id="cList_menu">
				<div id="btn01">
					<input class="btn" type="button" value="강사 등록"
						onclick="location='admin_insertTeacher';" />
				</div>
				<div id="btn02">
					<input class="btn" type="button" value="필드 클래스 등록"
						onclick="location='admin_insertField';" />
				</div>
				<div id="btn03">
					<input class="btn" type="button" value="온라인 클래스 등록"
						onclick="location='admin_insertOnline';" />
				</div>

				<%-- <c:if test="${(!empty find_field) && (!empty find_name)}">
					<input type="button" value="전체목록"
						onclick="location='admin_classList?page=${page}';" />
				</c:if> --%>
			</div>

			<br /> <br />
			<table id="cList_t">
				<tr id="cList_a">
					<th>고유번호</th>
					<th>클래스 종류</th>
					<th>클래스명</th>
					<th>강사명</th>
					<th>개설일</th>
					<th>수정/삭제</th>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<c:if test="${!empty clist}">
					<c:forEach var="c" items="${clist}">
						<tr>
							<td align="center">${c.cno}</td>
							<td align="center">${c.ckind}</td>
							<td align="center">${c.ctitle}</td>
							<td align="center">${c.cteacher}</td>
							<td align="center">${fn:substring(c.cdate,0,10)}</td>
							<td align="center">
							<input type="button" class="modifybtn" value="수정"
								onclick="onEdit('${c.ckind}', '${c.cno}')" />
								<input type="button" class="modifybtn" value="삭제"
								onclick="if(confirm('정말로 삭제할까요?') == true)
							{location='admin_class_del?cno=${c.cno}&page=${page}';}else{ return ;}" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty clist}">
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
						<a href="admin_classList?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="admin_classList?page=${a}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="admin_classList?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%--검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a
							href="admin_classList?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						<%--현재 쪽번호가 선택된 경우 --%>

						<c:if test="${a != page}">
							<%--현재 쪽번호가 선택 안된 경우 --%>
							<a
								href="admin_classList?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="admin_classList?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>

			</div>
			<div id="cFind_wrap">
				<select name="find_field" class="class-title">
					<option value="ctitle"
						<c:if test="${find_field=='ctitle'}">
   ${'selected'}</c:if>>클래스명</option>
					<option value="cteacher"
						<c:if test="${find_field=='cteacher'}">
   ${'selected'}</c:if>>강사명</option>
				</select> <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" value="검색"
					class="searchbtn" /> <input class="searchbtn" type="button"
					value="전체목록" onclick="location='admin_classList?page=${page}';" />

			</div>

		</div>
	</form>
</body>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/> 
</html>

<script>

function onEdit(type, cno) {
	//alert('test'+type+cno);
	if(type === '필드') location.href='admin_editField?cno='+cno;
	else if(type === '온라인') location.href='admin_editOnline?cno='+cno;
}
</script>