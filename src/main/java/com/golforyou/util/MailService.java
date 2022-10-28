package com.golforyou.util;

import org.springframework.mail.MailMessage;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.golforyou.vo.MemberVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailService {

	private JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "jiin724@gmail.com";
    
    
    public void mailSend(MemberVO member) {
    	
  
        SimpleMailMessage message = new SimpleMailMessage();
        
        
    	String title = "GolForYou 계정 확인 메일.";
        String content = "<h2>안녕하세요 당신의 아이디는 "+member.getUsername()+"<br>당신의 비밀번호는 "+member.getPassword()+"입니다.</h2>";
		
        
        message.setTo(member.getMemail());
        message.setFrom(MailService.FROM_ADDRESS);
        message.setSubject(title); //member.getTitle()
        message.setText(content); //member.getMessage()

        mailSender.send(message);
    }
}
