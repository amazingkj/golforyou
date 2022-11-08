
		//댓글 추가 
		console.log('시작');
		$('#gc_replyAddBtn').on("click",function(){
			
		console.log('아작스');
		$gc_replyer = $('#newGc_ReplyWriter').val();//댓글 작성자 
		$gc_reply = $('#newGc_ReplyText').val();//댓글 내용
		
		
	
	$.ajax({
		type:'post',
		url:'/gc_replies/',//URL매핑주소
		headers:{
		 "Content-Type":"application/json",
		 "X-HTTP-Method-Override" :"POST"
		}, 
		dataType:'text',
		data:JSON.stringify({
			gc_no:gc_no, //게시판 번호 
			gc_replyer:$gc_replyer, //댓글 작성자 
			gc_replytext:$gc_reply //댓글내용 
			
		}),
		
		success:function(result){ 
			//비동기식으로 받아오는 것이 성공시 호출. 받아온 데이터는 result매개변수에 저장
			if(result == 'SUCCESS'){
				alert('댓글이 등록되었습니다!');
				//location.reload();//새로고침(단축키 F5)
				getAllList();//댓글 목록 함수 호출 
			}
						
		},
		
      	  error:function(){//비동기식 아작스로 서버디비 데이터를
      		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
      		  alert("댓글을 입력하지 않았거나 서버가 연결되어 있지 않습니다");
      	  }
	});
	
});
		console.log('끝');
		
		//댓글 수정 화면 
			$('#gc_replies').on("click",".gc_replyLi button",function(){
	
			var gc_reply = $(this).parent(); //부모요소를 선택 => li태그를 가리킴 this는 버튼 
			var gc_rno =gc_reply.attr("gc_data-gc_rno"); //data-gc_rno속성값을 구함 =>댓글 번호 
			var gc_replytext=gc_reply.children('.com').text(); //댓글 내용 
			
			$('.gc_modal-title').html(gc_rno); //댓글번호를 표시
			$('#gc_replytext').val(gc_replytext);//댓글내용을 표시 
			$('#gc_modDiv').show('slow');//댓글수정화면을 나오게 한다. 
				
			});
			4
			
			//댓글 수정 화면 닫기 
		function gc_modDivClose(){
			$('#gc_modDiv').hide('slow');			
		}
		
		$('#gc_replyModBtn').on('click',function(){
			$gc_rno = $('.gc_modal-title').html(); //댓글 번호 
			$gc_replytext = $("#gc_replytext").val(); //수정할 댓글 내용 
			
			$.ajax({
				type:'put', //메서드 방식 
				url:'/gc_replies/'+$gc_rno, //Gc_ReplyController.jave에 등록된 매핑주소 경로 
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override" :"PUT"
				},
				data:JSON.stringify({
					gc_replytext:$gc_replytext
				}),
				dataType:'text', //받아오는 자료형
				success:function(result){
					if(result == 'SUCCESS'){
						alert('댓글이 수정되었습니다!');
						$('#gc_modDiv').hide('slow');//댓글 수정화면 닫기 
						getAllList();//댓글 목록 함수 호출
						
					}
				}
			});//비동기식 jQuery 아작스 함수
		});

		
		$('#gc_replyDelBtn').on("click",function(){
			$gc_rno = $('.gc_modal-title').html();//댓글 번호 
			
			$.ajax({
				type:'delete',
				url:'/gc_replies/'+$gc_rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"
				},
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert("댓글이 삭제되었습니다!");
						$('#gc_modDiv').hide('slow');
						getAllList();
					}
				}
			});
		 });