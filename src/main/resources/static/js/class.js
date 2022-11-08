/*class.js*/


/* 강사 등록 시 유효성 검사 */
function write_check_teacher() {
	if($.trim($("#tname").val())==""){
		alert("강사명을 입력해주세요!");
		$("#tname").val("").focus();
		return false;
	}
	if(form5.tgender.value == 'none'){
   		alert("강사 성별을 선택해주세요!");
   		return false;
  	}
	if($.trim($("#tcareer").val())==""){
		alert("강사 소개 또는 경력 사항을 입력해주세요!");
		$("#tcareer").val("").focus();
		return false;
	}
}

/* 강사 정보 수정 시 유효성 검사 */
function edit_check_teacher() {
	if($.trim($("#tname").val())==""){
		alert("강사명을 입력해주세요!");
		$("#tname").val("").focus();
		return false;
	}
	if(form7.tgender.value == 'none'){
   		alert("강사 성별을 선택해주세요!");
   		return false;
  	}
	if($.trim($("#tcareer").val())==""){
		alert("강사 소개 또는 경력 사항을 입력해주세요!");
		$("#tcareer").val("").focus();
		return false;
	}
}

/* 필드 클래스 등록 시 유효성 검사 */
function write_check_field(){
	if($.trim($("#ftitle").val())==""){
		alert("클래스명을 입력해주세요!");
		$("#ftitle").val("").focus();
		return false;
	}
	if(form1.tname.value == 'none'){
   		alert("강사명을 선택해주세요!");
   		return false;
  	}
	if($.trim($("#fphone").val())==""){
		alert("클래스 전화번호를 입력하세요!");
		$("#fphone").val("").focus();
		return false;
	}
	if(form1.faddr.value == 'none'){
   		alert("클래스 지역을 선택해주세요!");
   		return false;
  	}
	var fileCheck = document.getElementById("fimage2").value;
    if(!fileCheck){
        alert("썸네일 이미지를 첨부해주세요!");
        return false;
    }
	if($.trim($("#fsprice").val())==""){
		alert("STANDARD 가격을 입력하세요!");
		$("#fsprice").val("").focus();
		return false;
	}
	if($.trim($("#fsrounding").val())==""){
		alert("STANDARD 라운딩 횟수를 입력하세요!");
		$("#fsrounding").val("").focus();
		return false;
	}
	if($.trim($("#fsdesc").val())==""){
		alert("STANDARD 상세 설명을 입력하세요!");
		$("#fsdesc").val("").focus();
		return false;
	}
	if($.trim($("#fstime").val())==""){
		alert("STANDARD 1회당 레슨 시간(분)을 입력하세요!");
		$("#fstime").val("").focus();
		return false;
	}
	if($.trim($("#fdprice").val())==""){
		alert("DELUCE 가격을 입력하세요!");
		$("#fdprice").val("").focus();
		return false;
	}
	if($.trim($("#fdrounding").val())==""){
		alert("DELUXE 라운딩 횟수를 입력하세요!");
		$("#fdrounding").val("").focus();
		return false;
	}
	if($.trim($("#fddesc").val())==""){
		alert("DELUXE 상세 설명을 입력하세요!");
		$("#fddesc").val("").focus();
		return false;
	}
	if($.trim($("#fdtime").val())==""){
		alert("DELUXE 1회당 레슨 시간(분)을 입력하세요!");
		$("#fdtime").val("").focus();
		return false;
	}
	if($.trim($("#fpprice").val())==""){
		alert("PREMIUM 가격을 입력하세요!");
		$("#fpprice").val("").focus();
		return false;
	}
	if($.trim($("#fprounding").val())==""){
		alert("PREMIUM 라운딩 횟수를 입력하세요!");
		$("#fprounding").val("").focus();
		return false;
	}
	if($.trim($("#fpdesc").val())==""){
		alert("PREMIUM 상세 설명을 입력하세요!");
		$("#fpdesc").val("").focus();
		return false;
	}	
	if($.trim($("#fptime").val())==""){
		alert("PREMIUM 1회당 레슨 시간(분)을 입력하세요!");
		$("#fptime").val("").focus();
		return false;
	}
}

