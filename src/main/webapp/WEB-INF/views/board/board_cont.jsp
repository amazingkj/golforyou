<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<style>
input[type="submit"]{
	font-family:Font AweSome\ 5 Free;
}
</style>
<script src="/js/jquery.js"></script>

 <link rel="stylesheet" type="text/css" href="/css/common.css" />
 <link rel="stylesheet" type="text/css" href="/css/board.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
	 <script>



function openDelCheck(){
	var resultvalue = confirm('정말로 삭제하시겠습니까?');
	//var no=document.getElementById('b_no');
	//var page=document.getElementById('page');
	var frm = document.deletefrm;
	
	if(resultvalue==true){
		frm.action="board_del_ok";
		frm.submit();
		
		//document.deletefrm.submit();
		//location='board_del_ok.do';
		//location='board_cont.do?b_no=${bc.b_no}&page=${page}&state=del';
		//alert(page.value);
		//alert(no.value);
	}
	
}
		

//댓글


			let b_no=${b.b_no}; //스프링 MVC 게시판 번호값 
			getAllList()
			function getAllList(){
				$.getJSON("/replies/all/"+b_no,function(data){//json데이터를 get방식으로 처리,
					//비동기식으로 가져온 데이터는 data매개변수에 저장
					let result="";
				
					 $(data).each(function(){//each()함수로 반복
						 result += "<li data-r_no='"+this.r_no+"' class='replyLi'>"
						 +this.replyer +" |  <span class='com' style='color:black;font-weight:bold;'>"+this.reply
						 +"</span><br/><br/><span class='date' style='color:gray; text-align:right; font-style:italic'>"+this.updateDate
						 +"</span> <c:if test="${rolecheck == 'ROLE_ADMIN'}"><button class='button'>수정</button></c:if></li><br/>";
						 //c:if 내 true 되게 잘 해봅시다.
					 });
					 
					 $('#replies').html(result); //해당영역에 html()함수로 문자와 태그를 함께 변경적용.
					
				});
			}//댓글목록 함수
			
			
			
     </script>
 
<meta charset="UTF-8">
<title>GolForyou</title>
<style type="text/css">
 
</style>

</head>
 <div class="clear"></div>
 <body class="tablebody">
 <Br><br>
<div id="bWrite_wrap" class="bWrite_wrap" style="margin-top: 200px" >
  <table id="bCont_t" class="tablebox">
   <tr>
    <td style="width:100px;" >제목</td><td class="bottom_line"><div class="b_title"><div name="b_title" class="textField" size="100%">${b.b_title}</div></div></td>
   </tr>
   <tr>
    <td>내용</td><td class="bottom_line"><div class="b_cont" ><div class="textField" style="width:100%; height:500px; overflow-y:scroll; resize:none; border:none;" >${b.b_cont}</div></div></td>
   </tr>
   <tr>
    <td>조회수</td><td class="bottom_line"><div class="b_hit">${b.b_hit}</div></td>
    </tr>
	 <tr>
    <td>
     <%-- 좋아요--%>
    <div id="like">
    <c:choose>
        <c:when test="${check == 0}">
        <form method="post" action="likeupload_yes">
           <button type="submit" id="likebtn" name="likebtn" class="btn btn-light" value="좋아요"><i class="far fa-heart" style="color:#56F569"></i>&nbsp;좋아요</button>
            
            <input type="hidden" id="likecheck" name="likecheck_yes" value="${check}">
             <input type="hidden" id="nickname" name="nickname_yes" value="${nickname}">
             <input type="hidden" id="bno" name="bno_yes" value="${b.b_no}">
             <input type="hidden" id="page" name="page" value="${page}">
        </form>
        </c:when>
        
        <c:when test="${check == 1}">
        <form method="post" action="/likeupload_no">
        	<button type="submit" id="likebtn" name="likebtn" class="btn btn-danger"><i class="fas fa-heart"  style="color:#56F569"></i>&nbsp;좋아요<br>취소</button>
             
             <input type="hidden" id="likecheck" name="likecheck_no" value="${check}">
               <input type="hidden" id="nickname" name="nickname_no" value="${nickname}">
               <input type="hidden" id="bno" name="bno_no" value="${b.b_no}">
               <input type="hidden" id="page" name="page" value="${page}">
        </form>
        </c:when>	
    </c:choose>	  			
	</div>
    
    </td><td id='likeCount' >${likestotal }  Likes</td>
    </tr>
    
     <%-- 좋아요 버튼 테스트중 --%>
	
	<tr><td></td>
	<td class="buttontd" colspan="2">
	<form method="post" name="deletefrm">
   <input type="button" class="CheckBtn"  value="답변" onclick="location=
	   'board_cont?b_no=${b.b_no}&page=${page}&state=reply';" />
	<c:if test="${id == b.username}">
   <input type="button" class="CheckBtn"  value="수정" onclick="location=
	   'board_cont?b_no=${b.b_no}&page=${page}&state=edit';" />
	   

<input type="hidden" id="b_no" name="b_no" value="${b.b_no}"/>
<input type="hidden" id="page" name="page" value="${page}"/>
<input type="button" class="CheckBtn"  value="삭제" onclick="return openDelCheck();" />
 </c:if> 

	    <input type="button" class="CheckBtn" class="buttontd" value="목록" onclick="location='board_list?page=${page}';" />	   	   	   

     </form>
  
		<!-- 덧글 작성 시작 -->
		<!-- <input type="hidden" id="b_no" name="b_no" value="${b.b_no}">
		<input type="hidden" id="page" name="page" value="${page}">-->
 		
		<tr>
		<td></td><td><input type=hidden name="replyer" id="newReplyWriter" value="${nickname}" /></td>
		</tr>
		<tr>
		<td colspan="2"><textarea name="reply" id="newReplyText" class="textField" style="width: 90%; hight:5%; border-bottom: 2px; " placeholder="댓글을 입력해주세요" border></textarea>
		<button type="button" class="CheckBtn" id="replyAddBtn">댓글 등록</button>
		
		</td>
		</tr>
		<!-- 덧글 작성 부분 끝 -->
		
		
<%--댓글 수정 화면 시작--%>
        <tr><td colspan="2">

<div id="modDiv" style="display:none;"><%--일단 화면에 안나오게 한다. --%>
	<div class="modal-title"></div>
		<div>
			<textarea rows="4" cols="50" id="replytext" style="width: 83%; hight:5%;" ></textarea>
			<input type=hidden id="replydate"/>
			<button type="button" id="replyModBtn" class="CheckBtn" style="width: 4%"> 수정 </button>
			<button type="button" id="replyDelBtn" class="CheckBtn" style="width: 4%"> 삭제 </button>
			<button type="button" id="closeBtn" onclick="modDivClose();" class="CheckBtn" style="width: 4%"> 닫기 </button>
		</div>
	</div>
	</td>
 	</tr>
 	<%--댓글 수정 화면 끝--%>
		
   <tr>
     <td colspan="2"><div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>댓글
			</div>
			<br>
			<div class="panel-body">
				<ul id="replies"></ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>
        </td></tr>
        
   </table>
   
   
</div> 
<script src="/js/reply.js"></script>
<script src="/js/board.js"></script>
<script src="/js/likes.js"></script>
</body>
</html>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" /> 