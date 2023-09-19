package egovframework.project.web;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.project.service.LoginVO;
import egovframework.project.service.S_ParentsVO;
import egovframework.project.service.TeacherVO;

@Controller
public class WebSocketMessengerController {

	@RequestMapping(value = "/websocketMessengerView.do")
	public String websocketMessengerView(HttpSession session, ModelMap model) {
		/*
		 * nameList : session에 올려진 vo들 / name : nameList 중 필요한 객체를 담을
		 */
		Enumeration<String> nameList = session.getAttributeNames();
		String name = "";
		S_ParentsVO parentVO;
		TeacherVO teacherVO;
		LoginVO loginVO = new LoginVO();

		while (nameList.hasMoreElements()) {
			name = (String) nameList.nextElement();
			System.out.println("세션에 연결되어 있는 이름 : " + name);

			switch (name) {
			case "s_parents":
				parentVO = (S_ParentsVO) session.getAttribute("s_parents");
				loginVO.setName(parentVO.getS_parents_nm());
				// loginVO = messengerService.selectName(parentVO);
				break;

			case "teacher":
				teacherVO = (TeacherVO) session.getAttribute("teacher");
				// loginVO = messengerService.selectName(teacherVO);
				loginVO.setName(teacherVO.getTeacher_nm());
				break;
			}
		}
		;

		model.addAttribute("loginVO", loginVO);

		// System.out.println(names.nextElement());
		return "/chatMessenger";
	}

	@RequestMapping(value = "/websocketMessengerMain.do")
	public String websocketMessengerMain(LoginVO loginVO, HttpSession session, Model model) {
		model.addAttribute("loginVO", loginVO);

		return "/chatMessengerMain";
	}

	@RequestMapping(value = "/websocketMessengePopup.do")
	public String websocketMessengePopup(@RequestParam(value = "roomId") String roomId,
			@RequestParam(value = "username") String username, HttpSession session, ModelMap model, LoginVO loginVO) {
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("roomId", roomId);
		model.addAttribute("username", username);
		return "/chatPopupBubble";
	}
}