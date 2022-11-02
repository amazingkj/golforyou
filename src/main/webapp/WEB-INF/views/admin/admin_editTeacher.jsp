<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 정보 수정</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/class_admin.css">
<script src="/js/jquery.js"></script>
<script src="/js/class.js"></script>
<%-- <jsp:include page="/WEB-INF/views/includes/header.jsp" /> --%>
</head>
<body>

	<div id="header_body" style="width: 100%;"></div>
	<div id="wrap-edit2">
		<h2>강사 정보 수정하기</h2>
		<br />
		<form name="form7" method="post" action="/admin/editTeacher_ok" >
			<input type="hidden" name="tno" value="${item.tno}">
			<table>
				<tr>
					<td><hr /></td>
					<td><hr /></td>
					<td><hr /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td>※ 강사 기본 정보를 입력해주세요.</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>강사명</td>
					<td><input name="tname" id="tname" size="15" value="${item.tname}"></td>
				</tr>
				<tr>
					<td>강사 성별</td>
					<td><select name="tgender" id="tgender">
							<option>성별을 선택해주세요</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
					</select></td>
				</tr>
				<tr>
					<td>강사 소개 또는 경력사항</td>
					<td><textarea name="tcareer" id="tcareer" rows="9" cols="60" >${item.tcareer}</textarea></td>
				</tr>
				<tr>
					<td><br /> <br /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="수정" class="btn01">
					<input type="button" value="목록" class="btn01" onclick="location='admin_classTeacher';" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<div style="margin: 10% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>