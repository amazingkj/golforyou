package com.golforyou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.golforyou.service.RankingService;
import com.golforyou.vo.RankingVO;

@Controller
public class GolForYouController {
	
	@Autowired
	private RankingService rankingService;

	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String home(HttpServletRequest request,HttpServletResponse response) {
		List<RankingVO> ranking = rankingService.getRankList();
		
		for(int i=0 ; i<ranking.size() ; ++i) {			
			//request.setAttribute("r_id"+i, ranking.get(i).getR_id());
			//request.setAttribute("r_sum"+i, ranking.get(i).getR_sum());
			
			request.setAttribute("r_id"+i, ranking.get(i).getR_nickname());
			request.setAttribute("r_sum"+i, ranking.get(i).getR_sum());
		}
		return "/index";
    }//index()
	
	
}
