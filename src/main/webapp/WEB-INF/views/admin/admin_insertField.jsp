<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필드 클래스 등록</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/class_admin.css">
<script src="/js/jquery.js"></script>
<script src="/js/class.js"></script>
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>

	<div id="header_body" style="width: 100%;"></div>
	<div id="wrap-edit">
		<h2>필드 클래스 등록하기</h2>
		<br />
		<!-- form name="form1" method="post" action="/insertField_ok" onsubmit="write_check_field()" enctype="multipart/form-data" -->
		<form name="form1" method="post" action="/admin/insertField_ok" enctype="multipart/form-data" onsubmit="return write_check_field();">
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
					<td style="width:30%;">※ 클래스 기본 정보를 입력해주세요.</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>클래스명</td>
					<td><input name="ftitle" id="ftitle" size="70"></td>
				</tr>
				<tr>
					<td>강사명</td>
					<td><select name="tno" id="tname">
							<option value="none">강사를 선택해주세요</option>
					</select> 프로</td>
				</tr>
				<tr>
					<td>강사 성별</td>
					<td><select name="tgender" id="tgender" disabled>
							<option>성별을 선택해주세요</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
					</select></td>
				</tr>
				<tr>
					<td>강사 소개 또는 경력사항</td>
					<td><textarea name="tcareer" id="tcareer" rows="9" cols="60" disabled></textarea></td>
				</tr>
				<tr>
					<td>클래스 전화번호</td>
					<td><input name="fphone" id="fphone" size="30" placeholder="예) 010-1234-5678"></td>
				</tr>
				<tr>
					<td>클래스 지역</td>
					<%-- 
					<td><select onchange="categoryChange(this)">
							<option>지역을 선택해주세요</option>
							<option name="caddr" id="caddr" value="capital" >수도권</option>
							<option name="caddr" id="caddr" value="gangwon">강원도</option>
							<option name="caddr" id="caddr" value="chungcheong">충청도</option>
							<option name="caddr" id="caddr" value="jeonla">전라도</option>
							<option name="caddr" id="caddr" value="kyeongsang">경상도</option>
							<option name="caddr" id="caddr" value="jeju">제주도</option>
					</select> <select id="good">
							<option>지역을 선택해주세요</option>
					</select></td>--%>

					<td>
					<select name="faddr" id="faddr" >
							<option value="none">지역을 선택해주세요</option>
							<option value="수도권">수도권</option>
							<option value="강원도">강원도</option>
							<option value="충청도">충청도</option>
							<option value="전라도">전라도</option>
							<option value="경상도">경상도</option>
							<option value="제주도">제주도</option>
					</select> 
					
					<!--  
					<select name="caddr2" id="caddr2">
							<option>지역을 선택해주세요</option>
							<option value="경기도 전체">경기도 전체</option>
							<option value="서울">서울</option>
							<option value="인천">인천</option>
					</select>
					
						<select name="caddr2" id="caddr2">
							<option>지역을 선택해주세요</option>
							<option value="강원도 전체">강원도 전체</option>
							<option value="춘천">춘천</option>
							<option value="속초">속초</option>
					</select>
						<select name="caddr2" id="caddr2">
							<option>지역을 선택해주세요</option>
							<option value="충청도 전체">충청도 전체</option>
							<option value="대전">대전</option>
							<option value="세종">세종</option>
					</select>
						<select name="caddr2" id="caddr2">
							<option>지역을 선택해주세요</option>
							<option value="전라도 전체">전라도 전체</option>
							<option value="광주">광주</option>
							<option value="전주">전주</option>
					</select>
						<select name="caddr2" id="caddr2">
							<option value="경상도 전체">경상도 전체</option>
							<option value="부산">부산</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
					</select>
						<select name="caddr2" id="caddr2">
							<option>지역을 선택해주세요</option>
							<option value="제주도 전체">제주도 전체</option>
							<option value="제주시">제주시</option>
							<option value="서귀포시">서귀포시</option>
					</select>
					-->
					</td>
				</tr>
				<tr>
					<td>클래스 이미지</td>
					<td><input type="file" name="fimage2" id="fimage2"></td>
				</tr>
				<tr>
					<td><br /> <br /></td>
				</tr>
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
					<td>※ 가격 정보를 입력해주세요.</td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td>STANDRD 가격</td>
					<td><input name="fsprice" id="fsprice" placeholder="' , ' 없이 입력해주세요."> 원</td>
				</tr>
				<tr>
					<td>STANDRD 라운딩 횟수</td>
					<td><input name="fsrounding" id="fsrounding"> 회</td>
				</tr>
				<tr>
					<td>STANDRD 상세 설명</td>
					<td><textarea name="fsdesc" id="fsdesc" rows="5" cols="60"></textarea></td>
				</tr>

				<tr>
					<td>STANDRD 1회당 레슨 시간(분)</td>
					<td><input name="fstime" id="fstime"> 분</td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>

				<tr>
					<td>DELUXE 가격</td>
					<td><input name="fdprice" id="fdprice" placeholder="' , ' 없이 입력해주세요."> 원</td>
				</tr>
				<tr>
					<td>DELUXE 라운딩 횟수</td>
					<td><input name="fdrounding" id="fdrounding"> 회</td>
				</tr>
				<tr>
					<td>DELUXE 상세 설명</td>
					<td><textarea name="fddesc" id="fddesc" rows="5" cols="60"></textarea></td>
				</tr>

				<tr>
					<td>DELUXE 1회당 레슨 시간(분)</td>
					<td><input name="fdtime" id="fdtime"> 분</td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>

				<tr>
					<td>PREMIUM 가격</td>
					<td><input name="fpprice" id="fpprice" placeholder="' , ' 없이 입력해주세요."> 원</td>
				</tr>
				<tr>
					<td>PREMIUM 라운딩 횟수</td>
					<td><input name="fprounding" id="fprounding"> 회</td>
				</tr>
				<tr>
					<td>PREMIUM 상세 설명</td>
					<td><textarea name="fpdesc" id="fpdesc" rows="5" cols="60"></textarea></td>
				</tr>

				<tr>
					<td>PREMIUM 1회당 레슨 시간(분)</td>
					<td><input name="fptime" id="fptime"> 분</td>
				</tr>
				<tr>
					<td><br /> <br /></td>
				</tr>
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
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="등록" class="btn01"> 
					<input type="button" value="목록" class="btn01" onclick="location='admin_classField';" />
					</td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<div style="margin: 18% 0%;"></div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>