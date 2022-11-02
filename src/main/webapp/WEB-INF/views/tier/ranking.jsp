<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.sql.*, javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/includes/header.jsp" /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="/css/ranking.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<link rel="stylesheet" type="text/css" href="/css/board.css" />
<br/>

<%-- 랭킹 본문 --%>

<script src="/js/jquery.js"></script>

<article id="ranking_main">
	<br>
	<span class="rank_title_1" id="rank_tag_1">
		전체랭킹
	</span>	
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; margin-top:20px;">
	<div class="rank_title" id="rank_tag">
		<form method="get" action="ranking">
		<div class="tier-explain">
			<img class='tierexplainPic' alt='다이아' src='/images/t_b.png' onmouseover="mouse_over_bronze()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<img class='tierexplainPic' alt='다이아' src='/images/t_s.png' onmouseover="mouse_over_silver()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<img class='tierexplainPic' alt='다이아' src='/images/t_g.png' onmouseover="mouse_over_gold()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<img class='tierexplainPic' alt='다이아' src='/images/t_p.png' onmouseover="mouse_over_platinum()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<img class='tierexplainPic' alt='다이아' src='/images/t_d.png' onmouseover="mouse_over_diamond()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			<input type="text" class="tier_box" id="tier_box" name="tier_box" readonly value="티어">
		</div>
		<div class="search-box">
			<input type="text" name="searchtxt" class="search-txt" onkeyup="press();" id="search_txt" placeholder="아이디 입력">
			
			<button type="button" class="search-btn" onclick="searching();"><i class="fas fa-search"></i></button>	
				
		</div>
		
		</form>
	</div>
	
	
	<div class="category">
		<ul class="province_1">
			<li><a href="ranking">전체</a></li>
			<li>서울・경기・인천
				<ul class="province_2" id="province_2-3">
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=서울"> 서울</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=경기"> 경기</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=인천"> 인천</a></li>
				</ul>
			</li>
			<li>강원
				<ul class="province_2" id="province_2-1">
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=강원"> 강원</a></li>
				</ul>
			</li>
			<li>충청・대전・세종
				<ul class="province_2" id="province_2-3">
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=충청"> 충청</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=대전"> 대전</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=세종"> 세종</a></li>
				</ul>
			</li>
			<li>전라・광주
				<ul class="province_2" id="province_2-2">
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=전라"> 전라</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=광주"> 광주</a></li>
				</ul>
			</li>
			<li>경상・부산・대구・울산
				<ul class="province_2" id="province_2-4">
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=경상"> 경상</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=부산"> 부산</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=대구"> 대구</a></li>
					<li><i class="fas fa-map-marker-alt"></i><a href="ranking?prov=울산"> 울산</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="rank_wrap"> 
		<table class="rankList" id="rank0">
			<tr>
				<th width="7%" id="Listno">#</th>
				<th width="11%" id="Listprofile">프로필</th>
				<th width="11%" id="Listtier">
					<select name="id_or_tier" class="searchtier" onchange="tierChange()">
						<option value="select_All">티어</option>
						<option value="select_bornze">브론즈</option>
						<option value="select_silver">실버</option>
						<option value="select_gold">골드</option>
						<option value="select_platinum">플레티넘</option>
						<option value="select_diamond">다이아몬드</option>
						<option value="select_unrank">티어없음</option>
					</select>
				</th>
				<th width="25%" id="Listid">닉네임</th>
				<th width="14%" id="Listpoint">점수</th>
				<th width="15%" id="Listdriver">최대비거리</th>				
				<th width="17%" id="Listcard">플레이 횟수</th>
			</tr>
		</table>	
		<div class="rank_wrap2">
		
		</div>

	</div>
	
	<script>
		var memberCount = "<c:out value='${mem}'/>"; // 회원 수.
		var divCount = $('.rank').length;  //rank class에 해당하는 div 개수(현재 0).
		
		//div 생성 반복문
		while(memberCount > divCount){ //while문은 돌아가고있음
			
			$(".rank_wrap2").append("<div class='rank' id='rank"+(divCount+1)+"'>");
					
			$("#rank"+(divCount+1)).html("<div class='rankno' id='rankno"+(divCount+1)+"'>"); //rankno클래스 div 생성
			
			var divrankprofile = $("<div></div>").addClass("rankprofile").attr('id',"rProfile_"+(divCount+1));
			$("#rankno"+(divCount+1)).after(divrankprofile); //rankprofile클래스 div 생성
			
			var divranktier = $("<div></div>").addClass("ranktier").attr('id',"rTier_"+(divCount+1));
			$("#rProfile_"+(divCount+1)).after(divranktier); //ranktier클래스 div 생성
						
			var divrankname = $("<div></div>").addClass("rankname").attr('id',"rNickname_"+(divCount+1));
			$("#rTier_"+(divCount+1)).after(divrankname); //rankid클래스 div 생성
			
			var divrankpoint = $("<div></div>").addClass("rankpoint").attr('id',"rPoint_"+(divCount+1));
			$("#rNickname_"+(divCount+1)).after(divrankpoint); //rankpoint클래스 div 생성
			
			var divrankdriver = $("<div></div>").addClass("rankdriver").attr('id',"rDriver_"+(divCount+1));
			$("#rPoint_"+(divCount+1)).after(divrankdriver); //rankdriver클래스 div 생성
						
			var divrankcard = $("<div></div>").addClass("rankcard").attr('id',"rCard_"+(divCount+1));
			$("#rDriver_"+(divCount+1)).after(divrankcard); //rankcard클래스 div 생성
			
			var divrankprov = $("<div></div>").addClass("rankprov").attr('id',"rProv_"+(divCount+1));
			$("#rCard_"+(divCount+1)).after(divrankprov); //rankprov클래스 div 생성
			
			var divrankid = $("<div></div>").addClass("rankid").attr('id',"rId"+(divCount+1));
			$("#rCard_"+(divCount+1)).after(divrankid); //rankid클래스 div 생성
			
			
			$("#rankpoint"+(divCount+1)).html("<span id='rPoint_"+(divCount+1)+"'></span>");
			
			document.getElementById('rankno'+(divCount+1)).innerHTML = (divCount+1)+"위";
			
						
			divCount = $('.rank').length; //div 값 갱신. 
			
			
		}//while
		
	</script>
	
	
	<!-- div 내 정보 자동입력 -->
	
	<c:forEach var="i" begin="1" end="${mem }">
	<script>
	
	$('#rId'+${i}).append("<c:out value='${rankid.get(i-1)}'/>");
	$('#rNickname_'+${i}).append("<c:out value='${rankname.get(i-1)}'/>");
	$('#rCard_'+${i}).append("<c:out value='${count.get(i-1)}'/>");
	if($('#rCard_'+${i}).text() == "0"){
		$('#rPoint_'+${i}).text("X");
	}else{
		$('#rPoint_'+${i}).append("<c:out value='${rankpoint.get(i-1)}'/>");
	}	
	$('#rProv_'+${i}).append("<c:out value='${province.get(i-1)}'/>");	
	if($('#rCard_'+${i}).text() == "0"){
		$('#rDriver_'+${i}).text("X");
	}else{
		$('#rDriver_'+${i}).append("<c:out value='${bestrange.get(i-1)}'/>m");	
	}
	
	
	$("#rProfile_"+${i}).css({
		"background-image": "url('/upload/member<c:out value="${fileaddr.get(i-1)}"/>')",
		"background-repeat" : "no-repeat",
		"background-size" : "50px 50px"
	});
	</script>
	</c:forEach>

	
	<script>
	//indivrank 링크, 티어 만드는 스크립트

		var tier = '';
		for(var i=1 ; i<=memberCount ; ++i){
			$("#rank"+i).attr('onclick',"location.href='indivrank?rId="+document.getElementById("rId"+i).innerHTML+"&rPoint_="+$("#rPoint_"+i).text()+"&rankno="+$("#rankno"+i).text()+"'");	
			
			if(parseInt($('#rCard_'+i).text()) < 5){ //5판 미만으로 플레이시 언랭 티어로 지정
				tier = 'un_rank.png';
				document.getElementById("rTier_"+i).innerHTML = "<img class='tierPic' alt='언' src='/images/"+tier+"'>";
				$("#rTier_"+i).append("티어없음");
			}else{
				var tierNum = $("#rPoint_"+i).text();
				if(tierNum < -15){
					tier = 'd.png';
					document.getElementById("rTier_"+i).innerHTML = "<img class='tierPic' alt='다이아' src='/images/t_"+tier+"'>";
					$("#rTier_"+i).append("다이아몬드");
				}else if(tierNum >= -15 && tierNum < -10){
					tier = 'p.png';
					document.getElementById("rTier_"+i).innerHTML = "<img class='tierPic' alt='플레' src='/images/t_"+tier+"'>";
					$("#rTier_"+i).append("플레티넘");
				}else if(tierNum >= -10 && tierNum < -5){
					tier = 'g.png';
					document.getElementById("rTier_"+i).innerHTML = "<img class='tierPic' alt='골드' src='/images/t_"+tier+"'>";
					$("#rTier_"+i).append("골드");
				}else if(tierNum >= -5 && tierNum < 5){
					tier = 's.png';
					document.getElementById("rTier_"+i).innerHTML = "<img class='tierPic' alt='실버' src='/images/t_"+tier+"'>";
					$("#rTier_"+i).append("실버");
				}else{
					tier = 'b.png';
					document.getElementById("rTier_"+i).innerHTML = "<img class='tierPic' alt='브' src='/images/t_"+tier+"'>";
					$("#rTier_"+i).append("브론즈");
				}
			}
			
			var profile = $('#rProfile_+i').text();
			
			
		}
		
		
	</script>
		
	<script>
	//검색 관련 스크립트

	var divCount = $('.rank').length;
		
	function getParameterByName(name){
		name = name.replace(/[\[]/,"\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var getprov = getParameterByName('prov');
	
	function searchname(){
		var search = document.getElementById("search_txt").value;
		return search;
	}
	
	if("<c:out value='${prov}'/>" != null){
		for(var i=1 ; i<=memberCount ; ++i){
			if("<c:out value='${prov}'/>" == '서울'){
				if(!($('#rProv_'+i).text() == '서울')){
					$("#rank"+i).css({
						"display": "none"
					});
				}
			}else if("<c:out value='${prov}'/>" == '경기'){
				if(!($('#rProv_'+i).text() == '경기')){
					$("#rank"+i).css({
						"display": "none"
					});
				}
			}else if("<c:out value='${prov}'/>" == '인천'){
				if(!($('#rProv_'+i).text() == '인천')){
					$("#rank"+i).css({
						"display": "none"
					});
				}
			}
			
		}
		
		
		
	}
	
	
	function searching(){		
		$(".rank").css({
			"display" : "block"
		});
		for(var i=1 ; i<=divCount ; ++i){
			if(searchname() == ''){
				$(".rank").css({
					"display" : "block"
				});
			}else if(!(searchname() == document.getElementById("rId"+i).innerText)){
				$("#rank"+i).css({
					"display" : "none"
				});
			}
		}
	}
	
	//티어 selectbox제어 스크립트
	<%-- 다이아:상위memeber/5 플레:상위member/5*2 골드:상위member/5*3 실버:상위member/5*4 브론즈:나머지 --%>
	
	function tierChange(){
		
		$(".rank").css({
			"display" : "block"
		});
		
		if(getprov == ''){
			if($(".searchtier option:checked").text() == "티어"){
				$(".rank").css({
					"display" : "block"
				});
			}else{
				for(var i=1 ; i<=memberCount ; ++i){
					if(!($("#rTier_"+i).text() == $(".searchtier option:checked").text())){
						$("#rank"+i).css({
							"display" : "none"
						});
					}
				}		
			}	
		}else{ //prov가 있다면.
			if($(".searchtier option:checked").text() == "티어"){				
				$(".rank").css({
					"display" : "block"
				});
				for(var i=1 ; i<=memberCount ; ++i){
					if($('#rProv_'+i).text() != getprov){
						$("#rank"+i).css({
							"display" : "none"
						});
					}				
				}			
			}else{			
				for(var i=1 ; i<=memberCount ; ++i){
					if(!($("#rTier_"+i).text() == $(".searchtier option:checked").text())){
						$("#rank"+i).css({
							"display" : "none"
						});
					}
					if($('#rProv_'+i).text() != getprov){
						$("#rank"+i).css({
							"display" : "none"
						});
					}
				}		
			}	
		}				
	}
	
	function press(){
		if(window.event.keyCode == 13){ //13이 enter을 의미
			searching();
		}
	}
	
	</script>
	
	<!-- 티어정보 마우스오버 스크립트 -->
	<script >
		function mouse_over_bronze(){
			$('#tier_box').attr('value',"브론즈");
		}
		function mouse_over_silver(){
			$('#tier_box').attr('value',"실버");
		}
		function mouse_over_gold(){
			$('#tier_box').attr('value',"골드");
		}
		function mouse_over_platinum(){
			$('#tier_box').attr('value',"플레티넘");
		}
		function mouse_over_diamond(){
			$('#tier_box').attr('value',"다이아몬드");
		}
	</script>

</article>


<jsp:include page="/WEB-INF/views/includes/footer.jsp" /> 
<br>




























