package egovframework.project.service;

import java.util.List;

public interface RsvtService {

	void insertRsvt(RsvtVO vo) throws Exception;

	void updateRsvt(RsvtVO vo) throws Exception;

	void deleteRsvt(RsvtVO vo) throws Exception;

	RsvtVO selectRsvt(RsvtVO vo) throws Exception;

	List<RsvtVO> selectRsvtList(RsvtVO vo) throws Exception;

	List<RsvtVO> selectTodayRsvtList(S_ParentsVO vo) throws Exception;

}