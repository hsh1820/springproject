<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재</title>
<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">

	<div class="wrapper">
		<jsp:include page="../common/nav.jsp" />
		<jsp:include page="../common/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2"></div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- Main content -->
			<form class="form-horizontal" method="POST"
				action="insertResignation" enctype="multipart/form-data" role="form">
				<section class="content">
					<div class="container-fluid">
						<div class="row">
							<!-- left column -->
							<div class="col-md-10">
								<!-- Horizontal Form -->
								<div class="card">
									<div class="card-header bg-navy">
										<h3 class="card-title">사직서 작성</h3>
									</div>
								</div>
								<div style="width: 95%;">

									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">
										<div class="form-group row">
											<label for="inputPassword3" class="col-sm-2 col-form-label"
												style="text-align: center;">제목</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="docTitle"
													id="inputPassword3" placeholder="제목을 입력해주세요.">
											</div>
										</div>
										<div class="form-group row">
											<label for="inputTitle3" class="col-sm-2  col-form-label"
												style="text-align: center;" style="margin-bottom: 0;">첨부파일</label>
											<div class="col-sm-10">
												<div class="custom-file">
													<label class="custom-file-label" for="exampleInputFile">
													</label> <input type="file" class="custom-file-input"
														multiple="multiple" id="exampleInputFile" name="docFile">
												</div>
											</div>
										</div>

										<div class="form-group row">
											<label for="inputPassword3" class="col-sm-2 col-form-label"
												style="text-align: center;">결재라인&공람자</label>
											<!-- 결재 라인 버튼 넣기 -->

											<div class="card-footer text-right">
												<!-- 결재라인 모달 시작-->
												<a id="modal-12110922" role="button"
													class="btn btn btn-outline-secondary"
													data-target="#modal-container-12110922" data-toggle="modal">결재라인</a>
												<!-- href="#modal-container-12110922" -->

												<div class="modal fade " id="modal-container-12110922">
													<!--    role="dialog" aria-labelledby="myModalLabel"
                                       aria-hidden="true" -->
													<div class="modal-dialog modal-lg"
														style="width: 1000px; margin-left: 250px; margin-top: 100px; display: table;"
														role="document">
														<div class="modal-content">
															<!--              id="modal-12110922" -->

															<div class="card">
																<div class="card-header bg-navy">
																	<h3 class="card-title">결재라인</h3>
																</div>
																<div class="card-body">
																	<div class="row">
																		<div class="col-md-3 ml-3" style="text-align: left;">
																			<table class="table" id="selectDepartment"
																				style="width: 100%; border: 1px solid rgba(176, 196, 222, 0.726)">
																				<thead
																					style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
																					<th>부서 선택</th>
																				</thead>
																				<tbody>
																					<tr>
																						<td><input type="radio" id="D1" value="D1"
																							name="group1" class="selectDepartment1">
																							<label for="D1">개발부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D2" value="D2"
																							name="group1" class="selectDepartment1">
																							<label for="D2">경영지원부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D3" value="D3"
																							name="group1" class="selectDepartment1">
																							<label for="D3">회계부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D4" value="D4"
																							name="group1" class="selectDepartment1">
																							<label for="D4">인사부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D5" value="D5"
																							name="group1" class="selectDepartment1">
																							<label for="D5">마케팅부서</label></td>
																					</tr>
																					<tr>
																						<td><input type="radio" id="D6" value="D6"
																							name="group1" class="selectDepartment1">
																							<label for="D6">영업부서</label></td>
																					</tr>
																				</tbody>
																			</table>
																		</div>

																		<div class="col-md-3" style="text-align: left;">
																			<table class="table" id="selectRecieverName"
																				style="height: 100px; overflow-x: scroll; overflow-y: hidden; border: 1px solid rgba(176, 196, 222, 0.726)">
																				<thead
																					style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
																					<th>결재자 & 결재구분 선택</th>
																				</thead>
																				<tbody id="deptListOut"
																					style="height: 100px; overflow-x: scroll; overflow-y: hidden;">

																				</tbody>
																			</table>
																		</div>

																		<div class="col-md-1">
																			<br> <br> <br> <br> <br> <br>
																			<br> <i
																				class="fas fa-angle-double-right fa-2x mr-3"></i>
																		</div>

																		<div class="col-md-4 ml-2" style="text-align: left;">
																			<table class="table" id="checkSignName"
																				style="height: 100px; overflow-x: scroll; overflow-y: hidden; border: 1px solid rgba(176, 196, 222, 0.726)">
																				<thead
																					style="font-size: large; font-weight: bold; background-color: rgba(176, 196, 222, 0.726);">
																					<th>결재목록 확인</th>
																				</thead>
																				<tbody
																					style="height: 100px; overflow-x: scroll; overflow-y: hidden;">
																					<tr>
																				</tbody>
																			</table>
																		</div>

																	</div>
																	<!-- row종료 -->
																</div>
																<!-- 모달 카드바디 종료 -->
															</div>

															<div class="modal-footer" style="padding-right: 50px;">
																<input type="button" class="btn btn-outline-primary"
																	id="selectBtn" value="선택">
																<button type="button" class="btn btn-outline-secondary"
																	data-dismiss="modal" aria-label="Close">취소</button>
																<button id="makeLine" type="button" data-dismiss="modal"
																	class="btn btn-outline-danger">결재라인 등록</button>
															</div>

														</div>
													</div>
												</div>
												<!-- 모달 끝 -->
											</div>

										</div>



										<div class="form-group row">
											<label for="inputEmail3" class="col-sm-2 col-form-label"
												style="text-align: center;">입사일자</label>
											<div class="col-sm-10">
												<input type="date" class="form-control" id="inputEmail3"
													name="docRemark">
											</div>
										</div>

										<div class="form-group row">
											<label for="inputEmail3" class="col-sm-2 col-form-label"
												style="text-align: center;">퇴사예정일</label>
											<div class="col-sm-10">
												<input type="date" class="form-control" id="inputEmail3"
													name="docRemark">
											</div>
										</div>

										<div class="form-group row">
											<label for="inputPassword3" class="col-sm-2 col-form-label"
												style="text-align: center;">퇴직 후 연락처</label>
											<div class="col-sm-4">
												<input class="mt-2 form-control" name="docRemark"
													placeholder="퇴직 후 연락받을 수 있는 번호 기재">
											</div>

											<label for="inputPassword3" class="col-sm-2 col-form-label"
												style="text-align: center;">주소</label>
											<div class="col-sm-4">
												<input class="mt-2 form-control" placeholder="주소 입력"
													name="docRemark">
											</div>
										</div>

										<div class="form-group row">
											<label for="exampleInputFile" class="col-sm-2 col-form-label"
												style="text-align: center; width: 80%;">퇴직 사유</label>
											<div class="col-sm-10">
												<textarea class="textarea " placeholder="퇴직사유는 상세하게 적어주세요."
													name="docContents"
													style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px; resize: none;"></textarea>
											</div>
										</div>
										<input type="hidden" id="docRemark">
										<script>
											// 수신인  경로;

											$('input[name=group1]')
													.click(
															function() {
																var radioValue = $(
																		this)
																		.val();

																$
																		.ajax({
																			url : "msgSelectDepartment",
																			type : "post",
																			data : {
																				radioValue : radioValue
																			},
																			dataType : "json",
																			success : function(
																					mList) {

																				$(
																						"#deptListOut")
																						.html(
																								"");

																				var td = "";
																				for ( var i in mList) {
																					td += "<tr><td>"
																							+ "&nbsp"
																							+ "<input type='radio' name='group2'  value='"+mList[i].memberNo + "'>"
																							+ "<input type='hidden' id='memberName' name='memberName' value='" + mList[i].memberName  + "'>"
																							+ "<input type='hidden' value='" + mList[i].jobName  + "'>"
																							+ "<lable for = 'selectReciever'>"
																							+ mList[i].memberName
																							+ "   /   "
																							+ mList[i].jobName
																							+ "</label>"
																							+ "&nbsp;&nbsp;"
																							+ "<select class='targetSelect'" + i + " style='width:70px;'>"
																							+ "<option value='1'>"
																							+ '합의'
																							+ "</option>"
																							+ "<option value='2'>"
																							+ '결재'
																							+ "</option>"
																							+ "</select>"
																							+ "</td></tr>";
																				}

																				$(
																						"#deptListOut")
																						.html(
																								td);
																			}
																		});
															});
										</script>

										<script>
											var printNm = 0;
											var count = 0;
											var arr = [];

											$("#selectBtn")
													.click(
															function() {

																// 결재자 회원번호
																var memberNoVal = $(
																		'input[name="group2"]:checked')
																		.val();
																console
																		.log("memberNoVal : "
																				+ memberNoVal);

																// 결재자 이름
																var nameVal = $(
																		'input[name="group2"]:checked')
																		.next()
																		.val();
																console
																		.log("nameVal : "
																				+ nameVal);

																// 결재자 직급
																var jobVal = $(
																		'input[name="group2"]:checked')
																		.next()
																		.next()
																		.val();
																console
																		.log("jobVal : "
																				+ jobVal);

																// 결재 구분  1: 합의   2:결재
																var checkSign = $(
																		'input[name="group2"]:checked')
																		.next()
																		.next()
																		.next()
																		.children()
																		.children(
																				"option:selected")
																		.val();
																console
																		.log("checkSign : "
																				+ checkSign);

																// 결재 구분 이름 (사용자 확인용)
																var checkSignName = $(
																		'input[name="group2"]:checked')
																		.next()
																		.next()
																		.next()
																		.children()
																		.children(
																				"option:selected")
																		.text();
																console
																		.log("checkSignName : "
																				+ checkSignName);
																var index = $(
																		"#checkSignName option")
																		.index(
																				$("#checkSignName option:selected"));
																console
																		.log("index : "
																				+ index);

																var td = "";

																var $tr = $("<tr>");
																//$('input[name="group2"]:checked').next().next().children().children("option:selected").val();

																$tr
																		.append("<td>"
																				+ "<span name='group2'>"
																				+ nameVal
																				+ "/"
																				+ jobVal
																				+ "["
																				+ checkSignName
																				+ "]"
																				+ "<input type='hidden' name='memberNo' value='" + memberNoVal + ">"
																				+ "<input type='hidden' name='checkSign' value='" + checkSign + "'>"
																				+ "</span>"
																				+ "<i id='test' onclick='removeLine();' class='far fa-minus-square' style='color:red; padding-left:150px;'>삭제</i>"
																				+ "</td>");
																$(
																		"#checkSignName tbody")
																		.append(
																				$tr);
																var isEmpty = function(
																		value) {
																	if (value == ""
																			|| value == null
																			|| value == undefined
																			|| (value != null
																					&& typeof value == "object" && !Object
																					.keys(value).length)) {
																		return true
																	} else {
																		return false
																	}
																};

																if (isEmpty(arr)) {
																	arr
																			.push(memberNoVal
																					+ ":"
																					+ nameVal
																					+ ":"
																					+ count
																					+ ":"
																					+ jobVal
																					+ ":"
																					+ checkSign);
																} else {
																	arr
																			.push("||"
																					+ memberNoVal
																					+ ":"
																					+ nameVal
																					+ ":"
																					+ count
																					+ ":"
																					+ jobVal
																					+ ":"
																					+ checkSign);
																}
																printNm = count;
																count += 1;

															});

											function selectNo() {
												return memberNoVal;
											};

											function removeLine() {

												console.log(printNm);
											};
											$("#makeLine")
													.on(
															"click",
															function() {
																console
																		.log(arr);
																for ( var i in arr) {

																	var afterStr = arr[i]
																			.split(":");
																	console
																			.log(afterStr[1]);
																	var $li = $(
																			"<li>")
																			.prop(
																					"class",
																					"list-group-item d-flex justify-content-between align-items-center")
																			.text(
																					afterStr[1]);
																	var $arrow = $(
																			"<i>")
																			.prop(
																					"class",
																					"fas fa-angle-down fa-2x mt-2 mb-2 ml-5");

																	$("#lines")
																			.append(
																					$arrow);
																	$("#lines")
																			.append(
																					$li);
																}
																$(
																		"#docSignPath")
																		.val(
																				arr);
															});
										</script>


										<hr class="ml-5">
										<br> <br>

										<div>
											<button type="submit" class="btn btn-primary"
												onclick="test()"
												style="float: right; margin-right: 2%; width: 100px; height: 40px;">
												<!--  onclick="location.href = 'insertNightMeal';" -->
												결재 등록
											</button>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- div style``종료 -->

							</div>
							<!-- col-md=10 종료-->

							<script>
								function test() {

									var remark = document
											.getElementsByName("docRemark");
									var remarks = new Array();
									for (var i = 0; i < remark.length; i++) {
										remarks.push(remark[i].value);
									}
									console.log(remarks);
									$("#docRemark").val(remarks);
								}
							</script>

							<div class="col-md-2 pl-3">
								<div class="card row">
									<div class="card-header bg-navy">
										<h3 class="card-title">
											<i class="fas fa fa-book-reader"></i>&nbsp; 결재선
										</h3>
									</div>
									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">
										<!--               
              					<span class="badge badge-info badge-pill">기안</span> 
                                 <span class="badge badge-warning badge-pill">열람</span> 
                                 <span class="badge badge-primary badge-pill">미열람</span>
                                 <span class="badge badge-success badge-pill">승인</span>
                                 <span class="badge badge-danger badge-pill">반려</span>
                                 -->
										<ul class="list-group" id="lines">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												${loginMember.memberName } <!--  <span class="badge badge-info badge-pill">기안</span> -->
											</li>
											<!--    <li class="list-group-item d-flex justify-content-between align-items-center">
                                       결재선 1번 
                                    </li>

                                    <i class="fas fa-angle-down fa-2x mb-2 ml-5"></i>

                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                       결재선 2번
                                       홍부장 
                                       <span class="badge badge-primary badge-pill">
                                          미열람
                                    </span>
                                    </li>

                                    <i class="fas fa-angle-down fa-2x mb-2 ml-5"></i>

                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                       결재선 3번
                                        <span class="badge badge-primary badge-pill">
                                          미열람
                                    </span>
                                    </li> -->
										</ul>
										<input type="hidden" style="display: none" name="docSignPath"
											id="docSignPath">

									</div>
									<!-- cardBody-->
								</div>
								<!--card row 종료 -->
								<!-- row 종료 -->

								<div class="card row">
									<div class="card-header bg-navy">
										<h3 class="card-title">
											<i class="fas fa fa-book-reader"></i>&nbsp; 공람자
										</h3>
									</div>

									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">

										<ul class="list-group">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												<i class="fas fa-check">&nbsp; <!-- 김대리 -->
											</i>
											</li>

											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												<i class="fas fa-check">&nbsp; <!-- 신과장 -->
											</i>
											</li>

											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												<i class="fas fa-check">&nbsp; <!-- 이사원 -->
											</i>
											</li>

											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												<i class="fas fa-check">&nbsp; <!-- 윤이사 -->
											</i>
											</li>

										</ul>

									</div>
									<!-- 첨부파일 div끝/ card-body 종료-->

								</div>
								<!-- 공람자 있는 card row 종료 -->

								<div class="card row">
									<div class="card-header bg-navy">
										<h3 class="card-title">
											<i class="fas fa fa-book-reader"></i>&nbsp; 첨부파일
										</h3>
									</div>


									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">
										<i class="far fa-file-pdf"> &nbsp; <!-- 야근식대 영수증_이대리.jpg --></i>
									</div>
								</div>
								<!-- 첨부파일 div끝-->
							</div>
							<!--결재라인 row 끝-->
							<!--col-md 2 종료 -->
						</div>
					</div>
				</section>
			</form>
		</div>
		<!-- /.container-fluid -->
		<!-- /.content -->

	</div>
	<!-- 기안서 작성 화면 끝-->


	<jsp:include page="../common/footer.jsp" />
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- bs-custom-file-input -->
	<script
		src="${contextPath }/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>


	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.js"></script>

	<!-- OPTIONAL SCRIPTS -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/chart.js/Chart.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/pages/dashboard3.js"></script>
</body>
</html>