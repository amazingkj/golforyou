package com.golforyou.controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.golforyou.config.auth.PrincipalDetails;
import com.golforyou.service.BoardService;
import com.golforyou.vo.BoardVO;
import com.golforyou.vo.LikesVO;
import com.google.gson.JsonObject;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
		
	//게시판 작성
	@GetMapping("/board_write")
	public ModelAndView board_write(HttpServletRequest request) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
			
		}
		ModelAndView wm=new ModelAndView("board/board_write");//생성자 인자값으로 뷰페이지 경로 설정 : WEB-INF/views/board/board_write.jsp
		wm.addObject("page",page); //키,값 쌍으로 저장
		return wm;
		
	}//board_write()
	
	
	  //summernotefile 저장	  
	  @PostMapping(value="/uploadSummernoteImageFile", produces =
	 "application/json")
	 
	 @ResponseBody public JsonObject
	 uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile)
	 {
	 
	 JsonObject jsonObject = new JsonObject();
	 
	 String fileRoot = "C:\\summernote_image\\"; //저장될 외부 파일 경로 String
	 String originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
	 String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	 //파일 확장자
	 
	 String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
	 
	 File targetFile = new File(fileRoot + savedFileName);
	 
	 try { InputStream fileStream = multipartFile.getInputStream();
	 FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
	 jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
	 jsonObject.addProperty("responseCode", "success");
	 
	 } catch (IOException e) { FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
	 jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
	 
	 return jsonObject; }
	 
	
	
	
	//게시판 글쓰기 저장
	@RequestMapping("/board_write_ok")
	public String board_write_ok(BoardVO b, HttpServletRequest request) throws Exception{

		String nickname=request.getParameter("nickname");
		String b_title=request.getParameter("b_title");
		String b_cont=request.getParameter("b_cont");

		b.setNickname(nickname);		
		b.setB_title(b_title);
		b.setB_cont(b_cont);
				
		this.boardService.insertBoard(b); //게시판 저장 
		
		return "redirect:/board_list";
	}//board_write_ok()
	
	
	
	//게시판 목록 
	@RequestMapping(value="/board_list",method=RequestMethod.GET)//get으로 접근하는 매핑주소를 처리 
	public String board_list(Model listM, HttpServletRequest request,@ModelAttribute BoardVO b) {
				 
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
		page=Integer.parseInt(request.getParameter("page"));    //페이지 번호를 정수 숫자로 변경해서 저장      
		      }
		      String find_name=request.getParameter("find_name"); // 검색어
		      String find_field=request.getParameter("find_field"); //검색 필드
		        b.setFind_field(find_field);
		        b.setFind_name("%"+find_name+"%");

		      int totalCount=this.boardService.getRowCount(b);
		      //총레코드 개수,검색후 레코드 개수
		      
		      b.setStartrow((page-1)*10+1);//시작행번호
		      b.setEndrow(b.getStartrow()+limit-1);//끝행 번호
		      
		      List<BoardVO> blist=this.boardService.getboardList(b); //검색 전후 목록
		      //목록
		      System.out.println(blist);
		      //총 페이지수
		      int maxpage=(int)((double)totalCount/limit+0.95);
		      //시작페이지(1,11,21 ..)
		      int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		      //현재 페이지에 보여질 마지막 페이지(10,20 ..)
		      int endpage=maxpage;
		      if(endpage>startpage+10-1) endpage=startpage+10-1;
		      
		      listM.addAttribute("blist",blist);
		      listM.addAttribute("page",page);
		      listM.addAttribute("startpage",startpage);
		      listM.addAttribute("endpage",endpage);
		      listM.addAttribute("maxpage",maxpage);
		      listM.addAttribute("listcount",totalCount);
		      listM.addAttribute("find_field",find_field);
		      listM.addAttribute("find_name",find_name);
		
			return "board/board_list";//뷰페이지 경로: /WEB-INF/views/board/board_list.jsp
		
		}//board_list()
	
	//내용보기+답변폼+수정폼+삭제폼
			@RequestMapping("/board_cont")
			public ModelAndView board_cont(@RequestParam("b_no") int b_no, String state, int page, BoardVO b) {
				//@RequestParam("board_no")를 서블릿으로 표현하면 request.getParameter("board_no")와 같다. int page로 표현해도 get으로 전달된 page 파라미터값을 받을 수 있다. 
				
				if(state.equals("cont")) {//내용보기 일때만 조회수 증가
					b=this.boardService.getBoardCont(b_no);
				}else {//답변폼, 수정폼, 삭제폼일때는 조회수 증가 안함. 
					b=this.boardService.getBoardCont2(b_no);
				}
				
				String board_cont=b.getB_cont().replace("\n", "<br/>");//textarea 내용입력박스에서 엔터키 친 부분을 줄바꿈 처리 
				ModelAndView cm=new ModelAndView();
				cm.addObject("b",b);//키, 값 쌍으로 저장 
				cm.addObject("board_cont",board_cont);
				cm.addObject("page",page); //페이징에서 내가 본 쪽번호로 이동하기 위해서 
			
				if(state.equals("cont")) { //내용보기 일때 
					cm.setViewName("board/board_cont"); //뷰리졸브 경로 : 
				}else if(state.equals("reply")){
					cm.setViewName("board/board_reply"); 
				}else if(state.equals("edit")){
					cm.setViewName("board/board_edit"); 
				}else if(state.equals("del")){
					cm.setViewName("board/board_del"); 
				}
				
				return cm;
			}//board_cont()
			
			//답변저장 
			@RequestMapping(value="/board_reply_ok")
			public String board_reply_ok(BoardVO rb, int page) {
				/*boardVO rb는 피라미터 이름과 빈클래스 변수명이 같으면 rb객체에 값이 저장되어 있다. page만 빼고, 이유는 
				 * page는 빈클래스에 동일 변수명으로 정의되어 있지 않다. 
				 */
				this.boardService.replyboard(rb);//답변저장 
				return "redirect:/board_list?page="+page;
			}//board_reply_ok()
			
			//게시판 수정 
			@PostMapping("/board_edit_ok")
			public ModelAndView board_edit_ok(HttpServletRequest request,HttpServletResponse response,BoardVO eb)
			throws Exception{
				response.setContentType("text/html;charset=UTF-8");//브라우저에 출력되는 문자와 태그 언어 코딩타입을 설정
				PrintWriter out=response.getWriter();
				
				
				int b_no=Integer.parseInt(request.getParameter("b_no"));
				int page=1;
						if(request.getParameter("page") !=null) {
							page=Integer.parseInt(request.getParameter("page"));
						}
						String id=request.getParameter("nickname");						
						String username=request.getParameter("username");
						String b_title=request.getParameter("b_title");
						String b_cont=request.getParameter("b_cont");
						
						eb.setB_no(b_no); eb.setNickname(id); eb.setUsername(username); 
						eb.setB_title(b_title); eb.setB_cont(b_cont);
							
							this.boardService.editboard(eb);//번호를 기준으로 글쓴이, 글제목, 글내용, 첨부파일 수정 
							
							ModelAndView em=new ModelAndView("redirect:/board_cont");
							em.addObject("b_no",b_no);
							em.addObject("page",page);
							em.addObject("state","cont"); //state구분값
							return em; //브라우저 주소창에 다음과 같이 실행된다. board_cont?board_no=번호&page=쪽번호&state=cont 즉 주소창에 노출되는 get 방식으로 3개의 인자값이 전달 된다. 
						
						
				
			
			}//board_edit_ok
			
			//게시판 삭제 
			@RequestMapping("/board_del_ok") //get or post양쪽 방식 모두 실행됨 board_no는 get방식, 그외 정보는 post이기 때문
			public String board_del_ok(int b_no,int page,HttpServletResponse response, HttpServletRequest request)
			throws Exception{
				response.setContentType("text/html; charset=UTF-8");
				
				this.boardService.delboard(b_no);//번호를 기준으로 게시판 삭제 
				
				return "redirect:/board_list?page="+page;
				
			
			}//board_del_ok()
			
			
			//게시판 좋아요 
			// 빈하트 클릭시 하트 저장
			@ResponseBody
			@RequestMapping(value = "/saveHeart", method = RequestMethod.GET, headers = "Accept=application/json")
			public BoardVO save_heart(@RequestParam int b_no,  HttpSession session) {
				BoardVO pto =new BoardVO();
				LikesVO to = new LikesVO();

			    // 게시물 번호 세팅
			    to.setBoard_no(b_no);

			    // 좋아요 누른 사람 nick세팅
			    to.setNickname("member02");

			    // +1된 하트 갯수를 담아오기위함
			  
			    		
			    int result=boardService.SaveHeart(to);
			    System.out.println(result);
			    if(result==1) {
			    		boardService.UpHeart(b_no);
			    	 pto=boardService.CountHeart(pto);
			    }
			    
			   
			    return pto;
			}

			// 꽉찬하트 클릭시 하트 해제
			@ResponseBody
			@RequestMapping(value = "/removeHeart")
			public BoardVO remove_heart(@RequestParam int b_no, HttpSession session) {
				BoardVO pto =new BoardVO();
				LikesVO to = new LikesVO();

			    // 게시물 번호 세팅
			    to.setBoard_no(b_no);

			    // 좋아요 누른 사람 nick세팅
			    to.setNickname((String) session.getAttribute("nick"));

			    // -1된 하트 갯수를 담아오기위함
			    
		   		
			    int result=boardService.RemoveHeart(to);
			    
			    if(result==1) {
			    	 pto=boardService.CountHeart(pto);
			    }
			    
			   

			    return pto;
			}
			
}
