package egovframework.project.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.project.service.TeacherVO;
import egovframework.project.service.ProjectDAO;
import egovframework.project.service.ProjectService;
import egovframework.project.service.S_ParentsVO;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Resource(name = "daoMyBatis")
	private ProjectDAO projectDAO;

	public ProjectServiceImpl() {
		System.out.println("ProjectServiceImpl() 생성");
	}

	@Override
	public String insertJoin(TeacherVO vo) throws Exception {
		return projectDAO.insertJoin(vo);
	}

	@Override
	public int selectLoginCount(TeacherVO vo) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.selectLoginCount(vo);
	}

	@Override
	public void insertJoin2(S_ParentsVO vo) throws Exception {
		projectDAO.insertJoin2(vo);

	}

	@Override
	public int selectLoginCount2(S_ParentsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.selectLoginCount2(vo);
	}

	@Override
	public String idCheck(String teacher_id) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.idCheck(teacher_id);
	}

	@Override
	public String idCheck2(String s_parents_id) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.idCheck2(s_parents_id);
	}

	@Override
	public TeacherVO login1(TeacherVO vo) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.login1(vo);
	}

	@Override
	public S_ParentsVO login2(S_ParentsVO vo) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.login2(vo);
	}

	@Override
	public void update2(S_ParentsVO vo) throws Exception {
		// TODO Auto-generated method stub
		projectDAO.update2(vo);
	}

	@Override
	public void delete2(S_ParentsVO vo) throws Exception {
		// TODO Auto-generated method stub
		projectDAO.delete2(vo);
	}

	@Override
	public String nmCheck2(String s_parents_nm) throws Exception {
		// TODO Auto-generated method stub
		return projectDAO.nmCheck2(s_parents_nm);
	}

}
