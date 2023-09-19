package egovframework.project.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.project.service.ProjectService;
import egovframework.project.service.S_ParentsVO;
import egovframework.project.service.TeacherVO;

@Controller
//@SessionAttributes("abtnt")
public class ProjectController {

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

//	AbtntVO Abtnt = new AbtntVO();

	@Resource(name = "projectService")
	private ProjectService projectService;

	@RequestMapping("/home.do")
	public String index() {
		System.out.println("home");
		return "home(test)";
	}

	@RequestMapping("/login.do")
	public String login() {
		System.out.println("login 유형 선택 화면");
		return "login";
	}

	@RequestMapping("/join.do")
	public String joinpage() {
		return "join";
	}

	@RequestMapping("/joinForm2.do")
	public String join2() {
		System.out.println("학부모 회원가입 화면 이동");
		return "joinForm2";
	}

	@RequestMapping("/joinForm.do")
	public String join() {
		System.out.println("교사 회원가입 화면 이동");
		return "joinForm";
	}

//	@RequestMapping("/home.do")
//	public String home() {
//		System.out.println("홈화면 이동");
//		return "home";
//	}

	@RequestMapping("/mypage.do")
	public String mypage() {
		System.out.println("mypage 이동");
		return "mypage";
	}

	@RequestMapping("/list1.do")
	public String list1() {
		System.out.println("교사 list 이동");
		return "list1";
	}

