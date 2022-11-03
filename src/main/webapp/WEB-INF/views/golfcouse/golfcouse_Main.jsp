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
<script src="/js/class.js"></script>
<script src="https://kit.fontawesome.com/7e87ecac1e.js" crossorigin="anonymous"></script>
 <link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">


	<script src="/js/jquery.js"></script>
	<script src="/js/class.js"></script>
	<jsp:include page="/WEB-INF/views/includes/header.jsp" />

</head>
<body>
<br><br>
<script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
</script>

<script>
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});
//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});
//저장 전송전 필드 체크 이벤트 리스너
document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});
</script>

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
                    <li id="ground-info" class="btn3" data-target-class="tab1"><button data-flag="info">정보</button></li>
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
        
        
   <!--   <div id="map" style="width:50%; height: 50vh; margin:40px 0px 0px 300px ;"></div>

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a776efec500b4b608cd15346b5f8310"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${it.gc_coordinates} ), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${it.gc_coordinates}) ; 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

</script>-->


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

			<hr style="border-color: #d1d1d1;">

		</td>

	</tr>

	<tr>

		<td style="width: 720px; ">

			<strong>전화안내</strong><br>

			<p style=" margin-top: 5px;">T: ${it.gc_phone}/ F:${it.gc_fax}</p>

		</td>

	</tr>

</table>

<hr style="padding: 0.1px; background-color: grey; width: 77%; margin-left: 6%"/>
<%-- <hr style="border-color: #000000;">--%>



<table style="font-family: Noto Sans KR, sans-serif;">	

	<tr>

		<td rowspan="2" style="vertical-align: top; width: 300px; "><h4 style="margin: 10px 0 0 170px ;"><strong>오시는 방법</strong></h4></td>

		<td style="width: 720px; ">

			<strong>자차로 이동</strong><br>


			<p style="margin-top: 5px;">${it.gc_move} </p>

		
			<%--<hr style="border-color: #d1d1d1;">--%>

		</td>

	</tr>

</table>

<hr style="padding: 0.1px; background-color: grey; width: 77%; margin-left: 6%"/>
<%-- <hr style="border-color: #000000;">--%>

<div class="wrap">
    <h1>후기</h1>
    <form name="reviewform" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 		
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
      <div class="review_contents">
            <div class="warning_msg"></div>
            <textarea rows="10"  class="review_textarea" style="width: 80% resize:none;"></textarea>
        </div>   
        <div class="cmd"> 
            <input type="button" name="save" id="save" value="등록">
        </div>
    </form>
</div>
<footer>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</footer>
</html>