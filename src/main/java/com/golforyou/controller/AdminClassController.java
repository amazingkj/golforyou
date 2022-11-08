package com.golforyou.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.golforyou.service.ClassService;
import com.golforyou.vo.AllClassVO;
import com.golforyou.vo.CTeacherVO;
import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.OnlineClassVO;
import com.oreilly.servlet.MultipartRequest;

@Controller
public class AdminClassController {

	@Autowired
	private ClassService classService;
	
	/* 골프 클래스 관리자 메인 페이지 */
	@RequestMapping(value="/admin/admin_classMain",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String admin_classMain(Model listC, HttpServletRequest request,@ModelAttribute AllClassVO allclassVO) {
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		allclassVO.setFind_field(find_field);
		allclassVO.setFind_name("%"+find_name+"%");
		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
		//와일드 카드문자

		int totalCount=this.classService.getRowCountAll(allclassVO);
		//검색전 총레코드 개수,검색후 레코드 개수

		allclassVO.setStartrow((page-1)*10+1);//시작행번호
		allclassVO.setEndrow(allclassVO.getStartrow()+limit-1);//끝행 번호

		List<AllClassVO> alist=this.classService.getAllList(allclassVO); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		listC.addAttribute("alist",alist);
		listC.addAttribute("page",page);
		listC.addAttribute("startpage",startpage);
		listC.addAttribute("endpage",endpage);
		listC.addAttribute("maxpage",maxpage);
		listC.addAttribute("listcount",totalCount);
		listC.addAttribute("find_field",find_field);
		listC.addAttribute("find_name",find_name);
		return "admin/admin_classMain";
	}//admin_classMain()
	
	
	/* 강사 관리 */
	//강사 목록
	@RequestMapping(value="/admin/admin_classTeacher",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String admin_classTeacher(Model listC, HttpServletRequest request,@ModelAttribute CTeacherVO ct) {
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색 필드
		ct.setFind_field(find_field);
		ct.setFind_name("%"+find_name+"%");
		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
		//와일드 카드문자

		int totalCount=this.classService.getRowCountTeacher(ct);
		//검색전 총레코드 개수,검색후 레코드 개수

		ct.setStartrow((page-1)*10+1);//시작행번호
		ct.setEndrow(ct.getStartrow()+limit-1);//끝행 번호

		List<CTeacherVO> tlist=this.classService.getTeacherList(ct); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		listC.addAttribute("tlist",tlist);
		listC.addAttribute("page",page);
		listC.addAttribute("startpage",startpage);
		listC.addAttribute("endpage",endpage);
		listC.addAttribute("maxpage",maxpage);
		listC.addAttribute("listcount",totalCount);
		listC.addAttribute("find_field",find_field);
		listC.addAttribute("find_name",find_name);
		return "admin/admin_classTeacher";
	}//admin_classTeacher()
	
	//강사 등록 페이지 불러오기
	@GetMapping("/admin/admin_insertTeacher")
	public ModelAndView admin_insertTeacher() {
		ModelAndView wm = new ModelAndView("admin/admin_insertTeacher");
		return wm;
	}//admin_insertTeacher()
	
	//강사 저장
	@PostMapping("/admin/insertTeacher_ok")
	public String insertTeacher_ok(CTeacherVO ct, HttpServletRequest request) throws Exception {

		//강사 기본 정보
		String tname=request.getParameter("tname"); //강사명
		String tgender=request.getParameter("tgender"); //강사 성별
		String tcareer=request.getParameter("tcareer"); //강사 소개 또는 경력사항
		String tdate=request.getParameter("tdate"); //강사 등록날짜

		ct.setTname(tname);
		ct.setTgender(tgender);
		ct.setTcareer(tcareer);
		ct.setTdate(tdate);

		this.classService.insertTeacher(ct);

		return "redirect:/admin/admin_classTeacher";
	}

	//강사 수정 페이지 불러오기
	@RequestMapping(value="/admin/admin_editTeacher",method=RequestMethod.GET)
	public String admin_editTeacher(@RequestParam int tno, Model model) throws Exception {
		CTeacherVO ct = classService.getTeacherDetail(tno);
		model.addAttribute("item", ct);
		return "admin/admin_editTeacher";
	}
	
	//강사 수정
	@PostMapping("/admin/editTeacher_ok")
	public String editTeacher_ok(CTeacherVO ct, HttpServletRequest request) throws Exception {
	
		//클래스 기본 정보
		int tno=Integer.parseInt(request.getParameter("tno")); //강사명
		String tname=request.getParameter("tname"); //강사명
		String tgender=request.getParameter("tgender"); //강사 성별
		String tcareer=request.getParameter("tcareer"); //강사 소개 또는 경력사항
		String tdate=request.getParameter("tdate"); //강사 등록날짜

		ct.setTno(tno);
		ct.setTname(tname);
		ct.setTgender(tgender);
		ct.setTcareer(tcareer);
		ct.setTdate(tdate);
		
		this.classService.updateTeacher(ct);

		return "redirect:/admin/admin_classTeacher";
	}

	//강사 삭제
	@RequestMapping("/admin/admin_teacher_del")
	public String admin_teacher_del(int tno) throws Exception{
		this.classService.deleteTeacher(tno);
		return "redirect:/admin/admin_classTeacher";
	}//admin_teacher_del()
	
	@GetMapping("/api/teacher_list_all")
	@ResponseBody
	public List<CTeacherVO> teacherListAll() throws Exception{
		List<CTeacherVO> teacherList = this.classService.getTeacherListAll();
		return teacherList;
	}
	
	
	/* 필드 클래스 관리 */
	//필드 클래스 목록
	@RequestMapping(value="/admin/admin_classField",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String admin_classField(Model listC, HttpServletRequest request,@ModelAttribute FieldClassVO fc) {
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
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

		fc.setStartrow((page-1)*10+1);//시작행번호
		fc.setEndrow(fc.getStartrow()+limit-1);//끝행 번호

		List<FieldClassVO> flist=this.classService.getFieldList(fc); //검색 전후 목록

		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		listC.addAttribute("flist",flist);
		listC.addAttribute("page",page);
		listC.addAttribute("startpage",startpage);
		listC.addAttribute("endpage",endpage);
		listC.addAttribute("maxpage",maxpage);
		listC.addAttribute("listcount",totalCount);
		listC.addAttribute("find_field",find_field);
		listC.addAttribute("find_name",find_name);
		return "admin/admin_classField";
	}//admin_classField()

	//필드 클래스 등록하기 페이지 불러오기
	@GetMapping("/admin/admin_insertField")
	public ModelAndView admin_insertField() {
		ModelAndView wm = new ModelAndView("admin/admin_insertField");
		return wm;
	}//admin_insertField()

	//필드 클래스 등록(저장)
	@PostMapping("/admin/insertField_ok")
	public String insertField_ok(FieldClassVO fc, MultipartHttpServletRequest request,MultipartFile file) throws Exception {
		//System.out.println("================================================="+oc.toString());
		
		String saveFolder = request.getServletContext().getRealPath("/upload/class");

		//int fileSize = 5 * 1024 * 1024;

		//기본 정보
		String ftitle=request.getParameter("ftitle");
		int tno=Integer.parseInt(request.getParameter("tno"));
		String fphone=request.getParameter("fphone");

		//지역 정보
		String faddr=request.getParameter("faddr"); //필드 클래스 지역(대분류)
		/* String faddr2=request.getParameter("faddr2"); */ //필드 클래스 지역2(소분류)

		//가격 정보
		int fsprice=Integer.parseInt(request.getParameter("fsprice")); //STANDARD 가격
		int fsrounding=Integer.parseInt(request.getParameter("fsrounding")); //STANDARD 라운딩 횟수
		String fsdesc=request.getParameter("fsdesc"); //STANDARD 상세 설명
		int fstime=Integer.parseInt(request.getParameter("fstime")); //STANDARD 1회당 레슨시간(분)

		int fdprice=Integer.parseInt(request.getParameter("fdprice")); //DELUXE 가격
		int fdrounding=Integer.parseInt(request.getParameter("fdrounding")); //DELUXE 라운딩 횟수
		String fddesc=request.getParameter("fddesc"); //DELUXE 상세 설명
		int fdtime=Integer.parseInt(request.getParameter("fdtime")); //DELUXE 1회당 레슨시간(분)

		int fpprice=Integer.parseInt(request.getParameter("fpprice")); //PREMIUM 가격
		int fprounding=Integer.parseInt(request.getParameter("fprounding")); //PREMIUM 라운딩 횟수
		String fpdesc=request.getParameter("fpdesc"); //PREMIUM 상세 설명
		int fptime=Integer.parseInt(request.getParameter("fptime")); //PREMIUM 1회당 레슨시간(분)
		
		//이미지 업로드
		file = request.getFile("fimage2");
		
		if(file != null) {
			String fileName = file.getName();
			Calendar cal = Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);//년도값
			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
			int date=cal.get(Calendar.DATE);//일값

			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
			File path01 = new File(homedir);

			if(!(path01.exists())) {
				path01.mkdir();
			}
			Random r = new Random();
			int random = r.nextInt(100000000);

			// 첨부 파일 확장자를 구함 
			//int index = fileName.lastIndexOf(".");

			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = "class" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			
			File saveFile = new File(homedir+"/"+refileName);
			file.transferTo(saveFile);

			fc.setFimage(fileDBName);
		} else {
			String fileDBName="";
			fc.setFimage(fileDBName);
		}
		 
		fc.setFtitle(ftitle);
		fc.setTno(tno);
		fc.setFphone(fphone);
		fc.setFaddr(faddr);
		/* fc.setFaddr2(faddr2); */
		
		fc.setFsprice(fsprice);
		fc.setFsrounding(fsrounding);
		fc.setFsdesc(fsdesc);
		fc.setFstime(fstime);
		
		fc.setFdprice(fdprice);
		fc.setFdrounding(fdrounding);
		fc.setFddesc(fddesc);
		fc.setFdtime(fdtime);
		
		fc.setFpprice(fpprice);
		fc.setFprounding(fprounding);
		fc.setFpdesc(fpdesc);
		fc.setFptime(fptime);
		
		this.classService.insertField(fc);
		
		return "redirect:/admin/admin_classField";
	}
	
	//관리자 페이지 필드 클래스 수정 페이지 불러오기
	@RequestMapping(value="/admin/admin_editField",method=RequestMethod.GET)
	public String admin_editField(@RequestParam int fno, Model model) throws Exception {
		//System.out.println(fno);
		FieldClassVO fc = classService.getFieldDetail(fno);
		//System.out.println(classVO.toString());
		model.addAttribute("item", fc);
		return "admin/admin_editField";
	}

	//필드 클래스 수정
	@PostMapping("/admin/editField_ok")
	public String editField_ok(FieldClassVO fc, MultipartHttpServletRequest request,MultipartFile file) throws Exception {
		//System.out.println("================================================="+oc.toString());
		
		String saveFolder = request.getServletContext().getRealPath("/upload/class");

		//int fileSize = 5 * 1024 * 1024;

		//기본 정보
		int fno=Integer.parseInt(request.getParameter("fno"));
		String ftitle=request.getParameter("ftitle");
		int tno=Integer.parseInt(request.getParameter("tno"));
		String fphone=request.getParameter("fphone");

		//지역 정보
		String faddr=request.getParameter("faddr"); //필드 클래스 지역(대분류)
		/* String faddr2=request.getParameter("faddr2"); */ //필드 클래스 지역2(소분류)

		//가격 정보
		int fsprice=Integer.parseInt(request.getParameter("fsprice")); //STANDARD 가격
		int fsrounding=Integer.parseInt(request.getParameter("fsrounding")); //STANDARD 라운딩 횟수
		String fsdesc=request.getParameter("fsdesc"); //STANDARD 상세 설명
		int fstime=Integer.parseInt(request.getParameter("fstime")); //STANDARD 1회당 레슨시간(분)

		int fdprice=Integer.parseInt(request.getParameter("fdprice")); //DELUXE 가격
		int fdrounding=Integer.parseInt(request.getParameter("fdrounding")); //DELUXE 라운딩 횟수
		String fddesc=request.getParameter("fddesc"); //DELUXE 상세 설명
		int fdtime=Integer.parseInt(request.getParameter("fdtime")); //DELUXE 1회당 레슨시간(분)

		int fpprice=Integer.parseInt(request.getParameter("fpprice")); //PREMIUM 가격
		int fprounding=Integer.parseInt(request.getParameter("fprounding")); //PREMIUM 라운딩 횟수
		String fpdesc=request.getParameter("fpdesc"); //PREMIUM 상세 설명
		int fptime=Integer.parseInt(request.getParameter("fptime")); //PREMIUM 1회당 레슨시간(분)

		
		//이미지 업로드
		file = request.getFile("fimage2");
		
		if(file != null) {
			String fileName = file.getName();
			Calendar cal = Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);//년도값
			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
			int date=cal.get(Calendar.DATE);//일값

			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
			File path01 = new File(homedir);

			if(!(path01.exists())) {
				path01.mkdir();
			}
			Random r = new Random();
			int random = r.nextInt(100000000);

			// 첨부 파일 확장자를 구함 
			//int index = fileName.lastIndexOf(".");

			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = "class" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			
			File saveFile = new File(homedir+"/"+refileName);
			file.transferTo(saveFile);

			fc.setFimage(fileDBName);
		} else {
			String fileDBName="";
			fc.setFimage(fileDBName);
		}
		 
		fc.setFno(fno);
		fc.setFtitle(ftitle);
		fc.setTno(tno);
		fc.setFphone(fphone);
		fc.setFaddr(faddr);
		/* fc.setFaddr2(faddr2); */
		
		fc.setFsprice(fsprice);
		fc.setFsrounding(fsrounding);
		fc.setFsdesc(fsdesc);
		fc.setFstime(fstime);
		
		fc.setFdprice(fdprice);
		fc.setFdrounding(fdrounding);
		fc.setFddesc(fddesc);
		fc.setFdtime(fdtime);
		
		fc.setFpprice(fpprice);
		fc.setFprounding(fprounding);
		fc.setFpdesc(fpdesc);
		fc.setFptime(fptime);

		this.classService.updateField(fc);
		
		return "redirect:/admin/admin_classField";
	}
	
	//필드 클래스 삭제
	@RequestMapping("/admin/admin_field_del")
	public String admin_field_del(int fno) throws Exception{
		this.classService.deleteField(fno);
		return "redirect:/admin/admin_classField";
	}//admin_field_del()

	
	/* 온라인 클래스 관리 */
	//온라인 클래스 목록
	@RequestMapping(value="/admin/admin_classOnline",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
	public String admin_classOnline(Model listC, HttpServletRequest request,@ModelAttribute OnlineClassVO oc) {
		int page=1;
		int limit=10;//한페이지에 보여지는 목록개수
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

		oc.setStartrow((page-1)*10+1);//시작행번호
		oc.setEndrow(oc.getStartrow()+limit-1);//끝행 번호

		List<OnlineClassVO> olist=this.classService.getOnlineList(oc); //검색 전후 목록
		for(OnlineClassVO vo: olist) {
			System.out.println("==============================="+vo.toString());
		}
		
		//총 페이지수
		int maxpage=(int)((double)totalCount/limit+0.95);
		//시작페이지(1,11,21 ..)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
		int endpage=maxpage;
		if(endpage>startpage+10-1) endpage=startpage+10-1;

		listC.addAttribute("olist",olist);
		listC.addAttribute("page",page);
		listC.addAttribute("startpage",startpage);
		listC.addAttribute("endpage",endpage);
		listC.addAttribute("maxpage",maxpage);
		listC.addAttribute("listcount",totalCount);
		listC.addAttribute("find_field",find_field);
		listC.addAttribute("find_name",find_name);
		return "admin/admin_classOnline";
	}//admin_classOnline()
	
	//온라인 클래스 등록하기 페이지 불러오기
	@GetMapping("/admin/admin_insertOnline")
	public ModelAndView admin_insertOnline() {
		ModelAndView wm = new ModelAndView("admin/admin_insertOnline");
		return wm;
	}//admin_insertOnline()

	//온라인 클래스 등록(저장)
	@PostMapping("/admin/insertOnline_ok")
	public String insertOnline_ok(OnlineClassVO oc, MultipartHttpServletRequest request,MultipartFile file) throws Exception {
		//System.out.println("================================================="+oc.toString());
		
		String saveFolder = request.getServletContext().getRealPath("/upload/class");

		//int fileSize = 5 * 1024 * 1024;

		//기본 정보
		String otitle=request.getParameter("otitle");
		int tno=Integer.parseInt(request.getParameter("tno"));
		String ophone=request.getParameter("ophone");

		//가격 정보
		int oprice=Integer.parseInt(request.getParameter("oprice")); //온라인 클래스 가격
		String odesc=request.getParameter("odesc"); //온라인 클래스 상세 설명
		int otime=Integer.parseInt(request.getParameter("otime")); //온라인 클래스 수강기간
		String olevel=request.getParameter("olevel"); //온라인 클래스 추천 레벨

		
		//이미지 업로드
		file = request.getFile("oimage2");
		
		if(file != null) {
			String fileName = file.getName();
			Calendar cal = Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);//년도값
			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
			int date=cal.get(Calendar.DATE);//일값

			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
			File path01 = new File(homedir);

			if(!(path01.exists())) {
				path01.mkdir();
			}
			Random r = new Random();
			int random = r.nextInt(100000000);

			// 첨부 파일 확장자를 구함 
			//int index = fileName.lastIndexOf(".");

			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = "class" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			
			File saveFile = new File(homedir+"/"+refileName);
			file.transferTo(saveFile);

			oc.setOimage(fileDBName);
		} else {
			String fileDBName="";
			oc.setOimage(fileDBName);
		}
		
		oc.setOtitle(otitle);
		oc.setTno(tno);
		oc.setOphone(ophone);
		oc.setOprice(oprice);
		oc.setOdesc(odesc);
		oc.setOtime(otime);
		oc.setOlevel(olevel);

		this.classService.insertOnline(oc);
		
		return "redirect:/admin/admin_classOnline";
	}
	
	//관리자 페이지 온라인 클래스 수정 페이지 불러오기
	@RequestMapping(value="/admin/admin_editOnline",method=RequestMethod.GET)
	public String admin_editOnline(@RequestParam int ono, Model model) throws Exception {
		System.out.println(ono);
		OnlineClassVO oc = classService.getOnlineDetail(ono);
		//System.out.println(classVO.toString());
		model.addAttribute("item", oc);
		return "admin/admin_editOnline";
	}
	
	//온라인 클래스 수정
	@PostMapping("/admin/editOnline_ok")
	public String editOnline_ok(OnlineClassVO oc, MultipartHttpServletRequest request,MultipartFile file) throws Exception {
		//System.out.println("================================================="+oc.toString());
		
		String saveFolder = request.getServletContext().getRealPath("/upload/class");

		//int fileSize = 5 * 1024 * 1024;

		//기본 정보
		int ono=Integer.parseInt(request.getParameter("ono"));
		String otitle=request.getParameter("otitle");
		int tno=Integer.parseInt(request.getParameter("tno"));
		String ophone=request.getParameter("ophone");

		//가격 정보
		int oprice=Integer.parseInt(request.getParameter("oprice")); //온라인 클래스 가격
		String odesc=request.getParameter("odesc"); //온라인 클래스 상세 설명
		int otime=Integer.parseInt(request.getParameter("otime")); //온라인 클래스 수강기간
		String olevel=request.getParameter("olevel"); //온라인 클래스 추천 레벨

		
		//이미지 업로드
		file = request.getFile("oimage2");
		
		if(file != null) {
			String fileName = file.getName();
			Calendar cal = Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);//년도값
			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
			int date=cal.get(Calendar.DATE);//일값

			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
			File path01 = new File(homedir);

			if(!(path01.exists())) {
				path01.mkdir();
			}
			Random r = new Random();
			int random = r.nextInt(100000000);

			// 첨부 파일 확장자를 구함 
			//int index = fileName.lastIndexOf(".");

			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename()); //파일 확장자
			String refileName = "class" + year + month + date + random + "." + fileExtension;
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			
			File saveFile = new File(homedir+"/"+refileName);
			file.transferTo(saveFile);

			oc.setOimage(fileDBName);
		} else {
			String fileDBName="";
			oc.setOimage(fileDBName);
		}
		 
