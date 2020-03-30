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
					<div class="row">
						<!-- 1 -->
						<div class="card col-md-9" style="float: left; height: auto;">
							<!-- 2 -->
							<div class="card-header bg-navy" style="width: 100%">
								<h3 class="card-title">결재</h3>
							</div>
							<!-- /.card-header -->
							<div class="card-body" style="width: 100%; height: auto;">
								<!-- 전체감싸는 것 -->
								<!-- 3 -->
								<div style="height: 100%;">
									<!-- 내용시작  -->
									<!-- 4 -->
									<div class="row mt-5">
										<!-- 첫 째줄 시작 -->
										<div class="input-group mb-3 col-md-3">
											<div class="input-group-prepend ">
												<span class="input-group-text">사원번호</span>
											</div>
											<input type="text" class="form-control"
												style="background-color: white;"
												value="${docList[0].drafter}" readonly>
										</div>

										<div class="input-group mb-3 col-md-3">
											<div class="input-group-prepend ">
												<span class="input-group-text">사원명</span>
											</div>
											<input type="text" class="form-control"
												style="background-color: white;"
												value="${docList[0].drafterName }" readonly>
										</div>

										<div class="input-group mb-3 col-md-6">
											<div class="input-group-prepend ">
												<span class="input-group-text">문서종류</span>
											</div>
											<input type="text" class="form-control"
												value="${docList[0].dTitle}"
												style="background-color: white;" readonly>
										</div>
									</div>
									<!-- 첫 쨰 줄 끝-->


									<div class="row">
										<!-- 둘 째줄 시작 -->
										<div class="input-group mb-3 col-md-12">
											<div class="input-group-prepend ">
												<span class="input-group-text">결재 서류 명</span>
											</div>
											<input type="text" class="form-control"
												style="background-color: white;"
												value="${docList[0].docTitle}" readonly>
										</div>
									</div>
									<!-- 둘 째 줄 끝-->


									<div class="row">
										<!-- 셋 째줄 시작 -->
										<div class="input-group mb-3 col-md-12">
											<div class="input-group-prepend ">
												<span class="input-group-text">내용</span>
											</div>
											<textarea rows="6" class="form-control"
												style="background-color: white;" readonly>${docList[0].docContents}</textarea>
										</div>
									</div>
									<!-- 셋째 줄 끝-->

									<div class="row">
										<!-- 셋 째줄 시작 -->
										<div class="input-group mb-3 col-md-6">
											<div class="input-group-prepend ">
												<span class="input-group-text">휴가 종류</span>
											</div>
											<input type="text" class="form-control"
												style="background-color: white;"
												value="${docList[0].holidayType}" readonly>
										</div>
									</div>
									<!-- 셋째 줄 끝-->

									<div class="row">
										<!-- 넷째 줄 시작-->
										<div class="input-group mb-3 col-md-12">
											<div class="input-group-prepend ">
												<span class="input-group-text">휴가 신청 일자</span>
											</div>
											<input type="text" class="form-control"
												style="background-color: white;"
												value="${docList[0].holidayStartDt }" readonly>
											&nbsp; &nbsp; - &nbsp; &nbsp; <input type="text"
												class="form-control" style="background-color: white;"
												value="${docList[0].holidayEndDt }" readonly>
										</div>
									</div>
									<!-- 넷째 줄 끝-->

									<c:if test="${docList[0].docStatus == 3}">
										<hr id="rejectHr">
										<div class="input-group mb-3">
											<div class="input-group-append">
												<span class="input-group-text" style="width: 110px;">반
													려 사 유 </span>
											</div>
											<c:forEach var="docList" items="${docList}">
												<c:if test="${!empty docList.ssComment}">
													<textarea class="form-control"
														style="resize: none; height: 200px;">${docList.ssComment}</textarea>
												</c:if>
											</c:forEach>
										</div>
									</c:if>

								</div>
								<!-- 내용끝  -->
								<!-- 4 -->


							</div>
							<!-- 3 -->
						</div>
						<!-- 2 -->
						<!-- /.row-->

						<div class="col-md-3 pl-3" style="float: left;">
							<div class="row">
								<div class="card col-md-11">
									<div class="card-header bg-navy" style="width: 100%">
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
												${docList[0].drafterName}
												<p style="font-size: small; color: lightslategrey;">${docList[0].insertDate}</p>
												<span class="badge badge-info badge-pill">기안</span>

											</li>
											<c:forEach var="docList" items="${docList}">
												<i class="fas fa-angle-down fa-2x mt-2 mb-2 ml-5"></i>
												<li
													class="list-group-item d-flex justify-content-between align-items-center">
													${docList.payerName}
													<p style="font-size: small; color: lightslategrey;">${docList.signDate}</p>
													<c:if test="${docList.ssResult == 0}">
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
							<!-- 결재라인 끝 (결재선) -->
							<div class="row">
								<div class="card col-md-11">
									<div class="card-header bg-navy" style="width: 100%">
										<h3 class="card-title" style="width: 100%">
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
					<!-- 1 -->

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
	</div>


	</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
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