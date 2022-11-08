package com.golforyou.config.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.golforyou.config.auth.PrincipalDetails;
import com.golforyou.config.oauth.provider.GoogleUserInfo;
import com.golforyou.config.oauth.provider.NaverUserInfo;
import com.golforyou.config.oauth.provider.OAuth2UserInfo;
import com.golforyou.repository.UserRepository;
import com.golforyou.vo.MemberVO;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	//구글에서 받은 userRequest데이터에 대한 후처리되는 함수
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration:"+userRequest.getClientRegistration());//registrationId로 어떤 OAuth로 로그인 했는지 확인
		System.out.println("getAccessToken:"+userRequest.getAccessToken().getTokenValue());
		OAuth2User oauth2User = super.loadUser(userRequest);
		//구글 로그인 버튼 클릭 > 구글로그인 창 > 로그인 완료 > code리턴 (OAuth-Client라이브러리) > accessToken 요청 
		//userRequest 정보 > loadUser함수 호출 > 구글로부터 회원 프로필 받아줌. 
		System.out.println("getAttributes:"+oauth2User.getAttributes());
	
		
	//회원가입 강제 진행 예정 
		
		OAuth2UserInfo oAuth2UserInfo = null;
		
		if(userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("구글 로그인 요청");
			oAuth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
			
		}else if(userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			System.out.println("네이버 로그인 요청");
			oAuth2UserInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
			
		}else {
			System.out.println("구글 또는 네이버만 Oauth2 가입 가능합니다");
		}


		System.out.println(oAuth2UserInfo);
		String provider = oAuth2UserInfo.getProvider(); 
		String providerId = oAuth2UserInfo.getProviderId();
		//
		
		String nickname=oAuth2UserInfo.getNickname();
		String mfile =oAuth2UserInfo.getProfile_image();
		String gender=oAuth2UserInfo.getGender();
		String phone=oAuth2UserInfo.getMobile();
		
		//
		String username =provider+"_"+providerId; //mProvider+"_"+mProviderid; //google_***
		String password = bCryptPasswordEncoder.encode("golforyou");
		String email = oAuth2UserInfo.getEmail();
		String role = "ROLE_USER";
		
		MemberVO userEntity = userRepository.findByUsername(username);
		
		if(userEntity == null) {
		
			System.out.println("userEntity: "+userEntity);
			System.out.println("Oauth 로그인이 최초입니다.");
			userEntity = MemberVO.builder()
					.username(username)
					.nickname(nickname)
					.password(password)
					.memail(email)
					.mrole(role)
					.mstate(1)
					.mprovider(provider)
					.mprovider(providerId)
					.mfile(mfile)
					.mphone(phone)
					.mgender(gender)
					.build();
			userRepository.save(userEntity);//회원가입!
			
			System.out.println("가입이 완료되었습니다");
			
			
		}else {
			System.out.println("가입이 이미 되어있습니다.");
		}
		
		
		return new PrincipalDetails(userEntity,oauth2User.getAttributes());
		//authentication 객채로 들어감
		//Oauth2로 로그인 하면, Map을 같이 가지고 있음
	}
}