		oc.setOno(ono);
		oc.setOtitle(otitle);
		oc.setTno(tno);
		oc.setOphone(ophone);
		oc.setOprice(oprice);
		oc.setOdesc(odesc);
		oc.setOtime(otime);
		oc.setOlevel(olevel);

		this.classService.updateOnline(oc);
		
		return "redirect:/admin/admin_classOnline";
	}
	
//	//관리자 페이지 온라인 클래스 수정
//	@PostMapping("/admin/editOnline_ok")
//	public String editOnline_ok(OnlineClassVO oc, HttpServletRequest request) throws Exception {
//
//		String saveFolder = request.getRealPath("/upload/class");
//
//		int fileSize = 5 * 1024 * 1024;
//		MultipartRequest multi = null;
//
//		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");
//
//		//기본 정보
//		int ono=Integer.parseInt(multi.getParameter("ono"));
//		/* System.out.println("클래스 번호 : " +ono); */
//		String otitle=multi.getParameter("otitle");
//		int tno=Integer.parseInt(multi.getParameter("tno"));
//		String ophone=multi.getParameter("ophone");
//
//		//가격 정보
//		int oprice=Integer.parseInt(multi.getParameter("oprice")); //온라인 클래스 가격
//		String odesc=multi.getParameter("odesc"); //온라인 클래스 상세 설명
//		int otime=Integer.parseInt(multi.getParameter("otime")); //온라인 클래스 수강기간
//		String olevel=multi.getParameter("olevel"); //온라인 클래스 추천 레벨
//
//		//이미지 업로드
//		File upFile = multi.getFile("oimage");
//
//		if(upFile != null) {
//			String fileName = upFile.getName();
//			Calendar cal = Calendar.getInstance();
//			int year=cal.get(Calendar.YEAR);//년도값
//			int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
//			int date=cal.get(Calendar.DATE);//일값
//
//			String homedir = saveFolder + "/" + year + "-" + month + "-" +date;
//			File path01 = new File(homedir);
//
//			if(!(path01.exists())) {
//				path01.mkdir();
//			}
//			Random r = new Random();
//			int random = r.nextInt(100000000);
//
//			// 첨부 파일 확장자를 구함 
//			int index = fileName.lastIndexOf(".");
//
//			String fileExtendsion = fileName.substring(index+1);
//			String refileName = "class" + year + month + date + random + "." + fileExtendsion;
//			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
//			upFile.renameTo(new File(homedir+"/"+refileName));
//
//			oc.setOimage(fileDBName);
//		} else {
//			String fileDBName="";
//			oc.setOimage(fileDBName);
//		}
//
//		oc.setOno(ono);
//		oc.setOtitle(otitle);
//		oc.setTno(tno);
//		oc.setOphone(ophone);
//		oc.setOprice(oprice);
//		oc.setOdesc(odesc);
//		oc.setOtime(otime);
//		oc.setOlevel(olevel);
//		
//		
//		this.classService.updateOnline(oc);
//
//		return "redirect:/admin/admin_classOnline";
//	}

	//온라인 클래스 삭제
	@RequestMapping("/admin/admin_online_del")
	public String admin_online_del(int ono) throws Exception{

		this.classService.deleteOnline(ono);
		return "redirect:/admin/admin_classOnline";
	}//admin_class_del()

