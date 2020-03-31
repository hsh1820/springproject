<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark">
				<!-- Control sidebar content goes here -->
			</aside>
			<!-- /.control-sidebar -->



			<!-- Main content -->
		<!-- 	<form class="form-horizontal"> -->
				<section class="content">
					<div class="container-fluid">
						<div class="row">
							<!-- left column -->
							<div class="col-md-10">

								<!-- Input addon -->
								<div class="card card-info">
									<div class="card-header bg-navy">
										<h3 class="card-title">결재</h3>
									</div>
									<div class="card-body" style="height: auto;">

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">제목</span>
											</div>
											<input type="text" class="form-control"
												value="${docList[0].docTitle }">
										</div>
										<input type="hidden" value="${docList[0].docNo}">

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">입사일자</span>
											</div>
											<input type="date" class="form-control col-sm-5"
												value="${docList[0].enrollDate }">

											<div class="col-sm-1"></div>

											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">퇴사예정일</span>
											</div>
											<input type="date" class="form-control col-sm-5"
												value="${docList[0].retireDate }">
										</div>

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">퇴직 후 연락처</span>
											</div>
											<input type="text" class="form-control col-sm-5"
												value="${docList[0].subPhone }">
											<div class="col-sm-1"></div>
											<div class="input-group-prepend" style="text-align: center;">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">주소</span>
											</div>
											<input type="text" class="form-control col-md-5"
												value="${docList[0].subAddress }">
										</div>

										<div class="input-group mb-3">
											<div class="input-group-append">
												<span class="input-group-text" style="width: 130px;">퇴사
													사유</span>
											</div>
											<textarea class="form-control"
												style="resize: none; height: 200px;">${docList[0].docContents }</textarea>
										</div>

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">기안자</span>
											</div>
											<input type="text" class="form-control"
												value="${docList[0].drafterName}">
										</div>

										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"
													style="width: 130px; display: table-cell">상신일자</span>
											</div>
											<input type="date" class="form-control col-sm-5" readonly
												value="${docList[0].insertDate}">

											<div class="col-sm-1"></div>

										</div>

										<c:if test="${docList[0].docStatus == 3}">
											<hr id="rejectHr">
											<div class="input-group mb-3">
												<div class="input-group-append">
													<span class="input-group-text" style="width: 110px;">반
														려 사 유</span>
												</div>
												<c:forEach var="docList" items="${docList}">
													<c:if test="${!empty docList.ssComment}">
														<textarea class="form-control"
															style="resize: none; height: 200px;">${docList.ssComment}</textarea>
													</c:if>
												</c:forEach>
											</div>
										</c:if>

										<!-- /input-group -->
									</div>
									<!-- /.card-body -->
								</div>

							</div>




							<!-- /.card -->
							<div class="col-md-2 pl-3" style="width: 100%">
								<div class="row">
									<div class="card row" style="width: 100%">
										<div class="card-header bg-navy">
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
													${docList[0].drafterName }
													<p style="color: lightslategrey; font-size: small;">${docList[0].insertDate }</p>
													<span class="badge badge-info badge-pill">기안</span>
												</li>
												<c:forEach var="docList" items="${docList}">
													<i class="fas fa-angle-down fa-2x mt-2 mb-2 ml-5"></i>
													<li
														class="list-group-item d-flex justify-content-between align-items-center">
														${docList.payerName}
														<p style="color: lightslategrey; font-size: small;">${docList.signDate }</p>
														<c:if test="${docList.ssResult == 0}">
															<span class="badge badge-primary badge-pill">대기중</span>
														</c:if> <c:if test="${docList.ssResult == 1}">
															<span class="badge badge-primary badge-pill">승인</span>
														</c:if> <c:if test="${docList.ssResult == 2}">
															<span class="badge badge-primary badge-pill">반려</span>
														</c:if>
													</li>
												</c:forEach>
											</ul>
										</div>
										<!-- cardBody-->

										<!-- /.card-header -->

									</div>
									<div class="card row" style="width: 100%">
										<div class="card-header bg-navy">
											<h3 class="card-title">
												<i class="fas fa fa-book-reader"></i>&nbsp; 첨부파일
											</h3>
										</div>

										<div class="card-body">
											<c:if test="${empty files}">
                      					 	 등록된 파일이 없습니다.
                							</c:if>
											<c:forEach var="files" items="${files}">
												<c:if
													test="${files.realName  != '' || files.realName ne null}">
													<c:set var="formatString" value="${files.realName }" />

													<a
														href="${contextPath}/resources/uploadFiles/${files.realName}"
														class="btn-link text-secondary" download> <c:choose>
															<c:when test="${fn:contains(formatString,'png')}">
																<i class="far fa-fw fa-image " style="display: inline"></i>
															</c:when>

															<c:when test="${fn:contains(formatString,'docx')}">
																<i class="far fa-fw fa-file-word"
																	style="display: inline"></i>
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
														</c:choose> ${files.fileName}
													</a> &nbsp;
                       					 </c:if>
											</c:forEach>

										</div>

									</div>

									<c:if test="${docList[0].docStatus == 4}">
										<div class="card row" style="width: 100%">
											<button
												onclick="location.href='${contextPath}/electronicSign/signPDF?no=${docList[0].docNo}'">인쇄
												미리 보기</button>
										</div>
									</c:if>

								</div>

							</div>
						</div>
					</div>
				</section>
			<!-- </form> -->
		</div>

	</div>

	<jsp:include page="../common/footer.jsp" />


	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>

	<script>
		$(function() {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(
					function() {
						var clicks = $(this).data('clicks')
						if (clicks) {
							//Uncheck all checkboxes
							$('.noticeList input[type=\'checkbox\']').prop(
									'checked', false)
							$('.checkbox-toggle .far.fa-check-square')
									.removeClass('fa-check-square').addClass(
											'fa-square')
						} else {
							//Check all checkboxes
							$('.noticeList input[type=\'checkbox\']').prop(
									'checked', true)
							$('.checkbox-toggle .far.fa-square').removeClass(
									'fa-square').addClass('fa-check-square')
						}
						$(this).data('clicks', !clicks)
					})
		})
	</script>

	<!-- 결재라인 -->
	<script>
		var arr = [];

		$("input[name=elecLine]").on("click", function() {
			arr.push($(this).val());
		});

		$("#elecSubmit").on("click", function() {
			$("#elecLineSpan").html(arr.join(" , "));
			$("#elecModalClose").click();
		});
	</script>


	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>


	<!-- bs-custom-file-input -->
	<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>



</body>

</html>