<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.kh.ojungFinal.admin.model.vo.ProfileImage"%>
<%@page import="com.kh.ojungFinal.member.model.vo.SignImage"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<title>(주) 오정상사 인트라넷</title>

<!-- jQuery -->
<script
	src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
<script
	src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">



<style>
.fixedHeader {
	position: sticky;
	top: 0;
	background-color: lightsteelblue;
}

.pagination {
	justify-content: center;
}

.sign-noChange {
	-webkit-filter: blur(3px);
	-moz-filter: blur(3px);
	-o-filter: blur(3px);
	-ms-filter: blur(3px);
	filter: blur(3px);
}
</style>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../common/nav.jsp" />
		<jsp:include page="../common/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">

					<div class="card ">
						<div class="card-header bg-navy">
							<h1 class="card-title ">내 정보</h1>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3">

							<!-- Profile 영역 -->
							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">

										<c:set var="src"
											value="${contextPath}/resources/images/woman.png" />
										<c:if test="${!empty profileImg}">
											<c:set var="src"
												value="${contextPath}/resources/uploadFiles/${profileImg.imageChangeName}" />
										</c:if>
										<img class="profile-user-img img-fluid img-circle"
											src="${src}" alt="User profile picture"
											style="width: 160px; height: 160px;">
									</div>

									<!-- 로그인멤버 이름 -->
									<h3 class="profile-username text-center">${loginMember.memberName }</h3>

									<!-- 로그인멤버 소속 /  직급 -->
									<p class="text-muted text-center">${member.deptName} /
										${member.jobName}</p>

									<ul class="list-group list-group-unbordered mb-3">
										<li class="list-group-item"><b>Tel</b> <a
											class="float-right">${member.memberPhone}</a></li>


										<li class="list-group-item"><b>Email</b> <a
											class="float-right">${member.memberEmail}</a></li>

										<li class="list-group-item"><b>Address</b> <a
											class="float-right">${member.memberAddress}</a></li>

									</ul>

								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->

							<!-- About Me Box -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">개인 정보</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<strong><i class="fas fa-star mr-1"></i> 소속</strong>

									<p class="text-muted">${member.deptName}</p>

									<hr>

									<strong><i class="fas fa-user mr-1"></i> 직급</strong>

									<p class="text-muted">${member.jobName}</p>

									<hr>

									<strong><i class="fas fa-phone-alt"></i> 내선 번호</strong>

									<p class="text-muted">${member.extensionNo}</p>

									<hr>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-9">

							<div class="card">
								<div class="card-header p-2">
									<ul class="nav nav-tabs" id="custom-content-above-tab"
										role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="custom-content-above-home-tab" data-toggle="pill"
											href="#custom-content-above-home" role="tab"
											aria-controls="custom-content-above-home"
											aria-selected="true">부서정보</a></li>
										<li class="nav-item attendance"><a class="nav-link"
											id="custom-content-above-profile-tab" data-toggle="pill"
											href="#custom-content-above-profile" role="tab"
											aria-controls="custom-content-above-profile"
											aria-selected="false">내 근태현황</a></li>
										<li class="nav-item"><a class="nav-link"
											id="custom-content-above-messages-tab" data-toggle="pill"
											href="#custom-content-above-messages" role="tab"
											aria-controls="custom-content-above-messages"
											aria-selected="false">개인정보 변경</a></li>
										<li class="nav-item"><a class="nav-link"
											id="custom-content-above-messages-tab" data-toggle="pill"
											href="#custom-content-above-sign" role="tab"
											aria-controls="custom-content-above-sign"
											aria-selected="false">도장 사진 변경</a></li>
									</ul>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<div class="tab-content">
										<!-- 부서정보  -->
										<div class="tab-pane fade show active"
											id="custom-content-above-home" role="tabpanel"
											aria-labelledby="custom-content-above-home-tab">
											<!-- /.row -->
											<div class="row">
												<div class="col-12">
													<div class="card">
														<div class="card-header">
															<div class="card-tools">
																<form action="list" method="POST">
																	<div class="input-group input-group-sm"
																		style="height: 40px;">
																		<input type="text" name="table_search"
																			style="height: 40px;"
																			class="form-control float-right" placeholder="Search">

																		<div class="input-group-append">
																			<button type="submit" class="btn btn-default">
																				<i class="fas fa-search"></i>
																			</button>
																		</div>
																	</div>
																</form>
															</div>
														</div>
														<!-- /.card-header -->
														<div class="card-body table-responsive p-0"
															style="height: 550px;">
															<table class="table table-head-fixed text-nowrap">
																<thead>
																	<tr>
																		<th>사번</th>
																		<th>이름</th>
																		<th>직급</th>
																		<th>내선</th>
																		<th>이메일</th>
																		<th>출근상태</th>
																		<th style="width: 10px"><i
																			class="fas fa-sync-alt" id="showD"
																			style="float: right;"></i></th>
																	</tr>
																</thead>
																<tbody>
																	<c:if test="${empty list }">
																		<tr>
																			<td colspan="6">존재하는 부서원이 없습니다.</td>
																		</tr>
																	</c:if>
																	<c:if test="${!empty list }">
																		<c:forEach var="member" items="${list}" varStatus="vs">
																			<tr>
																				<td>${member.memberNo}</td>
																				<td>${member.memberName}</td>
																				<td>${member.jobName}</td>
																				<td>${member.extensionNo}</td>
																				<td>${member.memberEmail}</td>
																				<c:if
																					test="${empty member.outTime && member.inoutStatus == 2 || member.inoutStatus == 1}">
																					<td><span class="badge bg-warning">출근</span></td>
																				</c:if>
																				<c:if test="${!empty member.outTime}">
																					<td><span class="badge bg-danger">퇴근</span></td>
																				</c:if>
																				<td></td>
																			</tr>
																		</c:forEach>
																	</c:if>
																</tbody>
															</table>
														</div>
														<!-- /.card-body -->
													</div>
												</div>
											</div>
											<!-- /.row -->
										</div>
										<!-- 내 근태현황 -->
										<div class="tab-pane fade" id="custom-content-above-profile"
											role="tabpanel"
											aria-labelledby="custom-content-above-profile-tab">
											<div class="row">
												<div class="col-12">
													<div class="card">
														<div class="card-header" id="card-header-sh">
															<span class="info-box-icon"><i
																class="far fa-calendar-alt"></i> 남은 연차수 :
																${loginMember.holiday} </span>
														</div>

														<!-- 기간 설정 -->

														<div class="input-group input-group-sm float-left"
															id="searchForm" style="width: 300px;">
															<select name="searchKeyYear" class="form-control"
																id="searchKeyYear"
																style="width: 10px; display: inline-block;">

																<c:forEach var="i" begin="${enrollDate}" end="2020"
																	step="1">
																	<option value="${i}">${i}</option>
																</c:forEach>

															</select> <select name="searchKeyMonth" class="form-control"
																id="searchKeyMonth"
																style="width: 10px; display: inline-block;">
																<option value="01">1월</option>
																<option value="02">2월</option>
																<option value="03">3월</option>
																<option value="04">4월</option>
																<option value="05">5월</option>
																<option value="06">6월</option>
																<option value="07">7월</option>
																<option value="08">8월</option>
																<option value="09">9월</option>
																<option value="10">10월</option>
																<option value="11">11월</option>
																<option value="12">12월</option>
															</select>

															<div class="input-group-append">
																<button type="submit" class="btn btn-default"
																	id="AttendanceSearch">
																	<i class="fas fa-search"></i>
																</button>
															</div>
														</div>

														<!-- /.card-header -->
														<div class="card-body table-responsive p-0"
															style="height: 570px; , overflow: scroll;" id="forSearch">
															<table class="table table-head-fixed text-nowrap">
																<thead>
																	<tr>
																		<th>날짜</th>
																		<th>출근 시간</th>
																		<th>퇴근 시간</th>
																		<th>상태</th>
																	</tr>
																</thead>
																<tbody id="attendanceTable">
																	<tr>
																		<td class="changeDate"></td>
																		<td class="changeInTime"></td>
																		<td class="changeOutTime"></td>
																		<td class="status"><span class="badge bg-warning">정상</span></td>
																	</tr>
																</tbody>
															</table>
														</div>
														<!-- /.card-body -->
													</div>
													<!-- /.card -->
												</div>
											</div>
										</div>
										
										<!-- 개인정보 확인 / 변경 -->
										<c:if test="${!empty profileImg}">
											<div class="tab-pane fade" id="custom-content-above-messages"
												role="tabpanel"
												aria-labelledby="custom-content-above-messages-tab">
												<form action="updateMember" method="POST"
													class="form-horizontal" enctype="multipart/form-data">
													<div class="form-group row">
														<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" id="email"
																name="email" value="${member.memberEmail}"
																disabled="disabled">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">비밀번호
															변경</label>
														<div class="col-sm-10">
															<input type="password" class="form-control" id="newPwd1"
																name="newPwd1" placeholder="password">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">비밀번호 변경 재확인</label>
														<div class="col-sm-10">
															<input type="password" class="form-control" id="newPwd2"
																name="newPwd2" placeholder="password recheck">
														</div>
														<label for="inputName2" class="col-sm-2 col-form-label"></label>
														<div class="col-sm-10">
															<span id="checkPwd"> </span>
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">주소
															변경</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="address"
																name="address" value="${member.memberAddress}">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">연락처
															변경</label>
														<div class="col-sm-10">


															<input type="text" class="form-control" id="phone"
																name="phone" value="${member.memberPhone}"
																maxlength="13">
															<%-- 	
															<input type="text" class="form-control" 
															data-inputmask="'mask': ['999-9999-9999']"  
															id="phone" name="phone"
															data-mask="" im-insert="true" value="${member.memberPhone}" maxlength="13"> --%>
														</div>
													</div>



													<div class="form-group row" id="changeProfile">
														<label for="profile" class="col-sm-2 col-form-label">프로필
															사진 변경</label>
														<div class="pl-2">
															<div
																style="background: #BDBDBD; width: 130px; height: 130px; border-radius: 10%;"
																id="profileArea">
																<img id="contentImg" src="${src}"
																	style="width: 110px; height: 110px; margin: 10px;">
															</div>
														</div>
														<div class="col-sm-4">
															<input type="file" class="form-control"
																style="height: 45px;" id="profile" name="profile"
																onchange="LoadImg(this)">
														</div>
													</div>


													<div class="form-group row ">
														<div class="offset-sm-2 col-sm-10">
															<button type="submit"
																class="btn btn-primary float-right ml-2">Submit</button>
															<button type="reset" class="btn btn-danger float-right">Reset
															</button>
														</div>
													</div>
												</form>
											</div>
										</c:if>


										<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
										<c:if test="${empty profileImg}">
											<div class="tab-pane fade" id="custom-content-above-messages"
												role="tabpanel"
												aria-labelledby="custom-content-above-messages-tab">
												<form action="updateMember" method="POST"
													class="form-horizontal" enctype="multipart/form-data">
													<div class="form-group row">
														<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" id="email"
																name="email" value="${member.memberEmail}"
																disabled="disabled">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">비밀번호
															변경</label>
														<div class="col-sm-10">
															<input type="password" class="form-control" id="newPwd1"
																name="newPwd1" placeholder="password"
																disabled="disabled">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">비밀번호
															변경 재확인</label>
														<div class="col-sm-10">
															<input type="password" class="form-control" id="newPwd2"
																name="newPwd2" placeholder="password recheck"
																disabled="disabled">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">주소
															변경</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="address"
																name="address" value="${member.memberAddress}"
																disabled="disabled">
														</div>
													</div>
													<div class="form-group row">
														<label for="inputName2" class="col-sm-2 col-form-label">연락처
															변경</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="phone"
																name="phone" value="${member.memberPhone}"
																disabled="disabled">
														</div>
													</div>


													<div class="form-group row" id="changeProfile">
														<label for="profile" class="col-sm-2 col-form-label">프로필
															사진 삽입</label>
														<div class="pl-2">
															<div
																style="background: #BDBDBD; width: 130px; height: 130px; border-radius: 10%;"
																id="profileArea">
																<img id="contentImg" src="${src}"
																	style="width: 110px; height: 110px; margin: 10px;">
															</div>
														</div>
														<div class="col-sm-4">
															<input type="file" class="form-control"
																style="height: 45px; margin-bottom: 10px;" id="profile"
																name="profile" onchange="LoadImg(this)"> <span
																style="color: red;">먼저 프로필 사진을 등록해 주세요.</span>
														</div>
													</div>


													<div class="form-group row ">
														<div class="offset-sm-2 col-sm-10">
															<button type="submit"
																class="btn btn-primary float-right ml-2">Submit</button>
															<button type="reset" class="btn btn-danger float-right">Reset
															</button>
														</div>
													</div>
												</form>
											</div>
										</c:if>



										<!-- 도장 이미지 관리 -->
										<c:if test="${empty signImg}">
											<div class="tab-pane fade" id="custom-content-above-sign"
												role="tabpanel"
												aria-labelledby="custom-content-above-profile-tab">
												<form action="updateSign" method="POST"
													class="form-horizontal" enctype="multipart/form-data">
													<div class="row">
														<div class="col-12">
															<div class="card">
																<div class="form-group row" id="changeSign">
																	<label for="sign" class="col-sm-2 col-form-label">도장 사진 삽입</label>
																	<div class="pl-2">
																		<div
																			style="background: #BDBDBD; width: 130px; height: 130px; border-radius: 10%;"
																			id="signArea">
																			<c:set var="src2"
																				value="${contextPath}/resources/images/noImage.png" />
																			<img class="sign-user-img img-fluid" src="${src2}"
																				alt="User sign picture" id="contentImg2"
																				style="width: 110px; height: 110px; margin: 10px;">
																		</div>
																	</div>
																	<div class="col-sm-4">
																		<input type="file" class="form-control"
																			style="height: 45px;" id="sign" name="sign"
																			onchange="LoadImg2(this)"> 
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group row ">
														<div class="offset-sm-2 col-sm-10">
															<button type="submit"
																class="btn btn-primary float-right ml-2">Submit</button>
															<button type="reset" class="btn btn-danger float-right">Reset
															</button>
														</div>
													</div>
												</form>
												
											</div>
										</c:if>
										
										
										<c:if test="${!empty signImg}">
											<div class="tab-pane fade" id="custom-content-above-sign"
												role="tabpanel"
												aria-labelledby="custom-content-above-profile-tab">
												<form action="updateSign" method="POST"
													class="form-horizontal" enctype="multipart/form-data">
													<div class="row">
														<div class="col-12">
															<div class="card">
																<div class="form-group row" id="changeSign">
																	<label for="sign" class="col-sm-2 col-form-label">도장 사진 변경</label>
																	<div class="pl-2">
																		<div
																			style="background: #BDBDBD; width: 130px; height: 130px; border-radius: 10%;"
																			id="signArea">
																			<c:if test="${!empty profileImg}">
																			<c:set var="src2"
																				value="${contextPath}/resources/uploadFiles/${signImg.signChangeName}" />
																			<img class="sign-user-img img-fluid img-circle"
																				src="${src2}" alt="User sign picture" id="contentImg2"
																				style="width: 110px; height: 110px; margin: 10px;">
																			</c:if>
																		</div>
																	</div>
																	<div class="col-sm-4 change-sign">
																		<input type="file" class="form-control"
																			style="height: 45px;" id="sign" name="sign"
																			onchange="LoadImg2(this)"> 
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="form-group row ">
														<div class="offset-sm-2 col-sm-10">
															<button type="submit"
																class="btn btn-primary float-right ml-2">Submit</button>
															<button type="reset" class="btn btn-danger float-right">Reset
															</button>
														</div>
													</div>
												</form>
											</div>
										</c:if>
									
									</div>

								</div>
								

							</div>
							<!-- /.tab-pane -->
						</div>
						<!-- /.tab-content -->
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.nav-tabs-custom -->
			</section>
		</div>
		<!-- /.col -->
		<jsp:include page="../common/footer.jsp" />
	</div>
	<!-- /.row -->
	<!-- /.container-fluid -->

	<!-- /.content -->

	<!-- /.content-wrapper -->

	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<script>
		$("#showD").on("click", function(){
			console.log("test");
			location.href="${contextPath}/member/profileMember";
		})
	</script>

	<script>

		
		// 전화번호 관련
	 	$("#phone").on("input",function(){
	 		
			// 전화번호 input 태그에 13글자 이상 입력하지 못하게 하는 이벤트
            if ($(this).val().length > $(this).prop("maxLength")){
                $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
            }
        });
		
	</script>

	<script>
	 $(function () {
	      //$("#changeProfile").hide();

	      $("#profileArea").click(function () {
	        $("#profile").click();
	      });
	      
	      $("#signArea").click(function(){
	    	  $("#sign").click();
	      });
	 });
	 
	function LoadImg(value){
		
		if(value.files){	
			// 파일이 선택된 경우
			
			var reader = new FileReader();
			
			reader.onload = function(e){
				$("#contentImg").attr("src",e.target.result);
			}
		};
		
		reader.readAsDataURL(value.files[0]);
	}
	
	
	function LoadImg2(value){
		
		if(value.files){	
			// 파일이 선택된 경우
			
			var reader = new FileReader();
			
			reader.onload = function(e){
				$("#contentImg2").attr("src",e.target.result);
			}
		};
		
		reader.readAsDataURL(value.files[0]);
	}
	
	$(".attendance").on("click",function(){
		$.ajax({
			url : "selectAttendanceList",
			type: "POST",
			dataType : "json",
			success : function(aList){
				var $attendanceTable = $("#attendanceTable");
				console.log(aList);
				
				if(aList == ""){
					$attendanceTable.html("조회된 기록이 없습니다.");
				}else{
					$attendanceTable.html("");
					
					$.each(aList, function(i){
						console.log(aList[i]);
						var $tr = $("<tr>");
						var $changeDate = $("<td>").prop("class","changeDate").html(aList[i].changeDate);
						var $changeInTime = $("<td>").prop("class","changeInTime").html(aList[i].changeInTime);
						var $changeOutTime = $("<td>").prop("class","changeOutTime").html(aList[i].changeOutTime);
						var $lateStatus = $("<td>").prop("class","status").html("<span class='badge bg-danger'>지각</span>");
						var $onTimeStatus = $("<td>").prop("class","status").html("<span class='badge bg-warning'>정상</span>");
						
						if(aList[i].inoutStatus == 1){
							$tr.append($changeDate).append($changeInTime).append($changeOutTime).append($onTimeStatus);
							$attendanceTable.append($tr);
						}else{
							$tr.append($changeDate).append($changeInTime).append($changeOutTime).append($lateStatus);
							$attendanceTable.append($tr);
						}
						
					});
					
				}
			},
			error : function(){
				consol.log("ajax 통신 실패");
			}
		});
	});
	
	$("#AttendanceSearch").on("click",function(){
		
		var searchKeyYear = $("#searchKeyYear").val();
		var searchKeyMonth = $("#searchKeyMonth").val();
		
		console.log(searchKeyYear);
		console.log(searchKeyMonth)
		 
		$.ajax({
			url : "AttendanceSearch",
			type : "GET",
			data : {"searchKeyYear" : searchKeyYear, "searchKeyMonth" : searchKeyMonth},
			dataType : "json",
			success : function(aList){
				
				var $attendanceTable = $("#attendanceTable");
				
				
				console.log(aList);
				
				if(aList == ""){
					$attendanceTable.html("<tr style='text-align: center;'><td colspan='4'>조회된 기록이 없습니다.</tr>");
				}else{
					$attendanceTable.html("");
					
					$.each(aList, function(i){
						console.log(aList[i]);
						var $tr = $("<tr>");
						var $changeDate = $("<td>").prop("class","changeDate").html(aList[i].changeDate);
						var $changeInTime = $("<td>").prop("class","changeInTime").html(aList[i].changeInTime);
						var $changeOutTime = $("<td>").prop("class","changeOutTime").html(aList[i].changeOutTime);
						var $lateStatus = $("<td>").prop("class","status").html("<span class='badge bg-danger'>지각</span>");
						var $onTimeStatus = $("<td>").prop("class","status").html("<span class='badge bg-warning'>정상</span>");
						
						if(aList[i].inoutStatus == 1){
							$tr.append($changeDate).append($changeInTime).append($changeOutTime).append($onTimeStatus);
							$attendanceTable.append($tr);
						}else{
							$tr.append($changeDate).append($changeInTime).append($changeOutTime).append($lateStatus);
							$attendanceTable.append($tr);
						}
					});
				}	
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	
	// 비밀번호
	var signUpCheck={
			"newPwd1":false,
			"newPwd2":false
	};
	
	
	$(document).ready(function(){
		var $newPwd1 = $("#newPwd1");
		var $newPwd2 = $("#newPwd2");
	
	
	$newPwd2.on("input", function(){
		if($newPwd1.val().trim() != $newPwd2.val().trim()){
			$("#checkPwd").text("비밀번호 불일치").css("color", "red");
			signUpCheck.newPwd2 = false;
		} else{
			$("#checkPwd").text("비밀번호 일치").css("color", "green");
			signUpCheck.newPwd2 = true;
		}
	});
	
	});
	
	</script>

	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="<%=request.getContextPath() %>/resources/dist/js/adminlte.js"></script>

	<!-- OPTIONAL SCRIPTS -->
	<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>

	<!-- 전화번호 입력 -->
	<!-- 
	<script src="<%=request.getContextPath() %>/resources/plugins/moment/moment.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
	 -->

</body>
</html>