package com.golforyou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.golforyou.service.GolfcouseService;

import com.golforyou.vo.GolfcouseVO;


@Controller
@RequestMapping("/admin/*")
public class AdminGolfcouseController {

	@Autowired
	private GolfcouseService golfcouseService;

	//관리자 페이지 골프장 등록하기 페이지 불러오기
	@GetMapping("/admin_insertGolfcouse")
	public ModelAndView admin_insertGolfcouse() {
		ModelAndView wm = new ModelAndView("admin/admin_insertGolfcouse");
		return wm;
	}//admin_insertGolfcouse()

	//관리자 페이지 골프장등록(저장)
	@PostMapping("/insertGolfcouse_ok")
	public String insertGolfcouse_ok(GolfcouseVO gc, MultipartHttpServletRequest request,Model model, MultipartFile file,HttpSession session ,HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String saveFolder = request.getServletContext().getRealPath("/upload/golfcouse");
		

		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		//골프장 정보
		String gc_title=request.getParameter("gc_title"); //골프장명
		String gc_english=request.getParameter("gc_english"); //골프장 영문명
		String gc_area=request.getParameter("gc_area"); //지역
		String gc_hole=request.getParameter("gc_hole"); //홀
		int gc_golf=Integer.parseInt(request.getParameter("gc_golf")); //파
		int gc_length=Integer.parseInt(request.getParameter("gc_length")); //길이
		String gc_kind=request.getParameter("gc_kind"); //잔디종류
		String gc_type=request.getParameter("gc_type"); //코스타입
		String gc_configuration=request.getParameter("gc_configuration"); //코스구성
		String gc_caddy=request.getParameter("gc_caddy");//캐디
		String gc_cart=request.getParameter("gc_cart");//카트
		String gc_architects=request.getParameter("gc_architects");//설계자명
		String gc_content=request.getParameter("gc_content");//골프장내용
		String gc_coordinates=request.getParameter("gc_coordinates");//지도 좌표값
		String gc_address_postcode=request.getParameter("gc_address_postcode"); //우편번호
		String gc_address_roadAddress=request.getParameter("gc_address_roadAddress"); //도로명주소
		String gc_address_jibunAddress=request.getParameter("gc_address_jibunAddress"); //지번주소
		String gc_address_detailAddress=request.getParameter("gc_address_detailAddress"); //상세주소
		String gc_address_extraAddress=request.getParameter("gc_address_extraAddress"); //참고항목
		String gc_phone=request.getParameter("gc_phone");//전화번호
		String gc_fax=request.getParameter("gc_fax");//팩스
		String gc_move=request.getParameter("gc_move");//골프장까지 자차이동경로
		String gc_date=request.getParameter("gc_date");//골프장 개장날짜
		
		
		//이미지 업로드
		 file = request.getFile("file2"); //이미지
		 
		if(file != null) {
			String fileName = file.getName();
			Calendar cal = Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);//년도값
			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
			int date=cal.get(Calendar.DATE);//일값

			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
			File path01 = new File(homedir);

			if(!(path01.exists())) {
				path01.mkdir();
			}
			Random r = new Random();
			int random = r.nextInt(100000000);

			// 첨부 파일 확장자를 구함 
			
			
			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = "class" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			File saveFile= new File(homedir+"/"+refileName);
			
			file.transferTo(saveFile); //새롭게 생성된 폴더 경로에 변경된 파일로 실제 업로드
			
			gc.setGc_image(fileDBName);
		} else {
			String fileDBName="";
			gc.setGc_image(fileDBName);
		}
			gc.setGc_title(gc_title);
			gc.setGc_english(gc_english);
			gc.setGc_area(gc_area);
			gc.setGc_hole(gc_hole);
			gc.setGc_golf(gc_golf);
			gc.setGc_length(gc_length);
			gc.setGc_kind(gc_kind);
			gc.setGc_type(gc_type);
			gc.setGc_configuration(gc_configuration);
			gc.setGc_caddy(gc_caddy);
			gc.setGc_cart(gc_cart);
			gc.setGc_architects(gc_architects);
			gc.setGc_content(gc_content);
			gc.setGc_coordinates(gc_coordinates);
			gc.setGc_address_postcode(gc_address_postcode);
			gc.setGc_address_roadAddress(gc_address_roadAddress);
			gc.setGc_address_jibunAddress(gc_address_jibunAddress);
			gc.setGc_address_detailAddress(gc_address_detailAddress);
			gc.setGc_address_extraAddress(gc_address_extraAddress);	
			gc.setGc_phone(gc_phone);
			gc.setGc_fax(gc_fax);
			gc.setGc_move(gc_move);
			gc.setGc_date(gc_date);
			
			

