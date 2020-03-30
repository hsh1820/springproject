package com.kh.ojungFinal.chatting.util;

import java.util.List;

//유저 목록 String형태로 묶어서 보내기
public class ChatUtil {
	String type;
	String message;
	String list;
	
	public ChatUtil() {
		// TODO Auto-generated constructor stub
	}
	public String split(List<String> mem) {
		String list = "";
		for(int i=0;i<mem.size();i++) {
			list += "<a href='#none' style='color:#343a43;'onclick=\"insertWisper('"+mem.get(i)+"')\">";
			list += mem.get(i);
			list += "</a><br>";
		}
		return list;
	}
}
