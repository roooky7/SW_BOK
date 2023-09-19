package egovframework.project.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import egovframework.project.service.NoticeService;
import egovframework.project.service.NoticeVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@SessionAttributes("notice")
public class NoticeController {
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.GET)
	public String insertNoticeView() throws Exception {
		System.out.println("등록화면이동");
		return "insertNotice";
	}

	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(NoticeVO vo) throws Exception {

		// 파일 업로드
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		vo.setNtc_img(fileName);

		System.out.println(vo.getNtc_img());

		noticeService.insertNotice(vo);
		return "redirect:selectNoticeList.do";
	}

	@RequestMapping(value = "/updateNotice.do")
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo, HttpServletRequest request) throws Exception {
		System.out.println("수정 정보");
		System.out.println("제목" + vo.getNtc_ttl());
		System.out.println("작성자" + vo.getNtc_writer());
		System.out.println("내용" + vo.getNtc_cn());

		// 파일 수정
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
			vo.setNtc_img(fileName);
		} else {
			noticeService.updateNotice(vo);
			return "forward:selectNoticeList.do?ntc_no=" + vo.getNtc_no();
		}

		noticeService.updateNotice(vo);
		return "forward:selectNoticeList.do?ntc_no=" + vo.getNtc_no();
	}

	@RequestMapping(value = "/deleteNotice.do")
	public String deleteNotice(NoticeVO vo) throws Exception {
		System.out.println("삭제 처리");
		noticeService.deleteNotice(vo);
		return "forward:selectNoticeList.do";
	}

	@RequestMapping(value = "/selectNotice.do")
	public String selectNotice(@RequestParam("rn") String rn, NoticeVO vo, Model model) throws Exception {
		System.out.println("조회 처리");
		noticeService.readCount(vo.getNtc_no());
		model.addAttribute("notice", noticeService.selectNotice(vo));
		model.addAttribute("rn", rn);
		return "selectNotice";
	}

	@RequestMapping(value = "/selectNoticeList.do")
	public String selectNoticeList(@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@ModelAttribute("vo") NoticeVO vo, Model model) throws Exception {
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

		List<NoticeVO> inquiryList = noticeService.selectNoticeList(vo);
		model.addAttribute("resultList", inquiryList);

		int totCnt = noticeService.selectNoticeListTotCnt(vo);
		paginationInfo.setTotalRecordCount(totCnt);
		System.out.println(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);

		model.addAttribute("noticeList", noticeService.selectNoticeList(vo));
		return "selectNoticeList";
	}

	@Controller
	public class FileDownloadController {

		@RequestMapping(value = "/fileDownload.do")
		public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {

			String filename = request.getParameter("fileName");
			String realFilename = "";
			System.out.println(filename);

			try {

				String browser = request.getHeader("User-Agent");
				// 파일 인코딩
				if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
					filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
				} else {
					filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
				}

			} catch (UnsupportedEncodingException e) {

				System.out.println("UnsupportedEncodingException 발생");

			}

			realFilename = "C:\\upload\\" + filename;
			System.out.println(realFilename);

			File file = new File(realFilename);
			if (!file.exists()) {
				return;
			}

			// 파일명 지정
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

			try {
				OutputStream os = response.getOutputStream();
				FileInputStream fis = new FileInputStream(realFilename);

				int cnt = 0;
				byte[] bytes = new byte[512];

				while ((cnt = fis.read(bytes)) != -1) {
					os.write(bytes, 0, cnt);
				}

				fis.close();
				os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
}