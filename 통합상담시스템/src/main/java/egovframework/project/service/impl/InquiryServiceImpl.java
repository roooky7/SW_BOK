package egovframework.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.project.service.InquiryDAO;
import egovframework.project.service.InquiryService;
import egovframework.project.service.InquiryVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("inquiryService")
public class InquiryServiceImpl extends EgovAbstractServiceImpl implements InquiryService {

	@Resource(name = "inquirydaoMyBatis")
	private InquiryDAO inquiryDAO;

	public void insertInquiry(InquiryVO vo) throws Exception {
		inquiryDAO.insertInquiry(vo);
	}

	public void insertReply(InquiryVO vo) throws Exception {
		inquiryDAO.insertReply(vo);

	}

	public void updateInquiry(InquiryVO vo) throws Exception {
		inquiryDAO.updateInquiry(vo);

	}

	public void deleteInquiry(InquiryVO vo) throws Exception {
		inquiryDAO.deleteInquiry(vo);

	}

	public void deleteReply(InquiryVO vo) throws Exception {
		inquiryDAO.deleteReply(vo);

	}

	public InquiryVO selectInquiry(InquiryVO vo) throws Exception {
		return inquiryDAO.selectInquiry(vo);
	}

	public List<InquiryVO> selectInquiryList(InquiryVO vo) throws Exception {
		return inquiryDAO.selectInquiryList(vo);
	}

	public void readCount(String inquiry_id) throws Exception {
		inquiryDAO.readCount(inquiry_id);
	}

	public int selectSampleListTotCnt(InquiryVO vo) throws Exception {
		return inquiryDAO.selectSampleListTotCnt(vo);
	}

}
