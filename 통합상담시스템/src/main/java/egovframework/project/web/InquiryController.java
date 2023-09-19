package egovframework.project.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.project.service.InquiryService;
import egovframework.project.service.InquiryVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@SessionAttributes("inquiry")
public class InquiryController {
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	@RequestMapping(value = "/insertInquiry.do", method = RequestMethod.GET)
	public String insertInquiryView() throws Exception {
		System.out.println("등록화면이동");
		return "insertInquiry";
	}

	@RequestMapping(value = "/insertInquiry.do", method = RequestMethod.POST)
	public String insertInquiry(InquiryVO vo) throws Exception {
		inquiryService.insertInquiry(vo);
		return "redirect:selectInquiryList.do";
	}

	@RequestMapping(value = "/insertReply.do")
	public String insertReply(@ModelAttribute("inquiry") InquiryVO vo) throws Exception {
		System.out.println("댓글 입력");
		System.out.println("댓글: " + vo.getInquiry_reply());
		System.out.println("글번호: " + vo.getInquiry_id());
		inquiryService.insertReply(vo);
		return "forward:selectInquiry.do";
	}

	@RequestMapping(value = "/updateInquiry.do")
	public String updateInquiry(@ModelAttribute("inquiry") InquiryVO vo) throws Exception {
		System.out.println("수정 정보");
		System.out.println("제목" + vo.getInquiry_ttl());
		System.out.println("작성자" + vo.getInquiry_writer());
		System.out.println("내용" + vo.getInquiry_cn());
		inquiryService.updateInquiry(vo);
		return "forward:selectInquiryList.do";

	}

	@RequestMapping(value = "/deleteInquiry.do")
	public String deleteInquiry(InquiryVO vo) throws Exception {
		System.out.println("삭제 처리");
		inquiryService.deleteInquiry(vo);
		return "forward:selectInquiryList.do";
	}

	@RequestMapping(value = "/deleteReply.do")
	public String deleteReply(InquiryVO vo) throws Exception {
		System.out.println("댓글 삭제");
		inquiryService.insertReply(vo);
		return "forward:selectInquiry.do";
	}

	@RequestMapping(value = "/selectInquiry.do")
	public String selectInquiry(@RequestParam("rn") String rn, InquiryVO vo, Model model) throws Exception {
		System.out.println("조회 처리");
		inquiryService.readCount(vo.getInquiry_id());
		model.addAttribute("inquiry", inquiryService.selectInquiry(vo));
		model.addAttribute("rn", rn);
		return "selectInquiry";
	}

	@RequestMapping(value = "/selectInquiryList.do")
	public String selectInquiryList(@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@ModelAttribute("vo") InquiryVO vo, Model model) throws Exception {
		System.out.println("목록 검색 처리");

		{
			if (vo.getSearchCondition() == null)
				vo.setSearchCondition("TITLE");
		}
		{
			if (vo.getSearchKeyword() == null)
				vo.setSearchKeyword("");
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		System.out.println(vo.getPageIndex());
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<InquiryVO> inquiryList = inquiryService.selectInquiryList(vo);
		model.addAttribute("resultList", inquiryList);

		int totCnt = inquiryService.selectSampleListTotCnt(vo);
		paginationInfo.setTotalRecordCount(totCnt);
		System.out.println(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);

		model.addAttribute("inquiryList", inquiryService.selectInquiryList(vo));
		return "selectInquiryList";
	}

}