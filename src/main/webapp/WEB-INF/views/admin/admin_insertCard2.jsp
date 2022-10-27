<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.sql.*, javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/admin_insertCard2.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<br/>

<%-- 관리자페이지-스코어카드 입력 본문 --%>
<script src="/js/jquery.js"></script>

<script>
	
	function calc_point(){
		var sumpoint = 0;
		var par = 0;
		var bestpoint = 9999;
		for(var i=1 ; i<=18 ; i++){
			var a = $('#point'+i).val();
			a = parseInt(a);
			sumpoint += a;
		}
		for(var i=1 ; i<=18 ; i++){
			var b = $('#par'+i).val();
			b = parseInt(b);
			par += b;
		}
		for(var i=1 ; i<=18 ; i++){
			var c = $('#point'+i).val();
			c = parseInt(c);
			if(bestpoint > c){
				bestpoint = c;
			}
		}
		
		document.getElementById('point_sum').value = sumpoint;
		document.getElementById('strike').value = par+sumpoint;
		document.getElementById('bestPoint').value = bestpoint;
		
	}
	
	function calc_putt(){
		var puttpoint = 0;
		for(var i=1 ; i<=18 ; i++){
			var a = $('#putt'+i).val();
			a = parseInt(a);
			puttpoint += a;
		}
		
		puttpoint = puttpoint/18;
		
		document.getElementById('put_avg').value = puttpoint;
	}
	
	function calc_OBandHazard(){
		var OBpoint = 0;
		var hazardpoint = 0;
		var sumpoint = 0;
		for(var i=1 ; i<=18 ; i++){
			var a = $('#ob'+i).val();
			a = parseInt(a);
			OBpoint += a;
		}
		for(var i=1 ; i<=18 ; i++){
			var a = $('#hazard'+i).val();
			a = parseInt(a);
			hazardpoint += a;
		}
		
		sumpoint = OBpoint+hazardpoint;
		
		document.getElementById('OBandHazard').value = sumpoint;
	}


</script>

<article class="adminInsertCard2_main">
<br>
	<form method="post" action="/admin_insertCard_ok">
		<input type="hidden" name="s_id" value="${id }">
		<input type="hidden" name="s_no" value="${no }">
		<div id="imginfo_wrap">
			<div>
			<h2>스코어카드 이미지</h2> <br>
			<img src="/upload${sb.sc_file }" width="900" height="300" alt="스코어카드">
					
			</div>
			<br>
			<hr>
			<h2>스코어카드 정보 입력란</h2>  <br>
			<table id="insertT" border="1">
				<tr>
					<td>hole</td>
					<c:forEach var="i" begin="1" end="18">
						<td>${i }</td>					
					</c:forEach>
				</tr>
				<tr>
					<td>par</td>
					<c:forEach var="i" begin="1" end="18">
						<td><input type="text" name="par" class="insert_info" id="par${i }" size="1"></td>					
					</c:forEach>
				</tr>
				<tr>
					<td>점수</td>
					<c:forEach var="i" begin="1" end="18">
						<td><input type="text" name="point" class="insert_info" id="point${i }" size="1"></td>					
					</c:forEach>
				</tr>
				<tr>
					<td>OB횟수</td>
					<c:forEach var="i" begin="1" end="18">
						<td><input type="text" name="ob" class="insert_info" id="ob${i }" size="1"></td>					
					</c:forEach>
				</tr>
				<tr>
					<td>Hazard횟수</td>
					<c:forEach var="i" begin="1" end="18">
						<td><input type="text" name="hazard" class="insert_info" id="hazard${i }" size="1"></td>					
					</c:forEach>
				</tr>
				<tr>
					<td>퍼팅횟수</td>
					<c:forEach var="i" begin="1" end="18">
						<td><input type="text" name="putting" class="insert_info" id="putt${i }" size="1"></td>					
					</c:forEach>
				</tr>
			</table>
			<br>
			<hr>
			<div id="insert_Card">
			점수합 계산하기 : <input type="button" name="cal_point" id="cal_point" value="계산하기" onclick="calc_point();"><br>
			점수합 : <input type="text" name="point_sum" id="point_sum" readonly size="14"><br>
			타수 : <input type="text" name="strike" id="strike" readonly size="14">
			<hr class="mini_hr">
			최고점수 : <input type="text" name="bestPoint" id="bestPoint" readonly size="14"> <span id="tip">*골프 점수는 낮을수록 좋습니다.</span>
			<hr class="mini_hr">
			평균 퍼팅 계산하기 : <input type="button" name="cal_put" id="cal_put" value="계산하기" onclick="calc_putt();"><br>
			평균 퍼팅 : <input type="text" name="put_avg" id="put_avg" readonly size="14">
			<hr class="mini_hr">
			최대비거리 : <input type="text" name="range" id="range">
			<hr class="mini_hr">
			OB+Hazard 계산하기 : <input type="button" name="cal_OBandHazard" id="cal_OBandHazard" value="계산하기" onclick="calc_OBandHazard();"><br>
			OB+Hazard : <input type="text" name="OBandHazard" id="OBandHazard" readonly size="14">
			<hr class="mini_hr">
			골프장 이름 : 
			<select name="location" id="location">
				<option value="잭 니클라우스 GC 코리아">잭 니클라우스 GC 코리아</option>
				<option value="소노 펠리체 CC">소노 펠리체 CC</option>
				<option value="해슬리 나인브릿지">해슬리 나인브릿지</option>
				<option value="골드레이크 CC">골드레이크 CC</option>
			</select>
			</div>
			<br>
			<hr>
			<input type="submit" class="submitBtn_admin" value="업데이트">
			<input type="reset" class="checkBtn_admin" value="다시 입력하기">
			
			
		</div>

	</form>
	<hr>
	<form method="post" action="admin/admin_insertCard_del">
		<input type="hidden" name="s_id" value="${id }">
		<input type="hidden" name="s_date" value="${date }">
		잘못올린 게시글이나 사진양식이 잘못된 경우 : <input type="submit" class="checkBtn_admin" value="반려">
	</form>
	
</article>

