package egovframework.project.service.impl;

import java.util.List;

import egovframework.project.service.RsvtVO;
import egovframework.project.service.S_ParentsVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("RsvtMapper")
public interface RsvtMapper {
	void insertRsvt(RsvtVO vo) throws Exception;

	void updateRsvt(RsvtVO vo) throws Exception;

	void deleteRsvt(RsvtVO vo) throws Exception;

	RsvtVO selectRsvt(RsvtVO vo) throws Exception;

	List<RsvtVO> selectRsvtList(RsvtVO vo) throws Exception;

	List<RsvtVO> selectTodayRsvtList(S_ParentsVO vo) throws Exception;
}
