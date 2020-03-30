<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page import="com.kh.ojungFinal.notice.model.vo.NoticeView"%>
<%@page import="com.kh.ojungFinal.notice.model.vo.NoticeFile"%>
<%@page import="com.kh.ojungFinal.notice.model.vo.NoticeReply"%>
<%
	NoticeView noticeView = (NoticeView) request.getAttribute("noticeView");
	NoticeFile noticeFile = (NoticeFile) request.getAttribute("noticeFile");
	NoticeFile noticeReply = (NoticeFile) request.getAttribute("noticeReply");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 부서게시판 상세보기</title>
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
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>

</head>
<style>
.form-control-sm {
	height: calc(1.8125rem + 2px);
	padding: .25rem .5rem;
	font-size: .875rem;
	line-height: 1.5;
	border-radius: .2rem;
}

.form-control {
	display: block;
	width: 95%;
	height: calc(2.25rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	box-shadow: inset 0 0 0 transparent;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
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
					<div class="row mb-2"></div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Default box -->
				<div class="card card-outline">
					<div class="card-header bg-navy">
						<h3 class="card-title">공지사항 상세</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-header" style="padding-bottom: 0px;">
						<span style="font-weight: bold;">[${noticeView.noticeName }]</span>&nbsp;&nbsp;<span>${noticeView.noticeTitle }</span>

						<p style="padding-top: 10px; margin-bottom: 10px;">
							<h7>작성자 : ${noticeView.memberName}</h7>
						</p>
					</div>

					<div class="card-body"
						style="padding-top: 10px; padding-bottom: 0px;">
						<p style="margin-bottom: 0px;">
							작성일 : ${noticeView.noticeUpdateDate} <span class="float-right">조회수:
								${noticeView.noticeCount }</span>
						</p>
					</div>
					<div class="card-body"
						style="padding-top: 5px; padding-bottom: 0px;">

						<p class="tesxt-secondary" style="padding-top: 10px;">
							첨부파일 :
							<c:if test="${empty files}">
		                     		등록된 파일이 없습니다.
		                    </c:if>
							<c:forEach var="files" items="${files}">
								<c:if
									test="${files.fileOriginName  != '' || files.fileOriginName ne null}">
									<c:set var="formatString" value="${files.fileOriginName}" />

									<a
										href="${contextPath}/resources/uploadFiles/${files.fileChangeName}"
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
										</c:choose> ${files.fileOriginName}
									</a> &nbsp;
                     			</c:if>
							</c:forEach>
						</p>
						<br>
					</div>
					<hr style="margin: 0px;">
					<br>
					<div class="card-body" style="height: 500px;">${noticeView.noticeContent }</div>

					<!-- /.card-body -->
					<div class="card-footer">

						<c:if
							test="${loginMember != null && noticeView.memberNo == loginMember.memberNo}">
							<button class="btn btn-danger btn-sm float-sm-right m-2"
								id="deleteBtn">
								<i class="fas fa-trash"> </i> 삭제
							</button>
							<a class="btn btn-info btn-sm float-sm-right m-2"
								href="updateForm?no=${noticeView.noticeNo}"> <i
								class="fas fa-pencil-alt "> </i> 수정
							</a>
						</c:if>

						<a class="btn btn-default btn-sm float-sm-right m-2"
							href="noticeList"> <i class="fas fa-share "></i> 목록으로
						</a>
					</div>
					<!-- /.card-footer-->
			</section>
			<!-- /.content -->
			<!-- Timelime example  -->
			<div class="row">
				<div class="col-md-12">
					<!-- The time line -->
					<span class="badge badge-secondary mb-5 ml-3"
						style="display: inline-block;" id="replyCount"></span>
					<!-- 댓글 등록 +버튼 클릭시 작성영역 나타남 -->
					<span id="messageArea" class="timeline-item"
						style="text-align: center;"></span>

					<div class="timeline" id="timeline">
						<!-- timeline item -->
						<!-- 작성된 댓글 영역 -->
						<!-- 댓글 영역이 null이 아닐경우 반복하여 출력한다. -->

					</div>
					<!-- END timeline item -->

					<!-- 댓글 작성 영역 -->
					<div class="timeline">
						<div id="replyInsert">
							<i class="fas fa-code bg-yellow"></i>
							<div class="timeline-item">
								<span class="time" id="writeTime"> </span>
								<div class="timeline-header">
									<textarea style="width: 100%; height: 100%" id="replyContent"></textarea>
								</div>
								<div class="timeline-header" style="height: 30px">
									<a id="insertReply"> <i class="fa fa-check float-right"
										style="width: 50px"></i>
									</a> <a id="remove"> <i class="fa fa-eraser float-right"
										style="width: 50px"></i>									</a>
								</div>
							</div>
						</div>
						</div>
						<div class="timeline-item" style="height: 60px">

							<i class="fa fa-pen float-right pb-3 pt-3 pr-0" id="plusReply"
								style="width: 50px;"></i> <span><strong
								class="float-right pb-3 pt-3 pr-3" id="plusReply">댓글 등록</strong></span>
						</div>
					</div>
				</div>
				<!-- /.card -->

			</div>
			<jsp:include page="../common/footer.jsp" />
			<!-- /.content-wrapper -->
			<!-- ./wrapper -->

			<!-- REQUIRED SCRIPTS -->

			<!-- Bootstrap -->
			<script
				src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- AdminLTE -->
			<script
				src="<%=request.getContextPath()%>/resources/dist/js/adminlte.js"></script>

			<!-- OPTIONAL SCRIPTS -->
			<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/dist/js/pages/dashboard3.js"></script>



			<script>
		$("#deleteBtn").on("click",function(){
			if(confirm("정말 삭제 하시겠습니까?")) location.href = "delete?no=${noticeView.noticeNo}";
		});
		
		
		// 댓글 등록 버튼 동작
		$(function(){
				$("#replyInsert").hide();
				replyList();
				
				replyCount();
				
			});
			
			$("#plusReply").on("click",function(){
				insert();
			});
			
			function insert(){
				$("#replyInsert").toggle();
			}
			


		$("#insertReply").on("click",function(){
			var noticeReplyContent = $("#replyContent").val();
			var noticeNo = ${noticeView.noticeNo}
			var memberNo = ${loginMember.memberNo}
			var obj={"noticeReplyContent":noticeReplyContent,"noticeNo":noticeNo, "memberNo":memberNo}
			console.log(noticeReplyContent);
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
			            replyList();
			            replyCount();
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
		
		
		function replyCount(){
			var noticeNo = "${noticeView.noticeNo}";
			$.ajax({
				url : "replyCount",
				type : "POST",
				data : {"noticeNo" : noticeNo},
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
		
		
		
		
		//var replyNo = "";
		// 댓글 목록 출력
		function replyList(){
			var noticeNo = "${noticeView.noticeNo}";
			
			$.ajax({
				url : "replyList",
				type : "POST",
				data : {"noticeNo" : noticeNo},
				dataType : "json", 
				success : function(replyList){
					
					var $messageArea = $("#messageArea");
					
					// 등록된 댓글이 없는 경우 
					if(replyList == "" ){ 
						
						$messageArea.html("등록된 댓글이 없습니다.");
						$("#timeline").hide();
						
					}else{
						// 댓글 등록 성공하고, 등록된 댓글이 있는 경우
						
						$messageArea.html(""); // 기존 댓글 목록 삭제
						
						var html = "";
						
						for(i=0; i<replyList.length; i++){
							var memberNo = ${loginMember.memberNo};
							var writeNo = replyList[i].memberNo;
							var noticeReplyNo = replyList[i].noticeReplyNo;
							//console.log(i + "번째 댓글번호 : " + replyNo);
							
							 html += "<div id='replyList' class='replyList'><i class='fas fa-user bg-green'></i> <div class='timeline-item'><span class='time'><i class='fas fa-clock' id='writeTime'></i>";
		                     html += replyList[i].noticeReplyModifyDate + "</span>";
		                     html += "<h3 class='timeline-header'><a id='memberName'>";
		                     html += replyList[i].memberName + "</a>";
		                     html += "</h3><div class='card-body' id='content'>";
		                     html += replyList[i].noticeReplyContent;
							
							if (memberNo == writeNo){ // 작성자와 로그인멤버가 같은경우만 수정/삭제버튼 보임
								html += "<span><i class='fa fa-trash float-right' id='replyDelete' ></i>";
								html += "<i class='fa fa-edit float-right editForm mr-4' id='replyEdit' ></i>";
								}
							html += "</div>";//content
							html += "<div style='display:none' >"+ noticeReplyNo + "</div>";
							html +="</div></div>";
							html +="</div>";//replyList
							
							}; // for
						
						$("#timeline").html(html);
							
					}//else
					
					
				}, 
				error : function(){
					console.log("댓글 목록 조회 ajax 호출 실패");
				}
				
			});
			
			

			
			
		}//replyList()
		
			$(document).on("click", "#replyDelete", function (){
				// 댓글 삭제 버튼 클릭시 컨펌창 띄우기
				noticeReplyNo =  $(this).parent().parent().next().text();
				//console.log("삭제버튼 클릭했음");
				console.log("삭제 버튼 클릭시 전달받은 댓번호 : " + noticeReplyNo);
				var msg = confirm("댓글을 삭제하시겠습니까?");
				if (msg == true){
					 replyDelete();
				}else{
					return false;
				}
			});
			
			
		      function replyDelete(){
		          
		          $.ajax({
		                 type:'POST',
		                 url : "deleteReply",
		                 data:{"noticeReplyNo":noticeReplyNo},
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
		      }

		      
				// 수정 폼 가져오기 
				var preContent="";
				
				$(document).on("click",".editForm",function(){
					// 수정폼 안에 이전 댓글 내용 삽입.
					var str =($(this).parent().parent().text());
					preContent = str;
					
					var $amond = $("<textarea>").css("resize","none");
					$amond.text(preContent).css("width","100%");
					
					
					noticeReplyNo =  $(this).parent().parent().next().text();
					console.log("수정폼에서 읽혀진 댓글 번호 : " + noticeReplyNo)
					
					// 댓글 수정 완료하기 / 지우기 버튼
					
					var $rDiv = $("<span>");
					var $die = $("<i>");
					var $honey = $("<i>");
					
					
					$die.prop({"class":"fa fa-check replySave float-right replySave"});
					$honey.prop({"class":"fa fa-eraser removeContent float-right mr-4"});
					
					$(this).parent().parent().html($amond).append($rDiv,$die,$honey);
					//console.log($amond.val());
					console.log("수정폼 불러올 때 보여지는 이전 댓글 내용 : " + preContent);
				
					$(".removeContent").on("click",function(){
						var html="";
			            html += "<div>";
			            html += preContent;
						html += "<span><i class='fa fa-trash float-right' id='replyDelete' ></i>";
						html += "<i class='fa fa-edit float-right editForm mr-4' id='replyEdit' ></i></div>";
						html += "<div style='display:none' >"+ noticeReplyNo + "</div>";
						$(this).parent().html(html);
						//replyNo = $(this).parent().parent().next().text();
						console.log("removeContent 클릭시 replyNo : " + noticeReplyNo);
					});
					
					 $(".replySave").on("click", function(){
						 noticeReplyContent = $(this).parent().children().val();
				    	  console.log("수정버튼 완료 클릭시 noticeReplyNo : " + $(this).parent().parent().next().text());
				    	  console.log("수정버튼 완료 클릭시 전달된 댓글번호 :" + noticeReplyNo);
				    	  console.log("수정버튼 완료 클릭시 전달된 내용 : " + noticeReplyContent);
				    	  
				    	  var obj ={"noticeReplyNo":noticeReplyNo, "noticeReplyContent":noticeReplyContent};
				    	  
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
							            replyCount();
							            }else{
							            	alert("댓글 수정 실패되었습니다.");
							            }
							        },
							        error:function(){
							            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							            console.log("수정 실패");
							       }
							        
							    });
				      });
					
				});
				
		$(document).on("click","#remove",function(){
			// 인서트 동작에서 리무브(지우개 아이콘) 클릭시.
			$("#replyContent").val("");
			$("#replyInsert").hide();
		});
		
		</script>
</body>
</html>