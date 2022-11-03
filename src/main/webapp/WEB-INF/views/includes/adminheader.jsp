<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
  <header> 

    <nav class="headerNav"> 
   
    <div id="login">${id} 관리자님 안녕하세요 |<a href="/logout" class=btn1>로그아웃</a></div>
    
     
    <%-- 회사로고 --%>
  	<div id="logo"><a href="/admin"><img src="/images/logo1.png"
    width="70px" height="70px" alt="Golf" /></a></div>
 
     <%--상단 메뉴 --%>
     
     <ul>
      <li><a href="/admin/member"class=btn1>회원관리</a>
       </li>
      <li><a href="/admin/board" class=btn1>공지사항 등록</a>
       </li>
      <li><a href="/admin/admin_insertCard" class=btn1>랭킹 스코어카드 입력</a>
       </li>
      <li><a href="/admin/admin_insertGolfcouse" class=btn1>골프장 등록</a>
       </li>
      <li><a href="/admin/admin_classMain" class=btn1>클래스 관리</a>
       </ul>  
    </nav>

    </header>
    <div class="clear"></div>
    
    
