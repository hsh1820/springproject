package com.kh.ojungFinal.mail.model.vo;


public class Mail {
		// 메일 송수신 용
	    private String mailFrom;
	    private String mailTo;
	    private String mailCc;
	    private String mailBcc;
	    private String mailSubject;
	    private String mailContent;
	    private String contentType;
	    private String mailSentDate;
	    
	    // DB 용
	    private int mailNo;
		private String mailDeleteYn;
		private int memberNo;
		private int readFlag;
		
		
	    public Mail() {
	        contentType = "text/plain; charset=UTF-8";
	    }


		

		public Mail(String mailFrom, String mailTo, String mailCc, String mailBcc, String mailSubject,
				String mailContent, String contentType, String mailSentDate, int mailNo, String mailDeleteYn,
				int memberNo, int mailCount) {
			super();
			this.mailFrom = mailFrom;
			this.mailTo = mailTo;
			this.mailCc = mailCc;
			this.mailBcc = mailBcc;
			this.mailSubject = mailSubject;
			this.mailContent = mailContent;
			this.contentType = contentType;
			this.mailSentDate = mailSentDate;
			this.mailNo = mailNo;
			this.mailDeleteYn = mailDeleteYn;
			this.memberNo = memberNo;
		}




		public String getMailFrom() {
			return mailFrom;
		}


		public void setMailFrom(String mailFrom) {
			this.mailFrom = mailFrom;
		}


		public String getMailTo() {
			return mailTo;
		}


		public void setMailTo(String mailTo) {
			this.mailTo = mailTo;
		}


		public String getMailCc() {
			return mailCc;
		}


		public void setMailCc(String mailCc) {
			this.mailCc = mailCc;
		}


		public String getMailBcc() {
			return mailBcc;
		}


		public void setMailBcc(String mailBcc) {
			this.mailBcc = mailBcc;
		}


		public String getMailSubject() {
			return mailSubject;
		}


		public void setMailSubject(String mailSubject) {
			this.mailSubject = mailSubject;
		}


		public String getMailContent() {
			return mailContent;
		}


		public void setMailContent(String mailContent) {
			this.mailContent = mailContent;
		}


		public String getContentType() {
			return contentType;
		}


		public void setContentType(String contentType) {
			this.contentType = contentType;
		}


		public String getMailSentDate() {
			return mailSentDate;
		}


		public void setMailSentDate(String mailSentDate) {
			this.mailSentDate = mailSentDate;
		}


		public int getMailNo() {
			return mailNo;
		}


		public void setMailNo(int mailNo) {
			this.mailNo = mailNo;
		}


		public String getMailDeleteYn() {
			return mailDeleteYn;
		}


		public void setMailDeleteYn(String mailDeleteYn) {
			this.mailDeleteYn = mailDeleteYn;
		}


		public int getMemberNo() {
			return memberNo;
		}


		public void setMemberNo(int memberNo) {
			this.memberNo = memberNo;
		}


		public int getReadFlag() {
			return readFlag;
		}




		public void setReadFlag(int readFlag) {
			this.readFlag = readFlag;
		}




		@Override
		public String toString() {
			return "Mail [mailFrom=" + mailFrom + ", mailTo=" + mailTo + ", mailCc=" + mailCc + ", mailBcc=" + mailBcc
					+ ", mailSubject=" + mailSubject + ", mailContent=" + mailContent + ", contentType=" + contentType
					+ ", mailSentDate=" + mailSentDate + ", mailNo=" + mailNo + ", mailDeleteYn=" + mailDeleteYn
					+ ", memberNo=" + memberNo + ", readFlag=" + readFlag + "]";
		}

	 
	}

