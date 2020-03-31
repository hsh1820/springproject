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
			<section class="content-header"></section>

			<!-- Main content -->
			
			<form action="updateSign?no=${docList[0].docNo}" method="POST">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<!-- left column -->
							<div class="col-md-10">
								<!-- general form elements -->
								<div>
								<!-- dtNo 숨겨서 넘기기 -->
									<input type="hidden" name="dtNo" value="${docList[0].dtNo}">
									<!-- /.card-header -->


									<!-- Input addon -->
									<div class="card card-info">
										<div class="card-header bg-navy">
											<h3 class="card-title">결재</h3>
										</div>
										<div class="card-body">

											<div class="input-group mb-3">
												<div class="input-group-prepend mb-3">
													<span class="input-group-text">제목</span>
												</div>
												<input type="text" class="form-control mb-3"
													style="background-color: white;" readonly
													value="${docList[0].docTitle}">
											</div>


											<div class="input-group mb-3">
												<div class="input-group mb-3" style="width: 60%;">
													<div class="input-group-prepend">
														<span class="input-group-text">결근 일자</span>
													</div>
													<input type="text" class="form-control"
														style="background-color: white; margin-right: 10px;"
														value="${docList[0].absentStartDt}" readonly> ~ <input
														type="text" class="form-control"
														style="background-color: white; margin-right: 10px;"
														value="${docList[0].absentEndDt}" readonly>

												</div>
											</div>

											<div class="input-group mb-3">
												<div class="input-group mb-3" style="width: 50%;">
													<div class="input-group-prepend">
														<span class="input-group-text">기안자</span>
													</div>
													<input type="text" class="form-control"
														style="background-color: white; margin-right: 10px;"
														value="${docList[0].drafterName}" readonly>
												</div>

												<div class="input-group mb-3" style="width: 50%;">
													<div class="input-group-prepend">
														<span class="input-group-text">상신일</span>
													</div>
													<input type="date" class="form-control"
														style="background-color: white; margin-right: 10px;"
														value="${docList[0].insertDate }" readonly>
												</div>



											</div>

											<div class="input-group mb-3">
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text" style="width: 100px;">결근사유</span>
													</div>
													<textarea class="form-control "
														style="height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px; resize: none; background-color: white;"
														readonly>${docList[0].docContents}</textarea>
												</div>
											</div>

										</div>
									</div>
								</div>



								<!-- /.card -->
							</div>
							<div class="col-md-2 pl-3">
								<div class="row" style="width: 100%">
									<div class="card row" style="width: 100%">
										<div class="card-header bg-navy">
											<h3 class="card-title">
												<i class="fas fa fa-book-reader"></i>&nbsp; 결재선
											</h3>
										</div>

										<!-- /.card-header -->
										<!-- form start -->
										<div class="card-body">
											<ul class="list-group">
												<li
													class="list-group-item d-flex justify-content-between align-items-center">
													이대리 <span class="badge badge-info badge-pill">기안</span>
													<p style="font-size: small; color: lightslategrey;">${docList[0].insertDate}</p>
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
														<p style="font-size: small; color: lightslategrey;">${docList.signDate}</p>
													</li>
													<p style="color: lightslategrey; font-size: small;"></p>
												</c:forEach>
											</ul>


										</div>
										<!-- cardBody-->
									</div>
									<!-- 결재라인 끝 (결재선) -->
							

								<div class="card row mr-2" style="width: 100%">
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
							<!-- /.container-fluid -->
						</div>
					</div>
				</div>
			</form>
		</div>
				<jsp:include page="../common/footer.jsp" />
		<!--/.col (right) -->
	</div>

	<!-- /.row -->



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
	<!-- /.content-wrapper -->



	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->

	<!-- ./wrapper -->


	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
</body>

</html>