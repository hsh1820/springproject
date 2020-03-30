package com.kh.ojungFinal.chatting.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.ojungFinal.chatting.controller.ProjectChatController;
import com.kh.ojungFinal.chatting.model.ChatDto;
import com.kh.ojungFinal.chatting.model.ChatMemberDto;
import com.kh.ojungFinal.chatting.service.ProjectChatService;
import com.kh.ojungFinal.common.FileRename;
import com.kh.ojungFinal.admin.model.vo.Member;


@Controller
public class ProjectChatController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectChatController.class);
	
	@Autowired
	ProjectChatService projectChatService;

	
	// 전체 채팅룸으로 이동
	@RequestMapping(value="chat.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String chat(Model model, HttpServletRequest req) throws Exception{
		logger.info("chat.do Run! / Run time : "+new Date());
		
		Member login = (Member)req.getSession().getAttribute("loginMember");
		
		if(login == null) {
			System.out.println("세션 겟 실패 ");
			return "redirect:/main";
		}
		
		// DB에 현재 아이디로 어떤 방에 들어가있는지 조사 후, 세팅하기
		ChatMemberDto chatM = projectChatService.getRoomMember(new ChatMemberDto(0,login.getMemberName(),"",""));
		
		// 만약 채팅방을 처음 입장하는 것이라면 방에대한 아이디정보를 생성
		if(chatM ==null) {
			projectChatService.addRoomMember(new ChatMemberDto(0,login.getMemberName(),"all", "all"));
			
			// 추가를 한다음 chatM을 다시 받아오도록 한다.
			chatM = projectChatService.getRoomMember(new ChatMemberDto(0, login.getMemberName(), "", ""));
			logger.info("이름 정보 추가 성공!"+ new Date());
		}
		// 존재한다면 방정보를 all로 변경
		else {
			
			projectChatService.updateRoomMember(new ChatMemberDto(0, login.getMemberName(),"all", "")); // room변경
			
		}
		
		// 현재 방이름 넣기(전체 채팅방이니 "all")
		model.addAttribute("room","all");
		
		return "chatting/chat";//채팅방 접속화면으로
	}
	
	//방만들기
	@RequestMapping(value="createChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String createChatRoom (Model model, HttpServletRequest request, ChatDto chat) throws Exception{
		
		logger.info("createChatRoom.do RUN! / Run Time: " + new Date());
		
		Member login = (Member)request.getSession().getAttribute("loginMember");
		
		if(login==null) {
			return "redirect:/main";
		}
		
		logger.info(chat.toString());
		
		// 1. 채팅 폴더 생성				
		String root = request.getSession().getServletContext().getRealPath("/resources");
		String filePath = root + "/chatlogs";
		
		File folder = new File(filePath);
		
		if(!folder.exists()) folder.mkdir();
		
		try {
			// 채팅.log 파일 생성
			String chatLotName = FileRename.rename("chat.log");
			String logFullPath = filePath + "/" + chatLotName;
			File chatLogFile = new File(logFullPath);
			
			chatLogFile.createNewFile();

			chat.setFilePath(logFullPath);
			
			System.out.println( chatLogFile.getName() + " >>> [ 채팅 파일 생성 성공 ]ㅎ");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		// 2. 생성된 파일 경로 디비에 저장
		
		//해당 정보로 방을 DB에 생성( 이미 방이 존재한다면 생성하지 않는다 )
		//ChatDto dto = projectChatService.checkRoom(chat.getName());
		//if(dto ==null) {
			int result = projectChatService.createChatRoom(chat);
		//}
			System.out.println(result);
			if(result>0) {
				result = projectChatService.updateRoomMember(new ChatMemberDto(0, login.getMemberName(), chat.getName(), ""));
				
			}else {
				System.out.println("방,, 만들기,, 실패ㅠ,,,,");
			}
		
		//현재 아이디로 만든 방의 이름으로 정보를 수정한다.
		
		//이전방은 수정하지 않음
		
		//현재 방이름 넣기(전체채팅방이니 all)
		model.addAttribute("room", chat.getName());
		
		return "chatting/chat";
	}
	//중복확인
	@ResponseBody
	@RequestMapping(value="checkRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int checkRoom(Model model, String name) throws Exception{
		System.out.println("name="+name);
		
		ChatDto dto = projectChatService.checkRoom(name);
		System.out.println("방 이름 중복검사 확인용   :  "+dto);
		if(dto ==null) {
			//중복값이 없을경우
			return 1; 
		}
		else {
			return 0;
		}		
	}
	
	//방이동
	@RequestMapping(value="MoveChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String MoveChatRoom (Model model, HttpServletRequest req, String roomName) throws Exception{
		
		logger.info("MoveChatRoom.do RUN! / Run Time: " + new Date());
		
		Member login = (Member)req.getSession().getAttribute("loginMember");
		
		if(login==null) {
			return "redirect:/main";
		}
		
		logger.info("이동할 방이름 : "+roomName);
		
		//이동하게 될 방 이름으로 수정
		projectChatService.updateRoomMember(new ChatMemberDto(0, login.getMemberName(), roomName, ""));
		
		//접속 끊기 이전방은 수정하지 않음.
		
		//방이동 처리
		model.addAttribute("room", roomName);
		System.out.println("방이동 처리 됨 ====================");
		
		
		//7-1. 입장 시 해당 채팅방의 이전 내용 불러와서 뿌려준다.
				// 현재 유저가 있는 방 정보 가져오기
				ChatMemberDto member1 = new ChatMemberDto();
				member1.setName(login.getMemberName());
				ChatMemberDto member2 = projectChatService.getRoomMember(member1);

				if(!member2.getRoom().equals("all")) {
					System.out.println("=============== 방이동 성공이후 ===============");
					//1. 접속자가 현재 들어간 방의 이름을 얻어오기 
					int roomNum = projectChatService.selectRoomNum(login.getMemberName());
					// 2. 해당 방의 파일 경로 얻어오기
					String filePath = projectChatService.selcetFilePath(roomNum);
					//String filePath = "c://200328204018_558518.log";
					
					// 3. 파일 불러와서 각 라인 배열로 자르기 
					
					try {
						
					File file = new File(filePath);
					
					FileReader filereader = new FileReader(file);
					
					BufferedReader bufReader = new BufferedReader(filereader);
					
					String str = "";
					
					
					List<String[]> msgList = new ArrayList<String[]>(); 
					// 리스트로 arr 묶어서 보내기 
					
					while((str = bufReader.readLine()) != null) {
					String arr[] = new String[5];
					 
					  Pattern p = Pattern.compile("(\\[[ㄱ-힣a-zA-Z0-9_\\.-:\\s]+\\])");
					  Matcher m = p.matcher(str);
				      
				      for(int i=0; i<arr.length && m.find(); i++) {
				    	  
				    	 String word = m.group().substring((m.group().indexOf('[')+1 ),m.group().indexOf(']'));
				    	 
			        	 arr[i] = word;
			        	 
				      	}
				      
				      	msgList.add(arr);
				      }
					
						// 0:채팅내용 1:귓속말대상자 2:방이름 3:시간 4:보낸사람이름
						
						model.addAttribute("msgList",msgList);
						model.addAttribute("loginMember",login);
						
						System.out.println("크기 : " + msgList.size());
						for(String[] ar : msgList) {
							for(int i = 0;i<ar.length;i++) {
								System.out.println("arr "+i+" 번째"+ar[i]);
								
							}
						}
						
						}catch (Exception e) {
							// TODO: handle exception
						}
					}
				
				
				
		return "chatting/chat";
	}
	
	
	
	
}