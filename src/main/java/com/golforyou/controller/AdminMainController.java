package com.golforyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainController {
	//관리자 메인 페이지
		@GetMapping("/admin")
		public ModelAndView adminmain() {
			ModelAndView admin = new ModelAndView("/admin/adminmain");
			return admin;
		}

}
