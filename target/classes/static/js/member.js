/**
 * member.js
 */
//아이디 중복확인
    /* end */	
    let idck = 0;
    let oldVal ='';
   	
  
   function idcheck(){
	  if ($.trim($('#username').val()) == '') {//trim()함수는 양쪽 공백을 제거
       alert('아이디를 입력하세요!');
       $('#username').focus();
       return false;
    }
   
    
	  $username =  $("#username").val(); 		//username을 param
      $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 비동기식 아작스 실행
          type:"POST",//데이터를 서버로 보내는 방법
         	//url:"./member/member_idcheck.jsp",    
          url:"/idcheck", //아작스 서버 주소 파일명
          data: {"username":$username},  //좌측 id 피라미터 이름에 우측 $username변수값을 저장
          datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
          success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
          	//서버 데이터를 data변수에 저장
        	  if(data> 0){//중복 아이디가 있다면
        	  
        	  alert("중복 아이디 입니다");        		
            	$("#username").val('').focus();
            	return false;
  	     
        	  }else{//중복 아이디가 아니면
        	 alert("사용 가능한 아이디 입니다");
    			$("#nickname").focus(); 
        		//아이디가 중복하지 않으면  idck = 1 	
                 idck = 1;             	
             	 oldVal=$.trim($('#username').val());
        	  }  	
        	      	  
          },
          
          
      	  error:function(){//비동기식 아작스로 서버디비 데이터를
      		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
      		  alert("data error 서버가 연결되어 있지 않습니다");
      	  }
        });//$.ajax
        
             
   			$("#username").on("propertychange change keyup paste input", function() {  //다섯가지의 이벤트가 모두 리슨 상태
  			let currentVal = $(this).val();  		
  			if(currentVal == oldVal) {
				return;
   		 		    
  		 	}
 		
  			oldVal = currentVal;  			
  			idck = 0;
			});
    
                 
	}

function join_check(){	
	  if ($.trim($('#username').val()) == '') {//trim()함수는 양쪽 공백을 제거
       alert('아이디를 입력하세요!');
       $('#username').val('').focus();
       return false;
    }
    
 	if ($.trim($('#nickname').val()) == '') {//trim()함수는 양쪽 공백을 제거
       alert('닉네임을 입력하세요!');
       $('#nickname').val('').focus();
       return false;
    }

    if ($.trim($('#password').val()) == '') {
       alert('비밀번호를 입력하세요!');
       $('#password').val('').focus();
       return false;
    }

    
    if ($.trim($('#pwCheck').val()) == '') {
       alert('비밀번호를 다시 한 번 입력하세요!');
       $('#pwCheck').val('').focus();
       return false;
    }
    
     if ($.trim($('#pwCheck').val()) != $.trim($('#password').val())) {
       alert('비밀번호와 비밀번호확인에 입력한 비밀번호가 서로 다릅니다!');
       $('#pwCheck').val('').focus();
       return false;
    }
    
    
    if ($.trim($('#mphone').val()) == '') {
       alert('휴대폰 번호를 입력하세요!');
       $('#mphone').val('').focus();
       return false;
    }
    
    if ($.trim($('#memail').val()) == '') {
       alert('이메일을 입력하세요!');
       $('#memail').val('').focus();
       return false;
    }
    
    if ($.trim($('input[name=mgender]:radio:checked').val()) == '') {
        alert('성별을 선택하세요');
        $('#memail').val('').focus();
        return false;
     }
     
    if(confirm("회원가입을 하시겠습니까?")){
    if(idck==0){
          alert('아이디 중복체크를 해주세요');
           $('#username').focus();
          return false;
      }

	 if($.trim($('#username').val()) != validUsername){
		alert('아이디 중복체크를 다시 해주세요');
		 $('#username').val('').focus();
          return false;
		}else{
  
      $("#frm").submit();
      alert("회원가입을 축하합니다");
      }
     
}
}

