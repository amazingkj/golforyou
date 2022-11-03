<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<script src="/js/jquery.js"></script>
<div class="clear"></div>
<style>

#wrap{
	clear:both;
	display:none; 
	margin: 0; auto;
	overflow: hidden;
}
.findPwd{
    display: flex;
    align-items: center;
    justify-content: center;
    background: url(/images/member/login3.png) no-repeat center center fixed; 
    -webkit-background-size: cover;
  	-moz-background-size: cover;
 	-o-background-size: cover;
 	background-size: cover;
	
}
.loginForm, .findPwdForm{
    width: 300px;
    background-color: #EEEFF1;
    margin:auto;
    padding: 20px;
    text-align: center;
    border: none;
	vertical-align: middle;
    align-items: center;
    justify-content: center;	
}

</style>
<script src="/js/jquery.js"></script>
<script>
   function emailAuthentication() { //이메일 입력 유효검증 후, emailValCheck() 호출 후 결과값 확인,
	   //결과값이 true라면 새 창에 email정보를 get방식으로 전송
      if ($.trim($('#email').val()) == '') {
         alert('이메일을 입력하세요!');
         $('#email').val('').focus();
         return false;
      }
   }
 /*  
      $email =  $("#email").val(); 		//username을 param
      $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 비동기식 아작스 실행
          type:"POST",//데이터를 서버로 보내는 방법
         	//url:"./member/member_idcheck.jsp",    
          url:"/idcheck", //아작스 서버 주소 파일명
          data: {"memail":$email},  //좌측 id 피라미터 이름에 우측 $username변수값을 저장
          datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
          success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
          	//서버 데이터를 data변수에 저장
        	  if(data= 0){//DB에 메일 주소가 없으면
        	  
        	  alert("해당 이메일 주소로 가입한 계정이 없습니다./n다시 확인해주세요");        		
            	$("#email").val('').focus();
            	return false;
  	     
        	  }
        	      	  
          },
          
          
      	  error:function(){//비동기식 아작스로 서버디비 데이터를
      		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
      		  alert("서버가 연결되어 있지 않습니다\n관리자에게 문의하세요.");
      	  }
        });//$.ajax
     */   
   
	
   /*
	if (!emailValCheck()){
    	 return false;
    	}
    var url = "confirmEmail.do?email=" + document.signUpForm.email.value;
    open(url, "confirm",
    "toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
    }

    	  
      
   const form = document.signUpForm;  //const form : email을 포함하는 form의 위치
   
   function emailValCheck(){ //emailPattern : 이메일 정규식 패턴
		var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = form.email.value;
		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false; //check(pattern, target, message)를 호출하고 결과알림(새창)
		}
	    return true;
	}
   
  
   function check(pattern, target, message) { 
	   //target을 pattern으로 검사해서 유효하면 true
   	if(pattern.test(target)) {
       	return true;
       }
       alert(message);
       target.focus();
       return false;
   }
   */
   

</script>

<%-- 비밀번호 찾기--%>
<body class="findPwd">

<div class="findPwdForm">

<div>
<H3>비밀번호 찾기</H3><br>
<span>계정에 연결된 이메일 주소를 입력하시면,<br>임시 비밀번호 발송해드립니다.</span><br><br>
<hr/>
<br>
</div>

<div>
<form name="signUpForm" action="/findPwd_ok" method="post" onsubmit="return emailAuthentication();" accept-charset="UTF-8">
<input type="email" name="email" class="textField" id="inputEmailForm" placeholder="example aaa@google.net"><br>
<button type="submit" id="btn_change_password" class="submitBtn" >인증메일 전송</button>
</form> 
</div>
</div>

</body>


