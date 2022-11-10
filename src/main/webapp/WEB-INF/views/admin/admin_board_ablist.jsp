<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<link rel="stylesheet" type="text/css" href="/css/abboard_list1.css" />
<link rel="stylesheet" type="text/css" href="/css/abcustomer.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />



</head>


<body >

<div style="margin: 30px;">

	<!-- // left navigation -->
	<Br>
	<br>
	<h3 id="name-tag">공지사항</h3>


	<!-- <form method="get" action="admin_board_list"> -->





	<div class="bList_count">게시물 수: &nbsp;&nbsp;&nbsp;${listcount}</div>
	<table class="boardlist">
		<thead>
			<tr>
				<th scope="col" class="boardNo"><a href="#">번호</a></th>
				<th scope="col" class="boardSubject"><a href="#">제목</a></th>
				<th scope="col" class="boardWriter"><span>글쓴이</span></th>
				<th scope="col" class="boardDate"><a href="#">날짜</a></th>
				<th scope="col" class="boardView"><a href="#">조회수</a></th>
				<th scope="col" class="boardedit"><a href="#">수정/삭제</a></th>
			</tr>
		</thead>
		<tbody>

			<c:if test="${!empty ablist}">
				<%-- 검색전후 목록이 있는 경우 실행 --%>
				<c:forEach var="b" items="${ablist}">


					<tr>

						<td class="boardNo"><c:if test="${b.abboard_step == 0}">
								<%--원본글일 때만 글그룹번호를 출력 --%>
   		      ${b.abboard_ref}
       		</c:if>&nbsp;</td>

						<td class=boardSubject><c:if test="${b.abboard_step != 0}">
								<%--답변글일때만 실행, 들여쓰기와 답변글 이미지 노출 --%>
								<c:forEach begin="1" end="${b.abboard_step}" step="1">
        		  &nbsp; <%--답변글만큼 들여쓰기 --%>
								</c:forEach>

								<%--답글 아이콘 --%>
							</c:if> <a
							href="abboard_cont?no=${b.abboard_no}&page=${page}&state=cont">${b.abboard_title}</a>

						</td>

						<td class="boardWriter">${b.abboard_name}</td>
						<td class="boardDate">${b.abboard_date}</td>
						<td class="boardView">${b.abboard_hit}</td>
						<td class="boardedit"align="center"><input type="button" value="수정"
								onclick="location=
'abboard_cont?no=${b.abboard_no}&page=${page}&state=edit';" />
								<input type="button" value="삭제"
								onclick="if(confirm('정말로 삭제할까요?') == true){
location=
'admin_board_del?no=${b.abboard_no}&page=${page}';	
}else{ return ;}" />

					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty ablist}">
				<tr>
					<th colspan="6">게시물 목록이 없습니다.</th>
				</tr>
			</c:if>

		</tbody>
	</table>

	<!-- 게시판 하단 목록 검색 쓰기 버튼-->

	<%--검색 폼추가 --%>
	<div id="bFind_wrap">
		<select name="find_field" style="height: 40px;">
			<option value="abboard_title"
				<c:if test="${find_field=='abboard_title'}">
   ${'selected'}</c:if>>제목</option>
			<option value="abboard_cont"
				<c:if test="${find_field=='abboard_cont'}">
   ${'selected'}</c:if>>내용</option>
		</select> <input name="find_name" id="find_name" size="20" value="${find_name}"
			style="cursor: pointer; width: 250px; height: 40px; border: none; background-color: #56f569;" />
		<input type="submit" value="검색"
			style="border: none; cursor: pointer; width: 50px; height: 40px;" />
	</div>

	<br>
	<br>



	<%--검색전후 페이징(쪽나누기) --%>

	<div id="bList_paging" class="page_control">
		<%--검색 전 페이징 --%>
		<c:if test="${(empty find_field) && (empty find_name)}">
			<%--검색필드와 검색어가 없는 경우 --%>
			<c:if test="${page<=1}">
				<i class="fas fa-angle-left"></i>
			</c:if>
			<c:if test="${page>1}">
				<a href="abboard_list?page=${page-1}"><i
					class="fas fa-angle-left"></i></a>
			</c:if>
			<%--현재 쪽번호 출력 --%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">${a}<%-- 현재 페이지가 선택된 경우 --%>
				</c:if>
				<c:if test="${a != page}">
					<%--현재페이지가 선택 안된 경우 --%>
					<a href="abboard_list?page=${a}">${a}</a>
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
				<i class="fas fa-angle-right"></i>
			</c:if>
			<c:if test="${page < maxpage}">
				<a href="abboard_list?page=${page+1}"><i
					class="fas fa-angle-right"></i></a>
			</c:if>
		</c:if>

		<%--검색이후 페이징(쪽나누기)--%>
		<c:if test="${(!empty find_field) || (!empty find_name)}">
			<c:if test="${page<=1}">
				<i class="fas fa-angle-left"></i>
			</c:if>
			<c:if test="${page>1}">
				<a
					href="abboard_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}"><i
					class="fas fa-angle-left"></i></a>
				<%--get으로 find_field와 find_name을 전달해야 검색이후 페이징 목록을 유지한다. 검색필드와 검색어를 전달하지 않으면
      검색전 전체 페이징 목록으로 이동해서 검색효과가 사라진다. --%>
			</c:if>

			<%--현재 쪽번호 출력 --%>
			<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}">${a}<%-- 현재 페이지가 선택된 경우 --%>
				</c:if>
				<c:if test="${a != page}">
					<%--현재페이지가 선택 안된 경우 --%>
					<a
						href="abboard_list?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>
				</c:if>
			</c:forEach>

			<c:if test="${page >= maxpage}">
				<i class="fas fa-angle-right"></i>
			</c:if>
			<c:if test="${page < maxpage}">
				<a
					href="abboard_?page=${page+1}&find_field=${find_field}&find_name=${find_name}"><i
					class="fas fa-angle-right"></i></a>
			</c:if>
		</c:if>
	</div>

	<div>
		<input id= "inputbtn" type="button" value="글쓰기" style="cursor:pointer;"
			onclick="location='abboard_write?page=${page}';" />
	</div>
</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
