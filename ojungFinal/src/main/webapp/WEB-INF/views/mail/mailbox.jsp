<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재</title>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
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
							<h1>메일함</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row" id="row">
					<div class="col-md-2">
					<c:if test="${!empty loginMember}">
						<a href="<%=request.getContextPath() %>/mail/mailWrite"
							class="btn btn-primary btn-block mb-3" title="새 메일 작성">Compose</a>
					</c:if>
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
									<li class="nav-item active" title="전체 메일함" id="showRow"><a href="#" class="nav-link">
											<i class="fas fa-inbox nav-icon"></i> Inbox 
											<span data-toggle="tooltip" title="New Messages" class="badge bg-primary mailAlert"></span>

									</a>
									</li>
									<li class="nav-item" title="보낸 메일함"><a href="#" class="nav-link"> <i
											class="far fa-share-square"></i> Sent items
									</a></li>
									<li class="nav-item" title="전송 실패 메일"><a href="#" class="nav-link"> <i
											class="fab fa-firstdraft"></i> Drafts
									</a></li>
									<li class="nav-item" title="삭제된 메일"><a href="#" class="nav-link"> <i
											class=""></i> Deleted items
									</a></li>
								</ul>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
					<div class="col-md-3" id ="hideRow">
						<div class="card card-primary card-outline">
							<div class="card-header ">
					                <form method="POST" class="input-group input-group-sm">
									<label class="card-title mr-3" style="font-weight: normal;line-height: 1;">Inbox</label>
										<button id="reload" type="button" class="btn btn-default btn-sm	">
											<i class="fas fa-sync-alt"></i>
										</button>&nbsp;&nbsp;
										<input type="text" class="form-control " size ="50"
											placeholder="Search Mail" name="searchValue">
										<div class="input-group-append">
											<div class="btn btn-primary">
												<i class="fas fa-search"></i>
											</div>
										</div>
									</form>
								</div>
								<!-- /.card-tools -->
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0" style="over-flow:auto;">

								<div class="table-responsive mailbox-messages">
								<div style="height:500px; overflow-y:scroll;">
									<table class="table table-hover table-striped">
										<tbody >
										<c:if test="${empty mList}">
											<tr>
												<td colspan="3" style="text-align:center;" class="mailbox-subject">
													받은 메일이 없습니다.
												</td>
											</tr>
										</c:if>
										<c:if test="${!empty mList }">
										<c:forEach var="board" items="${mList}" varStatus="vs">
											<tr>
												<td class="p-0">
													<input type="hidden"  name="no" value="${board.mailNo }">
												</td>
												<td class="mailbox-star p-0"><a href="#"><i
														class="fas fa-star text-warning"></i></a></td>
												<td class="mailbox-name p-0 list-table">
												<c:set var="from" value="${fn:substring(board.mailFrom,0,28)}"/>
												<label style="font-weight:lighter ;">
												<small style="color : grey;">
												<c:choose>
												<c:when test="${fn:contains(from,'Subsystem')}">
													${from} <small style="color:grey;">&lt;관리자&gt;</small>
												</c:when>
												<c:otherwise>
													${from}
												</c:otherwise>
												</c:choose>
												</small>
												</label>
												<br>
												<c:set var="noRead" value="color: #007bff;"/>
												<c:if test= "${board.readFlag == 0}">
													<c:set var="subject" value="${board.mailSubject}" />
													<label class="mailReadTitle" style="font-weight:normal; ${noRead}">
														<c:if test="${fn:length(subject) > 20 }">
														${fn:substring(subject,0,20) } ...
														</c:if>
														<c:if test="${fn:length(subject) < 20 }">
														${subject}
														</c:if>
													</label>
												
													<small  class="float-right pr-2" style="${noRead}">
													<c:set var="sentDate" value="${board.mailSentDate}"/>
													${fn:substring(sentDate,0,10) }
													</small>
													<i class="fas fa-paperclip float-right pr-2" style="${noRead}"></i>
													
												</c:if>
												<c:if test= "${board.readFlag == 1}">
													<c:set var="subject" value="${board.mailSubject}" />
													<label class="mailReadTitle" style="font-weight:normal;">
														<c:if test="${fn:length(subject) > 20 }">
														${fn:substring(subject,0,20) } ...
														</c:if>
														<c:if test="${fn:length(subject) < 20 }">
														${subject}
														</c:if>
													</label>
												
													<small  class="float-right pr-2">
													<c:set var="sentDate" value="${board.mailSentDate}"/>
													${fn:substring(sentDate,0,10) }
													</small>
													<i class="fas fa-paperclip float-right pr-2" style=""></i>
													
												</c:if>
												</td>
										    </tr>
									    </c:forEach>
										</c:if>
										</tbody>
									</table>
									</div>
									<!-- /.table -->
								</div>
								<!-- /.mail-box-messages -->
							</div>
							<!-- /.card-body -->
							<div class="card-footer p-0">
								<div class="mailbox-controls">
									<!-- Check all button -->
									<!-- /.btn-group -->
									<!-- /.float-right -->
								</div>
							</div>
						</div>
						
						<div class='col-md-7' id='rowAdd' >
						</div>
						
						<!-- /.card -->
					</div>
					</section>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			<!-- /.content -->
		</div>
	<jsp:include page="../common/footer.jsp" />
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

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

