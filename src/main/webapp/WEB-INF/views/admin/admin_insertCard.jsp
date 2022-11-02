<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.sql.*, javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/admin_insertCard.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<br/>

<%-- 관리자페이지-스코어카드 입력 본문 --%>
<script src="/js/jquery.js"></script>

<script>	

	$('#summon_image').on('click',function(){
		document.write("<img src=/upload/");
	});
</script>

<article class="adminInsertCard_main">
<br>

<form name="linkPost" action="/admin_insertCard_Check">
<div><h2>업데이트 필요한 스코어카드 갯수 : ${needCount }</h2> </div>
	<div class="needTable">
    
		<table class="needList">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>플레이날짜</th>
			</tr>
			
			<c:if test="${!empty needList }">
				<c:forEach var="n" items="${needList }">
					<tr>
						<td>${n.s_no }
						<td id="href"><a href="admin_insertCard_Check?admin_no=${n.s_no }&admin_id=${n.s_id}">${n.s_id }</a></td>
						<td id="href"><a href="admin_insertCard_Check?admin_no=${n.s_no }&admin_id=${n.s_id}">${n.s_nickname }</a></td>
						<td>${n.s_date }</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty needList }">
				<td colspan=3>업데이트할 스코어카드가 없습니다.</td>
			</c:if>
		</table>
	</div>
</form>
<%-- 페이징 --%>
<div>
	<c:if test="${page <= 1 }">
		[이전]
	</c:if>	
	<c:if test="${page > 1 }">
		<a href="admin_insertCard?page=${page-1 }">[이전]</a>
	</c:if>
	
	<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
		<c:if test="${a == page }">
			${a }
		</c:if>
		<c:if test="${a != page }">
			<a href="admin_insertCard?page=${a }">${a }</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${page >= maxpage }">
		[다음]
	</c:if>
	<c:if test="${page < maxpage }">
		<a href="admin_insertCard?page=${page+1 }">[다음]</a>
	</c:if>
</div>
<form method="post" action="admin_insertCard_Check">
	<div>
		<div id="imginfo_wrap">
			<div class="admin_info">
			글번호 : <input type="text" name="admin_no" id="admin_no" size="14" placeholder="글번호">
			</div>
			<div class="admin_info">
			아이디 : <input type="text" name="admin_id" id="admin_id" size="14" placeholder="아이디를 입력하세요">
			</div>
			
			<div class="admin_btn">
				<input type="submit" class="CheckBtn_admin" value="확인하기">
			</div>
		</div>
		<br>
	</div>
</form>
	
</article>

