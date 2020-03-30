package com.kh.ojungFinal.mail.controller;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator{
	PasswordAuthentication pa;
	
	public MyAuthentication() {
		String id = "shhan6485";
		String pw = "dudghk12@";
		
		pa = new javax.mail.PasswordAuthentication(id, pw);
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
