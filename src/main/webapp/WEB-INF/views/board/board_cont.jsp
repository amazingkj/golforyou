<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<script src="/js/jquery.js"></script>

 <link rel="stylesheet" type="text/css" href="/css/common.css" />
 <link rel="stylesheet" type="text/css" href="/css/board.css" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" /> 
	 <script>
    // 좋아요 버튼을 클릭 시 실행되는 코드
$("#like").on("click", function () {
	$.ajax({
      url: '/board/board_cont',
      type: 'POST',
      data: { 'b_no': b_no, 'username': username },
      success: function (data) {
          if (data == 1) {             
              location.reload();
          } else {
              location.reload();
          }
      }, error: function () {
          console.log('오타 찾으세요')
      }

  });

  });

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
			var b_no=${b.b_no}; //스프링 MVC 게시판 번호값 
			getAllList()
			function getAllList(){
				$.getJSON("/replies/all/"+b_no,function(data){//json데이터를 get방식으로 처리,
					//비동기식으로 가져온 데이터는 data매개변수에 저장
					 var result="";
					 
					 $(data).each(function(){//each()함수로 반복
						 result += "<li data-r_no='"+this.r_no+"' class='replyLi'>"
						 +this.replyer +" |  <span class='com' style='color:black;font-weight:bold;'>"+this.reply
						 +"</span><br/><br/><span class='com' style='color:gray; text-align:right; font-style:italic'>"+this.updateDate
						 +"</span><button>댓글수정</button></li><br/>"
						 
					 });
					 
					 $('#replies').html(result); //해당영역에 html()함수로 문자와 태그를 함께 변경적용.
					
				});
			}//댓글목록 함수
			
     </script>
 
<meta charset="UTF-8">
<title></title>
<style type="text/css">

 #modDiv{ /*댓글 수정 화면 영역*/
 width:600px; height:100px;
 background-color:gray;
 position:absolute;
 top:50%;
 left:50%;
 margin-top: -50px; margin-left:-150px;
 padding:10px;
 z-index:1000; /*position속성값이 absolute of fixed인 곳에서 사용 가능하다. 겹쳐지는 순서 제어(값이 클 수록 위에)) */
 }
 
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
    <td>내용</td><td class="bottom_line"><div class="b_cont" ><div class="textField" style="width:100%; height:500px; resize:none; border:none;" >${b.b_cont}</div></div></td>
   </tr>
   <tr>
    <td>조회수</td><td class="bottom_line"><div class="b_hit">${b.b_hit}</div></td>
    </tr>
	 <tr>
    <td>좋아요</td><td>${b.b_like}</td>
    </tr>

	<tr><td></td>
	<td class="buttontd" colspan="2">
	<form method="post" name="deletefrm">
   <input type="button" class="CheckBtn"  value="답변" onclick="location=
	   'board_cont?b_no=${b.b_no}&page=${page}&state=reply';" />
	<c:if test="${id == b.username}">
   <input type="button" class="CheckBtn"  value="수정" onclick="location=
	   'board_cont?b_no=${b.b_no}&page=${page}&state=edit';" />
	   

<input type="hidden" id="b_no" name="b_no" value="${bc.b_no}"/>
<input type="hidden" id="page" name="page" value="${page}"/>
<input type="button" class="CheckBtn"  value="삭제" onclick="return openDelCheck();" />
 </c:if> 

	    <input type="button" class="CheckBtn" class="buttontd" value="목록" onclick="location='board_list?page=${page}';" />	   	   	   
	 <c:if test="${id != b.username}">
	 <c:if test="${!empty b.b_like}">
   <input type="button" class="CheckBtn" id=like value="좋아요" onclick="return like();"/></input>
	</c:if>
	</c:if>
	
	<c:if test="${!empty id}">
	<c:if test="${empty b.b_like}">
	<input type="button" class="CheckBtn" id=like value="좋아요 취소 " onclick="return like();"/></input>
     </c:if>
     </c:if>
     </form>
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
        
        <tr><td>
<!-- 덧글 작성 부분-->

<%--댓글 수정 화면 --%>
<div id="modDiv" style="display:none;"><%--일단 화면에 안나오게 한다. --%>
	<div class="modal-title"></div>
		<div>
			<textarea rows="3" cols="36" id="replytext"></textarea>
		</div>
		<div>
			<button type="button" id="replyModBtn">댓글수정</button>
			<button type="button" id="replyDelBtn">댓글삭제</button>
			<button type="button" id="closeBtn" onclick="modDivClose();">닫기</button>
		</div>
	</div>
		 
		<!-- <input type="hidden" id="b_no" name="b_no" value="${b.b_no}">
		<input type="hidden" id="page" name="page" value="${page}">-->

		<tr>
		<td></td><td><input type=hidden name="replyer" id="newReplyWriter" value="${b.username}" /></td>
		
		</tr>
		<tr>
		<td>댓글 내용</td><td><textarea name="reply" id="newReplyText" class="textField" style="width: 100%; hight:5%; boader-bottom: 0.3px; "></textarea></td>
		<td>
		<button type="button" class="CheckBtn" id="replyAddBtn">댓글 등록</button></td></tr>
		<tr></tr><!-- 덧글 작성 부분 끝 -->


   </table>
   
   
</div> 
<script src="/js/reply.js"></script>
</body>
</html>

<jsp:include page="/WEB-INF/views/includes/footer.jsp" /> 