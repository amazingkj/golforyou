package com.golforyou.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.golforyou.service.ClassService;
import com.golforyou.vo.AllClassVO;
import com.golforyou.vo.ClassPayVO;
import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.OnlineClassVO;


@Controller
public class ClassController {

	@Autowired
	private ClassService classService;

	//전체 클래스 목록
	@RequestMapping(value="/class_main",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String class_main(Model listA, HttpServletRequest request,@ModelAttribute AllClassVO allclassVO) {
		int page=1;
		int limit=8;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		allclassVO.setFind_field(find_field);
		allclassVO.setFind_name("%"+find_name+"%");
		allclassVO.setFind_field(find_field);
		allclassVO.setFind_name("%"+find_name+"%");
		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
		//와일드 카드문자

		int totalCount=this.classService.getRowCountAll(allclassVO);
		//검색전 총레코드 개수,검색후 레코드 개수

		allclassVO.setStartrow((page-1)*8+1);//시작행번호
		allclassVO.setEndrow(allclassVO.getStartrow()+limit-1);//끝행 번호

		List<AllClassVO> alist=this.classService.getAllList(allclassVO); //검색 전후 목록
		
		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,9,17 ..)
		int startpage=(((int)((double)page/8+0.9))-1)*8+1;
		//현재 페이지에 보여질 마지막 페이지(8,16 ..)
		int endpage=maxpage;
		if(endpage>startpage+8-1) endpage=startpage+8-1;

		listA.addAttribute("alist",alist);
		listA.addAttribute("page",page);
		listA.addAttribute("startpage",startpage);
		listA.addAttribute("endpage",endpage);
		listA.addAttribute("maxpage",maxpage);
		listA.addAttribute("listcount",totalCount);
		listA.addAttribute("find_field",find_field);
		listA.addAttribute("find_name",find_name);
		return "/class/class_main";
	}//class_main()

	//필드 클래스 페이지 목록
	@RequestMapping(value="/class_field",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String class_field(Model listC, HttpServletRequest request,@ModelAttribute FieldClassVO fc) {
		int page=1;
		int limit=8;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		fc.setFind_field(find_field);
		fc.setFind_name("%"+find_name+"%");
		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
		//와일드 카드문자

		int totalCount=this.classService.getRowCountField(fc);
		//검색전 총레코드 개수,검색후 레코드 개수

		fc.setStartrow((page-1)*8+1);//시작행번호
		fc.setEndrow(fc.getStartrow()+limit-1);//끝행 번호

		List<FieldClassVO> flist=this.classService.getFieldList(fc); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,9,17 ..)
		int startpage=(((int)((double)page/8+0.9))-1)*8+1;
		//현재 페이지에 보여질 마지막 페이지(8,16 ..)
		int endpage=maxpage;
		if(endpage>startpage+8-1) endpage=startpage+8-1;

		listC.addAttribute("flist",flist);
		listC.addAttribute("page",page);
		listC.addAttribute("startpage",startpage);
		listC.addAttribute("endpage",endpage);
		listC.addAttribute("maxpage",maxpage);
		listC.addAttribute("listcount",totalCount);
		listC.addAttribute("find_field",find_field);
		listC.addAttribute("find_name",find_name);
		return "/class/class_field";
	}//class_field()
	
