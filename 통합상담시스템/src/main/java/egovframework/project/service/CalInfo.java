package egovframework.project.service;

public class CalInfo {
	private String id;
	private String name;
	private String mm;
	private String dd;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public CalInfo(String id, String name, String mm, String dd) {
		this.id = id;
		this.name = name;
		this.mm = mm;
		this.dd = dd;
	}
}
