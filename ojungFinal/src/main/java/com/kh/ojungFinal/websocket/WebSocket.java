package com.kh.ojungFinal.websocket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOError;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.ojungFinal.chatting.model.ChatDto;
import com.kh.ojungFinal.chatting.model.ChatMemberDto;
import com.kh.ojungFinal.chatting.service.ProjectChatService;
import com.kh.ojungFinal.chatting.util.ChatUtil;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.websocket.WebSocket;

public class WebSocket extends TextWebSocketHandler {
	//Service 접근(db처리를 하기위하여)
	@Autowired
	ProjectChatService projectChatService;
	
	private static final Logger logger = LoggerFactory.getLogger(WebSocket.class);
	
	// 서버에 연결된 사용자들을 저장하기위해 선언
	private List<WebSocketSession> sessionList = new ArrayList<>();//메세지를 날려주기위한 웹소켓전용 세션
	private Map<WebSocketSession, String> mapList = new HashMap<>(); //실제 session의 아이디정보, web소켓 정보
	private Map<WebSocketSession, String> roomList = new HashMap<>(); // 실제 session의 아이디정보, room정보
	private List<String> userList = new ArrayList<>();//접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트
	
	
	// 연결되었을 때 
	@Override
	public void afterConnectionEstablished(WebSocketSession session)throws Exception{
		logger.info("채팅방 연결 성공 ! 연결성공시간: "+ new Date());
		
		//1. 들어온 사람의 실제 로그인 아이디 정보를 가져온다.
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member)map.get("loginMember");
		String userName = mem.getMemberName();
		
		//2. 들어온 이름으로 어느 방에 있는지 확인한다.
		ChatMemberDto userRoom = projectChatService.getRoomMember(new ChatMemberDto(0,userName,"",""));
		
		//3. 들어온 이름으로 찾은 방이름을 웹소켓 세션에 추가
		roomList.put(session,userRoom.getRoom());
		//System.out.println(userName+"님이 "+userRoom.getRoom()+"방에 들어왔습니다.");
		
		//4. 이전 방 정보 DB에서 수정하기
		String priroom = userRoom.getRoom();
		projectChatService.updateRoomMember(new ChatMemberDto(0,userName,"",priroom));
		
		//5. mapList(해당세션의 실제 이름 값을 저장하기위해 map으로 저장)
		mapList.put(session,userName);
		
		//6. map을 사용하지않아도 될 경우를 위해서 session값도 넣도록한다.
		sessionList.add(session);//세션의 값 넣기(session : id= 0~, url:/ 주소/echo.do)
		logger.info("세션추가 : "+session.getId() + "접속자 이름 : " + mem.getMemberName()
					+ "현재 채팅 접속자 : " + sessionList.size()+"명");
		
