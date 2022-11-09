package com.golforyou.service;


import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.golforyou.dao.ClassDAO;
import com.golforyou.vo.AllClassVO;
import com.golforyou.vo.CTeacherVO;
import com.golforyou.vo.ClassPayVO;
import com.golforyou.vo.ClassVO;
import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.OnlineClassVO;

@Service
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDAO classDao;

	/* 강사 관리 */
	@Override
	public int getRowCountTeacher(CTeacherVO ct) {
		return this.classDao.getRowCountTeacher(ct);
	}

	@Override
	public List<CTeacherVO> getTeacherList(CTeacherVO ct) {
		return this.classDao.getTeacherList(ct);
	}
	
	@Override
	public List<CTeacherVO> getTeacherListAll(){
		return this.classDao.getTeacherListAll();
	}

	@Override
	public void insertTeacher(CTeacherVO ct) {
		this.classDao.insertTeacher(ct);	
	}

	@Override
	public CTeacherVO getTeacherDetail(int tno) {
		return this.classDao.getTeacherDetail(tno);
	}

	@Override
	public void updateTeacher(CTeacherVO ct) {
		this.classDao.updateTeacher(ct);
	}

	@Override
	public void deleteTeacher(int tno) {
		this.classDao.deleteTeacher(tno);
	}

	
	/* 필드 클래스 관리 */
	@Override
	public int getRowCountField(FieldClassVO fc) {
		return this.classDao.getRowCountField(fc);
	}

	@Override
	public List<FieldClassVO> getFieldList(FieldClassVO fc) {
		return this.classDao.getFieldList(fc);
	}

	@Override
	public void insertField(FieldClassVO fc) {
		this.classDao.insertField(fc);			
	}

	@Override
	public FieldClassVO getFieldDetail(int fno) {
		return this.classDao.getFieldDetail(fno);
	}

	@Override
	public void updateField(FieldClassVO fc) {
		this.classDao.updateField(fc);
	}

	@Override
	public void deleteField(int fno) {
		this.classDao.deleteField(fno);
	}
	
	
	/* 온라인 클래스 관리 */
	@Override
	public int getRowCountOnline(OnlineClassVO oc) {
		return this.classDao.getRowCountOnline(oc);
	}

	@Override
	public List<OnlineClassVO> getOnlineList(OnlineClassVO oc) {
		return this.classDao.getOnlineList(oc);
	}

	@Override
	public void insertOnline(OnlineClassVO oc) {
		this.classDao.insertOnline(oc);	
	}

	@Override
	public OnlineClassVO getOnlineDetail(int ono) {
		return this.classDao.getOnlineDetail(ono);
	}

	@Override
	public void updateOnline(OnlineClassVO oc) {
		this.classDao.updateOnline(oc);
	}

	@Override
	public void deleteOnline(int ono) {
		this.classDao.deleteOnline(ono);
	}

	/* 전체 클래스 관리 */
	@Override
	public int getRowCountAll(AllClassVO allclassVO) {
		return this.classDao.getRowCountAll(allclassVO);
	}

	@Override
	public List<AllClassVO> getAllList(AllClassVO allclassVO) {
		return this.classDao.getAllList(allclassVO);
	}

	/* 결제 페이지 */
	@Override
	public void insertClassPayOk(ClassPayVO cp) {
		this.classDao.insertClassPayOk(cp);	
	}
	
	@Override
	public ClassPayVO getClassPayDetail(int pno) {
		return this.classDao.getClassPayDetail(pno);
	}

	@Override
	public List<ClassPayVO> getClassPayList(int pno) {
		return this.classDao.getClassPayList(pno);
	}


	
}
