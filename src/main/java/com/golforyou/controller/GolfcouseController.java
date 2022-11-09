package com.golforyou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.golforyou.service.GolfcouseService;
import com.golforyou.vo.GolfcouseVO;

@Controller
public class GolfcouseController {

	@Autowired
	private GolfcouseService golfcouseService;

	//골프장 목록
	@RequestMapping(value="/golfcouse_list",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String golfcouse_list(Model listGC, HttpServletRequest request,@ModelAttribute  GolfcouseVO gc) {
		int page=1;
		int limit=8;//한페이지에 보여지는 목록개수
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

		gc.setStartrow((page-1)*8+1);//시작행번호
		gc.setEndrow(gc.getStartrow()+limit-1);//끝행 번호

		List<GolfcouseVO> gclist=this.golfcouseService.getgolfcouseList(gc); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,9,17 ..)
		int startpage=(((int)((double)page/8+0.9))-1)*8+1;
		//현재 페이지에 보여질 마지막 페이지(8,16 ..)
		int endpage=maxpage;
		if(endpage>startpage+8-1) endpage=startpage+8-1;

		listGC.addAttribute("gclist",gclist);
		listGC.addAttribute("page",page);
		listGC.addAttribute("startpage",startpage);
		listGC.addAttribute("endpage",endpage);
		listGC.addAttribute("maxpage",maxpage);
		listGC.addAttribute("listcount",totalCount);
		listGC.addAttribute("find_field",find_field);
		listGC.addAttribute("find_name",find_name);
		return "/golfcouse/golfcouse_list";
	}//golfcouse_list()

	
	
	//골프장 상세 페이지

	@RequestMapping(value="/golfcouse_Main",method=RequestMethod.GET)
		public String golfcouse_Main(@RequestParam int gc_no, Model model) throws Exception {
			//System.out.println(gc_no);
			GolfcouseVO golfcouseVO = golfcouseService.getGolfcouse(gc_no);
			//System.out.println(classVO.toString());
			model.addAttribute("it", golfcouseVO);		
		return "/golfcouse/golfcouse_Main";
	}
	
	
	//골프장 검색페이지
		@RequestMapping(value="/golfcouse_search",method=RequestMethod.GET)
		public String golfcouse_search() {
			return "/golfcouse/golfcouse_search";
		}//golfcouse_search()

	


}
