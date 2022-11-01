package com.golforyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.golforyou.service.BoardService;
import com.golforyou.vo.BoardReplyVO;

@RestController
@RequestMapping("/replies/")
public class BoardReplyController {
//자유게시판 댓글 구현 
	
	@Autowired
	private BoardService boardService;
	
	
	//댓글 등록 
	@RequestMapping(value="",method=RequestMethod.POST,produces="application/json") 
	//post방식으로 접근하는 매팽주소를 처리 
	public ResponseEntity<String> addReply(@RequestBody BoardReplyVO vo){
		/*
		 * @RequestBody ReplyVO vo 하면 전송된 json데이터가 ReplyVO 타입의 vo객체 타입으로 변경되어 전송된다. 
		 */
		System.out.println(12312312);
		System.out.println(vo.getReplyer());
		System.out.println(vo.getReply());
		
		ResponseEntity<String> entity=null;
		
		try {
			this.boardService.insertReply(vo); //댓글 등록
			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK); //댓글 저장 성공시 
			//'SUCCESS'문자를 반환하고, HTTP상태코드는 성공했다는 의미인 200을 반환. 
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			//예외 에러가 발생했을 때 나쁜 상태코드 문자열을 반환 
		}
		return entity;
	}//addReply()
	
	//게시판 번호에 해당하는 댓글 목록 
		@RequestMapping(value="/all/{b_no}",produces="application/json")
		//매핑주소가 /all/게시판 번호 
		public ResponseEntity<List<BoardReplyVO>> replyList(@PathVariable("b_no") int b_no){
			/*
			 * @PathVariable("bno")는 매핑주소인 {bno}에 입력되어진 게시판 번호값을 가져오는 용도이다. 
			 */
			ResponseEntity<List<BoardReplyVO>> entity=null;
			
			try {
				entity=new ResponseEntity<>(this.boardService.replyList(b_no),HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				//System.out.println(e.getMessage());
			}
			return entity;
		}//replyList()
		
		
		
		//댓글 수정 
		@RequestMapping(value="/{r_no}",method= {RequestMethod.PUT, RequestMethod.PATCH})
		//PUT 방식은 전체자료수정, PATCH는 일부자료수정
		public ResponseEntity<String> editReply(@PathVariable("r_no") int r_no, @RequestBody BoardReplyVO vo){
			/*
			 * @pathVariable("rno")는 주소창에 입력된 {rno} 댓글 번호값을 추출하는 용도, @RequestBody애노테이션은 입력된 수정 JSON데이터를 
			 * ReplyVO 객체 타입으로 변경한다.
			 */
			ResponseEntity<String> entity=null;
			
			try {
				vo.setR_no(r_no); //댓글번호저장, 이유는 주소창에서 입력한 댓글 번호라서 json 데이터가 아님
				//@RequestBody에 의해서 ReplyVO타입으로 변환 못하기 때문에 코드로 setter()메서드에 저장
				this.boardService.updateReply(vo); //댓글 수정
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
			
			}catch(Exception e){
				e.printStackTrace();
				entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
			
		}//editReply()
		
		//댓글 삭제 
		@RequestMapping(value="{r_no}",method=RequestMethod.DELETE)
		//DELTET는 삭제시 
		public ResponseEntity<String> replyDel(@PathVariable("r_no") int r_no){
			ResponseEntity<String> entity=null;
			
		try{
			this.boardService.delReply(r_no);//댓글 번호를 기준으로 삭제 
			entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
		
		//replyDel()
		}

	
	
}
		
	

