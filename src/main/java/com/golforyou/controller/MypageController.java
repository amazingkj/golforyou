package com.golforyou.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

//import java.io.File;
//import java.io.PrintWriter;
//import java.util.Calendar;
//import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.golforyou.config.auth.PrincipalDetails;
import com.golforyou.repository.UserRepository;
import com.golforyou.service.MypageService;
import com.golforyou.service.RankingService;
import com.golforyou.vo.AddrVO;
import com.golforyou.vo.MemberVO;
import com.golforyou.vo.RankingVO;
import com.golforyou.vo.WithdrawalVO;


@Controller
public class MypageController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Autowired 
	private MypageService mypageService;
	@Autowired
	private RankingService rankingService;


	//마이페이지 메인
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')") 
	@GetMapping("mypage")
	public ModelAndView mypage( HttpServletRequest request, HttpServletResponse response, @AuthenticationPrincipal PrincipalDetails userDetails, Authentication authentication) {
		
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		String username=principalDetails.getUsername();
		
		MemberVO member = userRepository.findByUsername(username);
		
		int mno = member.getMno();
		String nickname=request.getParameter("nickname"); 
		String maddr=request.getParameter("maddr"); 
		String mfile=request.getParameter("mfile");
		
		int tierNum = rankingService.getPoint(mno);
		String tier = "";
		String tierStr = "";
		String tierURL = "";
		
		if(tierNum < -15){
			tier = "d.png";
			tierStr = "다이아몬드";
			tierURL = "/images/t_"+tier;
		}else if(tierNum >= -15 && tierNum < -10){
			tier = "p.png";
			tierStr = "플레티넘";
			tierURL = "/images/t_"+tier;
		}else if(tierNum >= -10 && tierNum < -5){
			tier = "g.png";
			tierStr = "골드";
			tierURL = "/images/t_"+tier;
		}else if(tierNum >= -5 && tierNum < 5){
			tier = "s.png";
			tierStr = "실버";
			tierURL = "/images/t_"+tier;
		}else{
			tier = "b.png";
			tierStr = "브론즈";
			tierURL = "/images/t_"+tier;
		}
	
			ModelAndView m=new ModelAndView("mypage/main");
			m.addObject("m",member);//m 키이름에 em객체 저장 
			m.addObject("nickname",nickname);
			m.addObject("maddr",maddr);
			m.addObject("mfile",mfile);
			m.addObject("tierURL",tierURL);
			m.addObject("tierStr",tierStr);
			return m;
		
	}//mypage()
	

	
	//회원 정보 수정 
	@RequestMapping("profile")
	public ModelAndView profile( HttpServletRequest request, HttpServletResponse response, HttpSession session ) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		
		String id=(String)session.getAttribute("id");
		//this.loginService.getMember(username);  여기서 프로필로 el 값 넘기는게 안됨.. delete 
		
		MemberVO member = userRepository.findByUsername(id);			
		
		String memail=(String)session.getAttribute(member.getMemail());
		System.out.println(memail);
		String mphone=(String)session.getAttribute("mphone");
		String maddr=(String)session.getAttribute("maddr");	
		String mfile=(String)session.getAttribute("mfile");	
		String nickname=(String)session.getAttribute("nickname");	
		
		List<AddrVO> addrList = mypageService.getAddrList();
		
		System.out.println(member.getUsername()+member.getPassword());
		
			ModelAndView m=new ModelAndView("mypage/profile");
			m.addObject("m",member);//m 키이름에 em객체 저장 
			m.addObject("mphone",mphone);		
			m.addObject("nickname",nickname);
			m.addObject("memail",memail);
			m.addObject("maddr",maddr);
			m.addObject("addrList",addrList);
			m.addObject("mfile",mfile);
			return m;
		
	}
	
	
	//@SuppressWarnings("null")
	@RequestMapping("profileEdit_ok")
	public ModelAndView profileEdit_ok(MemberVO m, RankingVO r, MultipartFile upFile, MultipartHttpServletRequest request, HttpServletResponse response, HttpSession session, Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
	
		String saveFolder=request.getServletContext().getRealPath("/upload/profile");//이진파일 업로드 실제 경로를 구함.
	
		
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
     	System.out.println(principalDetails);
		
     		String username=principalDetails.getUsername();
			String nickname=request.getParameter("nickname"); 
			String mphone=request.getParameter("mphone"); 
			String memail=request.getParameter("memail");
			String maddr=request.getParameter("maddr");
		
		
			
		upFile=request.getFile("file");//첨부할 파일을 가져온다. 
		if(upFile != null) {//첨부한 파일이 있는 경우
			
			
			String fileName=upFile.getName();//첨부한 파일명을 구함
			File delFile=new File(saveFolder+m.getMfile()); //삭제할 파일 객체 생성 
			
			if(delFile.exists()) {//삭제할 파일이 존재하면 
				delFile.delete();//기존 첨부파일 삭제 
			}
			
			Calendar cal=Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);
			int month=cal.get(Calendar.MONTH)+1;
			int date=cal.get(Calendar.DATE);
			
			String homedir=saveFolder+"/"+year+"-"+month+"-"+date;
			File path01=new File(homedir);
			if(!(path01.exists())) {path01.mkdir();}
			Random ran=new Random();
			int random=ran.nextInt(100000000);
			
			/*첨부파일 확장자 구함*/
			int index=fileName.lastIndexOf(".");
			//마침표를 맨 오른쪽부터 찾아서 가장 먼저 나오는 .의 위치 번호를  맨 왼쪽부터 카운터해서 반환 
			//첫 문자는 0부터 시작 
			String fileExtendsion=FilenameUtils.getExtension(upFile.getOriginalFilename()); // fileName.substring(index+1);//마침표 이후부터 마지막 문자까지 구함. 
			//즉 첨부파일  확장자를 구함. 
			String refileName="profile"+year+month+date+random+"."+fileExtendsion;//새로운 파s일명 저장 
			String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드 값
			File saveFile =new File(homedir+"/"+refileName); //생성된 폴더에 변경된 파일명으로 실제 업로드 
			upFile.transferTo(saveFile);
			m.setMfile(fileDBName);
			
		}else {//수정 첨부파일을 하지 않았을 때
			String fileDBName="";
			if(m.getMfile()!=null) {
				m.setMfile(m.getMfile());
											
			}else {
				m.setMfile(fileDBName);
			}
		}//수정 첨부파일을 첨부한 경우와 안한 경우 분기 조건문
		
		m.setUsername(username);
		m.setNickname(nickname); 
		m.setMphone(mphone); 
		m.setMemail(memail);
		m.setMaddr(maddr);
		
		//System.out.println(m);
		mypageService.updateMember(m);//username 기준으로 닉네임, 휴대폰, email, maddr, 첨부파일 수정 
		
		System.out.println("결과 출력");
		System.out.println(m);
		this.mypageService.updateMember(m);//username 기준으로 닉네임, 휴대폰, email, maddr, 첨부파일 수정 
		System.out.println("test");

		return new ModelAndView("redirect:/mypage");
		
	}//profileEdit_ok()

	
	
	//비밀번호 수정 
	@RequestMapping("changepwd")
	public String changepwd() {
		return "mypage/pwdChange"; 
	}//profile()
	
	@RequestMapping("changepwd_ok")
	public String changepwd_ok(HttpServletRequest request, HttpServletResponse response, 
		HttpSession session, Authentication authentication, @AuthenticationPrincipal PrincipalDetails userDetails) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter(); 
		
		MemberVO member=new MemberVO();
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();	
		String password=principalDetails.getPassword();
		String username=principalDetails.getUsername();
		member.setUsername(username);
		
		String inputPw=request.getParameter("mem_password");
		
		System.out.println("inputpw "+inputPw);
		System.out.println("username "+username);
		System.out.println("password "+password);
		System.out.println("비교 "+bCryptPasswordEncoder.matches(inputPw,password));	
		
		String wantPW=request.getParameter("new_mem_password");
		String newPw=bCryptPasswordEncoder.encode(wantPW);
		
		
		member.setPassword(newPw);
	
		System.out.println(wantPW);	
		System.out.println(newPw);
	//비교하는 문자열은 해시처리 하기 전 문자열과 비교해야함. matches 활용
		if(bCryptPasswordEncoder.matches(inputPw,password)) {
			System.out.println(member);
			this.mypageService.changePwd(member); 
			
			out.println("<script>");
			out.println("alert('비밀번호가 변경되었습니다.');");
			out.println("self.close();");
			out.println("</script>");
			return "redirect:/";
		}else {
			out.println("<script>");
			out.println("alert('입력한 비밀번호가 다릅니다. 비밀번호를 변경할 수 없습니다.');");
			out.println("self.close();");
			out.println("</script>");
			
		}
		

		return null;
	}//changepwd_ok()
		
	@RequestMapping("withdrawal")
	public String withdrawal() {
		return "mypage/withdrawal"; 
	}//withdrawal()
	
	@Transactional
	@RequestMapping("withdrawal_ok")
	public String withdrawal_ok(MemberVO m, WithdrawalVO w, HttpServletRequest request, HttpServletResponse response, 
			HttpSession session, RedirectAttributes redirect, Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails) throws Exception{	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
			
			PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
	     	System.out.println(principalDetails);
			
			String username=principalDetails.getUsername();
			String mdelcont=request.getParameter("mdelcont");	
			w.setUsername(username); w.setMdelcont(mdelcont); 
			
			
			System.out.println("username "+username);
			System.out.println("username "+w);
			this.mypageService.saveDelcont(w);
	    	int result=userRepository.deleteByUsername(username);
	    	
		        if (result>0) {
		        	out.println("<script>");
					out.println("alert('성공적으로 회원정보를 삭제했습니다.');");
					out.println("window.close();");
					out.println("</script>");
		        	redirect.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
		        	
		        	
		        	
		     		SecurityContextHolder.clearContext();
		        } else {
		        	 redirect.addFlashAttribute("msg", "다시 시도해주세요");
		        	
		        }
		        
	
			 return "redirect:/"; 	
			
		
	}//withdrawal_ok()
	
	
	

}
