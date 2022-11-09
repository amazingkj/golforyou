package com.golforyou.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.golforyou.vo.AllClassVO;
import com.golforyou.vo.CTeacherVO;
import com.golforyou.vo.ClassPayVO;
import com.golforyou.vo.ClassVO;
import com.golforyou.vo.FieldClassVO;
import com.golforyou.vo.OnlineClassVO;

@Repository
public class ClassDAOImpl implements ClassDAO{

	@Autowired
	private SqlSession sqlSession;

	/* 강사 관리 */
	@Override
	public int getRowCountTeacher(CTeacherVO ct) {
		return this.sqlSession.selectOne("teacher_count", ct);
	}

	@Override
	public List<CTeacherVO> getTeacherList(CTeacherVO ct) {
		return this.sqlSession.selectList("teacher_list", ct);
	}
	
	@Override
	public List<CTeacherVO> getTeacherListAll(){
		return this.sqlSession.selectList("teacher_list_all");
	}

	@Override
	public void insertTeacher(CTeacherVO ct) {
		this.sqlSession.insert("teacher_in", ct);
		
	}

	@Override
	public CTeacherVO getTeacherDetail(int tno) {
		return this.sqlSession.selectOne("teacher_detail", tno);
	}

	@Override
	public void updateTeacher(CTeacherVO ct) {
		this.sqlSession.update("teacher_edit", ct);
		
	}

	@Override
	public void deleteTeacher(int tno) {
		this.sqlSession.delete("teacher_delete", tno);
	}

	
	/* 필드 클래스 관리 */
	@Override
	public int getRowCountField(FieldClassVO fc) {
		return this.sqlSession.selectOne("fieldc_count", fc);
	}

	@Override
	public List<FieldClassVO> getFieldList(FieldClassVO fc) {
		return this.sqlSession.selectList("fieldc_list", fc);
	}

	@Override
	public void insertField(FieldClassVO fc) {
		this.sqlSession.insert("fieldc_in", fc);
	}

	@Override
	public FieldClassVO getFieldDetail(int fno) {
		return this.sqlSession.selectOne("fieldc_detail", fno);
	}

	@Override
	public void updateField(FieldClassVO fc) {
		this.sqlSession.update("fieldc_edit", fc);
	}

	@Override
	public void deleteField(int fno) {
		this.sqlSession.delete("fieldc_delete", fno);
	}

	
	/* 온라인 클래스 관리 */
	@Override
	public int getRowCountOnline(OnlineClassVO oc) {
		return this.sqlSession.selectOne("onlinec_count", oc);
	}

	@Override
	public List<OnlineClassVO> getOnlineList(OnlineClassVO oc) {
		return this.sqlSession.selectList("onlinec_list", oc);
	}

	@Override
	public void insertOnline(OnlineClassVO oc) {
		this.sqlSession.insert("onlinec_in", oc);
	}

	@Override
	public OnlineClassVO getOnlineDetail(int ono) {
		return this.sqlSession.selectOne("onlinec_detail", ono);
	}

	@Override
	public void updateOnline(OnlineClassVO oc) {
		this.sqlSession.update("onlinec_edit", oc);
	}

	@Override
	public void deleteOnline(int ono) {
		this.sqlSession.delete("onlinec_delete", ono);
	}

	/* 전체 클래스 관리 */
	@Override
	public int getRowCountAll(AllClassVO allclassVO) {
		return this.sqlSession.selectOne("allclass_count", allclassVO);
	}

	@Override
	public List<AllClassVO> getAllList(AllClassVO allclassVO) {
		return this.sqlSession.selectList("all_list", allclassVO);
	}

	/* 결제 페이지 */
	@Override
	public void insertClassPayOk(ClassPayVO cp) {
		System.out.println("========================");
		System.out.println(cp.toString());
		this.sqlSession.insert("classpay_in", cp);
	}
	
	@Override
	public ClassPayVO getClassPayDetail(int pno) {
		return this.sqlSession.selectOne("classpay_detail", pno);
	}

	@Override
	public List<ClassPayVO> getClassPayList(int pno) {
		return this.sqlSession.selectList("classpay_list", pno);
	}



}
