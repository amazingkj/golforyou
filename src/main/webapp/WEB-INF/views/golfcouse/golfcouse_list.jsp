<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프장 목록 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/css/golfcouse_list.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" />
<script>
	function navigo() {
		const header = document.querySelector('header');
		const headerheight = header.clientHeight;
		document.addEventListener('scroll', onScroll, {
			passive : true
		});
		function onScroll() {
			const scrollposition = pageYOffset;
			const nav = document.querySelector('nav');
			if (headerheight <= scrollposition) {
				nav.classList.add('fix')
			} else {
				nav.classList.remove('fix');
			}
		}

	}
	navigo()
</script>
</head>
<body>

	<div id="wrap">
		<form method="get" action="golfcouse_list">
			<div>
				<h1 id="name-tag">골프장 목록</h1>
			</div>
			<hr class="hr-line">
			<div class="subject">
				<div class="subject-01">
					<div class="gcList_count">총 골프장 개수: ${listcount} 개</div>

					<%--검색 폼추가 --%>
					<div id="golfcouse_wrap">
						<select name="find_field" class="golfcouse-title">
							<option value="gc_title"
								<c:if test="${find_field=='gc_title'}">
   ${'selected'}</c:if>>골프장명</option>
							<option value="gc_area"
								<c:if test="${find_field=='gc_area'}">
   ${'selected'}</c:if>>지역명</option>
						</select> <input name="find_name" id="find_name" size="14"
							value="${find_name}" /> <input type="submit" value="검색"
							class="searchbtn" /> <input class="searchbtn" type="button"
							value="전체목록" onclick="location='golfcouse_list?page=${page}';" />

					</div>
				</div>
				<div class="golfcouse-btns">
					<c:if test="${!empty gclist}">
						<c:forEach var="gc" items="${gclist}">
							<button id="golfcouse-btn" type="button" onclick="onDetail('${gc.gc_no}')">
								<div class="golfcouse-box">
											
									<c:choose>
										<c:when test="${!empty gc.gc_image}">
											<div class="gc_image">
												<img src="/upload/golfcouse${gc.gc_image}" class="thumbnail-img" onclick="location='/golfcouse_Main?gc_no=${gc.gc_no}';" />
											</div>
										</c:when>
										<c:otherwise>
											<div class="gc_image">
												<img src="/images/golfcouse/Qcc.jpg" class="thumbnail-img" />
												<a href="/golfcouse_Main"></a>
											</div>
										</c:otherwise>
									</c:choose>

									<div class="gc_title">${gc.gc_title}</div>
									<div class="gc_english">${gc.gc_english}</div>
									<div class="gc_area">${gc.gc_area}</div>
								</div>
							</button>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<%--페이징(쪽나누기)--%>
			<div id="gcList_paging">
				<%--검색전 페이징 --%>
				<c:if test="${(empty find_field)&&(empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a href="golfcouse_list?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="golfcouse_list?page=${a}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="golfcouse_list?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%--검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a
							href="golfcouse_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						<%--현재 쪽번호가 선택된 경우 --%>

						<c:if test="${a != page}">
							<%--현재 쪽번호가 선택 안된 경우 --%>
							<a
								href="golfcouse_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="golfcouse_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>

			</div>
		</form>
	</div>
</body>
<div style="margin: 18% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>