		this.golfcouseService.insertGolfcouse(gc);

		return "redirect:/admin/admin_golfcouseList";
	}

			

	//관리자 페이지 골프장 목록
	@RequestMapping(value="/admin_golfcouseList",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String admin_golfcouseList(Model listGC, HttpServletRequest request,@ModelAttribute GolfcouseVO gc) {
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		gc.setFind_field(find_field);
		gc.setFind_name("%"+find_name+"%");
		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
		//와일드 카드문자

		int totalCount=this.golfcouseService.getRowCount(gc);
		//검색전 총레코드 개수,검색후 레코드 개수

		gc.setStartrow((page-1)*10+1);//시작행번호
		gc.setEndrow(gc.getStartrow()+limit-1);//끝행 번호

		List<GolfcouseVO> gclist=this.golfcouseService.getgolfcouseList(gc); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		listGC.addAttribute("gclist",gclist);
		listGC.addAttribute("page",page);
		listGC.addAttribute("startpage",startpage);
		listGC.addAttribute("endpage",endpage);
		listGC.addAttribute("maxpage",maxpage);
		listGC.addAttribute("listcount",totalCount);
		listGC.addAttribute("find_field",find_field);
		listGC.addAttribute("find_name",find_name);
		return "admin/admin_golfcouseList";
	}//admin_golfcouseList()

	//관리자 페이지 골프장 상세 페이지
	@RequestMapping(value="/admin_golfcouseDetail",method=RequestMethod.GET)
		public String admin_golfcouseDetail(@RequestParam int gc_no, Model model) throws Exception {
			//System.out.println(gc_no);
			GolfcouseVO golfcouseVO = golfcouseService.getGolfcouse(gc_no);
			//System.out.println(classVO.toString());
			model.addAttribute("it", golfcouseVO);		
		return "admin/admin_golfcouseDetail";
	}
	
	
	//관리자 페이지 골프장 수정 페이지 불러오기
	@RequestMapping(value="/admin_editGolfcouse",method=RequestMethod.GET)
	public String admin_editGolfcouse(@RequestParam int gc_no, Model model) throws Exception {
		//System.out.println(gc_no);
		GolfcouseVO golfcouseVO = golfcouseService.getGolfcouse(gc_no);
		//System.out.println(classVO.toString());
		model.addAttribute("item", golfcouseVO);
		return "admin/admin_editGolfcouse";
	}

	//관리자 페이지 골프장 수정
	@PostMapping("/editGolfcouse_ok")
	public String editGolfcouse_ok(GolfcouseVO gc, MultipartHttpServletRequest request,Model model, MultipartFile file,HttpSession session) throws Exception {
		//System.out.println("test");
		
		String saveFolder = request.getServletContext().getRealPath("/upload/golfcouse");

		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		//골프장 정보
		int gc_no=Integer.parseInt(request.getParameter("gc_no"));
		String gc_title=request.getParameter("gc_title"); //골프장명
		String gc_english=request.getParameter("gc_english"); //골프장 영문명
		String gc_area=request.getParameter("gc_area"); //지역
		String gc_hole=request.getParameter("gc_hole"); //홀
		int gc_golf=Integer.parseInt(request.getParameter("gc_golf")); //파
		int gc_length=Integer.parseInt(request.getParameter("gc_length")); //길이
		String gc_kind=request.getParameter("gc_kind"); //잔디종류
		String gc_type=request.getParameter("gc_type"); //코스타입
		String gc_configuration=request.getParameter("gc_configuration"); //코스구성
		String gc_caddy=request.getParameter("gc_caddy");//캐디
		String gc_cart=request.getParameter("gc_cart");//카트
		String gc_architects=request.getParameter("gc_architects");//설계자명
		String gc_content=request.getParameter("gc_content");//골프장내용
		String gc_coordinates=request.getParameter("gc_coordinates");//지도 좌표값
		String gc_address_postcode=request.getParameter("gc_address_postcode"); //우편번호
		String gc_address_roadAddress=request.getParameter("gc_address_roadAddress"); //도로명주소
		String gc_address_jibunAddress=request.getParameter("gc_address_jibunAddress"); //지번주소
		String gc_address_detailAddress=request.getParameter("gc_address_detailAddress"); //상세주소
		String gc_address_extraAddress=request.getParameter("gc_address_extraAddress"); //참고항목
		String gc_phone=request.getParameter("gc_phone");//전화번호
		String gc_fax=request.getParameter("gc_fax");//팩스
		String gc_move=request.getParameter("gc_move");//골프장까지 자차이동경로
		String gc_date=request.getParameter("gc_date");//골프장 개장날짜
		
		
		//이미지 업로드
		 file = request.getFile("file2"); //이미지
		 
		if(file != null) {
			String fileName = file.getName();
			Calendar cal = Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);//년도값
			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
			int date=cal.get(Calendar.DATE);//일값

			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
			File path01 = new File(homedir);

			if(!(path01.exists())) {
				path01.mkdir();
			}
			Random r = new Random();
			int random = r.nextInt(100000000);

			// 첨부 파일 확장자를 구함 
			
			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = "class" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			Path filePath = Paths.get(homedir+"/"+refileName);
			if(new File("/"+homedir+"/"+refileName).exists()) {
				Files.delete(filePath);
			}	
			File saveFile= new File(homedir+"/"+refileName);
			
			file.transferTo(saveFile); //새롭게 생성된 폴더 경로에 변경된 파일로 실제 업로드
			
			gc.setGc_image(fileDBName);
		} else {
			String fileDBName="";
			gc.setGc_image(fileDBName);
		}
			gc.setGc_no(gc_no);
			gc.setGc_title(gc_title);
			gc.setGc_english(gc_english);
			gc.setGc_area(gc_area);
			gc.setGc_hole(gc_hole);
			gc.setGc_golf(gc_golf);
			gc.setGc_length(gc_length);
			gc.setGc_kind(gc_kind);
			gc.setGc_type(gc_type);
			gc.setGc_configuration(gc_configuration);
			gc.setGc_caddy(gc_caddy);
			gc.setGc_cart(gc_cart);
			gc.setGc_architects(gc_architects);
			gc.setGc_content(gc_content);
			gc.setGc_coordinates(gc_coordinates);
			gc.setGc_address_postcode(gc_address_postcode);
			gc.setGc_address_roadAddress(gc_address_roadAddress);
			gc.setGc_address_jibunAddress(gc_address_jibunAddress);
			gc.setGc_address_detailAddress(gc_address_detailAddress);
			gc.setGc_address_extraAddress(gc_address_extraAddress);	
			gc.setGc_phone(gc_phone);
			gc.setGc_fax(gc_fax);
			gc.setGc_move(gc_move);
			gc.setGc_date(gc_date);
			
		
		

			this.golfcouseService.updategolfcouse(gc);

		return "redirect:/admin/admin_golfcouseList?page="+page;
	}
	
	//관리자 페이지 골프장 삭제
		@RequestMapping("/admin_golfcouse_del")
		public String admin_golfcouse_del(int gc_no) throws Exception{

			this.golfcouseService.deleteGolfcouse(gc_no);
			return "redirect:/admin/admin_golfcouseList";
		}//admin_class_del()
		
		
	
	
}
