package egovframework.project.service;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private String ntc_no;
	private String ntc_ttl;
	private String ntc_writer;
	private String ntc_cn;
	private Date ntc_ymd;
	private String searchCondition;
	private String searchKeyword;
	private String ntc_imp;
	private int ntc_cnt;
	private int sort_order;
	private int RN;
	private int pageIndex = 1;
	private int pageUnit = 10;
	private int pageSize = 10;
	private int firstIndex = 1;
	private int lastIndex = 1;
	private int recordCountPerPage = 10;
	private String ntc_img;
	private MultipartFile uploadFile;

	public String getNtc_no() {
		return ntc_no;
	}

	public void setNtc_no(String ntc_no) {
		this.ntc_no = ntc_no;
	}

	public String getNtc_ttl() {
		return ntc_ttl;
	}

	public void setNtc_ttl(String ntc_ttl) {
		this.ntc_ttl = ntc_ttl;
	}

	public String getNtc_writer() {
		return ntc_writer;
	}

	public void setNtc_writer(String ntc_writer) {
		this.ntc_writer = ntc_writer;
	}

	public String getNtc_cn() {
		return ntc_cn;
	}

	public void setNtc_cn(String ntc_cn) {
		this.ntc_cn = ntc_cn;
	}

	public Date getNtc_ymd() {
		return ntc_ymd;
	}

	public void setNtc_ymd(Date ntc_ymd) {
		this.ntc_ymd = ntc_ymd;
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

	public String getNtc_imp() {
		return ntc_imp;
	}

	public void setNtc_imp(String ntc_imp) {
		this.ntc_imp = ntc_imp;
	}

	public int getNtc_cnt() {
		return ntc_cnt;
	}

	public void setNtc_cnt(int ntc_cnt) {
		this.ntc_cnt = ntc_cnt;
	}

	public int getSort_order() {
		return sort_order;
	}

	public void setSort_order(int sort_order) {
		this.sort_order = sort_order;
	}

	public int getRN() {
		return RN;
	}

	public void setRN(int rN) {
		RN = rN;
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

	public String getNtc_img() {
		return ntc_img;
	}

	public void setNtc_img(String ntc_img) {
		this.ntc_img = ntc_img;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "NoticeVO [ntc_no=" + ntc_no + ", ntc_ttl=" + ntc_ttl + ", ntc_writer=" + ntc_writer + ", ntc_cn="
				+ ntc_cn + ", ntc_ymd=" + ntc_ymd + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", ntc_imp=" + ntc_imp + ", ntc_cnt=" + ntc_cnt + ", sort_order=" + sort_order
				+ ", RN=" + RN + ", pageIndex=" + pageIndex + ", pageUnit=" + pageUnit + ", pageSize=" + pageSize
				+ ", firstIndex=" + firstIndex + ", lastIndex=" + lastIndex + ", recordCountPerPage="
				+ recordCountPerPage + ", ntc_img=" + ntc_img + ", uploadFile=" + uploadFile + "]";
	}

}
