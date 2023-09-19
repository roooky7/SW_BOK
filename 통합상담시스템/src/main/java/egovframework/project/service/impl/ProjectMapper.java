package egovframework.project.service.impl;

import egovframework.project.service.S_ParentsVO;
import egovframework.project.service.TeacherVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ProjectMapper")
public interface ProjectMapper {
	void insertJoin(TeacherVO vo) throws Exception;

	int selectLoginCount(TeacherVO vo) throws Exception;

	void insertJoin2(S_ParentsVO vo) throws Exception;

	int selectLoginCount2(S_ParentsVO vo) throws Exception;

	String idCheck(String teacher_id) throws Exception;

	String idCheck2(String s_parents_id) throws Exception;

	TeacherVO login1(TeacherVO vo) throws Exception;

	S_ParentsVO login2(S_ParentsVO vo) throws Exception;

	void update2(S_ParentsVO vo) throws Exception;

	void delete2(S_ParentsVO vo) throws Exception;

	String nmCheck2(String s_parents_nm) throws Exception;
}
