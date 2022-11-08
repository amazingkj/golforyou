<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<header>
</header>

 <link rel="stylesheet" type="text/css" href="/css/YeYag_Main.css" />
<script src="/js/jquery.js"></script>
<script src="/js/goifcouse.js"></script>
<script src="https://kit.fontawesome.com/7e87ecac1e.js" crossorigin="anonymous"></script>
 <link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">

	
	<jsp:include page="/WEB-INF/views/includes/header.jsp" />

</head>
<body>

<br><br>


<div class="section" style="margin:150px 0px 0px 0px;">
	<div class="header_cont">
		<div class="header_info">
			<div class="info_tit">
				<p class="tit-basic">
					<span class="tit-ko"  >${it.gc_title}</span><span class="tit-area">${it.gc_area}</span>
				</p>				
				<p class="tit-en"><span class="tit-en1">${it.gc_english}</span></p>
			</div>				
		</div>
	</div>
<div class="header_tab">
            <div class="section">
                <ul class="tab-cont">
                    <li id="ground-info" class="btn3" data-target-class="tab1"><button data-flag="info"
                    id="info_button">정보</button></li>
                </ul>
            </div>
        </div>
        </div>
        
   <div class="clear"></div> 
      <div id="image">
	  <div id="image_1"><img src="/upload/golfcouse${it.gc_image}" width="500" height="300"/></div>
            <div class="basic-txt">
                <div class="txt-box txt01">
                    <p><span>홀</span><span>${it.gc_hole}</span></p>
                    <p><span>파</span><span>${it.gc_golf}</span></p>
                    <p><span>길이</span><span>${it.gc_length}</span></p>
                    <p><span>잔디</span><span>${it.gc_kind}</span></p>
                </div>
                <div class="txt-box txt02">
                    <p><span>코스타입</span><span>${it.gc_type}</span></p>
                    <p><span>코스구성</span><span>${it.gc_configuration}</span></p>
                    <p><span>캐디</span><span>${it.gc_caddy}</span></p>
                    <p><span>카트</span><span>${it.gc_cart}</span></p>
                </div>
            </div>
        </div>
        
        <div class="info-detail">
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="far fa-calendar-alt"></i> 개장년도</span>
                <br>
                <span><br/>${it.gc_date}</span>
                
            </p>
            
         
            
            <p style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-user-cog"></i> 코스설계자</span>
                <br>
                <span><br/>${it.gc_architects}</span>
               
            </p>
           
            
            <p class="detail-des" style="width: 850px; ">
                <span class="item-tit"><br/><i class="fas fa-comment-alt"></i>소개</span>
                <br>
                <span><br/>${it.gc_content}</span>
                 		
            </p>          
        </div>
        
   


  <div id="map" style="width:50%; height: 50vh; margin:40px 0px 0px 300px ;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a776efec500b4b608cd15346b5f8310&libraries=services&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${it.gc_address_roadAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">찾으신 골프장</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>






  
   <div class="clear"></div>  
   <br/><br/>
   <div id="for">
	<table style="font-family: Noto Sans KR, sans-serif;">
	<tr>
		<td rowspan="2" style="vertical-align: top; width: 300px; "><h4 style="margin: 10px 0 0 170px ;"><strong>오시는 길</strong></h4></td>

		<td style="width: 720px; ">

			<strong>주소</strong><br>

			<p style="margin-top: 5px;">${it.gc_address_postcode} <!-- 우편번호 -->
										${it.gc_address_roadAddress} <!-- 도로명주소 -->
										${it.gc_address_jibunAddress} <!--  지번주소-->
										${it.gc_address_detailAddress} <!--  상세주소-->						
			</p>

			

		</td>

	</tr>

	<tr>

		<td style="width: 720px; ">

			<strong>전화안내</strong><br>

			<p style=" margin-top: 5px;">T: ${it.gc_phone}/ F:${it.gc_fax}</p>

		</td>

	</tr>

</table>

<hr style="padding: 0.1px; background-color: grey; width: 55%; margin-left: 6%"/>


<table style="font-family: Noto Sans KR, sans-serif;">	

	<tr>

		<td rowspan="2" style="vertical-align: top; width: 300px; "><h4 style="margin: 10px 0 0 170px ;"><strong>오시는 방법</strong></h4></td>

		<td style="width: 720px; ">

			<strong>자차로 이동</strong><br>


			<p style="margin-top: 5px;">${it.gc_move} </p>


		</td>

	</tr>

</table>

<hr style="padding: 0.1px; background-color: grey; width: 55%; margin-left: 6%"/>

	<h2 style="margin: 10px 0 0 170px" >리뷰</h2>
	
		<div style="margin: 10px 0 0 170px">
		<div>
		임명  : &emsp;<input name="gc_replyer" id="newGc_ReplyWriter" />
		</div>
		<br>
		<div>
		내용  :
		<br/>
		<textarea rows="4" cols="100" name="gc_replytext" id="newGc_ReplyText" ></textarea>
		</div>
		<br>
		<button id="gc_replyAddBtn" class="gc_button1">댓글 등록</button>
		</div>
		<br>
	<hr style="padding: 0.1px; background-color: grey; width: 55%; margin-left: 6%"/>
		<br>
		
		<%--댓글 수정 화면 --%>
		<div id="gc_modDiv" style="display:none; margin:10px 0px 80px 20%"><%--일단 화면에 안나오게 한다. --%>
		<div class="gc_modal-title"></div>
		<div>
			<textarea rows="4" cols="70" id="gc_replytext"></textarea>
		</div>
		<div>
			<button type="button" id="gc_replyModBtn" class="gc_button3">댓글수정</button>
			<button type="button" id="gc_replyDelBtn" class="gc_button3">댓글삭제</button>
			<button type="button" id="gc_closeBtn" onclick="gc_modDivClose();" class="gc_button3">닫기</button>
		</div>
	</div>
	
		
		
		<%--댓글 목록 --%>
		
		<ul id="gc_replies" ></ul>
		
		<%--jQuery라이브러리--%>
		<script type="text/javascript">
		
		let gc_no=${it.gc_no}; //스프링 MVC 게시판 번호값 
		getAllList()
		function getAllList(){
			$.getJSON("/gc_replies/all/"+gc_no,function(gc_data){//json데이터를 get방식으로 처리,
				//비동기식으로 가져온 데이터는 data매개변수에 저장
				 let gc_result="";
				 
				 $(gc_data).each(function(){//each()함수로 반복
					 gc_result += "<li gc_data-gc_rno='"+this.gc_rno+"' class='gc_replyLi'>"
					 +"  <span class='com' style='color:blue;font-weight:bold;'>"+this.gc_replytext
					 + "</span><button class='gc_button2'>댓글수정</button></li><hr style='padding: 0.1px; background-color: grey; width: 45%; margin-left: 15%'/><br/>"
					 
				 });
				 
				 $('#gc_replies').html(gc_result); //해당영역에 html()함수로 문자와 태그를 함께 변경적용.
				
			});
		}//댓글목록 함수
		
		</script>
		
		</div>

</body>
<script src="/js/gc_reply.js"></script>

<footer>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</footer>
</html>