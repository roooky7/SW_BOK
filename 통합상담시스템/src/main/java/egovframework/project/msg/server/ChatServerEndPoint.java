package egovframework.project.msg.server;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.project.msg.server.config.ChatServerAppConfig;
import egovframework.project.msg.server.model.ChatMessage;
import egovframework.project.msg.server.model.Message;
import egovframework.project.msg.server.model.UsersMessage;
import egovframework.project.msg.server.model.decoder.MessageDecoder;
import egovframework.project.msg.server.model.encoder.MessageEncoder;

@ServerEndpoint(value = "/chat/{room}", encoders = { MessageEncoder.class }, decoders = {
		MessageDecoder.class }, configurator = ChatServerAppConfig.class)
public class ChatServerEndPoint {
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatServerEndPoint.class);
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void handleOpen(Session userSession, @PathParam("room") final String room)
			throws IOException, EncodeException {
		userSession.getUserProperties().put("room", room);
		chatroomUsers.add(userSession);
	}

	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("room") final String room)
			throws IOException, EncodeException {

		ChatMessage incomingChatMessage = (ChatMessage) incomingMessage;
		ChatMessage outgoingChatMessage = new ChatMessage();

		String username = (String) userSession.getUserProperties().get("username");
		if (username == null) {

			username = incomingChatMessage.getMessage();
			if (username != null) {
				userSession.getUserProperties().put("username", username);
			}

			synchronized (chatroomUsers) {
				for (Session session : chatroomUsers) {
					session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
				}
			}
		} else {
			outgoingChatMessage.setName(username);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());

			for (Session session : chatroomUsers) {
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
	}

	// 누군가가 접속 끊을때
	@OnClose
	public void handleClose(Session userSession, @PathParam("room") final String room)
			throws IOException, EncodeException {
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers) {
			session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
		}
	}

	@OnError
	public void handleError(Session session, Throwable throwable, @PathParam("room") final String room) {
		// Error handling
		LOGGER.info("ChatServerEndPoint (room: " + room + ") occured Exception!");
		LOGGER.info("Exception : " + throwable.getMessage());
	}

	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}

}
