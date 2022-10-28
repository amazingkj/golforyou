package com.golforyou.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.golforyou.config.auth.PrincipalDetails;
import com.golforyou.repository.UserRepository;
import com.golforyou.service.LoginService;
import com.golforyou.util.MailService;
import com.golforyou.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private MailService mailsender;
	
	//@Autowired
	//private PrincipalDetailsService principalDetail;
	@GetMapping("/test/login")
	public String testLogin(HttpServletRequest request, HttpSession session,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails){
		System.out.println("/test/login================");
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		
		System.out.println("authentication:"+principalDetails.getUsername()); //getUser 로 호출하고싶은데..
		System.out.println("userDetails:"+userDetails.getUsername());
		request.getSession().setAttribute("id", principalDetails.getUsername());
		request.getSession().setAttribute("pw", principalDetails.getPassword());
		return "redirect:/";
	}
	
	@GetMapping("/test/oauth/login")
	public String testOauthLogin(HttpServletRequest request,
			Authentication authentication,
			@AuthenticationPrincipal OAuth2User oauth){
		System.out.println("/test/oauth/login================");
		OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
		
		System.out.println("authentication:"+oauth2User.getAttributes());
		System.out.println("oauth2user:"+oauth.getAttributes());
		request.getSession().setAttribute("id", oauth2User.getName());
		request.getSession().setAttribute("pw", oauth2User.getName()); //수정예정
	
		//request.getSession().setAttribute("id", oauth2User.getAttribute);
		return "redirect:/";
	}
	
	
	@GetMapping({"","/"})
	public String index() {
		return "index";	
	}
	
	
	//OAuth로 로그인 해도, 일반 로그인을 해도 PrincipalDetails
	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("principalDetails:"+principalDetails.getUsername());
		return "user";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "admin/adminTest";
	}
	
//	 @GetMapping("/user/login")
//	    public String userLoginForm(@ModelAttribute("member") MemberVO member, HttpSession session) {
//	        if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
//	            return "redirect:/";
//	        }
//
//	        return "/member/login";
//	    }
	 
	 
	@RequestMapping("/access_denied")
	public String access_denied(Model model){
		model.addAttribute("loginErrorMsg","아이디 또는 비밀번호 확인해주세요");
		return "member/access_denied";
	}
	
	@GetMapping("/manager")
	public @ResponseBody String manager() {
		return "manager";
	}
	

	@RequestMapping("/login")
	public String login(PrincipalDetails principalDetails, HttpSession session) {
		
//		if(session==null){
//			return "member/login";
//		
//		}else {
//			return "redirect:/";   //세션이 있으면 index로 
//		}
		
		return "member/login";
	}
	
	//스프링 시큐리티가 해당 주소를 낚아채버림 
	@RequestMapping("/loginOk")
	public String login_ok() {
		return "redirect:/test/login";
	}
	
	@RequestMapping("/index")
	public String loginandSession(HttpServletRequest request, HttpSession session,
			Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails){
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
		
		System.out.println("authentication:"+principalDetails.getUsername()); 
		System.out.println("userDetails:"+userDetails.getUsername());
		request.getSession().setAttribute("id", principalDetails.getUsername());
	
		return "redirect:/";
	}

	@GetMapping("/join")
	public String join(PrincipalDetails principalDetails, HttpSession session) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
//		System.out.println("auth"+auth);
//		if(auth==null){
//			return "member/join";
//		
//		}else {
//			return "redirect:/";   //세션이 있으면 index로 
//		}
		return "member/join";
	}
	 @ResponseBody
	@RequestMapping("/idcheck")
    public int idcheck(String username, HttpServletRequest request) {
        System.out.println("테스트");
        int count = 0;
        //Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = this.loginService.idCheck(username);
        System.out.println(count);
        
        if(count==1) {
        	request.setAttribute("username", username);
        }
        //map.put("cnt", count);
        //System.out.println(map);

        return count;
    }
	
	@PostMapping("/join_ok")
	public String joinOk(MemberVO member,RedirectAttributes Redirect) {
		

		System.out.println(member);
		member.setMrole("ROLE_USER");
		member.setMstate(1); //default;
		
		String rawPassword = member.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encPassword);
		userRepository.save(member);//회원가입 잘됨
		Redirect.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
		return "redirect:/";
	}

	
	//비밀번호 찾기
		@GetMapping("findPwd")
		public String findPwd() {
			return "member/findPwd"; 
			
		}//findPwd()
		
		//비밀번호 찾기 인증메일 전송
		@RequestMapping("findPwd_ok")
		public String MailSender(MemberVO m, HttpServletRequest request) {
			
			
			String email=request.getParameter("email");
		
			m=this.loginService.getPassword(email);
			System.out.println("m"+m);
			String mEmail=m.getMemail(); //전체 email 이 널 
			int mstate=m.getMstate();
			
			System.out.println(mEmail); //null
			
			if(email.equals(mEmail) && mstate!=2) {
				
				System.out.println("메일 보내도 됨");
				
				mailsender.mailSend(m);
			}
			
			
			return "member/findPwd_ok";
			
		}
		
		
	
	
	//@Secured("ROLE_ADMIN") 이렇게 쓰거나 
	//@PreAuthorize("hasRole('ROLE_MANAGER') or hasRole()")  _ 두 개 이상 걸고 싶을 때 이렇게 사용 : 함수 시작 전, 
	@Secured("ROLE_ADMIN")
	@GetMapping("/info")
	public @ResponseBody String info() {
		return "개인정보";
	}
	

}