	@RequestMapping("/list2.do")
	public String list2() {
		System.out.println("학부모 list 이동");
		return "list2";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm1() {
		System.out.println("교사 loginForm1 이동");
		return "loginForm";
	}

	@RequestMapping("/loginForm2.do")
	public String loginForm2() {
		System.out.println("학부모 loginForm2 이동");
		return "loginForm2";
	}

	@RequestMapping("/selectForm.do")
	public String selectForm() {
		System.out.println("학부모 selectForm 이동");
		return "selectForm";
	}

	@RequestMapping("/selectForm2.do")
	public String selectForm2() {
		System.out.println("교사 selectForm 이동");
		return "selectForm2";
	}

	@RequestMapping("/delete2.do")
	public String delete2() {
		System.out.println("학부모 delete 이동");
		return "delete2";
	}

	@RequestMapping(value = "/joinForm.do", method = RequestMethod.POST)
	public String insertJoin(TeacherVO vo) throws Exception {
		System.out.println("교사 회원가입 처리");

		String inputPass = vo.getTeacher_pwd();
		String pwd = pwdEncoder.encode(inputPass);
		System.out.println("암호화 된 pw=" + pwd);
		vo.setTeacher_pwd(pwd);

		String message = "";
		String result = projectService.insertJoin(vo);
//		session.setAttribute("abtnt", result);
		System.out.println("result==>" + result);
		if (result == null) {
			message = "ok";
			return message;
		}

//		return "forward:login.do";
		return "ok";
	}

	@RequestMapping(value = "/joinForm2.do", method = RequestMethod.POST)
	public String insertJoin2(S_ParentsVO vo) throws Exception {
		System.out.println("학부모 회원가입 처리");

		String inputPass = vo.getS_parents_pwd();
		String pwd = pwdEncoder.encode(inputPass);
		System.out.println("암호화 된 pw=" + pwd);
		vo.setS_parents_pwd(pwd);

		projectService.insertJoin2(vo);
//		session.setAttribute("abtnt", result);
//		return "forward:login.do";
		return "ok";
	}

	// 아이디 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> idCheck(@RequestParam("teacher_id") String teacher_id) throws Exception {
		ResponseEntity<String> entity = null;

		String isUseID = "";
		String aa = projectService.idCheck(teacher_id);
		System.out.println("넘긴 id 값=" + aa);
		if (projectService.idCheck(teacher_id) != null) {
			isUseID = "yes"; // id 사용중
		} else {
			isUseID = "no"; // id X 사용가능
		}
		entity = new ResponseEntity<String>(isUseID, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/idCheck2.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> idCheck2(@RequestParam("s_parents_id") String s_parents_id) throws Exception {
		ResponseEntity<String> entity = null;

		String isUseID2 = "";
		String aa2 = projectService.idCheck2(s_parents_id);
		System.out.println("넘긴 id 값=" + aa2);
		if (projectService.idCheck2(s_parents_id) != null) {
			isUseID2 = "yes"; // id 사용중
		} else {
			isUseID2 = "no"; // id X 사용가능
		}
		entity = new ResponseEntity<String>(isUseID2, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/nmCheck2.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> nmCheck2(@RequestParam("s_parents_nm") String s_parents_nm) throws Exception {
		ResponseEntity<String> entity2 = null;

		String isUseNM2 = "";
		String bb2 = projectService.nmCheck2(s_parents_nm);
		System.out.println("넘긴 nm 값=" + bb2);
		if (projectService.nmCheck2(s_parents_nm) != null) {
			isUseNM2 = "yes"; // id 사용중
		} else {
			isUseNM2 = "no"; // id X 사용가능
		}
		entity2 = new ResponseEntity<String>(isUseNM2, HttpStatus.OK);

		return entity2;
	}

	@RequestMapping(value = "/loginForm.do", method = RequestMethod.POST)
	public String login(TeacherVO vo) throws Exception {
		System.out.println("로그인 처리");

		return "forward:loginOk.do";
	}

	@RequestMapping(value = "/loginOk.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginProcessing(TeacherVO vo, HttpSession session) throws Exception {
		System.out.println("교사 loginProcessing");
		String message = "";

		TeacherVO login = projectService.login1(vo);
		session.setAttribute("teacher", login);

		boolean pwdMatch = pwdEncoder.matches(vo.getTeacher_pwd(), login.getTeacher_pwd());
		System.out.println("pwdMatch=" + pwdMatch);
		System.out.println("login=" + login);

//		boolean pwdMatch;
//		if(login != null) {
//		pwdMatch = pwdEncoder.matches(abtnt.getAbtnt_pwd(),login.getAbtnt_pwd());
//		message ="ok";
//		} else {
//		pwdMatch = false;
//		}

//

//		if(login != null && pwdMatch == true) {
//		session.setAttribute("abtnt", login);
//		message ="ok";
//		} else {
//		session.setAttribute("abtnt", null);
//		rttr.addFlashAttribute("msg", false);
//		}

		if (login != null && pwdMatch == true) {
			System.out.println("로그인정보O 비번 일치");
			session.getAttribute("teacher");
			message = "ok";
		} else {
			System.out.println("비번 불일치");
			session.setAttribute("teacher", null);
//			rttr.addFlashAttribute("msg", false);
			message = "false";
		}
//		if (count == 1) {
//			// session 생성
//			session.setAttribute("SessionId", vo.getAbtnt_id());
//			System.out.println("1==>" + session.getAttribute("SessionId"));
////			session.setAttribute("SessionPass", vo.getPass());
//			// message 처리
//			message = "ok";
//		}
		return message;
	}

	@RequestMapping(value = "/loginForm2.do", method = RequestMethod.POST)
	public String login2(S_ParentsVO vo) throws Exception {
		System.out.println("로그인 처리2");

		return "forward:loginOk2.do";
	}

	@RequestMapping(value = "/loginOk2.do", method = RequestMethod.POST)
	@ResponseBody
	public String loginProcessing2(S_ParentsVO vo, HttpSession session) throws Exception {
		System.out.println("학부모 loginProcessing2");
		String message = "";
//		session.setAttribute("s_parents", vo);

		S_ParentsVO login = projectService.login2(vo);
		session.setAttribute("s_parents", login);

		boolean pwdMatch = pwdEncoder.matches(vo.getS_parents_pwd(), login.getS_parents_pwd());
		System.out.println("pwdMatch=" + pwdMatch);
		System.out.println("login=" + login);

		if (login != null && pwdMatch == true) {
			System.out.println("로그인정보O 비번 일치");
			session.getAttribute("s_parents");

			message = "ok";
		} else {
			System.out.println("비번 불일치");
			session.setAttribute("s_parents", null);
//			rttr.addFlashAttribute("msg", false);
			message = "false";
		}

//		int count = projectService.selectLoginCount2(vo);
//		if (count == 1) {
//			// session 생성
//			session.setAttribute("SessionId", vo.getStdnprnt_id());
//			System.out.println("1==>" + session.getAttribute("SessionId"));
////			session.setAttribute("SessionPass", vo.getPass());
//			// message 처리
//			message = "ok";
//		}
		return message;
	}

//	@RequestMapping("/select2.do")
//	public String select(StdnprntVO vo, Model model, HttpSession session) throws Exception {
//		System.out.println("학부모 상세화면");
//		session.getAttribute(vo.getStdnprnt_id());
//		model.addAttribute("Stdnprnt",projectService.select2(vo));
//
//		return "selectForm2";
//	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 처리");

//		session.removeAttribute("SessionId");
		session.invalidate();
		return "forward:home.do";
	}

//	@RequestMapping("/select2.do")
//	public String select2(StdnprntVO vo, Model model) {
//		System.out.println("학부모 상세화면 select2");
////		model.addAttribute("stdnprnt", projectService.select2(vo));
//		
//		return null;
//		
//	}
	@RequestMapping(value = "/updateForm2.do", method = RequestMethod.POST)
	public String update2(@ModelAttribute("s_parents") S_ParentsVO vo, HttpSession session) throws Exception {
		System.out.println("update");
		String inputPass = vo.getS_parents_pwd();
		String pwd = pwdEncoder.encode(inputPass);
		System.out.println("암호화 된 pw=" + pwd);
		vo.setS_parents_pwd(pwd);
		String aa1 = vo.getS_parents_cttpc();
		System.out.println("수정 전 전화번호" + aa1);
		projectService.update2(vo);
		String aa2 = vo.getS_parents_cttpc();
		System.out.println("수정 전화번호" + aa2);
		session.invalidate();

		return "home(test)";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk.do", method = RequestMethod.POST)
	public String passChk(S_ParentsVO vo) throws Exception {

		S_ParentsVO login2 = projectService.login2(vo);
		System.out.println("login2=>" + login2);
		boolean pwdChk = pwdEncoder.matches(vo.getS_parents_pwd(), login2.getS_parents_pwd());
		System.out.println("pwdChk=>" + pwdChk);
		if (pwdChk == true) {
			return "ok";
		}
		return "false";
	}

	@RequestMapping(value = "/deleteForm2.do", method = RequestMethod.POST)
	public String delete2(S_ParentsVO vo, HttpSession session) throws Exception {

		projectService.delete2(vo);
		session.invalidate();

		return "home(test)";
	}
}
