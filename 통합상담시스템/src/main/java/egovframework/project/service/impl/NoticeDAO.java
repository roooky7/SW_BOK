package egovframework.project.service.impl;

import java.util.List;

import egovframework.project.service.NoticeVO;

public interface NoticeDAO {
	void insertNotice(NoticeVO vo) throws Exception;

	void updateNotice(NoticeVO vo) throws Exception;

	void deleteNotice(NoticeVO vo) throws Exception;

	NoticeVO selectNotice(NoticeVO vo) throws Exception;

	List<NoticeVO> selectNoticeList(NoticeVO vo) throws Exception;

	void readCount(String ntc_no) throws Exception;

	int selectNoticeListTotCnt(NoticeVO vo) throws Exception;
}
