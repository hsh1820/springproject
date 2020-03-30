package com.kh.ojungFinal.member.model.vo;

public class SignImage {
	
	private int signNo;
    private String signOriginName;
    private String signChangeName;
    private String signPath;
    private String signStatus;
    private int memberNo;
    
    public SignImage() {
		// TODO Auto-generated constructor stub
	}
    
    

	public SignImage(int signNo, String signOriginName, String signChangeName) {
		super();
		this.signNo = signNo;
		this.signOriginName = signOriginName;
		this.signChangeName = signChangeName;
	}



	public SignImage(String signOriginName, String signChangeName, String signPath, int memberNo) {
		super();
		this.signOriginName = signOriginName;
		this.signChangeName = signChangeName;
		this.signPath = signPath;
		this.memberNo = memberNo;
	}



	public SignImage(int signNo, String signOriginName, String signChangeName, String signPath, String signStatus,
			int memberNo) {
		super();
		this.signNo = signNo;
		this.signOriginName = signOriginName;
		this.signChangeName = signChangeName;
		this.signPath = signPath;
		this.signStatus = signStatus;
		this.memberNo = memberNo;
	}


	public int getSignNo() {
		return signNo;
	}

	public void setSignNo(int signNo) {
		this.signNo = signNo;
	}

	public String getSignOriginName() {
		return signOriginName;
	}

	public void setSignOriginName(String signOriginName) {
		this.signOriginName = signOriginName;
	}

	public String getSignChangeName() {
		return signChangeName;
	}

	public void setSignChangeName(String signChangeName) {
		this.signChangeName = signChangeName;
	}

	public String getSignPath() {
		return signPath;
	}

	public void setSignPath(String signPath) {
		this.signPath = signPath;
	}

	public String getSignStatus() {
		return signStatus;
	}

	public void setSignStatus(String signStatus) {
		this.signStatus = signStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "SignImage [signNo=" + signNo + ", signOriginName=" + signOriginName + ", signChangeName="
				+ signChangeName + ", signPath=" + signPath + ", signStatus=" + signStatus + ", memberNo=" + memberNo
				+ "]";
	}
    
    

}
