package egovframework.project.service;

public class RsvtVO {
	private String rsvt_no; // 예약번호
	private String s_parents_id; // 학부모아이디
	private String teacher_id; // 교사아이디
	private String pst_ttl_nm; // 제목
	private String rsvt_cn; // 내용
	private String rsvt_dt; // 예약날짜
	private String rsvt_hr; // 예약시간
	private String rsvt_fhr; // 예약마감

	public String getRsvt_no() {
		return rsvt_no;
	}

	public void setRsvt_no(String rsvt_no) {
		this.rsvt_no = rsvt_no;
	}

	public String getS_parents_id() {
		return s_parents_id;
	}

	public void setS_parents_id(String s_parents_id) {
		this.s_parents_id = s_parents_id;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getPst_ttl_nm() {
		return pst_ttl_nm;
	}

	public void setPst_ttl_nm(String pst_ttl_nm) {
		this.pst_ttl_nm = pst_ttl_nm;
	}

	public String getRsvt_cn() {
		return rsvt_cn;
	}

	public void setRsvt_cn(String rsvt_cn) {
		this.rsvt_cn = rsvt_cn;
	}

	public String getRsvt_dt() {
		return rsvt_dt;
	}

	public void setRsvt_dt(String rsvt_dt) {
		this.rsvt_dt = rsvt_dt;
	}

	public String getRsvt_hr() {
		return rsvt_hr;
	}

	public void setRsvt_hr(String rsvt_hr) {
		this.rsvt_hr = rsvt_hr;
	}

	public String getRsvt_fhr() {
		return rsvt_fhr;
	}

	public void setRsvt_fhr(String rsvt_fhr) {
		this.rsvt_fhr = rsvt_fhr;
	}

}