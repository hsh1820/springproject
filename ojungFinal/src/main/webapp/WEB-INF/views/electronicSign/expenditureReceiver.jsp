<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>(주) 오정상사 그룹웨어 - 전자결재</title>
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
<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
</head>
<body>
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
			<form action="updateSign?no=${docList[0].docNo}" method="POST">
				<section class="content">
					<div class="container-fluid">
						<div class="row">
							<!-- left column -->
							<div class="col-md-10" style="float: left; width: 70%">

								<!-- Input addon -->
								<div class="card card-info">
									<div class="card-header bg-navy">
										<h3 class="card-title">결재</h3>
									</div>
									<input type="hidden" name="dtNo" value="${docList[0].dtNo}">
									<div class="card-body">

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 100px; display: table-cell">사원번호</span>
											</div>
											<input type="text" class="form-control col-sm-2"
												style="margin-right: 10px; background-color: white;"
												value="${docList[0].drafter}" readonly>

											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 100px; display: table-cell">사원 명</span>
											</div>
											<input type="text" class="form-control col-sm-2"
												style="margin-right: 10px; background-color: white;"
												value="${docList[0].drafterName}" readonly>

											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 100px; display: table-cell">문서종류</span>
											</div>
											<input type="text" class="form-control col-sm-5" value="품의서"
												style="margin-right: 10px; background-color: white;"
												readonly>
										</div>

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 110px; display: table-cell">결재 서류 명</span>
											</div>
											<input type="text" class="form-control"
												style="margin-right: 10px; background-color: white;"
												value="${docList[0].docTitle}" readonly>
										</div>

										<div class="input-group mb-3">
											<div class="input-group-append">
												<span class="input-group-text" style="width: 110px;">품
													의 내 용</span>
											</div>
											<textarea class="form-control"
												style="resize: none; height: 200px; background-color: white;"
												readonly>${docList[0].docContents}</textarea>
										</div>

										<div class="input-group mb-3" id="additional">
											<div class="input-group-append">
												<span class="input-group-text" style="width: 110px;">결
													재 자 <br>부 가 사 항
												</span>
											</div>
											<textarea class="form-control"
												style="resize: none; height: 200px;" name="additional"></textarea>
										</div>

										<div class="input-group mb-3" id="order">
											<div class="input-group-append">
												<span class="input-group-text" style="width: 110px;">지
													시 사 항</span>
											</div>
											<textarea class="form-control" name="order"
												style="resize: none; height: 200px;"></textarea>
										</div>

										<!-- /input-group -->
									</div>
									<!-- /.card-body -->
								</div>

							</div>
							<!-- /.card -->
							<div class="col-md-2 pl-3" style="float: left;">
								<div class="row" style="width: 100%">
									<div class="card row" style="width: 100%">
										<div class="card-header bg-navy" style="width: 100%">
											<h3 class="card-title">
												<i class="fas fa fa-book-reader"></i>&nbsp; 결재선
											</h3>
										</div>

										<!-- /.card-header -->
										<!-- form start -->
										<div class="card-body" style="width: 100%">


											<ul class="list-group">
												<li
													class="list-group-item d-flex justify-content-between align-items-center">
													${docList[0].drafterName} <span
													class="badge badge-info badge-pill">기안</span>
												</li>

												<c:forEach var="docList" items="${docList}">
													<i class="fas fa-angle-down fa-2x mt-2 mb-2 ml-5"></i>
													<li
														class="list-group-item d-flex justify-content-between align-items-center">
														${docList.payerName} <c:if test="${docList.ssResult == 0}">
															<span class="badge badge-primary badge-pill">대기중</span>
														</c:if> <c:if test="${docList.ssResult == 1}">
															<span class="badge badge-primary badge-pill">승인</span>
														</c:if> <c:if test="${docList.ssResult == 2}">
															<span class="badge badge-primary badge-pill">반려</span>
														</c:if>
													</li>
													<p style="color: lightslategrey; font-size: small;"></p>
												</c:forEach>
											</ul>
										</div>
										<!-- cardBody-->
									</div>
								
								
									</div>
								
									<div class="card row mr-3">
									<div class="card-header bg-navy">
										<h3 class="card-title">
											<i class="fas fa fa-book-reader"></i>&nbsp; 첨부파일
										</h3> 
									</div>


									<!-- /.card-header -->
									<!-- form start -->
									<div class="card-body">
										<c:if test="${empty files}">
                    	 			등록된 파일이 없습니다.
                    				 </c:if>
										<c:forEach var="files" items="${files}">
											<c:if
												test="${files.realName  != '' || files.realName ne null}">
												<c:set var="formatString" value="${files.realName }" />

												<a
													href="${contextPath}/resources/uploadFiles/${files.fileName}"
													class="btn-link text-secondary" download> <c:choose>
														<c:when test="${fn:contains(formatString,'png')}">
															<i class="far fa-fw fa-image " style="display: inline"></i>
														</c:when>

														<c:when test="${fn:contains(formatString,'docx')}">
															<i class="far fa-fw fa-file-word" style="display: inline"></i>
														</c:when>

														<c:when test="${fn:contains(formatString,'pdf')}">
															<i class="far fa-fw fa-file-pdf" style="display: inline"></i>
														</c:when>

														<c:when test="${fn:contains(formatString,'mln')}">
															<i class="far fa-fw fa-envelope" style="display: inline"></i>
														</c:when>

														<c:otherwise>
															<i class="far fa-fw fa-file" style="display: inline"></i>
														</c:otherwise>
													</c:choose> ${files.realName}
												</a> &nbsp;
                        				</c:if>
										</c:forEach>
									</div>
									<!-- 첨부파일 div끝-->
								
									
								</div>
								<!--  별하 승인 반려 버튼 수정 -->
							<div class="row pr-4" >
								<div class="col-md-6">
									<button class="btn btn-block btn-outline-success" style="float: right">승인</button>
								</div>
								<div class="col-md-6">
									<a id="modal-12" href="#modal-container-12"
										role="submit" class="btn btn-block btn btn-outline-danger"
										data-toggle="modal">반려</a> 
								</div> 
							</div>
						<!--  버튼 수정 끝  -->	

							</div>
							<!-- 결재라인 끝 (결재선) -->

						</div>
					</div>
				</section>
			</form>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	
	
	<!-- 반려모달 시작 -->
	<div class="modal fade " id="modal-container-12" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="modal-12">
				<form class="form-signin card-body" method="POST"
					action="rejectSign?no=${docList[0].docNo}">
					<div class="card">
						<div class="card-header bg-navy">
							<h3 class="card-title">반려</h3>
						</div>

						<div class="modal-body p-1">
							<textarea rows="6" cols="61" name="ssComment" required></textarea>
						</div>
						<div class="modal-footer">
							<button class="btn btn-outline-danger " type="submit">
								반려</button>
							<button type="button" class="btn btn-outline-secondary"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- /.card -->
	</div>
	<!-- /.modal -->
	<!-- /.content-wrapper -->

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->
	<!-- ./wrapper -->


	<!-- REQUIRED SCRIPTS -->

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
	<script>
		$(document).ready(function() {
			// docNo로 SGN_SIGN 테이블에서 count를 하고 SGN_DOC docStep 과 같은지 확인

			var docNo = "${docList[0].docNo}";
			var docStep = "${docList[0].docStep}";

			$.ajax({
				url : "expenditureReceiverChange",
				type : "POST",
				data : {
					"docNo" : docNo,
					"docStep" : docStep
				},
				success : function(result) {

					var $additional = $("#additional");
					var $order = $("#order");

					console.log("ajax 통신 성공");
					// 결재단계가 마지막이 아닌 경우 result = 1;
					if (result == 1) {
						$additional.remove();
						$order.remove();
					}

				},
				error : function() {
					console.log("ajax 통신 실패");
				}
			});
		});
	</script>

</body>
</html>