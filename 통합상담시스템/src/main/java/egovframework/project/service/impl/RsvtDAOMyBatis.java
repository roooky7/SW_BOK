package egovframework.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.project.service.RsvtDAO;
import egovframework.project.service.RsvtVO;
import egovframework.project.service.S_ParentsVO;

@Repository("RsvtdaoMyBatis")
public class RsvtDAOMyBatis implements RsvtDAO {
	@Resource(name = "RsvtMapper")
	private RsvtMapper mybatis;

	public RsvtDAOMyBatis() {
		System.out.println("생성");
	}

	public void insertRsvt(RsvtVO vo) throws Exception {
		System.out.println("insertRsvt()");
		mybatis.insertRsvt(vo);
	}

	public void updateRsvt(RsvtVO vo) throws Exception {
		System.out.println("updateRsvt()");
		mybatis.updateRsvt(vo);
	}

	public void deleteRsvt(RsvtVO vo) throws Exception {
		System.out.println("deleteRsvt()");
		mybatis.deleteRsvt(vo);
	}

	public RsvtVO selectRsvt(RsvtVO vo) throws Exception {
		System.out.println("selectRsvt()");
		return (RsvtVO) mybatis.selectRsvt(vo);
	}

	public List<RsvtVO> selectRsvtList(RsvtVO vo) throws Exception {
		System.out.println("selectRsvtList()");
		return mybatis.selectRsvtList(vo);
	}

	public List<RsvtVO> selectTodayRsvtList(S_ParentsVO vo) throws Exception {
		System.out.println("selectTodayRsvtList()");
		return mybatis.selectTodayRsvtList(vo);
	}
}
