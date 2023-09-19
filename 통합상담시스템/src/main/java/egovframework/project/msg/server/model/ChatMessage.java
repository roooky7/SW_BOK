package egovframework.project.msg.server.model;

/**
 * @Class Name : ChatMessage.java
 * @Description : 대화정보를 담는 VO
 * @Modification Information
 *
 *               수정일 수정자 수정내용 ------- ------- ------------------- 2014. 11. 27.
 *               이영지
 *
 */
public class ChatMessage implements Message {

	/**
	 * 사용자명
	 */
	private String name;

	/**
	 * room Id
	 */
	private String room;

	/**
	 * 전달 메시지
	 */
	private String message;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}
}
