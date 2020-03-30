package com.kh.ojungFinal.websocket;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.logging.LogManager;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.ojungFinal.mail.model.dao.MailDAO;
import com.kh.ojungFinal.mail.model.vo.Mail;

@Repository
public class MailAlertWebSocketHandler extends TextWebSocketHandler{
	
	@Autowired
	private MailDAO dao;
	
	//private final Logger logger = LogManager.getLogger(getClass());
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	//db에 있는 메일이랑 서버에있는 메일과 갯수 차 발생시 
	// sidebar // 브라우저 알림 통지 메소드
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		int result = dao.selectReadMail(Integer.parseInt(message.getPayload()));
		if(result <= 0) {
			result = 0;
		}
		session.sendMessage(new TextMessage((result+"")));
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session)throws Exception {
		sessions.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)throws Exception{
		sessions.remove(session);
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception)throws Exception{
		sessions.remove(session);
	}
}
