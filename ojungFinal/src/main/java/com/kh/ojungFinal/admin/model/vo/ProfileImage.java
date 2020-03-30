package com.kh.ojungFinal.admin.model.vo;

import java.sql.Date;

public class ProfileImage {
	private int imageNo;
	private String imageOriginName;
	private String imageChangeName;
	private String imagePath;
	private Date imageUploadDate;
	private String imageStatus;
	private int memberNo;
	
	public ProfileImage() {
		// TODO Auto-generated constructor stub
	}

	public ProfileImage(int imageNo, String imageOriginName, String imageChangeName, String imagePath,
			Date imageUploadDate, String imageStatus, int memberNo) {
		super();
		this.imageNo = imageNo;
		this.imageOriginName = imageOriginName;
		this.imageChangeName = imageChangeName;
		this.imagePath = imagePath;
		this.imageUploadDate = imageUploadDate;
		this.imageStatus = imageStatus;
		this.memberNo = memberNo;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getImageOriginName() {
		return imageOriginName;
	}

	public void setImageOriginName(String imageOriginName) {
		this.imageOriginName = imageOriginName;
	}

	public String getImageChangeName() {
		return imageChangeName;
	}

	public void setImageChangeName(String imageChangeName) {
		this.imageChangeName = imageChangeName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Date getImageUploadDate() {
		return imageUploadDate;
	}

	public void setImageUploadDate(Date imageUploadDate) {
		this.imageUploadDate = imageUploadDate;
	}

	public String getImageStatus() {
		return imageStatus;
	}

	public void setImageStatus(String imageStatus) {
		this.imageStatus = imageStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "ProfileImage [imageNo=" + imageNo + ", imageOriginName=" + imageOriginName + ", imageChangeName="
				+ imageChangeName + ", imagePath=" + imagePath + ", imageUploadDate=" + imageUploadDate
				+ ", imageStatus=" + imageStatus + ", memberNo=" + memberNo + "]";
	}
	
	
}
