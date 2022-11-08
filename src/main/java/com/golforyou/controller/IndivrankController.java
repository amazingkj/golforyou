package com.golforyou.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.golforyou.service.IndivService;
import com.golforyou.service.RankingService;
import com.golforyou.service.ScBoardService;
import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.GolfcouseVO;
import com.golforyou.vo.ScorecardVO;

@Controller
public class IndivrankController {
	
	@Autowired (required=false)
	private IndivService indivService;
	
	@Autowired (required=false)
	private RankingService rankingService;
	
	@Autowired (required=false)
	private ScBoardService scBoardService;
	
	//개인랭크 페이지
	@GetMapping("/indivrank")
	public ModelAndView indivrank(ScorecardVO sv, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView im = new ModelAndView("/tier/indivrank");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String rid = request.getParameter("rId");
		String nickname = request.getParameter("rNickname");
		if(rid == null) { //ranking페이지에서 타고 온 경우가 아닌 경우
			HttpSession session = request.getSession();
			if((String)session.getAttribute("id") == null) { //로그인이 안되어있는 경우
				out.println("<script>");
				out.println("alert('로그인부터 하세요')");
				out.println("location='login'");
				out.println("</script>");
			}else { //로그인되어있으면
				rid = (String)session.getAttribute("id");			
			}			
		} 
		if(rid != null) { //ranking페이지에서 타고오거나 로그인한 경우에만 들어갈수있음
			sv.setS_id(rid);
									
			String rPoint = request.getParameter("rPoint_"); //ranking페이지에서 받아온 포인트값
			if(rPoint == null) { //ranking페이지에서 타고온 경우가 아니라면
				rPoint = Integer.toString(indivService.getPoint(rid)); //로그인한 회원의 정보에서 포인트값 가져옴				
			}
			String rankno = request.getParameter("rankno"); //순위
			
			int getCount = rankingService.playCount(rid); //골프 플레이 횟수

			List<ScorecardVO> scorecardList = scBoardService.getScorecardList(rid);
			
			if(nickname == null) {
				nickname = rankingService.getNickname(rid);
			}
			
			List<String> viewDate = new ArrayList<>(); //골프친날
			List<String> viewLocation = new ArrayList<>(); //골프친장소
			List<Double> viewSumScore = new ArrayList<>(); //점수
			List<Integer> viewRange = new ArrayList<>(); //최대비거리
			List<Integer> noviewNo = new ArrayList<>(); //스코어카드 올린 게시판 글번호
			List<Double> put = new ArrayList<>(); //퍼팅
			List<Double> pointList = new ArrayList<>();
			int point = 0;			
			int obandhazard = 0;
			int strike = 0;			
			int sumPutting = 0;
			
			for(int i=0 ; i<getCount ; ++i) {
				put.add(scorecardList.get(i).getS_putting());
				sumPutting += put.get(i);			
				obandhazard += scorecardList.get(i).getS_obandhazard(); //지금까지 OB+Hazard 한 횟수 합
				strike += scorecardList.get(i).getS_strike(); //지금까지 골프공을 친 횟수 합		
				
				viewDate.add(scorecardList.get(i).getS_date());
				viewLocation.add(scorecardList.get(i).getS_location());
				viewSumScore.add(scorecardList.get(i).getS_sumscore());
				viewRange.add(scorecardList.get(i).getS_range());;
				noviewNo.add(scorecardList.get(i).getS_no());
				
				pointList.add(scorecardList.get(i).getS_sumscore());
				point += pointList.get(i);
				
				im.addObject("viewDate", viewDate);
				im.addObject("viewLocation", viewLocation);
				im.addObject("viewBestScore", viewSumScore);
				im.addObject("viewRange", viewRange);
				im.addObject("noviewNo",noviewNo);
			}
			
			if(rankno == null) { //ranking페이지에서 타고온 경우가 아닌 경우 순위를 구해야함
				int num = 1; //순위 초기값
				
				List<String> row_id = indivService.getRowNum(rid); //점수 기준으로 테이블에서 아이디가 몇번째인가
				
				while(num == getCount) {
					if(row_id.get(num).equals(rid)) { //num번째 아이디와 로그인한 아이디가 일치하는지 여부
						break; //일치하면 while문 중단
					}
					++num; //돌때마다 순위 하나씩 증가
				}			
				rankno = num+""; //num값이 순위
			}
			
			
			
			double avgPutting = (double)sumPutting/getCount;
			String strPutting = String.format("%.2f", avgPutting); //평균 퍼팅횟수
			
			Calendar cal = Calendar.getInstance();
			int intyear = cal.get(Calendar.YEAR);
			String year = Integer.toString(intyear);
			
			int jan = 0;int feb = 0;int mar = 0;		
			int apr = 0;int may = 0;int jun = 0;
			int jul = 0;int aug = 0;int sep = 0;
			int oct = 0;int nov = 0;int dec = 0;
					
			for(int i=1 ; i<=12 ; i++) {
				if(i >= 1 && i <= 9) {
					sv.setGraph_date(year+"_0"+i+"%");
				}else if(i >= 10 && i <= 12) {
					sv.setGraph_date(year+"_"+i+"%");
				}
				
				if(i == 1) {
					jan = indivService.monthCount(sv);
				}else if(i == 2) {
					feb = indivService.monthCount(sv);
				}else if(i == 3) {
					mar = indivService.monthCount(sv);
				}else if(i == 4) {
					apr = indivService.monthCount(sv);
				}else if(i == 5) {
					may = indivService.monthCount(sv);
				}else if(i == 6) {
					jun = indivService.monthCount(sv);
				}else if(i == 7) {
					jul = indivService.monthCount(sv);
				}else if(i == 8) {
					aug = indivService.monthCount(sv);
				}else if(i == 9) {
					sep = indivService.monthCount(sv);
				}else if(i == 10) {
					oct = indivService.monthCount(sv);
				}else if(i == 11) {
					nov = indivService.monthCount(sv);
				}else if(i == 12) {
					dec = indivService.monthCount(sv);
				}
			}

			String tierURL = null;
			String tierStr = null;
			
			
			if(getCount < 5) { //플레이를 5판 미만으로 했다면 언랭
				tierURL = "/images/un_rank.png";
				tierStr = "UNRANK";
			}else { //5판이상 플레이한 회원만 티어 부여
				if(point < -15){
					tierURL = "/images/t_d.png";
					tierStr = "다이아몬드";
				}else if(point >= -15 && point < -10){
					tierURL = "/images/t_p.png";
					tierStr = "플레티넘";
				}else if(point >= -10 && point < -5){
					tierURL = "/images/t_g.png";
					tierStr = "골드";
				}else if(point >= -5 && point < 5){
					tierURL = "/images/t_s.png";
					tierStr = "실버";
				}else{
					tierURL = "/images/t_b.png";
					tierStr = "브론즈";
				}
			}
			String profile = "";
			if(indivService.getProfile(rid) == null) {
				profile = "/images/member/blank_profile.png";
			}else {
				profile = "/upload/profile"+indivService.getProfile(rid);
			}
			
			
			//List<GolfcouseVO> field = scBoardService.getFieldList();
			
			im.addObject("rid", rid);
			im.addObject("rNickname", nickname);
			im.addObject("rPoint", rPoint);
			im.addObject("rankno", rankno);
			im.addObject("getCount", getCount);
			im.addObject("obandhazard", obandhazard);
			im.addObject("strike", strike);
			im.addObject("strPutting", strPutting);
			im.addObject("jan", jan);
			im.addObject("feb", feb);
			im.addObject("mar", mar);
			im.addObject("apr", apr);
			im.addObject("may", may);
			im.addObject("jun", jun);
			im.addObject("jul", jul);
			im.addObject("aug", aug);
			im.addObject("sep", sep);
			im.addObject("oct", oct);
			im.addObject("nov", nov);
			im.addObject("dec", dec);
			im.addObject("dec", dec);
			im.addObject("tierURL", tierURL);
			im.addObject("tierStr", tierStr);
			im.addObject("profile", profile);
			//im.addObject("field", field);
			return im;
		}
		return null;
		
	}
	
	@RequestMapping(value="tier/scorecardImg")
	public void scorecardImg(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		
		String imgName = scBoardService.getImg(no);
		
		request.setAttribute("imgName", imgName);
	}
}