function joinOauth_check(){	
	 
    
 	if ($.trim($('#nickname').val()) == '') {//trim()함수는 양쪽 공백을 제거
       alert('닉네임을 입력하세요!');
       $('#nickname').val('').focus();
       return false;
    }


    
    if ($.trim($('#mphone').val()) == '') {
       alert('휴대폰 번호를 입력하세요!');
       $('#mphone').val('').focus();
       return false;
    }
    

      $("#frm").submit();
      alert("반영되었습니다.");
     
     
}



   function email_Check(){  //작업중 더블체크할 것 

	//이메일 중복확인
       $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 비동기식 아작스 실행
           type:"POST",//데이터를 서버로 보내는 방법
           url:"emailcheck.do", //아작스 서버 주소 파일명
           data: {"email":$m_email},  
           datatype:"String",//서버의 실행된 결과값을 사용자로 받아오는 방법
           success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           	//서버 데이터를 data변수에 저장
         	  if(data==1){//중복 아이디가 있다면
         		$newtext='<font color="red" size="2"><b>중복 이메일이 있습니다.</b></font>';
         		$("#emailcheck").text('');
           	$("#emailcheck").show();
           	$("#emailcheck").append($newtext);          		
             	$("#m_email").val('').focus();
             	return false;
   	     
         	  }else{//중복 아이디가 아니면
         		$newtext='<font color="blue" size="2"><b>사용가능한 이메일입니다.</b></font>';
         		$("#emailcheck").text('');
         		$("#emailcheck").show();
         		$("#emailcheck").append($newtext);
         		$("#password").focus(); //포커스값 재설정 하기
         	  }  	    	  
           },
       	  error:function(){//비동기식 아작스로 서버디비 데이터를
       		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
       		  alert("data error");
       	  }
         });//$.ajax
    /* end */	


}


//정규표현식
function validate_userid($username)
{
  var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
  //자와 숫자 와 _조합으로 처리
  return pattern.test($username);
};


//메일 주소 선택과 직접입력
function domain_list(){
  var num=m.mail_list.selectedIndex;//선택한 목록 항목 번호
  if(num == -1){//목록이 선택되지 않았을때 실행
	  return true;
  }
  if(m.mail_list.value =="직접입력"){
	  m.mail_domain.value = "";
	  m.mail_domain.readOnly=false;//쓰기 가능
	  m.mail_domain.focus();//입력박스로 포커스 이동
  }else{//목록에서 멜주소를 선택한 경우
	 m.mail_domain.value=m.mail_list.options[num].value;
	 //목록 옵션 value값이 멜도메인 입력박스로 입력
	 m.mail_domain.readOnly=true;//읽기만 가능
  }
}//domain_list()

//member_edit.jsp 유효성 검증
function edit_check(){
	$mem_pwd=$.trim($("#mem_pwd").val());
	$mem_pwd2=$.trim($("#mem_pwd2").val());
	if($mem_pwd == ""){
		alert("비번을 입력하세요!");
		$("#mem_pwd").val("").focus();
		return false;
	}
	if($mem_pwd2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mem_pwd2").val("").focus();
		return false;
	}
	if($mem_pwd != $mem_pwd2){
		alert("비번이 다릅니다!");
		$("#mem_pwd").val("");//비번 입력박스를 초기화
		$("#mem_pwd2").val("");
		$("#mem_pwd").focus();
		return false;
	}
	if($.trim($("#mem_name").val())==""){
		alert("회원이름을 입력하세요!");
		$("#mem_name").val("").focus();
		return false;
	}
	if($.trim($("#mem_zip").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}
	if($.trim($("#mem_zip2").val())==""){
		alert("우편번호를 입력하세요!");		
		return false;
	}
	if($.trim($("#mem_addr").val())==""){
		alert("주소를 입력하세요!");		
		return false;
	}
	if($.trim($("#mem_addr2").val())==""){
		alert("나머지 주소를 입력하세요!");
		$("#mem_addr2").val("").focus();
		return false;
	}
	if($.trim($("#mem_phone02").val())==""){
		alert("폰번호를 입력하세요!");
		$("#mem_phone02").val("").focus();
		return false;
	}
	if($.trim($("#mem_phone03").val())==""){
		alert("폰번호를 입력하세요!");
		$("#mem_phone03").val("").focus();
		return false;
	}
	if($.trim($("#mail_id").val())==""){
		alert("전자우편을 입력하세요!");
		$("#mail_id").val("").focus();
		return false;
	}
	if($.trim($("#mail_domain").val())==""){
		alert("전자우편을 입력하세요!");		
		return false;
	}
}//edit_check()









































