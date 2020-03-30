<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<title>(주) 오정상사 인트라넷</title>
<script
	src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>

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
</style>

</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to to the body tag
to get the desired effect
|---------------------------------------------------------|
|LAYOUT OPTIONS | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../common/nav.jsp" />
		<jsp:include page="../common/sidebar.jsp" />




		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->






			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<div class="card ">
						<div class="card-header bg-navy">

							<h3 class="card-title">사원관리</h3>

							<div class="card-tools">
								<form action="list" method="GET" class="text-center"
									id="searchForm">
									<div class="input-group input-group-sm" style="width: 400px;">
										<select name="searchKey" class="form-control"
											style="width: 100px; display: inline-block;">
											<option value="memberName">성명</option>
											<option value="deptName">부서명</option>
											<option value="memberStatus">상태</option>
										</select> <input type="text" name="searchValue"
											class="form-control float-right" style="width: 100px;"
											placeholder="검색어를 입력하세요">
										<div class="input-group-prepend">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>
								<script>
            	/* 페이지 이동 후에도 검색 결과가 검색창 input 태그에 표시되도록 하는 script */
					$(function(){
						var searchKey = "${param.searchKey}";
						var searchValue = "${param.searchValue}";
						
						if(searchKey != "null" && searchValue != "null"){
							$.each($("select[name=searchKey] > option"), function(index, item){
								if($(item).val() == searchKey){
									$(item).prop("selected","true");
								} 
							});
							
							$("input[name=searchValue]").val(searchValue);
						}
							
					});
				</script>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0"
							style="width: 100%; height: 600px; overflow: scroll">

							<table class="table table-hover text-center" id="list-table">
								<thead>
									<tr>
										<th class="fixedHeader">사번</th>
										<th class="fixedHeader">성명</th>
										<th class="fixedHeader">부서명</th>
										<th class="fixedHeader">입사일자</th>
										<th class="fixedHeader">상태</th>
									</tr>
								</thead>
								<tbody class="text-center">
									<c:if test="${empty list}">
										<tr>
											<td colspan="5">존재하는 사원이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="adminMember" items="${list}" varStatus="vs">
											<tr>
												<td>${adminMember.memberNo}</td>
												<td>${adminMember.memberName}</td>
												<td>${adminMember.deptName }</td>
												<td>${adminMember.enrollDate }</td>
												<c:choose>
													<c:when test="${adminMember.memberStatus == 1}">
														<td class="badge badge-success"
															style="padding-left: 0.5cm; padding-right: 0.5cm;">재직</td>
													</c:when>
													<c:when test="${adminMember.memberStatus == 2}">
														<td class="badge badge-warning"
															style="padding-left: 0.5cm; padding-right: 0.5cm;">휴직</td>
													</c:when>
													<c:otherwise>
														<td class="badge badge-danger"
															style="padding-left: 0.5cm; padding-right: 0.5cm;">퇴사</td>
													</c:otherwise>
												</c:choose>
											</tr>

										</c:forEach>
									</c:if>
								</tbody>
							</table>

							<!-- 직원 변경 모달 시작-->
							<a id="modal-1209" href="#modal-container-1209"
								data-toggle="modal"></a>

							<div class="modal fade " id="modal-container-1209" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-xl" role="document">
									<div class="modal-content" id="modal-1209">
										<form class="form-signin card-body" method="POST"
											action="update">
											<div id="employee-management" class="card-body"></div>




											<div class="card card-primary card-outline card-outline-tabs">
												<div class="card-header p-0 border-bottom-0">
													<ul class="nav nav-tabs nav-fill"
														id="custom-content-above-tab" role="tablist">
														<li class="nav-item"><a class="nav-link active"
															id="custom-content-above-home-tab" data-toggle="pill"
															href="#custom-content-above-home" role="tab"
															aria-controls="custom-content-above-home"
															aria-selected="true">인적사항</a></li>

													</ul>
													<div class="card-body  text-center">

														<div class="tab-content "
															id="custom-content-above-tabContent">

															<div class="tab-pane fade show active"
																id="custom-content-above-home" role="tabpanel"
																aria-labelledby="custom-content-above-home-tab">
																<!-- 인적사항 탭 시작-->
																<div class="tab-pane fade show active"
																	id="custom-tabs-three-home" role="tabpanel"
																	aria-labelledby="custom-tabs-three-home-tab">

																	<div class="row">
																		<!-- 첫 째줄 -->
																		<div class="input-group mb-3 col-md-3">
																			<div class="input-group-prepend ">
																				<span class="input-group-text">사원번호</span>
																			</div>
																			<input name="memberNoAjax" type="text"
																				class="form-control" readonly>
																		</div>

																		<div class="input-group mb-3 col-md-4">
																			<div class="input-group-prepend">
																				<span class="input-group-text">직위/직급</span>
																			</div>
																			<select class="form-control input-group-append"
																				id="jobSelect" name="jobSelect">
																				<option value="J1">사원</option>
																				<option value="J2">대리</option>
																				<option value="J3">과장</option>
																				<option value="J4">차장</option>
																				<option value="J5">부장</option>
																				<option value="J6">사장</option>
																			</select>

																		</div>

																		<div class="input-group mb-3 col-md-5">
																			<div class="input-group-prepend">
																				<span class="input-group-text ">상태</span>
																			</div>
																			<div class="form-control text-center">
																				<span><input type="radio"
																					name="memberStatusAjax" value="1">재직</span>
																				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><input
																					type="radio" name="memberStatusAjax" value="2">휴직</span>
																				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><input
																					type="radio" name="memberStatusAjax" value="3">퇴사</span>
																			</div>
																		</div>
																	</div>
																	<!-- 첫 째줄 끝-->

																	<div class="row">
																		<!-- 둘 째줄 -->
																		<div class="input-group mb-3 col-md-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">성명</span>
																			</div>
																			<input type="text" name="memberNameAjax"
																				class="form-control" readonly>
																		</div>


																		<div class="input-group mb-3 col-md-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">성별</span>
																			</div>
																			<input type="text" class="form-control"
																				name="genderAjax" readonly>
																		</div>

																		<div class="input-group mb-3 col-md-6">
																			<div class="input-group-prepend">
																				<span class="input-group-text">주민등록번호</span>
																			</div>
																			<input name="memberIdNoAjax1" type="text"
																				class="form-control" readonly>

																			<div class="input-group-prepend">
																				<span class="input-group-text">-</span>
																			</div>
																			<input name="memberIdNoAjax2" type="text"
																				class="form-control" readonly>
																		</div>
																	</div>
																	<!-- 둘 째줄 -->



																	<div class="row">
																		<!-- 셋 째 줄 -->

																		<div class="input-group mb-3 col-md-5">
																			<div class="input-group-prepend">
																				<span class="input-group-text">이메일주소</span>
																			</div>
																			<input type="email" class="form-control"
																				name="memberEmailAjax" readonly>
																		</div>

																		<div class="input-group mb-3 col-md-7">
																			<div class="input-group-prepend">
																				<span class="input-group-text">핸드폰번호</span>
																			</div>
																			<input type="text" class="form-control"
																				name="memberPhoneAjax1" readonly>
																			<div class="input-group-prepend">
																				<span class="input-group-text">-</span>
																			</div>
																			<input id="" type="text" class="form-control"
																				name="memberPhoneAjax2" readonly>

																			<div class="input-group-prepend">
																				<span class="input-group-text">-</span>
																			</div>
																			<input id="" type="text" class="form-control"
																				name="memberPhoneAjax3" readonly>
																		</div>


																	</div>
																	<!-- 셋째 줄 끝-->


																	<div class="row">
																		<!-- 넷 째 줄 -->
																		<div class="input-group mb-1 pl-2">
																			<div class="input-group-prepend">
																				<span class="input-group-text">우편번호</span>
																			</div>
																			<input type="text" name="memberAddressAjax1"
																				class="form-control postcodify_address"
																				id="address1" readonly>
																		</div>
																	</div>
																	<!-- 네번째 줄 끝-->

																	<div class="row">
																		<!-- 다섯 번 째 줄 -->
																		<div class="input-group mb-1 pl-2">
																			<div class="input-group-prepend">
																				<span class="input-group-text">도로명 주소</span>
																			</div>
																			<input type="text" name="memberAddressAjax2"
																				class="form-control postcodify_address"
																				id="address1" readonly>
																		</div>
																	</div>
																	<!-- 다섯 번 째 줄 끝-->

																	<div class="row">
																		<!-- 여섯 번 째 줄-->
																		<div class="input-group mb-3 pl-2">
																			<div class="input-group-prepend">
																				<span class="input-group-text">&nbsp;&nbsp;상세
																					주소&nbsp;&nbsp;</span>
																			</div>
																			<input type="text"
																				class="form-control postcodify_details"
																				name="memberAddressAjax3" id="address2" readonly>

																		</div>
																	</div>
																	<!-- 여섯 번 째 줄 끝-->

																	<div class="row">
																		<!-- 일곱번 째 줄-->
																		<div class="input-group mb-3 col-md-6 pr-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">입사일자</span>
																			</div>
																			<input type="text" class="form-control"
																				name="enrollDateAjax" readonly>
																		</div>


																		<div class="input-group mb-3 col-md-6 pl-3">
																			<div class="input-group-prepend">
																				<span class="input-group-text">근무부서</span>
																			</div>
																			<select class="form-control input-group-prepend"
																				id="deptSelect" name="deptSelect">
																				<option value="D1">개발부서</option>
																				<option value="D2">경영지원부서</option>
																				<option value="D3">회계부서</option>
																				<option value="D4">인사부서</option>
																				<option value="D5">마케팅부서</option>
																				<option value="D6">영업부서</option>
																			</select>
																		</div>
																	</div>

																	<!--일곱 번 째 줄 끝-->

																</div>
																<!-- 인적사항 끝-->



															</div>


															<div class="modal-footer">
																<button class="btn btn-outline-primary " type="submit">변경하기</button>
																<button type="button" class="btn btn-outline-secondary"
																	data-dismiss="modal">취소</button>
															</div>
														</div>
													</div>
												</div>
												<!-- /.card -->
											</div>

										</form>
									</div>
								</div>
								<!-- /.card -->
							</div>

						</div>
						<div class="card-footer text-right">
							<!-- 직원 신규 등록 모달 시작-->
							<a id="modal-120930" href="#modal-container-120930" role="button"
								class="btn btn btn-outline-success" data-toggle="modal">신규
								등록</a>

							<div class="modal fade " id="modal-container-120930"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-xl" role="document">
									<div class="modal-content" id="modal-120930">
										<form class="form-signin card-body" method="POST"
											action="insert">
											<div id="employee-management" class="card-body"></div>
											<div class="card">
												<div class="card-header bg-navy">
													<h3 class="card-title">직원 신규 등록</h3>
												</div>
											</div>



											<div class="card card-primary card-outline card-outline-tabs">
												<div class="card-header p-0 border-bottom-0">
													<ul class="nav nav-tabs nav-fill"
														id="custom-tabs-three-tab" role="tablist">
														<li class="nav-item"><a class="nav-link active"
															id="custom-tabs-three-home-tab-1" data-toggle="pill"
															href="#custom-tabs-three-home-1" role="tab"
															aria-controls="custom-tabs-three-home-1"
															aria-selected="true">인적사항</a>
													</ul>


													<div class="card-body">
														<div class="tab-content" id="custom-tabs-three-tabContent">

															<!-- 인적사항 탭 시작-->
															<div class="tab-pane fade show active"
																id="custom-tabs-three-home-1" role="tabpanel"
																aria-labelledby="custom-tabs-three-home-tab-1">

																<div class="row">
																	<!-- 첫 째줄 -->
																	<div class="input-group mb-3 col-md-3">
																		<div class="input-group-prepend ">
																			<span class="input-group-text">사원번호</span>
																		</div>
																		<input type="text" class="form-control"
																			name="memberNoAjax" readonly>
																	</div>

																	<div class="input-group mb-3 col-md-4">
																		<div class="input-group-prepend">
																			<span class="input-group-text">직위/직급</span>
																		</div>
																		<select class="form-control input-group-append"
																			name="jobCode" id="jobCode">
																			<option value="J1" selected>사원</option>
																			<option value="J2">대리</option>
																			<option value="J3">과장</option>
																			<option value="J4">차장</option>
																			<option value="J5">부장</option>
																			<option value="J6">사장</option>
																		</select>

																	</div>

																	<div class="input-group mb-3 col-md-5">
																		<div class="input-group-prepend">
																			<span class="input-group-text">상태</span>
																		</div>
																		<div class="form-control text-center">
																			<span><input type="radio" name="memberStatus"
																				value="1" checked>재직</span>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><input
																				type="radio" name="memberStatus" value="2">퇴사</span>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><input
																				type="radio" name="memberStatus" value="3">휴직</span>
																		</div>
																	</div>
																</div>
																<!-- 첫 째줄 끝-->

																<div class="row">
																	<!-- 둘 째줄 -->
																	<div class="input-group mb-3 col-md-3">
																		<div class="input-group-prepend">
																			<span class="input-group-text">성명</span>
																		</div>
																		<input type="text" class="form-control"
																			name="memberName" id="name" required>
																	</div>


																	<div class="input-group mb-3 col-md-3">
																		<div class="input-group-prepend">
																			<span class="input-group-text">성별</span>
																		</div>
																		<div class="form-control text-center">

																			<span><input type="radio" name="gender"
																				value="1">여자</span>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span><input
																				type="radio" name="gender" value="2">남자</span>
																		</div>
																	</div>

																	<div class="input-group mb-3 col-md-6">
																		<div class="input-group-prepend">
																			<span class="input-group-text">주민등록번호</span>
																		</div>
																		<input id="idNo1" name="idNo1" type="text"
																			class="form-control" required>

																		<div class="input-group-prepend">
																			<span class="input-group-text">-</span>
																		</div>
																		<input id="idNo2" name="idNo2" type="text"
																			class="form-control" required>
																	</div>
																</div>
																<!-- 둘 째줄 -->



																<div class="row">
																	<!-- 셋 째 줄 -->

																	<div class="input-group mb-3 col-md-5">
																		<div class="input-group-prepend">
																			<span class="input-group-text">이메일주소</span>
																		</div>
																		<input type="email" class="form-control"
																			name="memberEmail" id="email" required>
																	</div>

																	<div class="input-group mb-3 col-md-7">
																		<div class="input-group-prepend">
																			<span class="input-group-text">핸드폰번호</span>
																		</div>

																		<select class="form-control input-group-append"
																			id="phone1" name="phone1" required>
																			<option>010</option>
																			<option>011</option>
																			<option>016</option>
																			<option>017</option>
																			<option>019</option>
																		</select>

																		<div class="input-group-prepend">
																			<span class="input-group-text">-</span>
																		</div>
																		<input id="phone2" type="text"
																			class="form-control phone" name="phone2"
																			maxlength="4">

																		<div class="input-group-prepend">
																			<span class="input-group-text">-</span>
																		</div>
																		<input id="phone3" type="text"
																			class="form-control phone" name="phone3"
																			maxlength="4">
																	</div>
																</div>
																<!-- 셋째 줄 끝-->

																<div class="row">
																	<!-- 넷 째 줄 -->
																	<div class="input-group mb-1 pl-2">
																		<div class="input-group-prepend">
																			<span
																				class="input-group-text postcodify_search_button">&nbsp;&nbsp;우편번호&nbsp;
																				&nbsp;</span>
																		</div>
																		<input type="text" name="post"
																			class="form-control postcodify_postcode5" readonly>
																		<!-- 추후 검색 된 우편번호 자동 기입-->
																		<div class="input-group-prepend">
																			<button type="button"
																				class="btn btn btn-outline-secondary"
																				id="postcodify_search_button">우편번호 검색</button>
																		</div>
																	</div>
																</div>
																<!-- 네번째 줄 끝-->

																<div class="row">
																	<!-- 다섯 번 째 줄 -->
																	<div class="input-group mb-1 pl-2">
																		<div class="input-group-prepend">
																			<span class="input-group-text">도로명 주소</span>
																		</div>
																		<input type="text"
																			class="form-control postcodify_address"
																			name="address1" id="address1">
																	</div>
																</div>
																<!-- 다섯 번 째 줄 끝-->

																<div class="row">
																	<!-- 여섯 번 째 줄-->
																	<div class="input-group mb-3 pl-2">
																		<div class="input-group-prepend">
																			<span class="input-group-text">&nbsp;&nbsp;상세
																				주소&nbsp;&nbsp;</span>
																		</div>
																		<input type="text"
																			class="form-control postcodify_details"
																			name="address2" id="address2">

																	</div>
																</div>
																<!-- 여섯 번 째 줄 끝-->


																<div class="row">
																	<!-- 일곱번 째 줄-->


																	<div class="input-group mb-3 pl-2">
																		<div class="input-group-prepend">
																			<span class="input-group-text">근무부서</span>
																		</div>
																		<select class="form-control input-group-prepend"
																			name="deptCode" id="deptCode">
																			<option value="D1">개발부서</option>
																			<option value="D2">경영지원부서</option>
																			<option value="D3">회계부서</option>
																			<option value="D4">인사부서</option>
																			<option value="D5">마케팅부서</option>
																			<option value="D6">영업부서</option>
																		</select>
																	</div>
																</div>

																<!--일곱 번 째 줄 끝-->

															</div>
															<!-- 인적사항 끝-->


															<div></div>
															<div class="modal-footer">
																<button class="btn btn-outline-primary " type="submit"
																	onclick="return validate();">등록하기</button>
																<button type="button" class="btn btn-outline-secondary"
																	data-dismiss="modal">취소</button>
															</div>
														</div>
													</div>

													<!-- /.card -->
												</div>
											</div>
										</form>
									</div>
								</div>
								<!-- 직원 신규 등록 모달 끝-->



							</div>
						</div>
					</div>
					<!-- /.row-->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
		</div>
		<jsp:include page="../common/footer.jsp" />
		<!-- /.content-wrapper -->
	</div>

	<!-- ./wrapper -->

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->






	<!-- REQUIRED SCRIPTS -->
	<!-- jQuery -->
	<%--  <script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script> --%>

	<script
		src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js">
  
  </script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="<%=request.getContextPath() %>/resources/dist/js/adminlte.js"></script>

	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
  // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
  $(function(){
  $("#postcodify_search_button").postcodifyPopUp();
  
  });
  </script>
	<script>
        // 각 유효성 검사 결과를 저장할 객체
        var signUpCheck = { 
        		"email":false,
        		"emailDup":false,
				"name":false,
				"phone":false,
				"idNo1":false,
				"idNo2":false
				};
        
   	 	// 실시간 입력 형식 검사
		// 정규표현식
		$(document).ready(function(){
			
			// jQuery 변수 : 변수에 직접적으로 jQuery메소드를 사용할 수 있음.
			var $name = $("#name");
			var $phone2 = $("#phone2");
			var $phone3 = $("#phone3");
			var $email = $("#email");
			var $idNo1 = $("#idNo1");
			var $idNo2 = $("#idNo2");
			
			$email.on("input", function(){
				// 첫글자는 영어 소문자, 나머지 글자는 영어 대,소문자 + 숫자, 총 6~12글자
				var regExp =  /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/; // 한글 두 글자 이상
				if(!regExp.test($email.val())){
                	signUpCheck.email = false;
                	console.log("f");
                }else{
                	signUpCheck.email = true;
                	console.log("t");
                	$.ajax({
                		url : "emailDupCheck",
                		data : {memberEmail: $email.val() },
                		type : "post",
                		success : function(result){
                			console.log("통신성공" + result);
                			if(result == "true"){
                				signUpCheck.emailDup = true;
                			}else{
                				signUpCheck.emailDup = false;
                			}
                		},
                		
                		error : function(e){
                			console.log("ajax 통신 실패");
                			console.log(e);
                		}
                	});
                	
                }
			});

		
			
			// 이름 유효성 검사
			$name.on("input", function(){
				var regExp =  /^[가-힣]{2,}$/; // 한글 두 글자 이상
				
				if(!regExp.test($(this).val())){ // 이름이 정규식을 만족하지 않을경우
					signUpCheck.name = false;
				}else{
					signUpCheck.name = true;
				}
			});
			
			
			// 전화번호 관련
		 	$(".phone").on("input",function(){
		 		
				// 전화번호 input 태그에 4글자 이상 입력하지 못하게 하는 이벤트
                if ($(this).val().length > $(this).prop("maxLength")){
                    $(this).val($(this).val().slice(0, $(this).prop("maxLength")));
                }
                
				// 전화번호 유효성 검사
                var regExp1 =  /^\d{3,4}$/; // 숫자 3~4 글자
                var regExp2 =  /^\d{4,4}$/; // 숫자 4 글자
                
                if(!regExp1.test($phone2.val()) || !regExp2.test($phone3.val())){
					signUpCheck.phone = false;
                }else{
					signUpCheck.phone = true;
				}
				
				
            });
			
			$idNo1.on("input",function(){
				var regExp = /^[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|[3][01])$/;
				if(!regExp.test($idNo1.val())) {
					signUpCheck.idNo1 = false;
				}else{
					signUpCheck.idNo1 = true;
				}
				
				
			});
			
			$idNo2.on("input",function(){
				var regExp = /^[1-4][0-9]{6}$/;
				if(!regExp.test($idNo2.val())) {
					signUpCheck.idNo2 = false;
				}else{
					signUpCheck.idNo2 = true;
				}
				
				
			});
			
		});
        
		// submit 동작
		function validate(){
			
			// 아이디 중복 검사 결과
			//if( $("#idDup").val() == "true")	signUpCheck.idDup = true;
			//else				  				signUpCheck.idDup = false;
			
			for(var key in signUpCheck){
				if(!signUpCheck[key]){
					alert("일부 입력값이 잘못되었습니다.");
					var id = "#"+key;
					console.log(id);
					
					$(id).focus();
					return false;
				}
			}
		}
		
		
		
        </script>

	<script>
		// 공지사항 상세보기 기능 (jquery를 통해 작업)
		$(function(){
			$("#list-table td").click(function(){
				var adminMemberNo = $(this).parent().children().eq(0).text();
				// 쿼리스트링을 이용하여 get 방식으로 글 번호를 server로 전달
				
				/* <c:url var="detailUrl" value="detail">
		        	
               	</c:url>
				
				location.href="${detailUrl}&no="+adminMemberNo; */
				$.ajax({
            		url : "detail?no="+adminMemberNo,
            		/* data : adminMemberNo, */
            		type : "get",
            		success : function(result){
            			
            				console.log(result);
            				
            				for(var i in result){
            					console.log(result[i]);
            				}
            				
            				$('input[name=memberNameAjax]').val(result.memberName);
            				$('input[name=memberNoAjax]').val(result.memberNo);
            				$('input[name=memberEmailAjax]').val(result.memberEmail);
            				$('input[name=enrollDateAjax]').val(result.enrollDate);
            				
            				/* 주민등록번호 */
            				 var jbString = result.memberIdNo;
            			     var jbSplit = jbString.split('-');
            			        $('input[name=memberIdNoAjax1]').val(jbSplit[0]);
                				$('input[name=memberIdNoAjax2]').val(jbSplit[1]);
                				
                			/* 주소 */
                			var jbString2 = result.memberAddress;
               			     var jbSplit2 = jbString2.split(',');
               			        $('input[name=memberAddressAjax1]').val(jbSplit2[0]);
                   				$('input[name=memberAddressAjax2]').val(jbSplit2[1]);
                   				$('input[name=memberAddressAjax3]').val(jbSplit2[2]);
                   				
                   			/* 핸드폰 번호 */
                   			var jbString3 = result.memberPhone;
                  			var jbSplit3 = jbString3.split('-');
                  			    $('input[name=memberPhoneAjax1]').val(jbSplit3[0]);
                      			$('input[name=memberPhoneAjax2]').val(jbSplit3[1]);
                      			$('input[name=memberPhoneAjax3]').val(jbSplit3[2]);
            				
                      		/* 성별 */
                      		if(result.gender == 1) $('input[name=genderAjax]').val('여자');
                      		else $('input[name=genderAjax]').val('남자');
            				
                      		
                      		
                      		/* memberStatus(재직, 휴직, 퇴사) */
                            var memberStatus = document.getElementsByName("memberStatusAjax"); 
                      
                      		
                             if(result.memberStatus == 1){
                            	memberStatus[0].checked = true;
                            	
                            }else if(result.memberStatus == 2){
                            	memberStatus[1].checked = true;
                            	
                            }else{
                            	memberStatus[2].checked = true;
                            } 
                            
                             
                            /* 부서  */	
							$("#deptSelect").val(result.deptCode).prop("selected",true);

                            /* 직급 */
                            $("#jobSelect").val(result.jobCode).prop("selected",true);

            		
            			console.log("ajax 통신 성공");
            		},
            		error : function(e){
            			console.log("ajax 통신 실패");
            			console.log(e);
            		}
            	});
				
				$("#modal-container-1209").modal('show');
			
			}).mouseenter(function(){
				$(this).parent().css("cursor", "pointer");
			
			});
			
		});
	
		var checkNum;
		function check(num){
			var obj = $('input[name=radi]');
			if(checkNum==num){
				obj.eq(num).prop('checked',false);
				checkNum=null;
			}else{
				checkNum=num;
			}
		}
	</script>


</body>

</html>