	//온라인 클래스 페이지 목록
	@RequestMapping(value="/class_online",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String class_online(Model listC, HttpServletRequest request,@ModelAttribute OnlineClassVO oc) {
		//System.out.println("================================"+oc.toString());
		int page=1;
		int limit=8;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		oc.setFind_field(find_field);
		oc.setFind_name("%"+find_name+"%");
		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
		//와일드 카드문자

		int totalCount=this.classService.getRowCountOnline(oc);
		//검색전 총레코드 개수,검색후 레코드 개수

		oc.setStartrow((page-1)*8+1);//시작행번호
		oc.setEndrow(oc.getStartrow()+limit-1);//끝행 번호

		List<OnlineClassVO> olist=this.classService.getOnlineList(oc); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,9,17 ..)
		int startpage=(((int)((double)page/8+0.9))-1)*8+1;
		//현재 페이지에 보여질 마지막 페이지(8,16 ..)
		int endpage=maxpage;
		if(endpage>startpage+8-1) endpage=startpage+8-1;

		listC.addAttribute("olist",olist);
		listC.addAttribute("page",page);
		listC.addAttribute("startpage",startpage);
		listC.addAttribute("endpage",endpage);
		listC.addAttribute("maxpage",maxpage);
		listC.addAttribute("listcount",totalCount);
		listC.addAttribute("find_field",find_field);
		listC.addAttribute("find_name",find_name);
		return "/class/class_online";
	}//class_online()

	//필드 클래스 상세 페이지
	@RequestMapping(value="/class_detailField",method=RequestMethod.GET)
	public String class_detailField(@RequestParam int fno, Model model) throws Exception {
		System.out.println(fno);
		FieldClassVO fc = classService.getFieldDetail(fno);
		
		model.addAttribute("item", fc);
		
		return "/class/class_detailField";
	}//class_detailField
	
	//온라인 클래스 상세 페이지
	@RequestMapping(value="/class_detailOnline",method=RequestMethod.GET)
	public String class_detailOnline(@RequestParam int ono, Model model) throws Exception {
		System.out.println(ono);
		OnlineClassVO oc = classService.getOnlineDetail(ono);
		model.addAttribute("item", oc);
		
		return "/class/class_detailOnline";
	}//class_detailOnline
	 
	//클래스 장바구니 페이지
	@RequestMapping(value="/class_cart",method=RequestMethod.GET)
	public String class_cart() {
		return "/class/class_cart";
	}//class_cart

	//필드 클래스 결제하기 페이지
	@RequestMapping(value="/class_payField",method=RequestMethod.GET)
	public String class_payField(@RequestParam int fno, Model model) {
		System.out.println(fno);
		FieldClassVO fc = classService.getFieldDetail(fno);
		model.addAttribute("item", fc);
		return "class/class_payField";
	}//class_payOnline
	
	//온라인 클래스 결제하기 페이지
	@RequestMapping(value="/class_payOnline",method=RequestMethod.GET)
	public String class_payOnline(@RequestParam int ono, Model model) {
		System.out.println(ono);
		OnlineClassVO oc = classService.getOnlineDetail(ono);
		model.addAttribute("item", oc);
		return "class/class_payOnline";
	}//class_payOnline
	
	//결제 정보 저장
	@PostMapping("/insertClassPay_ok")
	public String insertClassPay_ok(ClassPayVO cp, HttpServletRequest request) throws Exception {

		Calendar cal = Calendar.getInstance();
		int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
		int date=cal.get(Calendar.DATE);//일값
		int hour=cal.get(Calendar.HOUR_OF_DAY);//시값
		int minute=cal.get(Calendar.MINUTE);//분값
		int second=cal.get(Calendar.SECOND);//초값
		
		int pno = month + date + hour + minute + second + 20220000;
		
		cp.setPno(pno);
		
		//강사 기본 정보
		String nickname=request.getParameter("nickname"); //멤버 아이디
		this.classService.insertClassPayOk(cp);
		
		cp.setNickname(nickname);

		return "redirect:/class_pay_ok?pno="+cp.getPno();
	}
	
	//클래스 결제완료 페이지
	@RequestMapping(value="/class_pay_ok",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String class_pay_ok(Model listC,int pno) {
		//System.out.println("================================"+oc.toString());
		System.out.println("pno="+pno);
		List<ClassPayVO> plist=this.classService.getClassPayList(pno);
		System.out.println(plist);
		listC.addAttribute("plist",plist);
		
		return "/class/class_pay_ok";
	}//class_online()

}
