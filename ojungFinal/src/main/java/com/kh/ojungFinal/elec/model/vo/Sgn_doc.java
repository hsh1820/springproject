package com.kh.ojungFinal.elec.model.vo;

import java.sql.Date;

public class Sgn_doc {

   private int docNo; // 결재문서 번호
   private String docTitle; // 결재문서 타이틀
   private String docContents; // 결재문서 내용
   private String deleteFlag; // 결재문서 삭제 여부
   private String docStatus; // 결재문서 - 문서 상태 (1:대기중,2:심사중,3:반려,4:결재완료)
   private int docStep; // 결재문서가 어디에 있냐.
   private Date updateDate; // 
   private Date insertDate; // 결재 상신일 
   private String deptNm; // 기안자의 부서명 
   private int dtNo; // 결제타입 번호(지출결의서인지 휴가신청인지 ...)
   private int memberNo; // 결재자 번호 
   private String docRemark; // 결재폼 부가 정보들
   private String docSignPath; // 결재라인
   /**********************docRemakr******************************/
   private String store; // 야근식대 - 거래처명
   private int price; // 야근식대 - 금액
   private int total; // 지출결의서 - 전체 합계 금액
   private String productName; // 지출결의서 - 품목
   private int pdPrice; // 지출결의서 - 금액
   private String remark; // 지출결의서 - 비고
   private String enrollDate; // 사직서 - 입사일자
   private String retireDate; // 사직서 - 퇴사일자
   private String subPhone; // 사직서 - 퇴직후 연락처
   private String subAddress; // 사직서 - 퇴직후 주소지
   private String retireReasson; // 사직서 - 퇴직 사유
   private String hospital; // 건강검진 - 진료 기관명
   private String disease; // 건강검진 - 병명
   private int healthPrice; //건강검진 - 신청금액
   private int copay;//건강검진 - 본인부담금
   private String holidayStartDt;//휴가신청서 - 휴가 시작일
   private String holidayEndDt;// 휴가신청서 - 휴가 종료일
   private String holidayType; // 휴가신청서 - 휴가 종류
   private String eventType; // 경조사 - 경조 구분
   private String eventRelation;// 경조사 - 본인과의 관계
   private String eventTarget; // 경조사 - 대상자
   private String eventDate; // 경조사 - 경조 일자
   private String eventStartDt; // 경조사 - 경조 시작일
   private String eventEndDt; //  경조사 - 경조 종료일
   private String eventBonus; // 경조사 - 지원금
   private String absentStartDt; // 결근사유서 - 시작일
   private String absentEndDt; // 결근사유서 - 종료일
   private String additional; // 품의서 - 부가사항
   private String order; // 품의서 - 지시사항
   /************************V_DOCLIST****************************/
   private String drafter; // 해당 문서의 기안자 사번
   private String drafterName; // 해당 문서의 기안자 성명
   private int ssNo; // 해당 문서의 결재번호
   private int sStep; // 해당 결재문서가 몇단계 있는지.?
   private int ssResult; // 결재 각 단계의 결재 결과
   private String ssComment; // 결재 코멘트
   private Date receiveDate; // 
   private Date signDate;// 결재자가 결재처리한 일자
   private String userPos; // 결재자의 직급
   private int payer;// 결재자의 사번
   private String payerName; // 결재자 이름 (결재선에 따라 여러명일 수 있음)
   private String dTitle; // 결재문서종류
   private String signNo; // 도장이미지 번호
   private String signOriginNm; // 도장 원본파일명
   private String signChangeNm; // 도장 이미지 변경파일명
   private String signPath; // 도장 이미지 경로
   
