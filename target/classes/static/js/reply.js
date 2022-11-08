
		//댓글 추가 
		console.log('시작');
		$('#replyAddBtn').on("click",function(){
			
		console.log('아작스');
		$replyer = $('#newReplyWriter').val();//댓글 작성자 
		$reply = $('#newReplyText').val();//댓글 내용
		
	
	$.ajax({
		type:'post',
		url:'/replies/',//URL매핑주소
		headers:{
		 "Content-Type":"application/json",
		 "X-HTTP-Method-Override" :"POST"
		}, 
		dataType:'text',
		data:JSON.stringify({
			b_no:b_no, //게시판 번호 
			replyer:$replyer, //댓글 작성자 
			reply:$reply //댓글내용 
			
		}),
		
		success:function(result){ 
			//비동기식으로 받아오는 것이 성공시 호출. 받아온 데이터는 result매개변수에 저장
			if(result == 'SUCCESS'){
				alert('댓글이 등록되었습니다!');
				$('#newReplyText').val('');
				//location.reload();//새로고침(단축키 F5)
				getAllList();//댓글 목록 함수 호출 
			}
						
		},
		
      	  error:function(){//비동기식 아작스로 서버디비 데이터를
      		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
      		  alert("댓글을 입력하지 않으셨거나, 서버가 연결되어 있지 않습니다");
      	  }
	});
	
});
		console.log('끝');
		
		//댓글 수정 화면 
			$('#replies').on("click",".replyLi button",function(){
	
			let reply = $(this).parent(); //부모요소를 선택 => li태그를 가리킴 this는 버튼 
			let r_no =reply.attr("data-r_no"); //data-rno속성값을 구함 =>댓글 번호 
			let replytext=reply.children('.com').text(); //댓글 내용 
			let date=reply.children('.date').text(); 
			
			$('.modal-title').html(r_no); //댓글번호를 표시
			$('#replytext').val(replytext);//댓글내용을 표시 
			$('#replydate').val(date);
			$('#modDiv').show('slow');//댓글수정화면을 나오게 한다. 
				
			});
			
			
			//댓글 수정 화면 닫기 
		function modDivClose(){
			$('#modDiv').hide('slow');			
		}
		
		$('#replyModBtn').on('click',function(){
			$r_no = $('.modal-title').html(); //댓글 번호 
			$reply = $("#replytext").val(); //수정할 댓글 내용 
			
			$.ajax({
				type:'put', //메서드 방식 
				url:'/replies/'+$r_no, //ReplyController.jave에 등록된 매핑주소 경로 
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override" :"PUT"
				},
				data:JSON.stringify({
					reply:$reply
				}),
				dataType:'text', //받아오는 자료형
				success:function(result){
					if(result == 'SUCCESS'){
						alert('댓글이 수정되었습니다!');
						$('#modDiv').hide('slow');//댓글 수정화면 닫기 
						getAllList();//댓글 목록 함수 호출
						
					}
				}
			});//비동기식 jQuery 아작스 함수
		});

		
		$('#replyDelBtn').on("click",function(){
			$r_no = $('.modal-title').html();//댓글 번호 
			
			$.ajax({
				type:'delete',
				url:'/replies/'+$r_no,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"
				},
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert("댓글이 삭제되었습니다!");
						$('#modDiv').hide('slow');
						getAllList();
					}
				}
			});
		 });
		 
		 
		 
		 