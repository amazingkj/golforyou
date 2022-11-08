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

import com.golforyou.service.Gc_ReplyService;
import com.golforyou.vo.Gc_replyVO;

@RestController 
@RequestMapping("/gc_replies") 	
public class Gc_replyController {

	@Autowired
	private Gc_ReplyService gc_replyService;
	//댓글 등록
		@RequestMapping(value="",method=RequestMethod.POST, produces="application/json")//post방식으로 접근하는 매핑주소를 처리
		public ResponseEntity<String> addgc_reply(@RequestBody Gc_replyVO vo){
			/*@RequestBody ReplyVO vo 하면 전송된 json데이터가 ReplyVO 타입의 vo객체타입으로 변경되어 전송된다.
			 * 
			 */
			
			
			ResponseEntity<String> entity=null;
			
			System.out.println(vo.getGc_replytext());
			System.out.println(vo.getGc_replyer());
			
			try {
				this.gc_replyService.insertgcReply(vo);//댓글등록
				entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);//댓글 저장 성공시 "SUCCESS"문자를 반환하고 HTTP 상태 코드는 
				//성공했다는 의미인 200을 반환.
				
			}catch (Exception ge) {
				ge.printStackTrace();
				entity=new ResponseEntity<>(ge.getMessage(),HttpStatus.BAD_REQUEST);//예외 에러가 발생했을때 나쁜 상태코드 문자열을 반환
			}
			return entity;
			
			
			
		}//addRpely()	
		

		//게시판 번호에 해당하는 댓글 목록
		@RequestMapping(value="/all/{gc_no}",produces="application/json")
		// 매핑주소가 /all/게시판번호
		public ResponseEntity<List<Gc_replyVO>> gc_replyList(@PathVariable("gc_no")int gc_no){
			/*@PathVariable("gc_no")는 매핑주소인 {gc_no}에 입력되어진 게시판 번호갑을 가져오는 용도이다.
			 */
			ResponseEntity<List<Gc_replyVO>>entity=null;
			
			try {
				entity=new ResponseEntity<>(this.gc_replyService.gc_replyList(gc_no),HttpStatus.OK);
				//게시판 번호에 해당하는 댓글 목록이 반환
			}catch (Exception ge) {
				ge.printStackTrace();
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}//replyList()
		
		//댓글 수정
		@RequestMapping(value="/{gc_rno}",method= {RequestMethod.PUT, RequestMethod.PATCH})
		//PUT은 전체자료수정,PATH는 일부자료 수정
		public ResponseEntity<String>Gc_editReply(@PathVariable("gc_rno")int gc_rno,@RequestBody Gc_replyVO vo){
			/*@PathVariable("gc_rno")는 주소창에 입력된 {gc_rno}댓글번호값을 추출하는 용도,@RquestBody애노테이션은 입려된 수정 JSON데이터
			 * ReplyVO 객체타입을 변경한다.
			 */
			ResponseEntity<String> entity=null;
			
			try {
				vo.setGc_rno(gc_rno);//댓글번호 저장,이유는 주소창에서 입력한 댓글번호라서 json데이터가 아니라서 @RequestBody에 의해서 ReplyVO타입으로
				//변환 못하기 떄문에 코드로 setter()메서드에 저장
				this.gc_replyService.gc_updateReply(vo);//댓글 수정
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch (Exception ge) {
				ge.printStackTrace();
				entity=new ResponseEntity<>(ge.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
		}//editReply()
		
		//댓글 삭제
		@RequestMapping(value="{gc_rno}",method=RequestMethod.DELETE)
		//DELTET는 삭제시
		public ResponseEntity<String> gc_replyDel(@PathVariable("gc_rno")int gc_rno){
			ResponseEntity<String> entity=null;
			
			try {
				this.gc_replyService.gc_delReply(gc_rno);//댓글번호를 기준으로 삭제
				entity=new ResponseEntity<>("SUCCESS",HttpStatus.OK);
			}catch (Exception ge) {
				ge.printStackTrace();
				entity=new ResponseEntity<>(ge.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		
}
			 