<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
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
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Compose</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/mail/mailbox">Home</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2">
						<a href="<%=request.getContextPath() %>/mail/mailWrite"
							class="btn btn-primary btn-block mb-3" title="새 메일 작성">Compose</a>

						<div class="card">
							<div class="card-header">
								<h3 class="card-title">구분</h3>

								<div class="card-tools">
									<button type="button" class="btn btn-tool"
										data-card-widget="collapse">
										<i class="fas fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="card-body p-0">
								<ul class="nav nav-pills flex-column">
									<li class="nav-item active" title="전체 메일함"><a href="#" class="nav-link">
											<i class="fas fa-inbox nav-icon"></i> Inbox <span
											class="badge bg-primary float-right"></span>
									</a>
									</li>
									<li class="nav-item" title="보낸 메일함"><a href="#" class="nav-link"> <i
											class="far fa-share-square"></i> Sent items
									</a></li>
									</li>
									<li class="nav-item" title="전송 실패 메일"><a href="#" class="nav-link"> <i
											class="fab fa-firstdraft"></i> Drafts
									</a></li>
									<li class="nav-item" title="삭제된 메일"><a href="#" class="nav-link"> <i
											class="far fa-trash-alt"></i> Deleted items
									</a></li>
								</ul>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
						<!-- /.col -->
						<div class="col-md-10">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<h3 class="card-title">Read Mail</h3>

									<div class="card-tools">
										<a href="#" class="btn btn-tool" data-toggle="tooltip"
											title="Previous"><i class="fas fa-chevron-left"></i></a> <a
											href="#" class="btn btn-tool" data-toggle="tooltip"
											title="Next"><i class="fas fa-chevron-right"></i></a>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body p-0">
									<div class="mailbox-read-info">
										<h5>${detail.mailSubject }</h5>
										<h6>
											From: ${detail.mailFrom } <span
												class="mailbox-read-time float-right">${detail.mailSentDate }</span>
										</h6>
									</div>
									<!-- /.mailbox-read-info -->
									<!-- /.mailbox-controls -->
									<div class="mailbox-read-message">
										${detail.mailContent }
									</div>
									<!-- /.mailbox-read-message -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer bg-white">
									<ul
										class="mailbox-attachments d-flex align-items-stretch clearfix">
										<li><span class="mailbox-attachment-icon"><i
												class="far fa-file-pdf"></i></span>

											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name"><i
													class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
													class="mailbox-attachment-size clearfix mt-1"> <span>1,245
														KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
														class="fas fa-cloud-download-alt"></i></a>
												</span>
											</div></li>
										<li><span class="mailbox-attachment-icon"><i
												class="far fa-file-word"></i></span>

											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name"><i
													class="fas fa-paperclip"></i> App Description.docx</a> <span
													class="mailbox-attachment-size clearfix mt-1"> <span>1,245
														KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
														class="fas fa-cloud-download-alt"></i></a>
												</span>
											</div></li>
										<li><span class="mailbox-attachment-icon has-img"><img
												src="../../dist/img/photo1.png" alt="Attachment"></span>

											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name"><i
													class="fas fa-camera"></i> photo1.png</a> <span
													class="mailbox-attachment-size clearfix mt-1"> <span>2.67
														MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
														class="fas fa-cloud-download-alt"></i></a>
												</span>
											</div></li>
										<li><span class="mailbox-attachment-icon has-img"><img
												src="../../dist/img/photo2.png" alt="Attachment"></span>

											<div class="mailbox-attachment-info">
												<a href="#" class="mailbox-attachment-name"><i
													class="fas fa-camera"></i> photo2.png</a> <span
													class="mailbox-attachment-size clearfix mt-1"> <span>1.9
														MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
														class="fas fa-cloud-download-alt"></i></a>
												</span>
											</div></li>
									</ul>
								</div>
								<!-- /.card-footer -->
								<div class="card-footer">
									<div class="float-right">
										<button type="button" class="btn btn-default">
											<i class="fas fa-reply"></i> Reply
										</button>
										<button type="button" class="btn btn-default">
											<i class="fas fa-share"></i> Forward
										</button>
									</div>
									<button type="button" class="btn btn-default">
										<i class="far fa-trash-alt"></i> Delete
									</button>
								</div>
								<!-- /.card-footer -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
			</section>
			<!-- /.content -->


		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="<%=request.getContextPath() %>/resources/dist/js/adminlte.js"></script>

	<!-- OPTIONAL SCRIPTS -->
	<script
		src="<%=request.getContextPath() %>/resources/plugins/chart.js/Chart.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
	<script
		src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>


</body>
</html>