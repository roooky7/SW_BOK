package egovframework.project.service;

import java.util.List;

public interface InquiryDAO {
	void insertInquiry(InquiryVO vo) throws Exception;

	void updateInquiry(InquiryVO vo) throws Exception;

	void deleteInquiry(InquiryVO vo) throws Exception;

	InquiryVO selectInquiry(InquiryVO vo) throws Exception;

	List<InquiryVO> selectInquiryList(InquiryVO vo) throws Exception;

	void readCount(String inquiry_id) throws Exception;

	void insertReply(InquiryVO vo) throws Exception;

	void deleteReply(InquiryVO vo) throws Exception;

	int selectSampleListTotCnt(InquiryVO vo) throws Exception;
}