/* 필드 클래스 수정 시 유효성 검사 */
function edit_check_field(){
	if($.trim($("#ftitle").val())==""){
		alert("클래스명을 입력해주세요!");
		$("#ftitle").val("").focus();
		return false;
	}
	if(form3.tname.value == 'none'){
   		alert("강사명을 선택해주세요!");
   		return false;
  	}
	if($.trim($("#fphone").val())==""){
		alert("클래스 전화번호를 입력하세요!");
		$("#fphone").val("").focus();
		return false;
	}
	if(form3.faddr.value == 'none'){
   		alert("클래스 지역을 선택해주세요!");
   		return false;
  	}
	var fileCheck = document.getElementById("fimage2").value;
    if(!fileCheck){
        alert("썸네일 이미지를 첨부해주세요!");
        return false;
    }
	if($.trim($("#fsprice").val())==""){
		alert("STANDARD 가격을 입력하세요!");
		$("#fsprice").val("").focus();
		return false;
	}
	if($.trim($("#fsrounding").val())==""){
		alert("STANDARD 라운딩 횟수를 입력하세요!");
		$("#fsrounding").val("").focus();
		return false;
	}
	if($.trim($("#fsdesc").val())==""){
		alert("STANDARD 상세 설명을 입력하세요!");
		$("#fsdesc").val("").focus();
		return false;
	}
	if($.trim($("#fstime").val())==""){
		alert("STANDARD 1회당 레슨 시간(분)을 입력하세요!");
		$("#fstime").val("").focus();
		return false;
	}
	if($.trim($("#fdprice").val())==""){
		alert("DELUCE 가격을 입력하세요!");
		$("#fdprice").val("").focus();
		return false;
	}
	if($.trim($("#fdrounding").val())==""){
		alert("DELUXE 라운딩 횟수를 입력하세요!");
		$("#fdrounding").val("").focus();
		return false;
	}
	if($.trim($("#fddesc").val())==""){
		alert("DELUXE 상세 설명을 입력하세요!");
		$("#fddesc").val("").focus();
		return false;
	}
	if($.trim($("#fdtime").val())==""){
		alert("DELUXE 1회당 레슨 시간(분)을 입력하세요!");
		$("#fdtime").val("").focus();
		return false;
	}
	if($.trim($("#fpprice").val())==""){
		alert("PREMIUM 가격을 입력하세요!");
		$("#fpprice").val("").focus();
		return false;
	}
	if($.trim($("#fprounding").val())==""){
		alert("PREMIUM 라운딩 횟수를 입력하세요!");
		$("#fprounding").val("").focus();
		return false;
	}
	if($.trim($("#fpdesc").val())==""){
		alert("PREMIUM 상세 설명을 입력하세요!");
		$("#fpdesc").val("").focus();
		return false;
	}	
	if($.trim($("#fptime").val())==""){
		alert("PREMIUM 1회당 레슨 시간(분)을 입력하세요!");
		$("#fptime").val("").focus();
		return false;
	}
}

/* 온라인 클래스 등록 시 유효성 검사 */
function write_check_online(){
	if($.trim($("#otitle").val())==""){
		alert("클래스명을 입력해주세요!");
		$("#otitle").val("").focus();
		return false;
	}
	if(form2.tname.value == 'none'){
   		alert("강사명을 선택해주세요!");
   		return false;
  	}
	if($.trim($("#ophone").val())==""){
		alert("클래스 전화번호를 입력하세요!");
		$("#ophone").val("").focus();
		return false;
	}
	var fileCheck = document.getElementById("oimage2").value;
    if(!fileCheck){
        alert("썸네일 이미지를 첨부해주세요!");
        return false;
    }
	if($.trim($("#oprice").val())==""){
		alert("온라인 클래스 가격을 입력하세요!");
		$("#oprice").val("").focus();
		return false;
	}
	if($.trim($("#odesc").val())==""){
		alert("온라인 클래스 상세 설명을 입력하세요!");
		$("#odesc").val("").focus();
		return false;
	}
	if(form2.otime.value == 'none'){
   		alert("온라인 클래스 수강기간을 선택해주세요!");
   		return false;
  	}
	if(form2.olevel.value == 'none'){
   		alert("온라인 클래스 추천 레벨을 선택해주세요!");
   		return false;
  	}  	
}

/* 온라인 클래스 수정 시 유효성 검사 */
function edit_check_online(){
	if($.trim($("#otitle").val())==""){
		alert("클래스명을 입력해주세요!");
		$("#otitle").val("").focus();
		return false;
	}
	if(form4.tname.value == 'none'){
   		alert("강사명을 선택해주세요!");
   		return false;
  	}
	if($.trim($("#ophone").val())==""){
		alert("클래스 전화번호를 입력하세요!");
		$("#ophone").val("").focus();
		return false;
	}
	var fileCheck = document.getElementById("oimage2").value;
    if(!fileCheck){
        alert("썸네일 이미지를 첨부해주세요!");
        return false;
    }
	if($.trim($("#oprice").val())==""){
		alert("온라인 클래스 가격을 입력하세요!");
		$("#oprice").val("").focus();
		return false;
	}
	if($.trim($("#odesc").val())==""){
		alert("온라인 클래스 상세 설명을 입력하세요!");
		$("#odesc").val("").focus();
		return false;
	}
	if(form4.otime.value == 'none'){
   		alert("온라인 클래스 수강기간을 선택해주세요!");
   		return false;
  	}
	if(form4.olevel.value == 'none'){
   		alert("온라인 클래스 추천 레벨을 선택해주세요!");
   		return false;
  	}  	
}


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

