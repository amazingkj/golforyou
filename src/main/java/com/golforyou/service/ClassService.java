package com.golforyou.service;

import java.util.List;

import com.golforyou.vo.AllClassVO;
import com.golforyou.vo.CTeacherVO;
import com.golforyou.vo.ClassPayVO;
import com.golforyou.vo.ClassVO;
import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.OnlineClassVO;

public interface ClassService {
	
	/* 강사 관리 */
	int getRowCountTeacher(CTeacherVO ct);
	List<CTeacherVO> getTeacherList(CTeacherVO ct);
	public List<CTeacherVO> getTeacherListAll();
	void insertTeacher(CTeacherVO ct);
	CTeacherVO getTeacherDetail(int tno);
	void updateTeacher(CTeacherVO ct);
	void deleteTeacher(int tno);
	
	/* 필드 클래스 관리 */
	int getRowCountField(FieldClassVO fc);
	List<FieldClassVO> getFieldList(FieldClassVO fc);
	void insertField(FieldClassVO fc);
	FieldClassVO getFieldDetail(int fno);
	void updateField(FieldClassVO fc);
	void deleteField(int fno);
	
	/* 온라인 클래스 관리 */
	int getRowCountOnline(OnlineClassVO oc);
	List<OnlineClassVO> getOnlineList(OnlineClassVO oc);
	void insertOnline(OnlineClassVO oc);
	OnlineClassVO getOnlineDetail(int ono);
	void updateOnline(OnlineClassVO oc);
	void deleteOnline(int ono);
	
	/* 전체 클래스 관리 */
	int getRowCountAll(AllClassVO allclassVO);
	List<AllClassVO> getAllList(AllClassVO allclassVO);
	
	/* 결제 페이지 */
	void insertOnlinePayOk(ClassPayVO cp);
	ClassPayVO getClassPayDetail(int pno);
	
	
	

	
	
	
	
	
	
	
	
	

}
