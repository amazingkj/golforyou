
	 $('#likebtn').click(function(){
			likeupdate();
		});
		
		function likeupdate(){
			let root = getContextPath(),
			likeurl = "/replies/likeupdate",
			nickname = $('#nickname').val(),
			b_no = $('#b_no').val(),
			count = $('#likecheck').val(),
			data = {"nickname" : nickname,
					"board_no" : b_no,
					"count" : count};
			
		$.ajax({
			url : root+likeurl,
			type : 'PUT',
			contentType: 'application/json',
			data : JSON.stringify(data),
			success : function(result){
				console.log("수정" + result.result);
				if(count == 1){
					console.log("좋아요 취소");
					 $('#likecheck').val(0);
					 $('#likebtn').attr('class','btn btn-light');
					 alert("좋아요가 취소되었습니다.");
					 location.reload();
				}else if(count == 0){
					console.log("좋아요!");
					$('#likecheck').val(1);
					$('#likebtn').attr('class','btn btn-danger');
					 alert("좋아요가 반영되었습니다.");
					location.reload();
				}
			}, error : function(result){
				console.log("에러" + result.result)
			}
			
			});
		};
		
		function getContextPath() {
		    let hostIndex = location.href.indexOf( location.host ) + location.host.length;
		    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		} 


   // 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
    // (로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
//    $(".heart-notlogin").unbind('click');
 //   $(".heart-notlogin ").click(function() {
 //       alert('로그인 하셔야 하트를 누를수 있습니다!');
 //   });