//	//관리자 페이지 골프 클래스 목록
//	@RequestMapping(value="/admin/admin_classList",method=RequestMethod.GET) //get으로 접근하는 매핑주소를 처리
//	public String admin_classList(Model listC, HttpServletRequest request,@ModelAttribute ClassVO c) {
//		int page=1;
//		int limit=10;//한페이지에 보여지는 목록개수
//		if(request.getParameter("page") != null) {
//			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수숫자로 변경해서 저장         
//		}
//		String find_name=request.getParameter("find_name");//검색어
//		String find_field=request.getParameter("find_field");//검색 필드
//		c.setFind_field(find_field);
//		c.setFind_name("%"+find_name+"%");
//		//SQL문에서 %는 검색에서 하나이상의 모르는 임의의 문자와 매핑 대응하는
//		//와일드 카드문자
//
//		int totalCount=this.classService.getRowCount(c);
//		//검색전 총레코드 개수,검색후 레코드 개수
//
//		c.setStartrow((page-1)*10+1);//시작행번호
//		c.setEndrow(c.getStartrow()+limit-1);//끝행 번호
//
//		List<ClassVO> clist=this.classService.getClassList(c); //검색 전후 목록
//
//		//총 페이지수
//		int maxpage=(int)((double)totalCount/limit+0.95);
//		//시작페이지(1,11,21 ..)
//		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
//		//현재 페이지에 보여질 마지막 페이지(10,20 ..)
//		int endpage=maxpage;
//		if(endpage>startpage+10-1) endpage=startpage+10-1;
//
//		listC.addAttribute("clist",clist);
//		listC.addAttribute("page",page);
//		listC.addAttribute("startpage",startpage);
//		listC.addAttribute("endpage",endpage);
//		listC.addAttribute("maxpage",maxpage);
//		listC.addAttribute("listcount",totalCount);
//		listC.addAttribute("find_field",find_field);
//		listC.addAttribute("find_name",find_name);
//		return "admin/admin_classList";
//	}//admin_classList()
//
//	//관리자 페이지 클래스 상세 페이지
//	@RequestMapping(value="/admin/admin_classDetail",method=RequestMethod.GET)
//	public String admin_classDetail() throws Exception {
//		return "admin/admin_classDetail";
//	}
	

	
	

	


	/*
	//관리자 클래스 상세정보 보기+수정폼
	@RequestMapping(value="/admin_classDetail",method=RequestMethod.GET)
	public ModelAndView  admin_classDetail(int no,String state,HttpServletResponse response,HttpServletRequest
			request,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");

        if(isAdminLogin(session, response)) {//==true : 관리자로 로그인 된 상태
        	int page=1;
        	if(request.getParameter("page") != null) {
        		page=Integer.parseInt(request.getParameter("page"));
        	}
        	ClassVO cv =this.classService.getClassDetail(no);//번호에 해당하는 DB레코드값을 가져옴.
        	String class_detail = cv.getClassDetail().replace("\n","<br/>");//textarea영역에서 엔터키 친부분을 줄바꿈

        	ModelAndView m=new ModelAndView();
        	m.addObject("c",cv);//b키이름에 bc객체를 저장
        	m.addObject("class_detail",class_detail);
        	m.addObject("page",page);

        	if(state.equals("cont")) {//관리자 자료실 상세정보 보기
        		m.setViewName("admin/admin_classDetail");//뷰페이지 경로
        	}else if(state.equals("edit")) {//관리자 자료실 수정폼일때
        		m.setViewName("admin/admin_classEdit");
        	}//if else if
        	return m;
        }
		return null;
	}//admin_classDetail()

	//반복적인 관리자 로그인을 하나로 줄이기
	public static boolean isAdminLogin(HttpSession session,HttpServletResponse response)
	throws Exception{
		PrintWriter out=response.getWriter();
		String admin_id=(String)session.getAttribute("admin_id");

		if(admin_id == null) {
           out.println("<script>");
           out.println("alert('관리자로 다시 로그인 하세요!');");
           out.println("location='admin_index';");
           out.println("</script>");

           return false;
		}
		return true;//관리자로 로그인 된 경우는 true를 반환
	}//isAdminLogin()

	 */
	
	@GetMapping("/test")
	public ModelAndView test() {
		ModelAndView wm = new ModelAndView("test");
		return wm;
	}//admin_insertOnline()

	@PostMapping("/testinsert")
	public String testinsert(HttpServletRequest request) throws Exception {
		//String saveFolder = request.getRealPath("/upload");
		//System.out.println("==============================="+saveFolder);
		MultipartRequest multi = new MultipartRequest(request, "C:\\20220607\\Last_Project_Golforyou\\Last_Project_Golforyou\\src\\main\\webapp\\upload", 5*1024*1024, "UTF-8");
		return "redirect:/test";
	}
	



}
