package egovframework.project.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.project.service.TeacherVO;
import egovframework.project.service.ProjectDAO;
import egovframework.project.service.S_ParentsVO;

@Repository("daoMyBatis")
public class ProjectDAOMyBatis implements ProjectDAO {

	@Resource(name = "ProjectMapper")
	private ProjectMapper mybatis;

	public ProjectDAOMyBatis() {
		System.out.println("ProjectDAOMyBatis 생성");
	}

	@Override
	public String insertJoin(TeacherVO vo) throws Exception {
		System.out.println("MyBatis ==> insertJoin() 기능처리");
		mybatis.insertJoin(vo);
		return null;
	}

	@Override
	public int selectLoginCount(TeacherVO vo) throws Exception {
		System.out.println("MyBatis ==> selectLoginCount() 기능처리");
		return mybatis.selectLoginCount(vo);
	}

	@Override
	public void insertJoin2(S_ParentsVO vo) throws Exception {
		System.out.println("MyBatis ==> insertJoin2() 기능처리");
		mybatis.insertJoin2(vo);

	}

	@Override
	public int selectLoginCount2(S_ParentsVO vo) throws Exception {
		System.out.println("MyBatis ==> selectLoginCount() 기능처리");
		return mybatis.selectLoginCount2(vo);
	}

	@Override
	public String idCheck(String teacher_id) throws Exception {
		System.out.println("MyBatis ==> idCheck() 기능처리 -교사");
		return mybatis.idCheck(teacher_id);
	}

	@Override
	public String idCheck2(String s_parents_id) throws Exception {
		System.out.println("MyBatis ==> idCheck2() 기능처리 -학부모");
		return mybatis.idCheck2(s_parents_id);
	}

	@Override
	public TeacherVO login1(TeacherVO vo) throws Exception {
		System.out.println("MyBatis ==> login1() 기능처리 -교사");
		return mybatis.login1(vo);
	}

	@Override
	public S_ParentsVO login2(S_ParentsVO vo) throws Exception {
		System.out.println("MyBatis ==> login2() 기능처리 -학부모");
		return mybatis.login2(vo);
	}

	@Override
	public void update2(S_ParentsVO vo) throws Exception {
		System.out.println("MyBatis ==> update2() 기능처리 -학부모");
		mybatis.update2(vo);
	}

	@Override
	public void delete2(S_ParentsVO vo) throws Exception {
		System.out.println("MyBatis ==> delete2() 기능처리 -학부모");
		mybatis.delete2(vo);
	}

	@Override
	public String nmCheck2(String s_parents_nm) throws Exception {
		System.out.println("MyBatis ==>nmCheck2() 기능처리 -학부모");
		return mybatis.nmCheck2(s_parents_nm);
	}

}
