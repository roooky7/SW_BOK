package egovframework.project.service;

import java.sql.Date;

import javax.validation.constraints.Size;

public class InquiryVO {
	private String inquiry_id;
	private String inquiry_ttl;
	private String inquiry_writer;
	@Size(max = 200)
	private String inquiry_cn;
	private Date inquiry_tmd;
	private String inquiry_sc;
	private String inquiry_reply;
	private int inquiry_rcnt;
	private int chldren_grade;
	private int chldren_clas;
	private String s_parents_id;

	private String searchCondition;
	private String searchKeyword;
	private int RN;
	private String loggedInUser;
	private int pageIndex = 1;
	private int pageUnit = 10;
	private int pageSize = 10;
	private int firstIndex = 1;
	private int lastIndex = 1;
	private int recordCountPerPage = 10;

	public String getInquiry_id() {
		return inquiry_id;
	}

	public void setInquiry_id(String inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public String getInquiry_ttl() {
		return inquiry_ttl;
	}

	public void setInquiry_ttl(String inquiry_ttl) {
		this.inquiry_ttl = inquiry_ttl;
	}

	public String getInquiry_writer() {
		return inquiry_writer;
	}

	public void setInquiry_writer(String inquiry_writer) {
		this.inquiry_writer = inquiry_writer;
	}

	public String getInquiry_cn() {
		return inquiry_cn;
	}

	public void setInquiry_cn(String inquiry_cn) {
		this.inquiry_cn = inquiry_cn;
	}

	public Date getInquiry_tmd() {
		return inquiry_tmd;
	}

	public void setInquiry_tmd(Date inquiry_tmd) {
		this.inquiry_tmd = inquiry_tmd;
	}

	public String getInquiry_sc() {
		return inquiry_sc;
	}

	public void setInquiry_sc(String inquiry_sc) {
		this.inquiry_sc = inquiry_sc;
	}

	public String getInquiry_reply() {
		return inquiry_reply;
	}

	public void setInquiry_reply(String inquiry_reply) {
		this.inquiry_reply = inquiry_reply;
	}

	public int getInquiry_rcnt() {
		return inquiry_rcnt;
	}

	public void setInquiry_rcnt(int inquiry_rcnt) {
		this.inquiry_rcnt = inquiry_rcnt;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getRN() {
		return RN;
	}

	public void setRN(int rN) {
		RN = rN;
	}

	public String getLoggedInUser() {
		return loggedInUser;
	}

	public void setLoggedInUser(String loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getChldren_grade() {
		return chldren_grade;
	}

	public void setChldren_grade(int chldren_grade) {
		this.chldren_grade = chldren_grade;
	}

	public int getChldren_clas() {
		return chldren_clas;
	}

	public void setChldren_clas(int chldren_clas) {
		this.chldren_clas = chldren_clas;
	}

	public String getS_parents_id() {
		return s_parents_id;
	}

	public void setS_parents_id(String s_parents_id) {
		this.s_parents_id = s_parents_id;
	}

	@Override
	public String toString() {
		return "InquiryVO [inquiry_id=" + inquiry_id + ", inquiry_ttl=" + inquiry_ttl + ", inquiry_writer="
				+ inquiry_writer + ", inquiry_cn=" + inquiry_cn + ", inquiry_tmd=" + inquiry_tmd + ", inquiry_sc="
				+ inquiry_sc + ", inquiry_reply=" + inquiry_reply + ", inquiry_rcnt=" + inquiry_rcnt
				+ ", chldren_grade=" + chldren_grade + ", chldren_clas=" + chldren_clas + ", s_parents_id="
				+ s_parents_id + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", RN="
				+ RN + ", loggedInUser=" + loggedInUser + ", pageIndex=" + pageIndex + ", pageUnit=" + pageUnit
				+ ", pageSize=" + pageSize + ", firstIndex=" + firstIndex + ", lastIndex=" + lastIndex
				+ ", recordCountPerPage=" + recordCountPerPage + "]";
	}

}
