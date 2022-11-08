package com.golforyou.controller;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.golforyou.service.IndivService;
import com.golforyou.service.RankingService;
import com.golforyou.service.ScBoardService;
import com.golforyou.vo.ScboardVO;

@Controller
public class ScBoardController {
	@Autowired
	private ScBoardService scBoardService;
	@Autowired
	private IndivService indivService;
	@Autowired
	private RankingService rankingService;
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
	    multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024); // 파일당 업로드 크기 제한 (10MB)
	    return multipartResolver;
	}
	
	//스코어카드게시판 목록
	@RequestMapping(value="/scorecard_list")
	public String scorecard_list(Model listM, HttpServletRequest request, HttpServletResponse response, @ModelAttribute ScboardVO sb, HttpSession session) {
		response.setContentType("text/html;charest=utf-8");
		
		int page = 1; //page없으면 1페이지고정
		int limit = 10;
		String find_field = null;
		String find_name = null;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		find_field = request.getParameter("find_field");
		if(request.getParameter("find_name") != null) { //검색어가 있는 경우
			find_name = request.getParameter("find_name").trim(); //trim()으로 양쪽 공백 제거
		}
		sb.setFind_field(find_field);
		sb.setFind_name("%"+find_name+"%");
		
		int listcount = scBoardService.getListCount(sb); //게시판 목록 갯수
		
		sb.setStartrow((page-1)*10+1);
		sb.setEndrow(sb.getStartrow()+limit-1);
		
		List<ScboardVO> sclist = scBoardService.getBoardList(sb); //게시판 목록 리스트
		List<ScboardVO> sclist_notice = scBoardService.getBoardListNotice(sb); //게시판 목록 리스트
		
		String id = (String)session.getAttribute("id");
		
		int maxpage = (int)((double)listcount/limit + 0.95); //총 페이지 수;
		int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; //시작 페이지;
		int endpage = maxpage;
		
		if(endpage > startpage + 9) {
			endpage = startpage + 9;
		}
		
		listM.addAttribute("id", id);
		listM.addAttribute("sclist", sclist);
		listM.addAttribute("sclist_notice", sclist_notice);
		listM.addAttribute("page", page);
		listM.addAttribute("startpage", startpage);
		listM.addAttribute("endpage", endpage);
		listM.addAttribute("maxpage", maxpage);
		listM.addAttribute("listcount", listcount);
		listM.addAttribute("find_field", find_field);
		listM.addAttribute("find_name", find_name);
		
		return "/tier/scorecard_list";
	}
	
	//스코어카드 게시판 내용보기(+수정,답변,삭제)
	@RequestMapping(value="/scorecard_cont")
	public ModelAndView scorecard_cont(@RequestParam("sc_no") int sc_no, String state, int page, ScboardVO sb, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		ModelAndView scm = new ModelAndView();
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String sc_id = (String)session.getAttribute("id");
		String roleCheck = scBoardService.getroleCheck(sc_id);
		
		page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		state = request.getParameter("state");
		
		if(state.equals("cont")) {
			sb = this.scBoardService.getScBoardCont(sc_no); //list에서 들어가면 조회수증가
		}else {
			sb = this.scBoardService.getScBoardCont2(sc_no); //다른데서 들어가면 조회수증가 없음
		}
		System.out.println(sb.getSc_cont());
		String sc_cont = sb.getSc_cont().replace("\n", "<br/>");
		
		//scm.addObject("no",sc_no);
		scm.addObject("id",sc_id);
		scm.addObject("roleCheck", roleCheck);
		scm.addObject("page", page);
		scm.addObject("sb",sb);
		scm.addObject("sc_cont",sc_cont);
		
		if(state.equals("cont")) { //내용보기폼
			scm.setViewName("tier/scorecard_cont");
		}else if(state.equals("reply")){ //답변폼
			scm.setViewName("tier/scorecard_reply");
		}else if(state.equals("edit")) { //수정폼
			scm.setViewName("tier/scorecard_edit");
		}else if(state.equals("del")) { //삭제폼
			scm.setViewName("tier/scorecard_del");
		}
		
		return scm;
	}
	
	//스코어카드 글쓰기
	@RequestMapping(value="/scorecard_write")
	public ModelAndView scorecard_write(HttpServletRequest request, HttpServletResponse response, int page, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		ModelAndView swm = new ModelAndView("tier/scorecard_write");
		
		page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		PrintWriter out = response.getWriter();
		
		String sc_id = (String)session.getAttribute("id");
		
		if(sc_id == null) {
			out.println("<script>");
			out.println("alert('로그인부터 하세요')");
			out.println("location='login'");
			out.println("</script>");
		}else {
			page = 1;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			System.out.println(sc_id);
			return swm;
		}
		
		return null;
	}
	
	//스코어카드 글쓰기 저장
	@RequestMapping("/scorecard_write_ok")
	public String scorecard_write_ok(@ModelAttribute ScboardVO sb, MultipartFile file, RedirectAttributes redirectAttributes,  HttpServletResponse response, MultipartHttpServletRequest request, HttpSession session) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String saveFolder = request.getServletContext().getRealPath("/upload/scboard");
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String sc_id = (String)session.getAttribute("id");
		String sc_name = rankingService.getNickname(sc_id);
		String sc_title = request.getParameter("sc_title"); //제목
		String sc_playdate = request.getParameter("sc_playdate"); //골프 친 날짜
		sc_playdate = sc_playdate.replace("-", "_"); //2022-01-01을 2022_01_01로
		String sc_cont = request.getParameter("sc_cont"); //내용
		
		file = request.getFile("file");
		
		if(file != null) { //첨부파일 있는경우
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //년도
			int month = c.get(Calendar.MONTH)+1; //1월이 0이라 +1
			int date = c.get(Calendar.DATE);
			
			String homedir = "";
			if(month >= 1 && month <= 9) {
				homedir = saveFolder+"/"+year+"-"+"0"+month+"-"+date; //폴더경로 저장
			}else if(month >= 10 && month <= 12) {
				homedir = saveFolder+"/"+year+"-"+month+"-"+date; //폴더경로 저장
			}
			File path01 = new File(homedir);
			if(!(path01.exists())) { //여기서 폴더생성이 안되고있음?
				path01.mkdirs(); //풀더 생성
				System.out.println("폴더생성 완료.");
			}
			int nodual = scBoardService.getscnodual();
			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = sc_playdate+"_"+nodual+"_"+sc_id+"."+fileExtension; //새로운 파일첨부명
			String fileDBName = ""; //DB에 저장되는 경로명
			if(month >= 1 && month <= 9) {
				fileDBName = "/"+year+"-"+"0"+month+"-"+date+"/"+refileName;
			}else if(month >= 10 && month <= 12) {
				fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
			}
			File saveFile = new File("/"+homedir+"/"+refileName);
			try {
				file.transferTo(saveFile); //새롭게 생성된 폴더 경로에 변경된 파일로 실제 업로드
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			sb.setSc_file(fileDBName);
			
		}
		
		redirectAttributes.addFlashAttribute("message", "You successfully uploaded " + file.getOriginalFilename() + "!");
		
		sb.setSc_id(sc_id);
		sb.setSc_name(sc_name);
		sb.setSc_title(sc_title);
		sb.setSc_playdate(sc_playdate);
		sb.setSc_cont(sc_cont);
		
		scBoardService.insertBoard(sb); //scboard테이블에 레코드 생성
		List<Integer> scnoList = scBoardService.getScno(sb);
		sb.setSc_no(scnoList.get(0));  //생성된 sc_no값을 받아옴
		indivService.autoInsert(sb); //스코어카드에 id와 playdate,s_no만 입력된 레코드 생성, 나머지는 관리자페이지에서 채우게 됨
		
		String strdate = indivService.makeDate(sb); //playdate를 s_sort인 int로 만들기 위해 발골하는 작업
		strdate = strdate.replace("_", "");
		int numdate = Integer.parseInt(strdate);
		sb.setNumdate(numdate);
		indivService.sortDate(sb); //발골된 날짜를 s_sort에 저장
		
		return "redirect:/scorecard_list?page="+page;
	}
	
	//답글 저장
	@RequestMapping(value="/scorecard_reply_ok")
	public String scorecard_reply_ok(HttpServletRequest request, HttpServletResponse response, ScboardVO sb, int page) throws Exception {
		request.setCharacterEncoding("utf-8");
		page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		//답변글 히든값 3개
		int sc_ref = Integer.parseInt(request.getParameter("sc_ref"));
		int sc_step = Integer.parseInt(request.getParameter("sc_step"));
		int sc_level = Integer.parseInt(request.getParameter("sc_level"));
		
		String sc_id = request.getParameter("sc_id");
		String sc_name = rankingService.getNickname(sc_id);
		String sc_title = request.getParameter("sc_title");
		String sc_cont = request.getParameter("sc_cont");
		
		sb.setSc_ref(sc_ref);
		sb.setSc_step(sc_step);
		sb.setSc_level(sc_level);
		sb.setSc_id(sc_id);
		sb.setSc_name(sc_name);
		sb.setSc_title(sc_title);
		sb.setSc_cont(sc_cont);
		
		scBoardService.replyBoard(sb);
		
		return "redirect:/scorecard_list?page="+page;
	}
	
	//수정
	@RequestMapping(value="/scorecard_edit_ok")
	public String scorecard_edit_ok(@ModelAttribute ScboardVO sb, MultipartFile file, RedirectAttributes redirectAttributes,  HttpServletResponse response, MultipartHttpServletRequest request, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String saveFolder = request.getServletContext().getRealPath("/upload/scboard"); //이진파일 업로드 실제경로
		
		int sc_no = Integer.parseInt(request.getParameter("sc_no"));
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String sc_id = request.getParameter("sc_id");
		String sc_name = rankingService.getNickname(sc_id);
		String sc_playdate = request.getParameter("sc_playdate");
		sc_playdate = sc_playdate.replace("-", "_"); //2022-01-01을 2022_01_01로
		String sc_title = request.getParameter("sc_title");
		String sc_cont = request.getParameter("sc_cont");
		String filecheck = request.getParameter("file_route");
		
		sb.setSc_no(sc_no);
		sb.setSc_id(sc_id);
		sb.setSc_name(sc_name);
		sb.setSc_playdate(sc_playdate);
		sb.setSc_title(sc_title);
		sb.setSc_cont(sc_cont);
		
		if(!filecheck.equals("스코어카드 사진을 올리세요")) {
			file = request.getFile("file");
			
			if(file != null) { //첨부파일 있는경우
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR); //년도
				int month = c.get(Calendar.MONTH)+1; //1월이 0이라 +1
				int date = c.get(Calendar.DATE);
				
				String homedir = "";
				if(month >= 1 && month <= 9) {
					homedir = saveFolder+"/"+year+"-"+"0"+month+"-"+date; //폴더경로 저장
				}else if(month >= 10 && month <= 12) {
					homedir = saveFolder+"/"+year+"-"+month+"-"+date; //폴더경로 저장
				}
				File path01 = new File(homedir);
				if(!(path01.exists())) { //여기서 폴더생성이 안되고있음?
					path01.mkdirs(); //풀더 생성
					System.out.println("폴더생성 완료.");
				}
				
				String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
				String refileName = sc_playdate+"_"+sc_no+"_"+sc_id+"."+fileExtension; //새로운 파일첨부명
				String fileDBName = ""; //DB에 저장되는 경로명
				if(month >= 1 && month <= 9) {
					fileDBName = "/"+year+"-"+"0"+month+"-"+date+"/"+refileName;
				}else if(month >= 10 && month <= 12) {
					fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				}
				Path filePath = Paths.get(homedir+"/"+refileName);
				if(new File("/"+homedir+"/"+refileName).exists()) {
					Files.delete(filePath);
				}			
				File saveFile = new File("/"+homedir+"/"+refileName);
				
				try {
					file.transferTo(saveFile); //새롭게 생성된 폴더 경로에 변경된 파일로 실제 업로드
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				sb.setSc_file(fileDBName);
				
			}
		}else {
			ScboardVO scfile = scBoardService.getScBoardCont(sc_no);
			sb.setSc_file(scfile.getSc_file());
		}
				
		redirectAttributes.addFlashAttribute("message", "You successfully uploaded " + file.getOriginalFilename() + "!");
		
		scBoardService.updateBoard(sb);
		
	
		indivService.autoUpdate(sb); //스코어카드 s_date 수정
		
		String strdate = indivService.makeDate(sb); //playdate를 s_sort인 int로 만들기 위해 발골하는 작업
		strdate = strdate.replace("_", "");
		int numdate = Integer.parseInt(strdate);
		sb.setS_sort(numdate);
	
		indivService.sortUpdate(sb); //스코어카드 s_sort 수정
		
		return "redirect:/scorecard_cont?sc_no="+sc_no+"&page="+page+"&state=cont";
	}
	
	//삭제
	@RequestMapping(value="/scorecard_del_ok")
	public String scorecard_del_ok(String del_pwd,HttpServletResponse response,HttpServletRequest request, ScboardVO sb) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		
		int sc_no = Integer.parseInt(request.getParameter("sc_no"));
		String sc_playdate = request.getParameter("sc_playdate");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		HttpSession session = request.getSession();
		String sc_id = (String)session.getAttribute("id");
		
		sb.setSc_no(sc_no);
		sb.setSc_id(sc_id);
		sb.setSc_playdate(sc_playdate);
		
		scBoardService.delBoard(sb);
		
		return "redirect:/scorecard_list?page="+page;
	}
	
	@RequestMapping(value="/scorecard_notice")
	public String scorecard_notice(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int sc_no = Integer.parseInt(request.getParameter("sc_no"));
		
		int noticecheck = scBoardService.getScBoardCont(sc_no).getSc_notice();
		
		if(noticecheck == 0) {
			scBoardService.setScnotice(sc_no);
		}else if(noticecheck == 1) {
			scBoardService.setScnotice2(sc_no);
		}
		
		return "redirect:/scorecard_list?page="+page;
	}
	
}
