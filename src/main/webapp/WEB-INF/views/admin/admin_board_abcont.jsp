<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="/css/abboard_cont.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" />
</head>
<body>
	<div id="all_box">
		<div>
			<div class="left_navi" style="margin-top: 260px;">
				<h3>고객센터</h3>

				<dl class="sub_menu">

					<dd>
						<a href="customer_main">FAQ</a>
					</dd>
					<dd>
						<a href="customer_fnq">1:1문의</a>
					</dd>
					<dd>
						<a href="#">공지사항</a>
					</dd>
					<dd>
						<a href="customer_sitepolicy">환불규정</a>
					</dd>
					<dd>
						<a href="customer_holeinone">홀인원보험</a>
					</dd>

				</dl>


				<ul class="sub_menu_bt">

					<li class="callcenter">고객센터</li>
					<li class="callno">1588-0000(유료)</li>
					<li class="callcenter sub">평일 : 09:30~18:00</li>
					<li class="callcenter sub">(토, 일, 공휴일 휴무)</li>
				</ul>
			</div>
			<!-- // left navigation -->
		</div>
		<div class="first_box">
			<form id="frm" method="post" action="admin_board_edit_ok">
				<table class="board_view">
					<colgroup>
						<col width="10%" />
						<col width="30%" />
						<col width="10%" />
						<col width="30%" />
					</colgroup>
					<caption id="main_text">공지사항</caption>
					<tbody>
						<tr>
							<th scope="row">글 번호</th>
							<td>${b.abboard_no}<input type="hidden" id="IDX" name="no"
								value="${b.abboard_no}">
							</td>
							<th scope="row">조회수</th>
							<td>${b.abboard_hit}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${b.abboard_name}<input type="hidden" id="IDX" name="board_name"
								value="${b.abboard_name}"></td>
							<th scope="row">작성시간</th>
							<td>${b.abboard_date}</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td>${b.abboard_title}<input type="hidden" id="IDX" name="board_title"
								value="${b.abboard_title}"></td>
						</tr>
						<tr>
							<td colspan="4" class="view_text"><textarea
									style="pointer-events: none;" readonly rows="15" cols="190">${b.abboard_cont}</textarea>
									<input type="hidden" id="IDX" name="cont" 
									value="${b.abboard_cont}">
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tr>
						<th><input type="button" value="목록으로" class="btn"
							onclick="location='admin_board_ablist?page=${page}';"
							style="cursor: pointer" /></th>
						<th><input type="button" value="수정" class="btn" 
							onclick="location= 'admin_board_abcont?no=${b.abboard_no}&page=${page}&state=edit';"
							style="cursor: pointer; margin-left: 0px;" /></th>

					</tr>
				</table>
			</form>
		</div>
		<div class="clear"></div>
	</div>


</body>
</html>