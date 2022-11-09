package com.golforyou.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomErrorController implements ErrorController{


    @GetMapping("/error")
    public String handleError(HttpServletRequest request){
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if(null != status){
            
        	int statusCode = Integer.valueOf(status.toString());
            
            if(statusCode == HttpStatus.FORBIDDEN.value()){
                return "error"; //403에러
            }else if(statusCode == HttpStatus.NOT_FOUND.value()){
                return "error"; //404에러
            }else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            	return "error"; //500에러
            } else {
            	return "error"; //그 외
            }
        }
        return "error";
    } 

//    @Override
//    public String getErrorPath() {
//        return "/error";
//    }
}