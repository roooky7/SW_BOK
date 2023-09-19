package egovframework.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.project.service.RsvtDAO;
import egovframework.project.service.RsvtService;
import egovframework.project.service.RsvtVO;
import egovframework.project.service.S_ParentsVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("rsvtService")
public class RsvtServiceImpl extends EgovAbstractServiceImpl implements RsvtService {
	private static final Logger LOGGER = LoggerFactory.getLogger(RsvtServiceImpl.class);

	@Resource(name = "RsvtdaoMyBatis")
	private RsvtDAO rsvtDAO;

	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	public RsvtServiceImpl() {
		System.out.println("로딩");
	}

	public void insertRsvt(RsvtVO vo) throws Exception {
//		LOGGER.trace("TRACE Level Logging");
//		LOGGER.debug("DEBUG Level Logging");
//		LOGGER.info("INFO Level Logging");
//		LOGGER.warn("WARN Level Logging");
//		LOGGER.error("ERROR Level Logging");
		String rsvt_no = egovIdGnrService.getNextStringId();
		vo.setRsvt_no(rsvt_no);
		rsvtDAO.insertRsvt(vo);
	}

	public void updateRsvt(RsvtVO vo) throws Exception {
		rsvtDAO.updateRsvt(vo);
	}

	public void deleteRsvt(RsvtVO vo) throws Exception {
		rsvtDAO.deleteRsvt(vo);
	}

	public RsvtVO selectRsvt(RsvtVO vo) throws Exception {
		return rsvtDAO.selectRsvt(vo);
	}

	public List<RsvtVO> selectRsvtList(RsvtVO vo) throws Exception {
		return rsvtDAO.selectRsvtList(vo);
	}

	public List<RsvtVO> selectTodayRsvtList(S_ParentsVO vo) throws Exception {
		return rsvtDAO.selectTodayRsvtList(vo);
	}

}
