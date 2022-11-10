<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프장 등록</title>





<script src="https://kit.fontawesome.com/7e87ecac1e.js"
	crossorigin="anonymous"></script>

<script language="javascript">
	function showPopup() {
		window.open("admin_gcarchitects", "a",
				"width=1000, height=500, left=100, top=50");
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function gc_address_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('gc_address_postcode').value = data.zonecode;
						document.getElementById("gc_address_roadAddress").value = roadAddr;
						document.getElementById("gc_address_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("gc_address_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("gc_address_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/golfcouse_admin.css">
<script src="/js/jquery.js"></script>
<script src="/js/golfcouse.js"></script>
<jsp:include page="/WEB-INF/views/includes/adminheader.jsp" />
</head>
<body>

	<div id="header_body" style="width: 100%;"></div>
	<div id="wrap-edit">
		<h2>골프장 등록하기</h2>
		<br />
		<form name="form1" method="post" action="/admin/insertGolfcouse_ok"
			enctype="multipart/form-data" onsubmit="return golfcouse();">
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
					<td>※ 골프장 정보를 입력해주세요.</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>

				<tr>
					<td>골프장 이미지</td>
					<td><input type="file" name="file2" id="file2"
						accept="image/*" ></td>

				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장명</td>
					<td><input name="gc_title" id="gc_title" size="50"style="color:black;background-color:white;" type="text"  
					 value="" placeholder="골프장명을 입력하세요."></td>
					 
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장영문명</td>
					<td><input name="gc_english" id="gc_english" size="50" style="color:black;background-color:white;" type="text" 
					 value="" placeholder="골프장 영문명을 입력하세요." ></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>지역</td>
					<td><input name="gc_area" id="gc_area" size="50" style="color:black;background-color:white;" type="text"  
					 value="" placeholder="지역명을 입력하세요." ></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>홀</td>
					<td><select name="gc_hole" id="gc_hole" style="color:black;background-color:white;" >
							<option value="none">홀수를 선택해주세요</option>
							<option value="18">18</option>
							<option value="27">27</option>
							<option value="36">36</option>
							<option value="54">54</option>
							<option value="72">72</option>
					</select></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>파</td>
					<td><input name="gc_golf" id="gc_golf" size="20"
						style="color:black;background-color:white;" type="text" 
						 class="check" name="test5" value="" placeholder="숫자를 입력하세요." autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>길이</td>
					<td><input name="gc_length" id="gc_length" size="40" style="color:black;background-color:white;" type="text"  
					class="check" name="test6" value="" placeholder="숫자를 입력하세요." autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>

				<tr>
					<td>잔디종류</td>
					
					
				
						
						
					<td>※ 잔디종류를 선택해주세요!<br/><img src="/images/golfcouse/버뮤다그래이스.png" width="150"
						height="150" values="버뮤다그래이스"> <img
						src="/images/golfcouse/벤트그래스.png" width="150" height="150">
						<img src="/images/golfcouse/켄터기블루그래스.png" width="150" height="150">
						<img src="/images/golfcouse/톰 페스큐.png" width="150" height="150"><br />
						버뮤다그래이스&emsp;<input type="checkbox" value="버뮤다그래이스" class="btn01"
						name="gc_kind" id="gc_kind" /> &emsp;벤트그래이스&emsp;<input
						type="checkbox" value="벤트그래스" class="btn01" name="gc_kind"
						id="gc_kind" /> &emsp;켄터키블루그래스&emsp;<input type="checkbox"
						value="켄터키블루그래스" class="btn01" name="gc_kind" id="gc_kind" />
						&emsp;톰 페스큐&emsp;<input type="checkbox" value="톰 페스큐"
						class="btn01" name="gc_kind" id="gc_kind" />
				</tr>
				<tr>
					<td><br /></td>
				</tr>

				<tr>
					<td>코스타입</td>
					<td><input name="gc_type" id="gc_type" size="60" style="color:black;background-color:white;" type="text" 
					 class="check" name="test7" value="" placeholder="코스타입을 입력해주세요." autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>코스구성</td>
					<td><input name="gc_configuration" id="gc_configuration"
						size="60" style="color:black;background-color:white;" type="text"  
						class="check" name="test8" value="" placeholder="코스구성을 입력하세요." autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>캐디(유/무)</td>
					<td><select name="gc_caddy" id=gc_caddy" style="color:black;background-color:white;" class="check" name="test9">
							<option value="선택1">캐디(유/무) 선택해주세요</option>
							<option value="유">유</option>
							<option value="무">무</option>
					</select></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>카트(유/무)</td >
					<td><select name="gc_cart" id=gc_cart" style="color:black;background-color:white;" class="check" name="test10">
							<option value="선택">카트(유/무) 선택해주세요</option>
							<option value="유">유</option>
							<option value="무">무</option>
					</select></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장 설계자</td>
					<td><input name="gc_architects" id="gc_architects" size="60" style="color:black;background-color:white;" type="text"  
						class="check" name="test11" value="" placeholder="골프장 설계자를 입력해주세요." autocomplete="off" ></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장 소개</td>
					<td><textarea name="gc_content" id="gc_content" rows="9"
							cols="100" style="color:black;background-color:white;" type="text"  
						class="check" name="test12" value="" placeholder="소개글을 입력해주세요." autocomplete="off"></textarea></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
			
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장 주소</td>
					<td><input type="text" id="gc_address_postcode"
						name="gc_address_postcode" placeholder="우편번호"> <input
						type="button" onclick="gc_address_execDaumPostcode()"
						value="우편번호 찾기"><br> <input type="text"
						id="gc_address_roadAddress" name="gc_address_roadAddress"
						placeholder="도로명주소"> <input type="text"
						id="gc_address_jibunAddress" name="gc_address_jibunAddress"
						placeholder="지번주소"> <span id="guide"
						style="color: #999; display: none"></span> <input type="text"
						id="gc_address_detailAddress" name="gc_address_detailAddress"
						placeholder="상세주소"> <input type="text"
						id="gc_address_extraAddress" name="gc_address_extraAddress"
						placeholder="참고항목"></td>
				</tr>
				<tr>
					<td></td>
					<td>※찾으시는 골프장지도는 입력하신주소로 자동생성됩니다.</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장 전화번호</td>
					<td><input name="gc_phone" id="gc_phone" size="30"
						style="color:black;background-color:white;" type="text"  
						class="check" name="test13" value="" placeholder="연락처를 입력해주세요" autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장 팩스번호</td>
					<td><input name="gc_fax" id="gc_fax" size="30"
						style="color:black;background-color:white;" type="text"  
						class="check" name="test14" value="" placeholder="연락처를 입력해주세요" autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>자차이동시 경로</td>
					<td><input name="gc_move" id="gc_move" size="60"
						style="color:black;background-color:white;" type="text"  
						class="check" name="test15" value="" placeholder="예) 해당고속도로-해당ic-해당톨게이트-해당골프장" autocomplete="off"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>골프장 개장년도</td>
					<td><select name="gc_date" id="gc_date" style="color:black;background-color:white;" class="check" name="test16">
							<option value="선택">년도 선택해주세요</option>
							<c:forEach var="i" begin="1980" end="2030" >
								<option value="${i }">${i }</option>
							</c:forEach>

					</select></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
				<tr>

					<td colspan="2" align="center"><input type="submit" value="등록"
						class="btn01" onclick= "golficouse()"> <input type="button" value="목록"
						class="btn01" onclick="location='/admin/admin_golfcouseList';" /></td>
				</tr>
				<tr>
					<td><br /></td>
					<td><br /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<div style="margin: 25% 0%;"></div>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</html>