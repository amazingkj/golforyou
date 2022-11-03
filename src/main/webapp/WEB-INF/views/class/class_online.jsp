<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 클래스 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/css/class_main.css" />
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
<script>

function onLevel(type, olevel) {
	//alert('test'+type+olevel);
	if(type === '골드') location="'class_online?olevel==='골드';"
	else if(type === '실버') location.href='class_online?olevel='+'실버';
	else if(type === '브론즈') location.href='class_online?olevel='+'브론즈';
}
</script>
</head>
<body>

	<div id="wrap">
		<form method="get" action="class_online">
			<div>
				<h1 id="name-tag">온라인 클래스</h1>
			</div>
			<hr class="hr-line">
			<div class="category">
				<ul class="province_3">
					<li><a href="class_online">온라인 전체</a></li>
					<li class="gold_level"><a href="class_online">골드</a></li>
					<li class="silver_level"><a href="class_online">실버</a></li>
					<li class="bronze_level"><a href="class_online">브론즈</a></li>
				</ul>
			</div>
			<div class="subject">
				<div class="subject-01">
					<div class="cList_count">총 클래스 개수: ${listcount} 개</div>

					<%--검색 폼추가 --%>
					<div id="cFind_wrap">
						<select name="find_field" class="class-title">
							<option value="otitle"
								<c:if test="${find_field=='otitle'}">
   ${'selected'}</c:if>>클래스명</option>
							<option value="tname"
								<c:if test="${find_field=='tname'}">
   ${'selected'}</c:if>>강사명</option>
						</select> <input name="find_name" id="find_name" size="14"
							value="${find_name}" /> <input type="submit" value="검색"
							class="searchbtn" /> <input class="searchbtn" type="button"
							value="전체목록" onclick="location='class_online?page=${page}';" />

					</div>
				</div>
				<div class="class-btns">
					<c:forEach var="o" items="${olist}">
							<!--  <button id="class-btn" type="button" onclick="onDetail('${c.ckind}', '${c.cno}')"> -->
							<button id="class-btn" type="button" onclick="location='class_detailOnline?ono=${o.ono}';">
								<div class="class-box">
									<%--c:if test="${!empty c.cimage}">
									<div class="cimage">
										<img src="/upload${c.cimage}" class="thumbnail-img"/>
									</div>
								</c:if--%>
									<c:choose>
										<c:when test="${!empty o.oimage}">
											<div class="oimage">
												<img src="/upload/class${o.oimage}" class="thumbnail-img" />
											</div>
										</c:when>
										<c:otherwise>
											<div class="oimage">
												<img src="/images/class/aaaa.jpg" class="thumbnail-img" />
											</div>
										</c:otherwise>
									</c:choose>

									<div class="tname"> ${o.tname}&nbsp;프로</div>
									<div class="otitle">${o.otitle}</div>
									<div class="oprice">
											<fmt:formatNumber value="${o.oprice}" pattern="#,###" /> 원
									</div>
								</div>
							</button>
						
					</c:forEach>
				</div>
			</div>
			<%--페이징(쪽나누기)--%>
			<div id="cList_paging">
				<%--검색전 페이징 --%>
				<c:if test="${(empty find_field)&&(empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a href="class_online?page=${page-1}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="class_online?page=${a}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="class_online?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%--검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
					<c:if test="${page >1}">
						<a
							href="class_online?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						<%--현재 쪽번호가 선택된 경우 --%>

						<c:if test="${a != page}">
							<%--현재 쪽번호가 선택 안된 경우 --%>
							<a
								href="class_online?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="class_online?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>

			</div>
		</form>
	</div>
</body>
<div style="margin: 13% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>
<script>

function onDetail(type, cno) {
	//alert('test'+type+cno);
	if(type === '필드') location.href='class_detailField?cno='+cno;
	else if(type === '온라인') location.href='class_detailOnline?cno='+cno;
}
</script>