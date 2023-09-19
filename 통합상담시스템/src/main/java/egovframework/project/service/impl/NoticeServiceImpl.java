package egovframework.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.project.service.NoticeService;
import egovframework.project.service.NoticeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {

	@Resource(name = "noticedaoMyBatis")
	private NoticeDAO noticeDAO;

	public void insertNotice(NoticeVO vo) throws Exception {
		noticeDAO.insertNotice(vo);
	}

	public void updateNotice(NoticeVO vo) throws Exception {
		noticeDAO.updateNotice(vo);

	}

	public void deleteNotice(NoticeVO vo) throws Exception {
		noticeDAO.deleteNotice(vo);

	}

	public NoticeVO selectNotice(NoticeVO vo) throws Exception {
		return noticeDAO.selectNotice(vo);
	}

	public List<NoticeVO> selectNoticeList(NoticeVO vo) throws Exception {
		return noticeDAO.selectNoticeList(vo);
	}

	public void readCount(String ntc_no) throws Exception {
		noticeDAO.readCount(ntc_no);
	}

	@Override
	public int selectNoticeListTotCnt(NoticeVO vo) throws Exception {
		return noticeDAO.selectNoticeListTotCnt(vo);
	}

}
