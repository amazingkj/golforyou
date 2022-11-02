package com.golforyou.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.golforyou.service.RankingService;
import com.golforyou.service.ScBoardService;
import com.golforyou.vo.ScboardVO;
import com.golforyou.vo.ScorecardVO;

@Controller
public class AdminRankController {
	@Autowired
	private ScBoardService scBoardService;
	@Autowired
	private RankingService rankingService;
	
	
	//관리자 스코어카드 첫페이지
	@RequestMapping("admin/admin_insertCard")
	public void admin_insertCard(HttpServletRequest request,ScorecardVO sv) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int page = 1; //페이지 쪽수
		int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int needCount = scBoardService.getNeedUpdateScorecardCount(); //업데이트해야할 스코어카드 갯수
		
		sv.setStartrow((page-1)*10+1);
		sv.setEndrow(sv.getStartrow()+limit-1);
		
		List<ScorecardVO> needList = scBoardService.getNeedUpdateScorecardList(sv); //업데이트해야할 스코어카드 목록
		//String nickname = rankingService.getNickname(sc_id);
						
		int maxpage = (int)((double)needCount/limit + 0.95); //총 페이지 수;
		int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; //시작 페이지;
		int endpage = maxpage;
		if(endpage > startpage + 9) {
			endpage = startpage + 9;
		}
		
		request.setAttribute("page", page);
		request.setAttribute("needCount", needCount);
		request.setAttribute("needList", needList);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
	}
	
	//입력해야 할 스코어카드 존재 확인여부
	@RequestMapping("admin/admin_insertCard_Check")
	public ModelAndView admin_InsertCard_Check(HttpServletRequest request, HttpServletResponse response, ScboardVO sb) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		ModelAndView aicm = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");

		int sc_no = Integer.parseInt(request.getParameter("admin_no"));
		String sc_id = request.getParameter("admin_id");
		//String sc_playdate = request.getParameter("admin_playdate");
		
				
		//sc_playdate = sc_playdate.replace("-", "_"); //2022-01-01을 2022_01_01로
	
		ScboardVO info = new ScboardVO();
		info.setSc_id(sc_id);
		info.setSc_no(sc_no);
		
		sb = scBoardService.getScBoardCont(info);
		
		if(sb != null) {
			if(scBoardService.getUpdated(info) == 0) {				
				//request.setAttribute("date", sc_playdate);	
				request.setAttribute("no", sc_no);
				request.setAttribute("id", sc_id);
				request.setAttribute("sb", sb);
				
				aicm.setViewName("admin/admin_insertCard2");
			}else {
				aicm.setViewName("admin/admin_insertCard_null");
			}
		}else {
			aicm.setViewName("admin/admin_insertCard_null");
		}
		return aicm;
	}
	

	
	//스코어카드 없는페이지
	@RequestMapping("admin/admin_insertCard_null")
	public void admin_insertCard_null() {
		
	}
	
	//스코어카드 정보 입력 확인
	@RequestMapping("/admin_insertCard_ok")
	public String admin_InsertCard_Ok(HttpServletRequest request, HttpServletResponse response, ScorecardVO sc) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String s_id = request.getParameter("s_id");
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		double point_sum = Double.parseDouble(request.getParameter("point_sum"));
		int s_strike = Integer.parseInt(request.getParameter("strike"));
		double put_avg = Double.parseDouble(request.getParameter("put_avg"));
		int range = Integer.parseInt(request.getParameter("range"));
		String location = request.getParameter("location");
		int s_obandhazard = Integer.parseInt(request.getParameter("OBandHazard"));
		
		sc.setS_id(s_id);
		sc.setS_no(s_no);
		sc.setS_range(range);
		sc.setS_location(location);
		sc.setS_putting(put_avg);
		sc.setS_sumscore(point_sum);
		sc.setS_strike(s_strike);
		sc.setS_obandhazard(s_obandhazard);
		
		int updatedCount = rankingService.getUpdatedScorecardCount(sc); //score_card테이블 레코드개수
		if(updatedCount == 0) {
			rankingService.resetScore(sc); //첫 가입시 r_sum 초기값 9999로 설정된걸 0으로 바꿔줌. 첫 입력에만 발동하게 조건을 걸어야함
			//s_updated가 1인게 하나도 없다면? 첫 업데이트때만 9999가 0이된다. 이게 맞네.
		}
		
		scBoardService.updateCard(sc);
		
		rankingService.updateAvgScore(sc); //point_sum,s_id
		
		return "redirect:admin/admin_insertCard";
	}
	
	//스코어카드 삭제
	@RequestMapping("admin/admin_insertCard_del")
	public void admin_InsertCard_del(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String s_id = request.getParameter("s_id");
		String s_date = request.getParameter("s_date");
		
		request.setAttribute("s_id", s_id);
		request.setAttribute("s_date", s_date);
	}
	
	//스코어카드 삭제 확인
	@RequestMapping("admin/admin_insertCard_del_ok")
	public String admin_InsertCard_del_ok(HttpServletRequest request, HttpServletResponse response, ScorecardVO sv) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String s_id = request.getParameter("s_id");
		String s_date = request.getParameter("s_date");
		
		sv.setS_id(s_id);
		sv.setS_date(s_date);
		
		scBoardService.delCard(sv);
		
		out.println("<script>");
		out.println("alert('삭제 완료')");
		out.println("<script>");
		
		return "redirect:/admin/admin_insertCard";
	}
}
