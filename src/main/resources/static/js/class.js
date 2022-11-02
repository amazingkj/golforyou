/*class.js*/

let teacherList = [];

/* 클래스 상세 페이지 */
$(function(){
	// 탭 컨텐츠 숨기기
	$(".tab_content").hide();
	
	// 첫번째 탭콘텐츠 보이기
	$(".tab_container").each(function () {
	  $(this).children(".tabs li:first").addClass("active"); //Activate first tab
	  $(this).children(".tab_content").first().show();
	});
	//탭메뉴 클릭 이벤트
	$(".tabs li a").click(function () {
	  
	  $(this).parent().siblings("li").removeClass("active");
	  $(this).parent().addClass("active"); $(this).parent().parent().parent().parent().find(".tab_content").hide();
	  var activeTab = $(this).attr("rel");
	   $("#" + activeTab).fadeIn();
	});
	
	//강사 목록
	$.ajax({
        type: "GET",
        url: "/api/teacher_list_all",
        dataType: "json",
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        success: function(data) {
          // console.log("통신데이터 값 : ", data);
          teacherList = data;
          data.forEach((item)=>{
          	//console.log(item.tname);
          	$("#tname").append('<option value="'+ item.tno +'">'+item.tname+'</option>');
          })
        },
        error: function() {
          console.log('통신실패!!');
        }
      });
      
       $("#tname").change(function(event){
       		//console.log(event.target.value);
       		let filteredTeacherList = teacherList.filter((item) => item.tno == event.target.value )
   			$("#tcareer").text(filteredTeacherList[0].tcareer);
   			$("#tgender").val( filteredTeacherList[0].tgender ).prop("selected", true);
  	   });
});


/* 관리자 페이지에서 클래스 등록 */
function categoryChange(e) {
	var good_a = ["경기도 전체", "서울", "인천"];
	var good_b = ["강원도 전체", "춘천", "속초"];
	var good_c = ["충청도 전체", "대전", "세종"];
	var good_d = ["전라도 전체", "광주", "전주"];
	var good_e = ["경상도 전체", "부산", "대구", "울산"];
	var good_f = ["제주도 전체", "제주시", "서귀포시"];
	var target = document.getElementById("good");

	if(e.value == "a") var d = good_a;
	else if(e.value == "b") var d = good_b;
	else if(e.value == "c") var d = good_c;
	else if(e.value == "d") var d = good_d;
	else if(e.value == "e") var d = good_e;
	else if(e.value == "f") var d = good_f;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}


function write_check_field(){
	if($.trim($("#ctitle").val())==""){
		alert("빈칸을 입력해주세요!");
		$("#ctitle").val("").focus();
		return false;
	}
	if($.trim($("#cteacher").val())==""){
		alert("강사명을 입력하세요!");
		$("#cteacher").val("").focus();
		return false;
	}
	if($.trim($("#cgender").val())==""){
		alert("강사 성별을 선택하세요!");
		$("#cgender").val("").focus();
		return false;
	}
	if($.trim($("#ccareer").val())==""){
		alert("강사 소개 또는 경력사항란을 입력하세요!");
		$("#ccareer").val("").focus();
		return false;
	}
	if($.trim($("#cphone").val())==""){
		alert("클래스 전화번호를 입력하세요!");
		$("#cphone").val("").focus();
		return false;
	}
	if($.trim($("#csprice").val())==""){
		alert("STANDARD 가격을 입력하세요!");
		$("#csprice").val("").focus();
		return false;
	}
	if($.trim($("#csrounding").val())==""){
		alert("STANDARD 라운딩 횟수를 입력하세요!");
		$("#csrounding").val("").focus();
		return false;
	}
	if($.trim($("#csdesc").val())==""){
		alert("STANDARD 상세 설명을 입력하세요!");
		$("#csdesc").val("").focus();
		return false;
	}
	if($.trim($("#cstime").val())==""){
		alert("STANDARD 1회당 레슨 시간(분)을 입력하세요!");
		$("#cstime").val("").focus();
		return false;
	}
	if($.trim($("#cdprice").val())==""){
		alert("DELUCE 가격을 입력하세요!");
		$("#cdprice").val("").focus();
		return false;
	}
	if($.trim($("#cdrounding").val())==""){
		alert("DELUXE 라운딩 횟수를 입력하세요!");
		$("#cdrounding").val("").focus();
		return false;
	}
	if($.trim($("#cddesc").val())==""){
		alert("DELUXE 상세 설명을 입력하세요!");
		$("#cddesc").val("").focus();
		return false;
	}
	if($.trim($("#cdtime").val())==""){
		alert("DELUXE 1회당 레슨 시간(분)을 입력하세요!");
		$("#cdtime").val("").focus();
		return false;
	}
	if($.trim($("#cpprice").val())==""){
		alert("PREMIUM 가격을 입력하세요!");
		$("#cpprice").val("").focus();
		return false;
	}
	if($.trim($("#cprounding").val())==""){
		alert("PREMIUM 라운딩 횟수를 입력하세요!");
		$("#cprounding").val("").focus();
		return false;
	}
	if($.trim($("#cpdesc").val())==""){
		alert("PREMIUM 상세 설명을 입력하세요!");
		$("#cpdesc").val("").focus();
		return false;
	}	
	if($.trim($("#cptime").val())==""){
		alert("PREMIUM 1회당 레슨 시간(분)을 입력하세요!");
		$("#cptime").val("").focus();
		return false;
	}
	if($.trim($("#caddr").val())==""){
		alert("지역을 선택하세요!");
		$("#caddr").val("").focus();
		return false;
	}
	if($.trim($("#caddr2").val())==""){
		alert("상세 지역을 선택하세요!");
		$("#caddr2").val("").focus();
		return false;
	}
	return true;
}
