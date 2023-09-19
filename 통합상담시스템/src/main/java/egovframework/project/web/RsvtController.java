package egovframework.project.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.project.service.RsvtService;
import egovframework.project.service.RsvtVO;
import egovframework.project.service.S_ParentsVO;

@Controller
@SessionAttributes("rsvt")
public class RsvtController {

	@Resource(name = "rsvtService")
	private RsvtService rsvtService;

	@RequestMapping(value = "/insertRsvt.do", method = RequestMethod.GET)
	public String insertRsvtView() throws Exception {
		System.out.println("등록화면이동");
		return "insertRsvt";
	}

	@RequestMapping(value = "/insertRsvt.do", method = RequestMethod.POST)
	public String insertRsvt(RsvtVO vo) throws Exception {
		System.out.println("예약 날짜 출력 -- " + vo.getRsvt_dt());
		System.out.println("예약 시간 출력 -- " + vo.getRsvt_hr());
		rsvtService.insertRsvt(vo);
		return "redirect:selectRsvtList.do";
	}

	@RequestMapping(value = "/updateRsvt.do")
	public String updateRsvt(@ModelAttribute("rsvt") RsvtVO vo) throws Exception {
		rsvtService.updateRsvt(vo);
		return "forward:selectRsvtList.do";

	}

	@RequestMapping(value = "/deleteRsvt.do")
	public String deleteRsvt(RsvtVO vo) throws Exception {
		System.out.println("삭제 처리");
		rsvtService.deleteRsvt(vo);
		return "redirect:selectRsvtList.do";
	}

	@RequestMapping(value = "/selectRsvt.do")
	public String selectRsvt(RsvtVO vo, Model model) throws Exception {
		System.out.println("조회 처리");

		model.addAttribute("rsvt", rsvtService.selectRsvt(vo));
		return "selectRsvt";
	}

	@RequestMapping(value = "/selectRsvtList.do")
	public String selectRsvtList(RsvtVO vo, Model model) throws Exception {
		model.addAttribute("rsvtList", rsvtService.selectRsvtList(vo));
		return "selectRsvtList";
	}

	// 현재 날짜에 해당되는 예약 리스트 출력
	@RequestMapping(value = "/selectTodayRsvtList.do", method = RequestMethod.POST)
	@ResponseBody
	public List<RsvtVO> selectTodayRsvtList(HttpSession session) throws Exception {
		S_ParentsVO loginVO = (S_ParentsVO) session.getAttribute("s_parents");
		List<RsvtVO> rsvtVO = rsvtService.selectTodayRsvtList(loginVO);
		return rsvtVO;
	}

}
