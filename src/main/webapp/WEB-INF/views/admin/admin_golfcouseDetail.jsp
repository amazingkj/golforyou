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

<script src="https://kit.fontawesome.com/7e87ecac1e.js" crossorigin="anonymous"></script>
 <link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">


	<script src="/js/jquery.js"></script>
	
	<jsp:include page="/WEB-INF/views/includes/header.jsp" />

</head>
<body>
<br><br>
<style>
#modDiv{ /*댓굴 수정화면 영역 */
	width:300px; heught:100px;
	background-color:gray;
	position:absolute;
	top:50%; left:50%;
	margin-top:-50px; margin-left:-150px; padding:10px;
	z-index:1000; /* position 속성값이 absolute or fixed인 곳에서 사용가능하다. 이속성은 요소가 겹쳐지는 순간 제어 할 수 있다. 갑이 큰것이 먼저 나온다*/
}
</style>
<!--  <script>
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
</script>-->

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

 <!--<div class="wrap">
    <h1>후기</h1>
    <form name="reviewform" class="reviewform" method="post" action="/save">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
 		
        <div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
               <!--   <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>-->
            <!--  </div>
        </div>
      <div class="review_contents">
            <div class="warning_msg"></div>
            <textarea rows="10"  class="review_textarea" style="width: 80% resize:none;"></textarea>
        </div>   
        <div class="cmd"> 
            <input type="button" name="save" id="save" value="등록">
        </div> 
    </form>
</div>-->


<%-- 댓글 수정화면 --%>
<div id="modDiv" style="display: none;"> <%-- 일단 화면에 안 나오게 한다. --%>
<div class="modal-title"></div>
<div>
 <textarea rows="3" cols="36" id="replytext"></textarea>
</div>
<form>
<div>
 <button type="button" id="replyModBtn">댓글수정</button>
 <button type="button" id="replyDelBtn">댓글삭제</button>
 <button type="button" id="closeBtn" onclick="modDivClose();">닫기</button>
</div>
</form>
</div>

<h2>아작스 댓글 연습</h2>
<div>
 <div>
 댓글 작성자:<input name="gc_replyer" id="gc_newReplyWriter"/>
 </div>
 <br/>
 <div>
 	댓글내용:<textarea rows="5" cols="30" name="gc_replytext" id="gc_newReplyText"></textarea>
 </div>
  <br/>
  
  <button id="gc_replyAddBtn" type="submit">댓글 등록</button>
</div>

<br/>
<hr/>
[댓글 개수 : <b>${gc.replycnt}</b> 개]
<br/>
	<%-- 댓글 목록 --%>
	<ul id="gc_replies"></ul>
	<script type="text/javascript">
	var gc_no=${it.gc_no};//스프링 MVC 게시판 번호값,자바스크립트 에서 JSTL OR EL 사용가능 =>${gc_.gc_no}
	
	getAllList()
	function getAllList(){
		$.getJSON("/gc_replies/all/"+gc_no,function(data){//json데이터를 get방식으로 처리,비동기식으로 가져온 데이터는 data매개변수에 저장
			var gc_result="";
		
			$(data).each(function(){//each()함수로 반복
				gc_result += "<li data_gc_rno='"+this.gc_rno+"' class='replyLi'>"
				+this.rno +": <span class='com' style='color:blue;font-weight:bold;'>"+this.gc_replytext +"</span>"
				+"<button>댓글수정</button></li><br/>"
			});
			$('#gc_replies').html(gc_result);//해당영역에 html()함수로 문자와 태그를 함께 변경 적용.
		});
	}//댓글 목록 함수
	
	
	//댓글 추가
	$('#replyAddBtn').on('click',function(){
		$replyer= $('#newReplyWriter').val();//댓글 작성자
		$replytext= $('#newReplyText').val();//댓글 내용
		
		$.ajax({
			type:'post',
			url:'/gc_replies',//URL 매핑주소
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data:JSON.stringify({
				gc_no:gc_no,// 게시판 번호
				gc_replyer:$gc_replyer,//댓글 작성자
				gc_replytext:$gc_replytext //댓글 내용
			}),
			success:function(result){//비동기식으로 받아오는 것이 성공시 호출.받아온 데이터는 result매개변수에 저장
				 if(result =='SUCCESS'){
					 alert('댓글이 등록되었습니다!');
					 location.reload();//새로고침(단축키 F5)
					 getAllList();//댓글 목록함수 호출
				 }
			}
		});//jQuery 비동기식 아작스 함수 
	});
	
	//댓글 수정화면
	$('#replies').on("click",".replyLi button",function(){
		var reply = $(this).parent();//parent 부모 요소를 선택 => li태그를 가리킴
		//this는 버튼
		
		var rno = reply.attr("data-rno");//data-rno속성값을 구함 => 댓글 번호
		var replytext = reply.children('.com').text();//댓글 내용
		
		$('.modal-title').html(rno);//댓글번호를 표시
		$('#replytext').val(replytext);//댓글내용을 표시
		$('#modDiv').show('slow');//대글수정화면을 나오게한다.
	});
	
	//댓글 수정화면닫기
	function modDivClose(){
		$('#modDiv').hide('slow');
	}
	
	//댓글 수정 완료
	$('#replyModBtn').on('click',function(){
		$rno = $('.modal-title').html();//댓글 번호
		$replytext = $('#gc_replytext').val();//수정할 댓글 내용
		
		$.ajax({
			type:'put',//메서드 방식
			url:'/gc_replies/'+$gc_rno,//ReplyController.java에 등록된 매핑주소
			headers:{
				"Content-Type" :"application/json",
				"X-HTTP-Methid-Override":"PUT"
			},
			data:JSON.stringify({
				gc_replytext:$gc_replytext
			}),
			dataType:'text',//받아오는 자료형
			success:function(result){
				if(result =='SUCCESS'){
					alert('댓글이 수정 되었습니다!');
					$('#modDiv').hide('slow');//댓글 수정화면 닫기
					getAllList();//댓글 목록함수 호출
				}
			}
		});//jQuery 비동기식 아작스 함수 
	});
	
	//댓글 삭제 완료
	$('#replyDelBtn').on("click",function(){
		$rno = $('.modal-title').html();//댓글 번호
		
		$.ajax({
			type:'delete',
			url:'/gc_replies/'+$rno,
			headers:{
				"Content-Type" :"application/json",
				"X-HTTP-Methid-Override":"DELETE"
			},
			dataType:'text',
			success:function(result){
				alert("댓글이 삭제되었습니다!");
				$('#modDiv').hide('slow');
				location.reload();//새로고침 (단축키 F5)
				getAllList();
			}
		});
	});
	</script>
</body>
<footer>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
</footer>
</html>