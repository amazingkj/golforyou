package com.golforyou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.golforyou.config.auth.PrincipalDetails;
import com.golforyou.service.CustomerService;
import com.golforyou.util.MailService;
import com.golforyou.vo.CustomerVO;

@Controller
public class CustomerController {
	
	@Autowired(required=false)
	private CustomerService customerService;
	

	@Autowired(required=false)
	private MailService mailsender;
	
	@RequestMapping(value = "/customer_main", method = RequestMethod.GET)
	public String Customer_main() {
		return "customer/main"; 
		
		
	} //고객센터 메인 페이지 

	
	@RequestMapping(value = "/customer_fnq")
	public String customer_onebyoneFnq(CustomerVO ct, HttpServletRequest request, HttpServletResponse response, HttpSession session, Authentication authentication,
			@AuthenticationPrincipal PrincipalDetails userDetails) {
		
		
		PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
 		String username=principalDetails.getUsername();
		String consult_type=request.getParameter("consult_type"); 
		String question_title=request.getParameter("question_title"); 
		String question_contents=request.getParameter("question_contents");
	//	String question_file=request.getParameter("question_file");
		String phone01=request.getParameter("phone01");
		String phone02=request.getParameter("phone02");
		String phone03=request.getParameter("phone03");
		
		String phoneNum=phone01+"-"+phone02+"-"+phone03;
		
		String question_email=request.getParameter("question_email");
		
		
		ct.setConsult_type(consult_type);
		ct.setPhoneNum(phoneNum);
		ct.setQuestion_contents(question_contents);
		ct.setQuestion_email(question_email);
		ct.setQuestion_title(question_title);
		
		mailsender.OnebyOneFnqEmail(ct);
		
		return "customer/onebyoneFnq"; 
	} //환불정책
	
	@RequestMapping(value = "/customer_sitepolicy", method = RequestMethod.GET)
	public String customer_SitePolicy() {
		return "customer/SitePolicy"; 
	} //환불정책
	
	@RequestMapping(value = "/customer_holeinone", method = RequestMethod.GET)
	public String customer_holeInOne() {
		return "customer/holeInOne"; 
	} //홀인원 보험
	
	
}
