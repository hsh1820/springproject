<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>(주) 오정상사 그룹웨어 - 협업게시판</title>
<!-- jQuery -->
	<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
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

<script>
  Date.prototype.format = function (f) {
      if (!this.valueOf()) return "";

      var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
      var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
      var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
      var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
      var d = this;

      return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
          switch ($1) {
              case "yyyy": return d.getFullYear(); // 년 (4자리)
              case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
              case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
              case "dd": return d.getDate().zf(2); // 일 (2자리)
              case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
              case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
              case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
              case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
              case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
              case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
              case "mm": return d.getMinutes().zf(2); // 분 (2자리)
              case "ss": return d.getSeconds().zf(2); // 초 (2자리)
              case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

              default: return $1;
          }
      });
  };

  String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
  String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
  Number.prototype.zf = function (len) { return this.toString().zf(len); };
  
  </script>
</head>
<style>
#cooper_btn {
	text-decoration-color: none;
}
</style>
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
					<div class="row"></div>
				</div>
				<!-- /.container-fluid -->
			</section>

	<div class="row m-2">
			<!-- Main content -->
			<div class="col-md-10">
		
				<!-- Default box -->
				<div class="card">
					<div class="card-header bg-navy">
						<div class="card-title">협업게시판 상세페이지</div>
					</div>
					<div class="card-header">
						<h2 class="card-title text-secondary">${detail.collaboTitle }</h2>
					</div>
					<div class="card-header">
					<small style="color:grey">
							협업 일정 : ${detail.collaboStartDate} - ${detail.collaboEndDate }</small>
						<div class="card-tools mt-1" style="margin-left: 500px; margin-bottom: 0px;">
							<!-- 
	                	*   요청 수락 버튼 표시	*
	              	   1. 로그인한 사람이 협업 요청글의 작성자가 아니면서
	              	   2. 요청글의 상태가 요청중일 때 
	              	   3. 요청 부서와 로그인한 사람의 부서번호가 같지 않을 때
	              	   4. 협업 부서 리스트에 로그인한 사람의 부서 이름이 있을 때
	               -->
							<c:set var="var" value="N" />
							<c:if
								test="${detail.collaboStatus == 1 && loginMember.memberNo != detail.memberNo}">
								<c:forEach var="deptList" items="${deptList }" varStatus="vs">
									<c:if
										test="${(loginMember.deptCode ne deptList.deptCode ) &&
                   				  fn:contains(collaDepts, loginMember.deptCode)}">
										<c:set var="var" value="Y" />
									</c:if>
								</c:forEach>
							</c:if>

							<c:if test="${var eq 'Y' }">
								<button type="button" style="width: 200px;" class="btn btn-info"
									data-toggle="modal" data-target="#modal-secondary">요청
									수락</button>
								<button type="button" style="width: 200px;"
									class="btn btn-danger" data-toggle="modal"
									data-target="#modal-reject">요청 거절</button>
							</c:if>
							<c:if test="${detail.collaboStatus > 1}">
								<span>담당자 : <span style="color: #17a2b8;">${detail.taskAccepterName }</span></span>
							</c:if>
						</div>


						<div class="modal fade" id="modal-secondary">
							<div class="modal-dialog">
								<div class="modal-content bg-secondary">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<h4 class="modal-title">요청수락 확인</h4>
										</button>
									</div>
									<div class="modal-body">
										<span aria-hidden="true">협업요청을 수락하시겠습니까?</span>
									</div>
									<div class="modal-footer ">
										<button type="button"
											class="btn btn-outline-light float-right"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-outline-light"
											id="taskAccept">수락</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
						<div class="modal fade" id="modal-reject">
							<div class="modal-dialog">
								<div class="modal-content bg-secondary">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<h4 class="modal-title">요청거절 확인</h4>
										</button>
									</div>
									<div class="modal-body">
										<span aria-hidden="true">협업요청을 거절하시겠습니까?</span>
									</div>
									<div class="modal-footer ">
										<button type="button"
											class="btn btn-outline-light float-right"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-outline-light"
											id="taskReject">거절</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>



					<div class="card-body ml-3 mr-3 mt-1">
						<div class="row">
							<ul class="list-unstyled" style="width: 100%">
								<li>
									<div class="float-right">
										<small style="color: #808080;">
											<span>작성일 :${detail.collaboCreateDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
											<span>글 번호 :${detail.collaboNo}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> 
											<span>조회수 : ${detail.collaboCount }</span>
										</small>
									</div>
								</li>
								
								<li class=" ml-3 mt-3">
									<span style="color: #17a2b8; ">${detail.memberName}</span>
									<span><small style="color: grey;"> ${detail.wirterDeptName } / </small></span> 
									<span><small style="color: #808080;">${detail.writerJobName }</small></span>&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="text-sm" id="textSpan"></span>
									<span class="text-sm">	
									<c:if test="${detail.collaboStatusTitle == '처리완료'}">
											<span class="badge badge-success">${detail.collaboStatusTitle }</span>
										</c:if> <c:if test="${detail.collaboStatusTitle == '요청중'}">
											<span class="badge badge-success"
												style="background-color: gray;">${detail.collaboStatusTitle}</span>
										</c:if> <c:if test="${detail.collaboStatusTitle == '요청수락'}">
											<span class="badge badge-success"
												style="background-color: rgb(38, 38, 224);">${detail.collaboStatusTitle}</span>
										</c:if> <c:if test="${detail.collaboStatusTitle == '요청거절'}">
											<span class="badge badge-success"
												style="background-color: red;">${detail.collaboStatusTitle}</span>
										</c:if>
								</span>&nbsp;&nbsp;&nbsp; <small><span class="sub"></span></small></li>
								
								<li style="height:300px;  background-color:aliceblue;" class="ml-3 mt-4" ><br>
							
								<span style="padding-left:30px; background-color:aliceblue;">${detail.collaboContent }</span>
								
								</li>
								
							
								
			<div class="card row mt-5 ml-3 mr-3">
				<div class=" card-header bg-navy">
					<h3 class="card-title" >
						<i class="fas fa fa-book-reader"></i>&nbsp; 첨부파일 </h3>
				</div>
			
				<!-- /.card-header -->
				<!-- form start -->
				<div class="card-body ml-4">
									<c:if
										test="${empty cfList }">
										<li><small style="color: grey;">등록된 첨부파일이 없습니다.</small></li>
									</c:if> <c:if test="${!empty cfList }">
										<small style="color: grey;"> <c:forEach var="files"
												items="${cfList}">
												<c:if
													test="${files.fileOriginNm  != '' || files.fileOriginNm ne null}">
													<c:set var="formatString" value="${files.fileOriginNm }" />

													<a
														href="${contextPath}/resources/collaboUploads/${files.fileChangeNm}"
														class="btn-link text-secondary" download> <c:choose>
															<c:when test="${fn:contains(formatString,'png')}">
																<i class="far fa-fw fa-image "></i>
															</c:when>

															<c:when test="${fn:contains(formatString,'docx')}">
																<i class="far fa-fw fa-file-word"></i>
															</c:when>

															<c:when test="${fn:contains(formatString,'pdf')}">
																<i class="far fa-fw fa-file-pdf"></i>
															</c:when>

															<c:when test="${fn:contains(formatString,'mln')}">
																<i class="far fa-fw fa-envelope"></i>
															</c:when>

															<c:otherwise>
																<i class="far fa-fw fa-file"></i>
															</c:otherwise>
														</c:choose> ${files.fileOriginNm}
													</a> &nbsp;
				</c:if>
												<br>
											</c:forEach>
										</small>
									</c:if></div></div>
							</ul>
						</div>
				

						<!-- 게시글 작성자 -->
						<div class="timeline-footer">
							<c:if
								test="${(detail.collaboStatus < 3) && (loginMember != null) && (detail.memberNo == loginMember.memberNo) }">
								<a href="edit?no=${detail.collaboNo }"
									class="btn btn-secondary float-right ml-1">수정</a>
								<a href="delete?no=${detail.collaboNo }"
									class="btn btn-danger float-right ml-1" id="deleteBtn">삭제</a>
							</c:if>
							<a class="btn btn-outline-primary float-right"
								href="
						<c:url value="collaboBoardList">
	                   		<c:if test="${!empty param.searchKey }">
				        		<c:param name="searchKey" value="${param.searchKey}"/>
				        	</c:if>
				        	<c:if test="${!empty param.searchValue }">
				        		<c:param name="searchValue" value="${param.searchValue}"/>
				        	</c:if>
				        	<c:if test="${!empty param.searchStatus }">
			        			<c:param name="searchStatus" value="${param.searchStatus}"/>
			        		</c:if>
	                   		<c:param name="currentPage" value="${param.currentPage}"/>
	                   	</c:url>">목록으로
							</a>
							<div></div>
						</div>
					</div>

				<!-- /.card -->
	<hr>
				<!-- 댓글영역 -->
			 <!-- Timelime example  -->
			<!-- Timelime example  -->
         </div>
         
				</div>
         <!-- /.card -->
		<!--  부서 리스트(오른쪽) -->
		
	<div class="col-md-2">
			<div class="card row">
				<div class="card-header bg-navy">
					<h3 class="card-title">
						<i class="fas fa fa-book-reader"></i>&nbsp; 요청부서 </h3>
				</div>

				<!-- /.card-header -->
				<!-- form start -->
				<div class="card-body">

	
			<ul class="pl-0">
				<li class="list-unstyled "> 									
								<span class="listSlide">
									<a href="#" style="color: grey;"> ${detail.wirterDeptName}</a></span>
										<ul class="list-unstyled">
											<c:forEach var="dList" items="${deptList }" varStatus="vs">
												<li>
													<a href="#">${dList.memberName}&nbsp;</a> 
													${dList.deptName } / ${dList.jobName }
												</li>
											</c:forEach>
										</ul>
				</li>
			</ul>


				</div>
				<!-- cardBody-->
		
		</div>
	
		
		<!--  ----------------- 협력 부서 -->
		
			<div class="card row">
				<div class="card-header bg-navy">
					<h3 class="card-title">
						<i class="fas fa fa-book-reader"></i>&nbsp; 협업부서 </h3>
				</div>

				<!-- /.card-header -->
				<!-- form start -->
				<div class="card-body">

	
			<ul class="pl-0">
				<li class="list-unstyled "> 									
								
							<c:forEach var="collaList" items="${collaList }" varStatus="vs">
											<span class="listSlide"><a href="#" style="color: grey;"> 
												<c:out value="${collaList[0].deptName}" /></a></span>
											<ul class="list-unstyled">
												<c:forEach var="cList" items="${collaList }"
													varStatus="vars">
													<li><a href="#">${cList.memberName}&nbsp;</a>
														 ${cList.deptName } / ${cList.jobName }</li>
												</c:forEach>
											</ul>
											<br>
										</c:forEach>

				</li>
			</ul>


				</div>
				<!-- cardBody-->
		
		</div>
		</div>
		
		<!--  부서리스트 끝 -->
		
		</div>
		</div>
		<!-- /.card -->
		<!-- /.content -->
	<jsp:include page="../common/footer.jsp" />
	</div>
	<!-- /.content-wrapper -->
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
	$("#taskAccept").on("click",function(){
		location.href="task?cNo=${detail.collaboNo}&task=1";
	});
	$("#taskReject").on("click",function(){
		location.href="task?cNo=${detail.collaboNo}&task=2";
	});
	
	$(".listSlide").click(function(){
	     $(this).next("ul").slideUp();
	     if(!$(this).next().is(":visible")){
	        $(this).next().slideDown();
	     }
	        
	   });
	   
	//댓글등록
	$("#insertReply").on("click",function(){
	var replyContent = $("#replyContent").val();
	var boardNo = ${detail.collaboNo};
	var memberNo = ${loginMember.memberNo};
	var obj={"collaboCmmtContent":replyContent,"collaboNo":boardNo, "memberNo":memberNo};
	
	//console.log(obj)
	
	if(${loginMember == null}){
		alert("로그인 후 이용 해주세요.");
	}else{
	
		 $.ajax({
	        type:'POST',
	        url : "insertReply",
	        data:JSON.stringify(obj),
	      	contentType: "application/json",
	        success : function(data){
	            if(data=="success") {
	  			//console.log(data);
	  			alert("댓글이 등록되었습니다.");
	  			$("#timeline").show();
	            $("#replyInsert").hide();
	            $("#replyContent").val("");
	            replyCount();
	            replyList();
	            }else{
	            	alert("댓글 등록이 실패되었습니다.");
	            }
	        },
	        error:function(){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            console.log("실패");
	       }
	        
	    });
	}
		
	});
	
	// 댓글 목록 출력
	function replyList(){
		var boardNo = "${detail.collaboNo}";
		
		$.ajax({
			url : "replyList",
			type : "POST",
			data : {"collaboNo" : boardNo},
			dataType : "json", 
			success : function(replyList){
				
				var $messageArea = $("#messageArea");
				
				// 등록된 댓글이 없는 경우 
				if(replyList == "" ){ 
					$text = $("<div>").text("등록된 댓글이 없습니다.").css("text-align","center");
					$addRow = $("<div>").prop({"class": "row text-center"}).append($text);
					
					$messageArea.html($addRow);
					$("#timeline").hide();
					
				}else{
					// 댓글 등록 성공하고, 등록된 댓글이 있는 경우
					
					$messageArea.html(""); // 기존 댓글 목록 삭제
					
					var html = "";
					var collaboCmmtNo = "";
					
					for(i=0; i<replyList.length; i++){
						var memberNo = ${loginMember.memberNo};
						var writeNo = replyList[i].memberNo;
						replyNo = replyList[i].collaboCmmtNo;
						//console.log(i + "번째 댓글번호 : " + replyNo);
						
						html += "<div id='replyList' class='replyList'><i class='fas fa-user bg-green'></i> <div class='timeline-item'><span class='time'><i class='fas fa-clock' id='writeTime'></i>";
						html += replyList[i].collaboCmmtCreateDt + "</span>";
						html += "<h3 class='timeline-header'><a id='memberName'>";
						html +=  replyList[i].memberName + "</a>";
						html += "</h3><div class='card-body' id='content'>";
						html += replyList[i].collaboCmmtContent;
						
						if (memberNo == writeNo){ // 작성자와 로그인멤버가 같은경우만 수정/삭제버튼 보임
							html += "<p hidden >"+replyNo+"</p>";
							html += "<span><i class='fa fa-trash float-right' id='replyDelete' style='width: 50px'></i>";
							html += "<i class='fa fa-edit float-right ' id='replyEdit' style='width: 50px'></i></span>";
							}
						
						html += "</div> </div> </div>";
						

						}; // for
					
					$("#timeline").html(html);
						
				}//else
				
				
			}, 
			error : function(){
				console.log("댓글 목록 조회 ajax 호출 실패");
			}
			
		});
		
	}
	
	function replyCount(){
		var boardNo = "${detail.collaboNo}";
		$.ajax({
			url : "replyCount",
			type : "POST",
			data : {"collaboNo" : boardNo},
			dataType : "json", 
			success : function(count){
					console.log("댓글 수 조회 성공");
				if(count>0){
					console.log("조회된 댓글 수 : " + count);
					var msg = "총 댓글 수 : " + count;
				}else{
					console.log("댓글 수 조회 실패");
					count = 0;
					var msg = "총 댓글 수 : " + count;
				}
				
				$("#replyCount").html(msg);
			}
		});
		
	}
	
	</script>

	<script>
	function deleteConfirm(replyNo){
		var msg = confirm("댓글을 삭제하시겠습니까?");
		if (msg == true){
			 replyDelete(replyNo);
		}else{
			return false;
		}
	}
	
	$(document).on("click",".fa-trash",function replyDelete(){
		console.log($(this).parent().parent().children().text());
		
		 $.ajax({
		        type:'POST',
		        url : "deleteReply",
		        data:{"collaboCmmtNo":replyNo},
		        dataType : "json",
		        success : function(result){
		            if(result>0) {
		  			//console.log(data);
		  			alert("댓글이 삭제되었습니다.");
		            replyList();
		            replyCount();
		            console.log("댓삭성공")
		            }else{
		            	alert("댓글 삭제가 실패되었습니다.");
		            }
		        },
		        error:function(){
		            console.log("실패");
		       }
		        
		    }); 
	});
	
	function replyUpdate(no,content){
		var replyNo = no;
		var replyContent = content;
		var obj = {"collaboCmmtNo":replyNo,"collaboCmmtContent":replyContent}

		
		if(${loginMember == null}){
			alert("로그인 후 이용 해주세요.");
		}else{
		
			 $.ajax({
		        type:'POST',
		        url : "updateReply",
		        data:JSON.stringify(obj),
		        dataType : "json",
		      	contentType: "application/json",
		        success : function(result){
		            if(result>0) {
		  			//console.log(data);
		  			alert("댓글이 수정 되었습니다.");
		  			$("#timeline").show();
		            $("#replyInsert").hide();
		            $("#replyUpdate").hide();
		            $("#replyContent").val("");
		            replyList();
		            }else{
		            	alert("댓글 수정 실패되었습니다.");
		            }
		        },
		        error:function(){
		            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            console.log("수정 실패");
		       }
		        
		    });
			 
		}
			 
			
		}
		
	// 수정 폼 가져오기 
	var no = ""; 
	var content="";
	var preContent="";
	
	$(document).on("click",".fa-edit",function(){
		//var str =($(this).parent().parent().text());
		//preContent = str;
		//no = ($(this).children().text());
		var $die = $("<a>");
		var $honey = $("<a>");
		
		$die.prop({"class":"fa fa-check float-right replySave"});
		$honey.prop({"class":"fa fa-arrow-left removeContent float-right mr-4"});
		console.log("test"+$die);
		var $amond = $("<textarea>").css("resize","none");
		
		$amond.text(str).css("width","100%");
		
		$(this).parent().parent().html($amond).append($die,$honey);	
		console.log($amond.val());
		
	});
	
	
	
	$(document).on("click",".replySave",function(){
		//console.log($(this).parent().children().val());
		content = $(this).parent().children().val();
		replyUpdate(no,content);
	});
	
	$(document).on("click",".removeContent",function(){
		$("#replyContent").val("");
		$("#replyInsert").hide();
		var $butter = $("<span>").text(preContent);
		
		var $die = $("<i>");
		var $honey = $("<i>");
		$die.prop({"class":"fa fa-trash float-right replySave "});
		$honey.prop({"class":"fa fa-edit float-right editForm mr-4"});
		
		$butter.append($die).append($honey);
		console.log("버터" + preContent);
		$(this).parent().html($butter);
	});
</script>
	<script>
		  var wDate = '${detail.collaboCreateDate}';
	      var uDate = '${detail.collaboUpdateDate }';
	      var status = '${detail.collaboStatusTitle}';
	      var now = new Date(); 
	      
	      //글쓴 시간                       
	      var writeDay = new Date(uDate); 
	      // 글 수정 시간
	      var twriteDay = new Date(wDate);
	      var minus; 
	      
	      function timeBefore(){ 
	          
	          //현재 년도랑 글쓴시간의 년도 비교
	          /* if(now.getFullYear() > writeDay.getFullYear()){ 
	             minus= now.getFullYear()-writeDay.getFullYear(); 
	             //두개의 차이를 구해서 표시
	             document.getElementsByClassName("sub")[0].innerHTML = minus+"년 전";
	             console.log(minus+"년 전"); 
	          }else if(now.getMonth() > writeDay.getMonth()){ 
	             //년도가 같을 경우 달을 비교해서 출력 
	             /* minus= now.getMonth()-writeDay.getMonth(); 
	             document.getElementsByClassName("sub")[0].innerHTML = minus+"달 전"; 
	             console.log(minus+"달 전");  
	             $("#textSpan").text(wDate+"에 작성"); 
	         }else*/ if(now.getDate() > writeDay.getDate() ){ 

	               //같은 달일 경우 일을 계산 
	               minus= now.getDate()-writeDay.getDate(); 
	               document.getElementsByClassName("sub")[0].innerHTML = minus+"일 전 수정됨"; 
	               console.log(minus+"일 전"); 
	        }else if(now.getDate() == writeDay.getDate()){ 
	           //당일인 경우에는
	              var nowTime = now.getTime(); 
	              var writeTime = writeDay.getTime(); 
	              if(nowTime>writeTime){ 
	                 //시간을 비교
	                 sec =parseInt(nowTime - writeTime) / 1000; 
	                 day = parseInt(sec/60/60/24); 
	                 
	                 sec = (sec - (day * 60 * 60 * 24)); hour = parseInt(sec/60/60); 
	                 sec = (sec - (hour*60*60)); min = parseInt(sec/60); 
	                 sec = parseInt(sec-(min*60)); 
	                    if(hour>0){ 
	                       //몇시간전인지 
	                 document.getElementsByClassName("sub")[0].innerHTML = hour+"시간 전 수정됨";
	                     console.log(hour+"시간 전"); 
	                    }else if(min>0){ 
	                       //몇분전인지
	                    document.getElementsByClassName("sub")[0].innerHTML = min+"분 전 수정됨"; 
	                       console.log(min+"분 전"); 
	                    }else if(sec>0){ 
	                       //몇초전인지 계산 
	                       document.getElementsByClassName("sub")[0].innerHTML = sec+"초 전 수정됨"; 
	                       console.log(sec+"초 전"); 
	                       }
	                    }
	              }
	         }
	      
	$(function(){
		$("#replyInsert").hide();
		replyList();
		
		replyCount();
		
	      //현재시간을 가져옴
	      console.log(writeDay);
	      console.log(twriteDay);
	      
	      if(wDate != uDate && status != '처리완료') timeBefore();

		
	});
	
	$("#plusReply").on("click",function(){
		insert();
	});
	
	function insert(){
		$("#replyInsert").toggle();
	}
	
	
     
   
</script>
</body>
</html>