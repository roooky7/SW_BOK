package egovframework.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.project.service.InquiryDAO;
import egovframework.project.service.InquiryVO;

@Repository("inquirydaoMyBatis")
public class InquiryDAOMyBatis implements InquiryDAO {
	@Resource(name = "InquiryMapper")
	private InquiryMapper mybatis;

	public InquiryDAOMyBatis() {
		System.out.println("===>InquiryDAOMyBatis()생성자");
	}

	@Override
	public void insertInquiry(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 insertInquiry() 기능처리");
		mybatis.insertInquiry(vo);
	}

	@Override
	public void insertReply(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 insertReply() 기능처리");
		mybatis.insertReply(vo);
	}

	@Override
	public void updateInquiry(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 updateInquiry() 기능처리");
		mybatis.updateInquiry(vo);
	}

	@Override
	public void deleteInquiry(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 deleteInquiry() 기능처리");
		mybatis.deleteInquiry(vo);
	}

	@Override
	public void deleteReply(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 deleteReply() 기능처리");
		mybatis.deleteReply(vo);

	}

	@Override
	public InquiryVO selectInquiry(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 selectInquiry() 기능처리");
		return (InquiryVO) mybatis.selectInquiry(vo);
	}

	@Override
	public List<InquiryVO> selectInquiryList(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 selectInquiryList() 기능처리");
		return mybatis.selectInquiryList(vo);
	}

	@Override
	public void readCount(String inquiry_id) throws Exception {
		System.out.println("MyBatis로 readcountBoard() 기능처리");
		mybatis.readCount(inquiry_id);
	}

	@Override
	public int selectSampleListTotCnt(InquiryVO vo) throws Exception {
		System.out.println("MyBatis로 selectInquiryListTotCnt() 기능처리");
		return mybatis.selectSampleListTotCnt(vo);
	}

}