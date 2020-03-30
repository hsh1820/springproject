package com.kh.ojungFinal.mail.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.lookup.ReductionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.ojungFinal.admin.model.vo.Member;
import com.kh.ojungFinal.collaboBoard.model.service.CollaboBoardService;
import com.kh.ojungFinal.common.Pagination;
import com.kh.ojungFinal.common.vo.PageInfo;
import com.kh.ojungFinal.mail.model.service.MailService;
import com.kh.ojungFinal.mail.model.vo.Mail;
import com.sun.mail.util.MimeUtil;

@Controller
@RequestMapping("/mail/*")
@SessionAttributes({"loginMember","msg","detailUrl"})
public class MailController {
	
	@Autowired
	MailService mailSerivce;
	
	@ResponseBody
	@RequestMapping(value="insertMailList",produces="application/json; charset=utf-8" )
	public String insertMailList(HttpServletRequest request) throws Exception{
		List<Mail> inMail = new ArrayList<Mail>();
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh:mm:ss").create();
		int result = 0;
		
		try {

		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		String userName = loginMember.getMemberEmail();
		String password = loginMember.getMemberPwd(); // 암호화 적용후 확인해봐야함..
		
		userName = userName.substring(0,userName.indexOf("@"));
		
		Properties props = System.getProperties();
		//개별설정
		
		//공통부분
		props.put("mail.imap.host","ojung.iptime.org"); // 메일 호스팅중인 서버
		props.put("mail.imap.port","143"); // 메일 서버의 포트
		props.put("mail.pop3.socketFactory.fallback","false");
		
		Authenticator auth = new MyAuthentication();
		Session session = Session.getDefaultInstance(props,auth);
		
            // connects to the message store
			Store store = session.getStore("imap");
			
           
			store.connect(userName, password);
 
            // opens the inbox folder
            Folder folderInbox = store.getFolder("INBOX");
            folderInbox.open(Folder.READ_ONLY);
 
            // fetches new messages from server
            Message[] messages = folderInbox.getMessages();
            for (int i = 0; i < messages.length; i++) {
                Message msg = messages[i];
                Address[] fromAddress = msg.getFrom();
                String from = fromAddress[0].toString();
                String subject = msg.getSubject();
                String toList = parseAddresses(msg.getRecipients(RecipientType.TO));
                String ccList = parseAddresses(msg.getRecipients(RecipientType.CC));
                String sentDate = msg.getSentDate().toString();
 
                String contentType = msg.getContentType();
                String messageContent = "";
 
                if (contentType.contains("text/plain") || contentType.contains("text/html")) {
                    try {
                        Object content = msg.getContent();
                        if (content != null) {
                            messageContent = content.toString();
                        }
                    } catch (Exception ex) {
                        messageContent = "[Error downloading content]";
                        ex.printStackTrace();
                    }
                }
                
                Mail mail = new Mail();
                mail.setMailFrom(from);
                mail.setMailTo(toList);
                mail.setMailCc(ccList);
                mail.setMailSubject(subject);
                mail.setMailSentDate(sentDate);
                mail.setMailContent(messageContent);
                mail.setMemberNo(loginMember.getMemberNo());
                inMail.add(mail);
            }
            // disconnect
            folderInbox.close(false);
            store.close();	
            
            
        	// -1 : insert 할 것 없음 // 1 : insert 성공 // else : 조회 실패
        	result = mailSerivce.insertMailList(inMail);
        	System.out.println("조회해온 개인 메일 insert 결과 (-1이여도 실패아니고 insert할 값이 없는것임.) ::::::::::::::: "+result);
            //////////////////////// insert 끝 ////////////////////////
            
            
			} catch (NoSuchProviderException ex) {
	            System.out.println("No provider for protocol: " + "imap");
	            ex.printStackTrace();
	        } catch (MessagingException ex) {
	            System.out.println("Could not connect to the message store");
	            ex.printStackTrace();
	        } catch (NullPointerException ex) {
	        	System.out.println("정상입니다.");
	        }
			return gson.toJson(result);
		}
		
	
	@RequestMapping("mailbox")
	public String mailbox( HttpServletRequest request, Model model,
			@RequestParam(value="searchValue", required=false)String searchValue,
			@RequestParam(value="currentPage",required=false)Integer currentPage) {
			
            Member loginMember = (Member)request.getSession().getAttribute("loginMember");
            List<Mail> mailList = new ArrayList<Mail>();
            
            try {
	    		mailList = mailSerivce.selectList(loginMember.getMemberNo());
	    		if(mailList != null) {
	    			System.out.println(mailList.size() +"<< 갯수 ");
	    			model.addAttribute("mList",mailList);
	    		}
	    		
            }catch (NullPointerException e) {
				System.out.println("정상 접속 입니다.");
			}
            catch (Exception e) {
            	e.printStackTrace();
			}
		
		return "mail/mailbox";
		
	}
	
