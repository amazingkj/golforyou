<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.sql.*, javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/css/admin_insertCard.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<br/>

<%-- 관리자페이지-스코어카드 입력 본문 --%>
<div id="card_none">
<h1>입력할 스코어카드가 없습니다.</h1>
<input type="button" class="CheckBtn" name="back" value="뒤로" onclick="history.back();">
</div>