<script>
	var currbNo = 0;
$(function(){
	
	
	
	$(".mailAlert").css("display","none");
	$("#hideRow").css("display","none");
	
	$("#showRow").click(function(){
		$("#hideRow").css("display","inline");
	});
	
 	$(".list-table").click(function(){
 		if(${empty loginMember}){
			alert("로그인 후 이용해 주세요.");
		}else{
		var $listtable = $(this);
 		var boardNo = ($(this).parent().children().eq(0).children().val());
 		
 		console.log('selected boardNo ======> '+boardNo);
 		
 		currbNo = boardNo;
 		
 		$.ajax({
 			url : "detail",
 			type : "GET",
 			data : {"no" : boardNo},
 			dataType : "json",
 			success : function(detail){
 				if(detail == ""){
 				}else{
				sendMessage();
				$listtable.parent().children().eq(2).children().next().next().css("color","black");
				
 				$("#rowAdd").html("");
 		 		$("#rowAdd").append("<div class='card card-primary card-outline'>"
 				        + "<div class='card-header'>"
				            + "<h3 class='card-title'>Read Mail</h3>"
				            + "<div class='card-tools'>"
				                + "<a href='#' class='btn btn-tool' data-toggle='tooltip' title='Previous'><i"
				                        + "class='fas fa-chevron-left'></i></a> <a href='#' class='btn btn-tool' data-toggle='tooltip'"
				                    + "title='Next'><i class='fas fa-chevron-right'></i></a>"
				            + "</div>"
				        + "</div> "
				        + "<div class='card-body p-0'>"
				            + "<div class='mailbox-read-info'>"
				                + "<h5>"+detail.mailSubject+"</h5>"
				                + "<h6>"
				                    + "From:  "+detail.mailFrom+"<span class='mailbox-read-time float-right'>"
				                    + detail.mailSentDate +"</span>"
				                + "</h6>"
				            + "</div> "
				            + "<div class='mailbox-read-message'>" 
				            + detail.mailContent
				            + "</div> "
				        + "</div> "
				        + "<div class='card-footer bg-white'>"
				            + "<ul class='mailbox-attachments d-flex align-items-stretch clearfix'>"
				                + "<li><span class='mailbox-attachment-icon'><i class='far fa-file-pdf'></i></span>" 
				                    + "<div class='mailbox-attachment-info'>"
				                        + "<a href='#' class='mailbox-attachment-name'><i class='fas fa-paperclip'></i>"
				                            + "Sep2014-report.pdf</a> <span class='mailbox-attachment-size clearfix mt-1'> <span>1,245"
				                                + "KB</span> <a href='#' class='btn btn-default btn-sm float-right'><i"
				                                    + "class='fas fa-cloud-download-alt'></i></a>"
				                        + "</span>"
				                    + "</div>"
				                + "</li>"
				                + "<li><span class='mailbox-attachment-icon'><i class='far fa-file-word'></i></span>" 
				                    + "<div class='mailbox-attachment-info'>"
				                        + "<a href='#' class='mailbox-attachment-name'><i class='fas fa-paperclip'></i> App"
				                            + "Description.docx</a> <span class='mailbox-attachment-size clearfix mt-1'> <span>1,245"
				                                + "KB</span> <a href='#' class='btn btn-default btn-sm float-right'><i"
				                                    + "class='fas fa-cloud-download-alt'></i></a>"
				                        + "</span>"
				                    + "</div>"
				                + "</li>"
				                + "<li><span class='mailbox-attachment-icon has-img'><img src='../../dist/img/photo1.png'"
				                            + "alt='Attachment'></span>"
				
				                    + "<div class='mailbox-attachment-info'>"
				                        + "<a href='#' class='mailbox-attachment-name'><i class='fas fa-camera'></i> photo1.png</a> <span"
				                            + "class='mailbox-attachment-size clearfix mt-1'> <span>2.67"
				                                + "MB</span> <a href='#' class='btn btn-default btn-sm float-right'><i"
				                                    + "class='fas fa-cloud-download-alt'></i></a>"
				                        + "</span>"
				                    + "</div>"
				                + "</li>"
				                + "<li><span class='mailbox-attachment-icon has-img'><img src='../../dist/img/photo2.png'"
				                            + "alt='Attachment'></span>" 
				                    + "<div class='mailbox-attachment-info'>"
				                        + "<a href='#' class='mailbox-attachment-name'><i class='fas fa-camera'></i> photo2.png</a> <span"
				                            + "class='mailbox-attachment-size clearfix mt-1'> <span>1.9"
				                                + "MB</span> <a href='#' class='btn btn-default btn-sm float-right'><i"
				                                    + "class='fas fa-cloud-download-alt'></i></a>"
				                        + "</span>"
				                    + "</div>"
				                + "</li>"
				            + "</ul>"
				        + "</div> "
				        + "<div class='card-footer'>"
				            + "<div class='float-right'>"
				                + "<button type='button' class='btn btn-default'>"
				                    + "<i class='fas fa-reply'></i> Reply"
				                + "</button>"
				                + "<button type='button' class='btn btn-default'>"
				                    + "<i class='fas fa-share'></i> Forward"
				                + "</button>"
				            + "</div>"
				            + "<button type='button' class='btn btn-default' onclick='deleteThisMail();'>"
				                + "<i class='far fa-trash-alt'></i> Delete"
				            + "</button>"
				        + "</div> "
				    + "</div>" ).css("height","500px");
 					
 				
 				}
 				
 			},
 			error : function(){
 				console.log("");
 			}
 		})
 		
 		}
	}).mouseenter(function(){
		$(this).css("cursor", "pointer");
	});

	
});

function deleteThisMail(){
	//console.log(currbNo);	
	
	$.ajax({
		url : "deleteThisMail",
		type : "GET",
		data : {"no": currbNo},
		dataType : "json",
		success : function(result){
			if(result>0)alert("메일이 삭제되었습니다.");
			else alert("메일이 삭제에 실패하였습니다. 관리자에게 문의해주세요.");
			location.reload();
		}
	});
	
};


$('#reload').click(function() {
	location.reload();
	
});
/* 체크 박스 전체 선택, 해제 */
/* var $checkall = $('#checkall');
$checkall.change(function () {
    var $this = $(this);
    var checked = $this.prop('checked');
	
    $('input[name="menu"]').prop('checked', checked);
});

var menu = $('input[name="menu"]');
menu.change(function () {
    var menulength = menu.length;
    var checkedLength = $('input[name="menu"]:checked').length;
    var selectAll = (menulength == checkedLength);

    $checkall.prop('checked', selectAll);
}); */



</script>
</body>
</html>