   public Sgn_doc() {
      // TODO Auto-generated constructor stub
   }

public Sgn_doc(int docNo, String docTitle, String docContents, String deleteFlag, String docStatus, int docStep,
		Date updateDate, Date insertDate, String deptNm, int dtNo, int memberNo, String docRemark, String docSignPath,
		String store, int price, int total, String productName, int pdPrice, String remark, String enrollDate,
		String retireDate, String subPhone, String subAddress, String retireReasson, String hospital, String disease,
		int healthPrice, int copay, String holidayStartDt, String holidayEndDt, String holidayType, String eventType,
		String eventRelation, String eventTarget, String eventDate, String eventStartDt, String eventEndDt,
		String eventBonus, String absentStartDt, String absentEndDt, String additional, String order, String drafter,
		String drafterName, int ssNo, int sStep, int ssResult, String ssComment, Date receiveDate, Date signDate,
		String userPos, int payer, String payerName, String dTitle, String signNo, String signOriginNm,
		String signChangeNm, String signPath) {
	super();
	this.docNo = docNo;
	this.docTitle = docTitle;
	this.docContents = docContents;
	this.deleteFlag = deleteFlag;
	this.docStatus = docStatus;
	this.docStep = docStep;
	this.updateDate = updateDate;
	this.insertDate = insertDate;
	this.deptNm = deptNm;
	this.dtNo = dtNo;
	this.memberNo = memberNo;
	this.docRemark = docRemark;
	this.docSignPath = docSignPath;
	this.store = store;
	this.price = price;
	this.total = total;
	this.productName = productName;
	this.pdPrice = pdPrice;
	this.remark = remark;
	this.enrollDate = enrollDate;
	this.retireDate = retireDate;
	this.subPhone = subPhone;
	this.subAddress = subAddress;
	this.retireReasson = retireReasson;
	this.hospital = hospital;
	this.disease = disease;
	this.healthPrice = healthPrice;
	this.copay = copay;
	this.holidayStartDt = holidayStartDt;
	this.holidayEndDt = holidayEndDt;
	this.holidayType = holidayType;
	this.eventType = eventType;
	this.eventRelation = eventRelation;
	this.eventTarget = eventTarget;
	this.eventDate = eventDate;
	this.eventStartDt = eventStartDt;
	this.eventEndDt = eventEndDt;
	this.eventBonus = eventBonus;
	this.absentStartDt = absentStartDt;
	this.absentEndDt = absentEndDt;
	this.additional = additional;
	this.order = order;
	this.drafter = drafter;
	this.drafterName = drafterName;
	this.ssNo = ssNo;
	this.sStep = sStep;
	this.ssResult = ssResult;
	this.ssComment = ssComment;
	this.receiveDate = receiveDate;
	this.signDate = signDate;
	this.userPos = userPos;
	this.payer = payer;
	this.payerName = payerName;
	this.dTitle = dTitle;
	this.signNo = signNo;
	this.signOriginNm = signOriginNm;
	this.signChangeNm = signChangeNm;
	this.signPath = signPath;
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

public String getDocContents() {
	return docContents;
}

public void setDocContents(String docContents) {
	this.docContents = docContents;
}

public String getDeleteFlag() {
	return deleteFlag;
}

public void setDeleteFlag(String deleteFlag) {
	this.deleteFlag = deleteFlag;
}

public String getDocStatus() {
	return docStatus;
}

public void setDocStatus(String docStatus) {
	this.docStatus = docStatus;
}

public int getDocStep() {
	return docStep;
}

public void setDocStep(int docStep) {
	this.docStep = docStep;
}

public Date getUpdateDate() {
	return updateDate;
}

public void setUpdateDate(Date updateDate) {
	this.updateDate = updateDate;
}

public Date getInsertDate() {
	return insertDate;
}

public void setInsertDate(Date insertDate) {
	this.insertDate = insertDate;
}

public String getDeptNm() {
	return deptNm;
}

public void setDeptNm(String deptNm) {
	this.deptNm = deptNm;
}

public int getDtNo() {
	return dtNo;
}

public void setDtNo(int dtNo) {
	this.dtNo = dtNo;
}

public int getMemberNo() {
	return memberNo;
}

public void setMemberNo(int memberNo) {
	this.memberNo = memberNo;
}

public String getDocRemark() {
	return docRemark;
}

public void setDocRemark(String docRemark) {
	this.docRemark = docRemark;
}

public String getDocSignPath() {
	return docSignPath;
}

public void setDocSignPath(String docSignPath) {
	this.docSignPath = docSignPath;
}

public String getStore() {
	return store;
}

public void setStore(String store) {
	this.store = store;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public int getTotal() {
	return total;
}

public void setTotal(int total) {
	this.total = total;
}

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}

public int getPdPrice() {
	return pdPrice;
}

public void setPdPrice(int pdPrice) {
	this.pdPrice = pdPrice;
}

public String getRemark() {
	return remark;
}

public void setRemark(String remark) {
	this.remark = remark;
}

public String getEnrollDate() {
	return enrollDate;
}

public void setEnrollDate(String enrollDate) {
	this.enrollDate = enrollDate;
}

public String getRetireDate() {
	return retireDate;
}

public void setRetireDate(String retireDate) {
	this.retireDate = retireDate;
}

public String getSubPhone() {
	return subPhone;
}

public void setSubPhone(String subPhone) {
	this.subPhone = subPhone;
}

public String getSubAddress() {
	return subAddress;
}

public void setSubAddress(String subAddress) {
	this.subAddress = subAddress;
}

public String getRetireReasson() {
	return retireReasson;
}

public void setRetireReasson(String retireReasson) {
	this.retireReasson = retireReasson;
}

public String getHospital() {
	return hospital;
}

public void setHospital(String hospital) {
	this.hospital = hospital;
}

public String getDisease() {
	return disease;
}

public void setDisease(String disease) {
	this.disease = disease;
}

public int getHealthPrice() {
	return healthPrice;
}

public void setHealthPrice(int healthPrice) {
	this.healthPrice = healthPrice;
}

public int getCopay() {
	return copay;
}

public void setCopay(int copay) {
	this.copay = copay;
}

public String getHolidayStartDt() {
	return holidayStartDt;
}

public void setHolidayStartDt(String holidayStartDt) {
	this.holidayStartDt = holidayStartDt;
}

public String getHolidayEndDt() {
	return holidayEndDt;
}

public void setHolidayEndDt(String holidayEndDt) {
	this.holidayEndDt = holidayEndDt;
}

public String getHolidayType() {
	return holidayType;
}

public void setHolidayType(String holidayType) {
	this.holidayType = holidayType;
}

public String getEventType() {
	return eventType;
}

public void setEventType(String eventType) {
	this.eventType = eventType;
}

public String getEventRelation() {
	return eventRelation;
}

public void setEventRelation(String eventRelation) {
	this.eventRelation = eventRelation;
}

public String getEventTarget() {
	return eventTarget;
}

public void setEventTarget(String eventTarget) {
	this.eventTarget = eventTarget;
}

public String getEventDate() {
	return eventDate;
}

public void setEventDate(String eventDate) {
	this.eventDate = eventDate;
}

public String getEventStartDt() {
	return eventStartDt;
}

public void setEventStartDt(String eventStartDt) {
	this.eventStartDt = eventStartDt;
}

public String getEventEndDt() {
	return eventEndDt;
}

public void setEventEndDt(String eventEndDt) {
	this.eventEndDt = eventEndDt;
}

public String getEventBonus() {
	return eventBonus;
}

public void setEventBonus(String eventBonus) {
	this.eventBonus = eventBonus;
}

public String getAbsentStartDt() {
	return absentStartDt;
}

public void setAbsentStartDt(String absentStartDt) {
	this.absentStartDt = absentStartDt;
}

public String getAbsentEndDt() {
	return absentEndDt;
}

public void setAbsentEndDt(String absentEndDt) {
	this.absentEndDt = absentEndDt;
}

public String getAdditional() {
	return additional;
}

public void setAdditional(String additional) {
	this.additional = additional;
}

public String getOrder() {
	return order;
}

public void setOrder(String order) {
	this.order = order;
}

public String getDrafter() {
	return drafter;
}

public void setDrafter(String drafter) {
	this.drafter = drafter;
}

public String getDrafterName() {
	return drafterName;
}

public void setDrafterName(String drafterName) {
	this.drafterName = drafterName;
}

public int getSsNo() {
	return ssNo;
}

public void setSsNo(int ssNo) {
	this.ssNo = ssNo;
}

public int getsStep() {
	return sStep;
}

public void setsStep(int sStep) {
	this.sStep = sStep;
}

public int getSsResult() {
	return ssResult;
}

public void setSsResult(int ssResult) {
	this.ssResult = ssResult;
}

public String getSsComment() {
	return ssComment;
}

public void setSsComment(String ssComment) {
	this.ssComment = ssComment;
}

public Date getReceiveDate() {
	return receiveDate;
}

public void setReceiveDate(Date receiveDate) {
	this.receiveDate = receiveDate;
}

public Date getSignDate() {
	return signDate;
}

public void setSignDate(Date signDate) {
	this.signDate = signDate;
}

public String getUserPos() {
	return userPos;
}

public void setUserPos(String userPos) {
	this.userPos = userPos;
}

public int getPayer() {
	return payer;
}

public void setPayer(int payer) {
	this.payer = payer;
}

public String getPayerName() {
	return payerName;
}

public void setPayerName(String payerName) {
	this.payerName = payerName;
}

public String getdTitle() {
	return dTitle;
}

public void setdTitle(String dTitle) {
	this.dTitle = dTitle;
}

public String getSignNo() {
	return signNo;
}

public void setSignNo(String signNo) {
	this.signNo = signNo;
}

public String getSignOriginNm() {
	return signOriginNm;
}

public void setSignOriginNm(String signOriginNm) {
	this.signOriginNm = signOriginNm;
}

public String getSignChangeNm() {
	return signChangeNm;
}

public void setSignChangeNm(String signChangeNm) {
	this.signChangeNm = signChangeNm;
}

public String getSignPath() {
	return signPath;
}

public void setSignPath(String signPath) {
	this.signPath = signPath;
}

@Override
public String toString() {
	return "Sgn_doc [docNo=" + docNo + ", docTitle=" + docTitle + ", docContents=" + docContents + ", deleteFlag="
			+ deleteFlag + ", docStatus=" + docStatus + ", docStep=" + docStep + ", updateDate=" + updateDate
			+ ", insertDate=" + insertDate + ", deptNm=" + deptNm + ", dtNo=" + dtNo + ", memberNo=" + memberNo
			+ ", docRemark=" + docRemark + ", docSignPath=" + docSignPath + ", store=" + store + ", price=" + price
			+ ", total=" + total + ", productName=" + productName + ", pdPrice=" + pdPrice + ", remark=" + remark
			+ ", enrollDate=" + enrollDate + ", retireDate=" + retireDate + ", subPhone=" + subPhone + ", subAddress="
			+ subAddress + ", retireReasson=" + retireReasson + ", hospital=" + hospital + ", disease=" + disease
			+ ", healthPrice=" + healthPrice + ", copay=" + copay + ", holidayStartDt=" + holidayStartDt
			+ ", holidayEndDt=" + holidayEndDt + ", holidayType=" + holidayType + ", eventType=" + eventType
			+ ", eventRelation=" + eventRelation + ", eventTarget=" + eventTarget + ", eventDate=" + eventDate
			+ ", eventStartDt=" + eventStartDt + ", eventEndDt=" + eventEndDt + ", eventBonus=" + eventBonus
			+ ", absentStartDt=" + absentStartDt + ", absentEndDt=" + absentEndDt + ", additional=" + additional
			+ ", order=" + order + ", drafter=" + drafter + ", drafterName=" + drafterName + ", ssNo=" + ssNo
			+ ", sStep=" + sStep + ", ssResult=" + ssResult + ", ssComment=" + ssComment + ", receiveDate="
			+ receiveDate + ", signDate=" + signDate + ", userPos=" + userPos + ", payer=" + payer + ", payerName="
			+ payerName + ", dTitle=" + dTitle + ", signNo=" + signNo + ", signOriginNm=" + signOriginNm
			+ ", signChangeNm=" + signChangeNm + ", signPath=" + signPath + "]";
}


}