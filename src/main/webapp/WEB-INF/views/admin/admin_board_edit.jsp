<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="/css/abboard_cont.css" />
<link rel="stylesheet" type="text/css" href="/css/abcustomer.css" />
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
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
			<form method="post" id="frm" action="admin_board_edit_ok">
				<input type="hidden" name="page" value="${page}">
				
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
							<td>${b.abboard_no}<input type="hidden" name="abboard_no"
								value="${b.abboard_no}">
							</td>
							<th scope="row">조회수</th>
							<td>${b.abboard_hit}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td><input name="abboard_name" size="14"
								value="${b.abboard_name}" /></td>
							<th scope="row">작성시간</th>
							<td>${b.abboard_date}</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td><input name="abboard_title" size="14"
								value="${b.abboard_title}" /></td>
						</tr>
						<tr>
							<td colspan="4" class="view_text"><textarea style="resize:none;" rows="11"
									cols="160" name="abboard_cont">${b.abboard_cont}</textarea></td>
						</tr>
					</tbody>
				</table>
				<div>
					<input type="button" value="목록으로" class="btn"
						onclick="location='abboard_list?page=${page}';"
						style="cursor: pointer" /> 
					<input type="submit" value="저장하기" class="btn" style="cursor: pointer; margin-left:0px;" /> 
				</div>
			</form>
		</div>
		<div class="clear"></div>
	</div>
	
</body>
</html>