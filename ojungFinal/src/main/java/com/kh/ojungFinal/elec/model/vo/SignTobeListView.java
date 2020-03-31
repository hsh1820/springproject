package com.kh.ojungFinal.elec.model.vo;

import java.sql.Date;

public class SignTobeListView {
   
   private int docNo;
   private String docTitle;
   private int memberNo; // 기안자 번호
   private String memberName; // 기안자 이름
   private int docStep;
   private int dtNo;
   private String dTitle;
   private String deptName;
   private String docStatus; // 해당 문서의 전체적 결과
   private String ssResult; // 로그인한 해당 결재자가 결재문서에 때린 결과
   private Date insertDate;
   
   public SignTobeListView() {
      // TODO Auto-generated constructor stub
   }
   
   public SignTobeListView(int docNo, String docTitle, int memberNo, String memberName, int docStep, int dtNo,
         String dTitle, String deptName, String docStatus, String ssResult, Date insertDate) {
      super();
      this.docNo = docNo;
      this.docTitle = docTitle;
      this.memberNo = memberNo;
      this.memberName = memberName;
      this.docStep = docStep;
      this.dtNo = dtNo;
      this.dTitle = dTitle;
      this.deptName = deptName;
      this.docStatus = docStatus;
      this.ssResult = ssResult;
      this.insertDate = insertDate;
   }

   public int getDocNo() {
      return docNo;
   }

   public void setDocNo(int docNo) {
      this.docNo = docNo;
   }

   public String getDocTitle() {
      return docTitle;
   }

   public void setDocTitle(String docTitle) {
      this.docTitle = docTitle;
   }

   public int getMemberNo() {
      return memberNo;
   }

   public void setMemberNo(int memberNo) {
      this.memberNo = memberNo;
   }

   public String getMemberName() {
      return memberName;
   }

   public void setMemberName(String memberName) {
      this.memberName = memberName;
   }

   public int getDocStep() {
      return docStep;
   }

   public void setDocStep(int docStep) {
      this.docStep = docStep;
   }

   public int getDtNo() {
      return dtNo;
   }

   public void setDtNo(int dtNo) {
      this.dtNo = dtNo;
   }

   public String getdTitle() {
      return dTitle;
   }

   public void setdTitle(String dTitle) {
      this.dTitle = dTitle;
   }

   public String getDeptName() {
      return deptName;
   }

   public void setDeptName(String deptName) {
      this.deptName = deptName;
   }

   public String getDocStatus() {
      return docStatus;
   }

   public void setDocStatus(String docStatus) {
      this.docStatus = docStatus;
   }

   public String getSsResult() {
      return ssResult;
   }

   public void setSsResult(String ssResult) {
      this.ssResult = ssResult;
   }

   public Date getInsertDate() {
      return insertDate;
   }

   public void setInsertDate(Date insertDate) {
      this.insertDate = insertDate;
   }

   @Override
   public String toString() {
      return "SignTobeListView [docNo=" + docNo + ", docTitle=" + docTitle + ", memberNo=" + memberNo
            + ", memberName=" + memberName + ", docStep=" + docStep + ", dtNo=" + dtNo + ", dTitle=" + dTitle
            + ", deptName=" + deptName + ", docStatus=" + docStatus + ", ssResult=" + ssResult + ", insertDate="
            + insertDate + "]";
   }
   
}