		//7. 입장 시 해당 방 인원수를 증가시킨다.
		projectChatService.updateChatCountInc(new ChatDto(0, userRoom.getRoom(),"", 0, 0, ""));
		
		
		//8. 모든유저들에게 서로다른 메세지를 전달하기위해 전체적으로 for문을 돌리도록 한다.
		for(int i = 0; i<sessionList.size(); i++) {
			//9. 해당 i번째 사람(sessionList.get(i)의 방이름 정보를 가져온다.
			// 웹소켓세션아이디가 저장된 sessionList를 이용해서 방정보를 가져옴.
			String roomName = roomList.get(sessionList.get(i));
			
			//10. 접속자가 속한 방에만 접속했음을 알린다.
			if(userRoom.getRoom().contentEquals(roomList.get(sessionList.get(i)))) {
				sessionList.get(i).sendMessage(new TextMessage(JsonDataOpen(userName)));
			}
			
			//11. 같은 방에 있는 사람에게만 접속자 리스트를 날려주도록한다.
			userList = informUser(mapList, roomName);// 현재 while문에서 사용중인 roomName값으로 리스트를 가져온다(아래 method확인)
			System.out.println("현재방에 참석중인 사람 수 : " + userList.size());
			ChatUtil chatUtil = new ChatUtil();//spring.util소속 클래스 선언
			String userListMessage = chatUtil.split(userList);// 받아온 list에 대해서 문자열로 바인딩해서 날려줌
			
			sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));
			
			//12. 방 리스트를 모든 사람들에게 보내줌
			String roomNames = getRoomName();
			sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));
		}
		
		//13. 없는 방에대해서 삭제처리를 한다.
		projectChatService.deleteChat();
		
	}
	
	
	//통신 연결 끊었을때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//1. 현재 접속한 사람의 로그인한 id 정보를 가져온다.
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member)map.get("loginMember");
		String userName = mem.getMemberName();
		
		//2. 접속을 끊을 때 해당 아이디로 DB에서 어느 방에 존재하는지 확인한다.
		ChatMemberDto member = projectChatService.getRoomMember(new ChatMemberDto(0,userName,"",""));
		
		System.out.println("접속 끊기 이전 방 : "+ member.getPriRoom());
		
		//3. 해당 유저의 roomList, mapList, sessionList를 제거한다(미리 제거를 해야만 본인 제외한 모든사람들에게 본인의 정보를
		// 		날려 줄 수 있기 때문)
		roomList.remove(session);
		mapList.remove(session); // 세션:key, 유저아이디:value
		sessionList.remove(session); // 실제 websocket 세션명
		logger.info("세션삭제 : "+session.getId()+", 이름 삭제 : "+userName+", 채팅 남은 사람 수 : " + sessionList.size());
		
		//4. 이전 방에서 인원수를 감소시킨다(이전방정보로 지우기)
		projectChatService.updateChatCountDec(new ChatDto(0, member.getPriRoom(),"",0,0,""));
		
		//4. 본인 제외하고 본인이 있던 방의 모든 사람들에게 나갔음을 알림
		// 이유 : 해당 아이디가 이전의 있던 방에만 데이터를 전달 할 경우, 해당 아이디가 없었던 방의 데이터는 전달이 안되고 아무 정보도 들어오지 않기때문
		for(int i=0;i<sessionList.size();i++) {
			//5. 해당 i번째 사람(sessionList.get(i)의 방이름 정보를 가져온다.
			String roomName = roomList.get(sessionList.get(i));// i번째 사람의 방이름이 저장되어있음.
			
			//6. sessionList.get(i).getMemberName()사람이 속한 방에만 전달하도록 설정
			Iterator<WebSocketSession> roomIds = roomList.keySet().iterator();// 현재 존재하는 roomList를 가져온다.
			// map이기 때문에 iterator를 사용하여 while문을 동작시킨다 
			while(roomIds.hasNext()) {
				WebSocketSession roomId = roomIds.next();// roomId : 실제 세션명
				String value = roomList.get(roomId);// value : 방이름
				
				//7. 같은 방에 있었던 사람에게만 ~님이 퇴장하셨습니다. 라고 데이터를 날려주도록함.
				if(member.getPriRoom().equals(value)) {
					roomId.sendMessage(new TextMessage(JsonDataClose(userName)));
				}
			}
			
			//8. 같은 방에 있는 사람에게만 접속자 리스트를 날려주도록한다.
			userList = informUser(mapList, roomName); // 현재 while문에서 사용중인 roomName값으로 리스트를 가져온다(아래 method확인)
			ChatUtil chatUtil = new ChatUtil();
			String userListMessage = chatUtil.split(userList);// 받아온 list에 대해서 문자열로 바인딩해서 날려줌
			
			sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));
			
			
			//9. 방리스트를 모든 사람들에게 보내줌
			String roomNames = getRoomName();
			sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));
		}
		
	}
	
	
	//서버가 클라이언트로부터 메시지를 받았을 때 
	@Override//WebSocketMessage<?>
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//1. 회원정보 가져오기
		Map<String, Object> map = session.getAttributes();
		Member mem = (Member)map.get("loginMember");
		String userName = mem.getMemberName();
		
		// 검색어로 들어왔을 경우
		if(message.getPayload().contains("!%/&")) {
			//메세지 전달이 아닌 검색리스트 전달
			
			//문자열 형태 : !%/&
			System.out.println(message.getPayload());
			
			String searchRoom = message.getPayload().replaceAll("!%/&", "");
			System.out.println(searchRoom);
			
			String roomNames = "";
			if(searchRoom.equals("")) {
				roomNames = getRoomName();
			}
			else {
				roomNames = getRoomName(searchRoom);
			}
			
			for(WebSocketSession webSocketSession : sessionList) {
				// 자신에게만 보내도록 함
				
				if(session.getId().equals(webSocketSession.getId())) {
					webSocketSession.sendMessage(new TextMessage(JsonRoom(roomNames)));
				}
			}
		}
		else {
			//2. 문자열 형태 : 문자 !%/ 대상 !%/ 방이름
			System.out.println(message.getPayload());
			
			//3. 배열 선언(split을 이용해서 문자열을 자른다)
			String msgArr[] = new String[4];
			msgArr = message.getPayload().split("!%/");// !%/로 문자를 잘라서 배열에 저장
			
			//4. [0]: 유저가 보낸 메시지, [1]: 귓속말 대상자, [2]: 방이름, [3]: 보낸 시간
			System.out.println("보낸메세지: "+msgArr[0] + "귓속말 대상자 : "
								+ msgArr[1] + ", 방 이름 : "+ msgArr[2]
								+ ", 보낸 시간 : " + msgArr[3]);
			
			//5. 귓속말이라면 해당아이디를 가진 사람한테만 보내도록한다.
			if(!msgArr[1].equals("")) {
				Iterator<WebSocketSession> sessionIds = mapList.keySet().iterator();// 기존에 저장된 접속자 명단을 가져옴
				while(sessionIds.hasNext()) {
					WebSocketSession sessionId = sessionIds.next();
					String value = mapList.get(sessionId);
					// while문을 돌면서 귓속말 대상자를 찾는다. 찾게되면 해당 사람에게 귓속말로 문자를 보내도록 한다.
					if(value.equals(msgArr[1])) {
						sessionId.sendMessage(new TextMessage(JsonWisper(userName,msgArr[0],msgArr[3])));
					}
				}
			}
			
			//6. 귓속말로 하지 않았을경우 해당 유저와 같은 방에 있는 사람에게만 메세지를 날리도록한다.
			else {
				for(WebSocketSession webSocketSession : sessionList) {
					
					//같은 방일때만 보냄
					if(msgArr[2].equals(roomList.get(webSocketSession))) {
						//만약 자신의 세션아이디와 다르다면 메세지를 아리와 같이 전달(자기자신한테는 보낼필요가 없기 때문)
						if(!session.getId().equals(webSocketSession.getId())) {
							webSocketSession.sendMessage(new TextMessage(JsonData(userName, msgArr[0], msgArr[3])));
						}
					}
				}
			}
			
			logger.info("메세지:"+message);
			
			// 현재 유저가 있는 방 정보 가져오기
			ChatMemberDto member1 = new ChatMemberDto();
			member1.setName(mem.getMemberName());
			ChatMemberDto member2 = projectChatService.getRoomMember(member1);

			if(!member2.getRoom().equals("all")) {
			
				String copyArr[] = new String[msgArr.length +1];
				
				if(msgArr[1].equals("")) {
					msgArr[1] = "emp";
				}
				
				for(int i = 0;i<copyArr.length;i++) {
					if(i==(msgArr.length)) {
						copyArr[i] = "[" + mem.getMemberName() + "] ";
						break;
					}
						
					copyArr[i] = "[" + msgArr[i] + "] ";
					
				}
				
				String mess = String.join("",copyArr); // 로그로 남길 메세지 내용
			try {
				// 해당 방 파일 경로 얻어오기 
				// 1. 유저의 현재 방 번호 얻어오기
				int roomNum = projectChatService.selectRoomNum(userName);
				// 2. 해당 방의 파일 경로 얻어오기
				String filePath = projectChatService.selcetFilePath(roomNum);
				// 현재 파일에 메세지 입력
				try {
					BufferedWriter fw = new BufferedWriter(new FileWriter(filePath, true));
					
					fw.write(mess);
					fw.write("\r\n"); 
					
					fw.flush();

					fw.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			}
			
		}
	}
	
	
	
	
	//json형태로 메세지 변환(일반 메세지 보낼 때 ) // 상대방
	public String JsonData(String name,Object msg, String sentDate) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message",
				"<div class=\"direct-chat-msg\">" + 
				"<div class=\"direct-chat-infos clearfix\">" + 
				"<span class=\"direct-chat-name float-left\">"+
				"<a href='#none' onclick=\"insertWisper('"+name+"')\">"+name+
				"</span>" + 
				"<span class=\"direct-chat-timestamp float-left\">"+ sentDate +"</span></div>" + 
				"<img class=\"direct-chat-img\" src=\"${contextPath}/resources/dist/img/user1-128x128.jpg\" alt=\"Message User Image\">"
				+"<div class=\"direct-chat-text left-txt\">" + 
				msg + "</div></div>").build();
		StringWriter write = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(write)){
    		jsonWriter.write(jsonObject);
    	};
		return write.toString();
	}
	
	
	// json형태로 메세지 변환2(접속했음을 알릴때)
	public String JsonDataOpen(String name) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", 
				"<div style='text-align:center;'>" + 
				"<span class=\"direct-chat-name\">"+
				"<a href='#none' onclick=\"insertWisper('"+name+"')\">"+name+
				"</a>님이 접속하셨습니다.</span></div>").build();
		StringWriter write = new StringWriter();
		
		try (JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		return write.toString();
	}
	
	//json 형태로 메세지 변환3(나갔음을 알릴 때)
	public String JsonDataClose(String name) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", 
				"<div style='text-align:center;'>" + 
				"<span class=\"direct-chat-name\">"+
				"<a href='#none' onclick=\"insertWisper('"+name+"')\">"+name+
				"</a>님이 퇴장하셨습니다.</span></div>").build();
		StringWriter write = new StringWriter();
		
		try (JsonWriter jsonWriter = Json.createWriter(write)){
			jsonWriter.write(jsonObject);
		};
		return write.toString();
	}
	
    //json형태로 귓속말
    public String JsonWisper(String fromName, Object msg, String sentDate) {
    	JsonObject jsonObject = Json.createObjectBuilder().add("message",
    	"<a href='#none' onclick=\"insertWisper('"+fromName+"')\">"+
    	"<i class='user icon'></i>"+
    	" <b style='color:green'>["+ // 아이디를 클릭하게되면 귓속말아이디 세팅
    	fromName+"]</b></a>님의 귓속말 : "+msg+ "&nbsp;"
        + sentDate
        + " 에 보냄 ").build();
    	StringWriter write = new StringWriter();

    	try(JsonWriter jsonWriter = Json.createWriter(write)){
    		jsonWriter.write(jsonObject);
    	};
    	return write.toString();
    }
	
	//json 형태로 유저 정보 날리기
	public String JsonUser(String id) {
    	JsonObject jsonObject = Json.createObjectBuilder().add("list", id).build();
    	StringWriter write = new StringWriter();
    	
    	try(JsonWriter jsonWriter = Json.createWriter(write)){
    		jsonWriter.write(jsonObject);
    	};
    	return write.toString();
    }
	
	//json 형태로 방 정보 날리기
	public String JsonRoom(String roomNames) {
    	JsonObject jsonObject = Json.createObjectBuilder().add("room", roomNames).build();
    	StringWriter write = new StringWriter();
    	
    	try(JsonWriter jsonWriter = Json.createWriter(write)){
    		jsonWriter.write(jsonObject);
    	};
    	
    	return write.toString();
    }
	
	//유저리스트
	private List<String> informUser(Map<WebSocketSession,String> maplist, String room) throws Exception {
    	//맵을 이용해서 세션을 통해 아이디값을 value로 가져와서 list에 담기
    	
    	//1.담을 리스트 껍데기 선언
    	List<String> list = new ArrayList<>();
    	
    	//2. 존재하는 웹소켓아이디, 로그인아이디 만큼 while문을 돌려준다.
    	Iterator<WebSocketSession> sessionIds = maplist.keySet().iterator();
		while(sessionIds.hasNext()) {
    		WebSocketSession sessionId = sessionIds.next();
    		String value = maplist.get(sessionId); //실제 아이디값
    		
    		//3. 해당 번지의 key값에 해당하는 방의 이름정보를 가져옴
    		String userRoom = roomList.get(sessionId); 
			
			//4. 지금 돌고있는 while문에서 추출한 방이름과 들어온 방의이름이 같을경우 리스트에 저장하도록한다.
			if(userRoom.equals(room)) {
				System.out.println("아이디:"+value +", 방이름:"+userRoom);
				list.add(value);
			}
    	}
    	return list;
    }
    
    //DB로부터 존재하는 방정보 String 형태로 가져오기
    public String getRoomName() throws Exception{
    	
    	List<ChatDto> roomList =  projectChatService.getRoomList();
    	
    	String room = sessionList.size()+"";
    	
    	for(int i=0; i<roomList.size(); i++) {
    		room += ",";
    		room += roomList.get(i).getName() +"/";
    		room += roomList.get(i).getRemainCount()+"/";
    		room += roomList.get(i).getTotalCount()+"/";
    		room += roomList.get(i).getContent()+"/";
    		room += roomList.get(i).getPwd();
    	}
    	
    	//room= room.substring(0, room.length()-1); //뒤의 문자열 자르기
    	
    	//logger.info(room);
    	
    	return room;
    	
    }
    
    
    public String getRoomName(String name) throws Exception{
    	
    	List<ChatDto> roomList =  projectChatService.searchRoomList(name);
    	
    	String room = sessionList.size()+"";
    	
    	//검색했는데 방이 없을 경우
    	if(roomList.size() <1) {
    		room += ",방이 존재하지 않습니다./ / / /null";
    		
    	}
    	
    	//방이 존재할경우
    	else {
    		
	    	for(int i=0; i<roomList.size(); i++) {
	    		room += ",";
	    		room += roomList.get(i).getName() +"/";
	    		room += roomList.get(i).getRemainCount()+"/";
	    		room += roomList.get(i).getTotalCount()+"/";
	    		room += roomList.get(i).getContent()+"/";
	    		room += roomList.get(i).getPwd();
    		}
    	}
    	//room= room.substring(0, room.length()-1); //뒤의 문자열 자르기
    	
    	logger.info(room);
    	
    	return room;
    }
}