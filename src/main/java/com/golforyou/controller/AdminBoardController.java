package com.golforyou.controller;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.golforyou.service.AdminBoardService;
import com.golforyou.vo.AbBoardVO;

@Controller
public class AdminBoardController {

	@Autowired
	private AdminBoardService adminBoardService;


	/*관리자 게시판 목록*/
	@RequestMapping("/abboard_list")//주소 입력하면 뷰페이지 출력
	public String admin_board_list(Model listM,   
			@ModelAttribute AbBoardVO b,
			HttpServletResponse response,	
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//생성

		int page=1;//쪽번호
		int limit=5;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		//필드
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%");
		//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
		//매핑 대응

		int listcount=this.adminBoardService.getListCount(b);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		//System.out.println("총 게시물수:"+listcount+"개");

		b.setStartrow((page-1)*5+1);//시작행번호
		b.setEndrow(b.getStartrow()+limit-1);//끝행번호

		List<AbBoardVO> ablist=
				this.adminBoardService.getBoardList(b);
		//목록

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		listM.addAttribute("ablist",ablist);
		//blist 키이름에 값 저장
		listM.addAttribute("page",page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("listcount",listcount);	
		listM.addAttribute("find_field",find_field);
		listM.addAttribute("find_name", find_name);

		return "board/abboard_list";
		//뷰페이지 폴더경로와 파일명 지정		
	}//admin_board_list()



	//내용보기+수정폼
	@RequestMapping("/abboard_cont")
	public ModelAndView admin_board_cont(
			@RequestParam("no") int abboard_no,
			@RequestParam("state") String state,
			HttpServletResponse response,
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
			//get으로 전달된 쪽번호를 정수 숫자로 바꿔서 저장
		}
		if(state.equals("cont")) {
			this.adminBoardService.updateHit(abboard_no);
		}

		AbBoardVO b=this.adminBoardService.getAdminBoardCont(abboard_no);
		//디비로 부터 레코드 내용을 가져옴.
		String board_cont=b.getAbboard_cont().replace("\n","<br/>");
		//textarea태그영역에서 엔터키 친부분을 줄바꿈 처리<br/>

		ModelAndView cm=new ModelAndView();
		cm.addObject("b",b);
		cm.addObject("board_cont",board_cont);
		cm.addObject("page",page);

		if(state.equals("cont")) {//내용보기
			cm.setViewName("board/abboard_cont");
		}else if(state.equals("edit")) {//수정폼
			cm.setViewName("admin/admin_board_edit");
		}
		return cm;
	}//admin_board_cont()




	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/*관리자 게시판 목록*/
	@RequestMapping("admin/abboard_list")//주소 입력하면 뷰페이지 출력
	public String admin_board_ablist(Model listM,  
			@ModelAttribute AbBoardVO b, 
			HttpServletResponse response,	
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//생성

		int page=1;//쪽번호
		int limit=5;//한페이지에 보여지는 목록개수`x
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		//필드
		b.setFind_field(find_field);
		b.setFind_name("%"+find_name+"%");
		//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
		//매핑 대응

		int listcount=this.adminBoardService.getListCount(b);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		//System.out.println("총 게시물수:"+listcount+"개");

		b.setStartrow((page-1)*5+1);//시작행번호
		b.setEndrow(b.getStartrow()+limit-1);//끝행번호

		List<AbBoardVO> ablist=
				this.adminBoardService.getBoardList(b);
		//목록

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		listM.addAttribute("ablist",ablist);
		//blist 키이름에 값 저장
		listM.addAttribute("page",page);
		listM.addAttribute("startpage",startpage);
		listM.addAttribute("endpage",endpage);
		listM.addAttribute("maxpage",maxpage);
		listM.addAttribute("listcount",listcount);	
		listM.addAttribute("find_field",find_field);
		listM.addAttribute("find_name", find_name);

		return "admin/admin_board_ablist";
		//뷰페이지 폴더경로와 파일명 지정		
	}//admin_board_list()
	//내용보기+수정폼
	@RequestMapping("admin/abboard_cont")
	public ModelAndView admin_board_abcont(
			@RequestParam("no") int abboard_no,
			@RequestParam("state") String state,
			HttpServletResponse response,
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
			//get으로 전달된 쪽번호를 정수 숫자로 바꿔서 저장
		}


		AbBoardVO b=this.adminBoardService.getAdminBoardCont(abboard_no);
		//디비로 부터 레코드 내용을 가져옴.
		String board_cont=b.getAbboard_cont().replace("\n","<br/>");
		//textarea태그영역에서 엔터키 친부분을 줄바꿈 처리<br/>

		ModelAndView cm=new ModelAndView();
		cm.addObject("b",b);
		cm.addObject("board_cont",board_cont);
		cm.addObject("page",page);

		if(state.equals("cont")) {//내용보기
			cm.setViewName("admin/admin_board_abcont");
		}else if(state.equals("edit")) {//수정폼
			cm.setViewName("admin/admin_board_edit");
		}
		return cm;
	}
	//관리자 게시판 수정완료
	@RequestMapping(value="/admin/admin_board_edit_ok",method=RequestMethod.POST)
	public String admin_board_edit_ok(
			@ModelAttribute AbBoardVO eb,
			HttpServletResponse response,
			HttpServletRequest request) 
					throws Exception{
		int page=Integer.parseInt(request.getParameter("page"));
		int abboard_no=Integer.parseInt(request.getParameter("abboard_no"));
		String abboard_name=request.getParameter("abboard_name");
		String abboard_cont=request.getParameter("abboard_cont");
		String abboard_title=request.getParameter("abboard_title");

		eb.setAbboard_no(abboard_no);
		eb.setAbboard_name(abboard_name);
		eb.setAbboard_cont(abboard_cont);
		eb.setAbboard_title(abboard_title);
		this.adminBoardService.editBoard(eb);

		return "redirect:/admin/abboard_cont?no=" + eb.getAbboard_no() + "&page="+page + "&state=cont";

	}//admin_board_edit_ok()
	//관리자 게시판 삭제
	@RequestMapping("admin/admin_board_del")
	public String admin_board_del(
			@RequestParam("no") int no,
			@RequestParam("page") int page,
			HttpServletResponse response,
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");


		this.adminBoardService.deleteBoard(no);//게시물 삭제

		return "redirect:/admin/abboard_list?page="+page;
	}
	//관리자 게시판 글쓰기
	@RequestMapping("admin/abboard_write")
	public ModelAndView admin_board_write(
			HttpServletRequest request,
			HttpServletResponse response)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));     		
		}	ModelAndView cm=
				new ModelAndView("admin/admin_board_write");
		cm.addObject("page",page);
		return cm;
	}//admin_board_write

	//관리자 게시판 저장
	@RequestMapping("admin/admin_board_write_ok")
	public String admin_board_write_ok(
			@ModelAttribute AbBoardVO b,
			HttpServletRequest request,
			HttpServletResponse response)
					throws Exception{
		//@ModelAttribute BoardVO b라고 하면 네임피라미터 이름과 빈
		//클래스 변수명이 일치하면 b객체에 값이 저장되어 있다.
		response.setContentType("text/html;charset=UTF-8");

		this.adminBoardService.insertBoard(b);
		return "redirect:/admin/abboard_list";
	}//admin_board_write_ok()
}