	@RequestMapping("mailWrite")
	public String mailWrite(Model model,
			 HttpServletRequest request) {
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		return "mail/mailWrite";
		
	}
	
	@RequestMapping(value="sending", method=RequestMethod.POST)
	public String sending(Mail mail, Model model,HttpServletRequest request,
			HttpServletRequest rdAttr) {
		Member loginMember = (Member)request.getSession().getAttribute("loginMember");
		mail.setMailFrom(loginMember.getMemberEmail());
		
		Properties props = System.getProperties();
		//개별설정
		props.put("mail.smtp.user",mail.getMailFrom()
				.substring(0,mail.getMailFrom().indexOf("@"))); 
		
		//공통부분
		props.put("mail.smtp.host","ojung.iptime.org"); // 메일 호스팅중인 서버
		props.put("mail.smtp.port","25"); // 메일 서버의 포트
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.auth","false"); // iptime에서 받은 무료 도메인이라 ssl 설정이 안돼서 인증설정은 false
		props.put("mail.smtp.socketFactory.port","25"); // 웹메일 소켓포트 : 25
		props.put("mail.smtp.socketFactory.fallback","false"); 
		
		Authenticator auth = new MyAuthentication();
		Session session = Session.getDefaultInstance(props,auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			// 메일상에서의 from
			InternetAddress from = new InternetAddress(mail.getMailFrom()); 
			msg.setFrom(from);
			
			
			String email = mail.getMailTo(); //jsp에서 입력받은 받는이 이메일주소
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(mail.getMailSubject(),"UTF-8");
			msg.setSubject(MimeUtility.encodeText(mail.getMailSubject(),"UTF-8","B"));
			msg.setText(mail.getMailContent(),"UTF-8");
			msg.setHeader("content-Type", mail.getContentType());
			
			javax.mail.Transport.send(msg);
			System.out.println("보냈어욜~");
			rdAttr.setAttribute("msg", "메일을 성공적으로 보냈습니다.");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mail/mailbox";
	}
	
	/** 메일 상세 조회 ajax
	 * @param no
	 * @return mailBoard
	 */
	@ResponseBody
	@RequestMapping(value="detail", produces="application/json; charset=utf-8")
	public String detailMailList(int no)throws Exception {
		System.out.println("ajax 실행 확인");
		Mail detail = mailSerivce.selectMailBoard(no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd hh:mm:ss").create();
		
		return gson.toJson(detail);
	}
	
	/** 안읽은 메일 읽음 처리ajax
	 * @param no
	 * @return result
	 */
	@ResponseBody
	@RequestMapping(value="updateMailBoard", produces="application/json; charset=utf-8")
	public String updateMailBoard(int no ) throws Exception{
		int result = mailSerivce.updateMailBoard(no);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd hh:mm:ss").create();
		
		return gson.toJson(result);
				
	}
	
	/**
     * Returns a list of addresses in String format separated by comma
     *
     * @param address an array of Address objects
     * @return a string represents a list of addresses
     */
    private String parseAddresses(Address[] address) {
        String listAddress = "";
 
        if (address != null) {
            for (int i = 0; i < address.length; i++) {
                listAddress += address[i].toString() + ", ";
            }
        }
        if (listAddress.length() > 1) {
            listAddress = listAddress.substring(0, listAddress.length() - 2);
        }
 
        return listAddress;
    }
    
    @ResponseBody
	@RequestMapping(value="deleteThisMail", produces="application/json; charset=utf-8")
	public String deleteThisMail(int no) throws Exception {
    	Gson gson = new GsonBuilder().create();
    	int result = mailSerivce.deleteThisMail(no);
    	
    	return gson.toJson(result);
    }
}
