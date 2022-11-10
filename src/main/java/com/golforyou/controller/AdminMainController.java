package com.golforyou.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


import com.golforyou.service.LoginService;
import com.golforyou.vo.MemberVO;

@Controller
public class AdminMainController {
	
	@Autowired
	private LoginService loginService;
	
	
	//관리자 메인 페이지
		@GetMapping("/admin")
		public ModelAndView adminmain() {
			ModelAndView admin = new ModelAndView("/admin/adminmain");
			return admin;
		}
		
		
		@GetMapping("/admin/member")
		public ModelAndView adminmember() {
			
			
			
			ModelAndView admin = new ModelAndView("/admin/admin_member");
			return admin;
		}

		
		@PostMapping("/admin/member_ok")
		public String adminmemberOK(MemberVO member,HttpServletRequest request,HttpServletResponse response) throws IOException {
	
			String username=request.getParameter("adminRole");
			
		int i=this.loginService.updateAdminMember(username);
		PrintWriter out = response.getWriter();
		if(i==1) {
			out.println("<script>");
			out.println("alert('권한 부여가 성공했습니다.')");			
			out.println("</script>");
			
		} else {
			out.println("<script>");
			out.println("alert('권한 부여가 실패했습니다. 아이디를 다시 확인해주세요')");
			out.println("</script>");
		
		}
		return "redirect:/admin";
			
		}

		
}
