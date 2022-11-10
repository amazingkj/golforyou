package com.golforyou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.golforyou.service.RankingService;
import com.golforyou.service.ScBoardService;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;

@Controller
public class GolForYouController {
	
	@Autowired
	private RankingService rankingService;
	
	@Autowired
	private ScBoardService scboardService;

	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String home(HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		List<RankingVO> ranking = rankingService.getRankList();
		List<MemberVO> ranking2 = rankingService.getRankList2();
		
		String id = (String)session.getAttribute("id");
		
		for(int i=0 ; i<ranking.size() ; ++i) {			
			
			request.setAttribute("r_Nickname"+i, ranking2.get(i).getNickname());
			request.setAttribute("r_id"+i, ranking2.get(i).getUsername());
			request.setAttribute("r_sum"+i, ranking.get(i).getR_sum());
		}
		return "/index";
    }//index()
	
	
}
