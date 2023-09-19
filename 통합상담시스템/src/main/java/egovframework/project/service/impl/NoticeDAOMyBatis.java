package egovframework.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.project.service.NoticeVO;

@Repository("noticedaoMyBatis")
public class NoticeDAOMyBatis implements NoticeDAO {
	@Resource(name = "NoticeMapper")
	private NoticeMapper mybatis;

	public NoticeDAOMyBatis() {
		System.out.println("===>NoticeDAOMyBatis()생성자");
	}

	@Override
	public void insertNotice(NoticeVO vo) throws Exception {
		System.out.println("MyBatis로 insertNotice() 기능처리");
		mybatis.insertNotice(vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) throws Exception {
		System.out.println("MyBatis로 updateNotice() 기능처리");
		mybatis.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) throws Exception {
		System.out.println("MyBatis로 deleteNotice() 기능처리");
		mybatis.deleteNotice(vo);
	}

	@Override
	public NoticeVO selectNotice(NoticeVO vo) throws Exception {
		System.out.println("MyBatis로 selectNotice() 기능처리");
		return (NoticeVO) mybatis.selectNotice(vo);
	}

	@Override
	public List<NoticeVO> selectNoticeList(NoticeVO vo) throws Exception {
		System.out.println("MyBatis로 selectNoticeList() 기능처리");
		return mybatis.selectNoticeList(vo);
	}

	@Override
	public void readCount(String ntc_no) throws Exception {
		System.out.println("MyBatis로 readcountBoard() 기능처리");
		mybatis.readCount(ntc_no);
	}

	@Override
	public int selectNoticeListTotCnt(NoticeVO vo) throws Exception {
		return mybatis.selectNoticeListTotCnt(vo);
	}

}