<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>

</head>
<body>
	<c:if test="${!empty msg}">
		<script>
			alert("${msg}")
		</script>
		<c:remove var="msg" />
	</c:if>
	<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath() %>" class="brand-link">
      <img src="${contextPath}/resources/images/ojung.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">(주) 오정상사</span>
    </a>



<!--   ************** 사이드바 메뉴 ***************** -->



    <!-- Sidebar -->
    <div class="sidebar" >
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      
      
      <c:set var="src" value="${contextPath}/resources/images/woman.png" />
      
			<c:if test="${profileImg.memberNo == loginMember.memberNo}">
         	<c:set var="src" value="${contextPath}/resources/uploadFiles/${profileImg.imageChangeName}" />
     		</c:if>
      
        <div class="image">
          <img src="${src}" class="img-circle elevation-2" alt="User Image">
        </div>
        
        <div class="info">
        <c:if test="${! empty sessionScope.loginMember }">
          <a href="#" class="d-block"> ${sessionScope.loginMember.memberName }님 환영합니다. </a>
          <button class="btn btn-block btn-outline-secondary" onclick='location.href="<%=request.getContextPath()%>/admin/logout"'>로그아웃</button>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <button class="bg-danger elevation-2" id="in" <c:if test="${!empty attendance.inTime}">disabled</c:if> >출근</button>
          <button class="bg-gray elevation-2" id="out" <c:if test="${!empty attendance.outTime}">disabled</c:if> >퇴근</button>
         </c:if>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
      
          <li class="nav-item">
            <a href="<%=request.getContextPath() %>/member/profileMember" class="nav-link">
              <i class="far fa-address-card nav-icon"></i>
              <p>내 정보</p>
            </a>
          </li>

          <li class="nav-item">
            <a href="<%=request.getContextPath() %>/calender/calender" class="nav-link">
              <i class="nav-icon fas fa-calendar-alt"></i>
              <p>
                일정
                <!-- <span class="badge badge-info right">2</span> -->
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="<%=request.getContextPath() %>/mail/mailbox" class="nav-link" id="tool">
              <i class="nav-icon far fa-envelope"></i>
              <label>메일</label>
              <span data-toggle="tooltip" title="New Messages" class="badge bg-primary mailAlert"></span>
            </a>
          </li>


          <li class="nav-item">
            <a href="<%=request.getContextPath() %>/notice/noticeList" class="nav-link">
              <i class="far fa-check-circle nav-icon"></i>
              <p> 공지사항 </p>
            </a>
          </li>

		
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="fas fa-desktop nav-icon"></i>
              <p>전자결재 </p>
              <i class="fas fa-angle-left right"></i>
            </a>
             <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath() %>/electronicSign/electronicSignList_drafter" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>결재 받을 문서(내가 기안자)</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath() %>/electronicSign/electronicSignList_payer" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>결재 할 문서(내가 결재자)</p>
                </a>
              </li>
              </ul>
          </li>

          <li class="nav-item">
            <a href="<%=request.getContextPath() %>/departmentBoard/departmentBoardList" class="nav-link">
              <i class="fas fa-stream nav-icon"></i>
              <p> 부서 게시판 </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="<%=request.getContextPath() %>/collaboBoard/collaboBoardList" class="nav-link">
              <i class="fas fa-stream nav-icon"></i>
              <p> 협업 게시판 </p>
            </a>
          </li>

          <c:if test="${sessionScope.loginMember.memberGrade == 2 }">
          <li class="nav-item"> 
            <a href="<%=request.getContextPath() %>/admin/list" class="nav-link">
              <i class="far fa-address-book nav-icon"></i>
              <p> 사원 관리  </p>
            </a>
          </li>
		  </c:if>	

       

 
            <!-- 게시판 글쓰기 시 이동해야할듯 게시판 안에서 필요-->
            <!-- <li class="nav-item">
              <a href="pages/forms/editors.html" class="nav-link">
                <i class="nav-icon fas fa-edit"></i>
                <p>글쓰기</p>
              </a>
          </li> -->

   

      
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
<script>
	$("#in").on("click",function(){
		$.ajax({
			url : "inTime",
			type : "POST",
			success : function(result){
				var msg1;
				console.log("ajax 통신 성공");
				
				switch(result){
				case 0 : 
					msg1 = "출근 시간 기록 실패 - 관리자에게 문의";
					break;
				case 1 : 
					msg1 = "출근 시간 기록";
					$("#in").prop('disabled',true);
					$("#in").unbind('hover');
					break;
				case -1 : 
					msg1 = "출근 시간 기록 중 오류 발생";
					break;
				}
				alert(msg1);
				
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	
	$("#out").on("click",function(){
		$.ajax({
			url : "outTime",
			type : "POST",
			success : function(result){
				var msg1;
				console.log("ajax 통신 성공");
				
				switch(result){
				case 0 : 
					msg1 = "퇴근 시간 기록 실패 - 관리자에게 문의";
					break;
				case 1 : 
					msg1 = "퇴근 시간 기록";
					$("#out").prop('disabled',true);
					break;
				case -1 : 
					msg1 = "퇴근 시간 기록 중 오류 발생";
					break;
				}
				alert(msg1);
				
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	
	
 	function insertMail(){
		var url = location.protocol + location.host + "/../../mail/insertMailList";
		
		$.ajax({
			url : url,
			type : "GET",
			dataType : "json",
			success : function(result){
				
				switch(result){
				case 0 : 
					console.log( "insert 실패 ");
					break;
				case 1 : 
					console.log( "insert 성공 ");
					break;
				}
			}
		});
	}
	
 	$(function(){
		insertMail();
		
		setInterval(function(){
			insertMail();
		}, 30000);
	});  
	
	
	var wsUri = "ws://localhost:8080/ojungFinal/mailAlert";
	function sendMessage(){
		websocket = new WebSocket(wsUri);
		websocket.onopen = function(evt){
			onOpen(evt);
		};
		
		websocket.onmessage = function(evt){
			onMessage(evt);
			//if(evt) alert("0 입니다.");
			
			insertMail();
		};
		
		websocket.onerror = function(evt){
			onError(evt);
		};
	}
	
	function onOpen(evt){
		var str = ${sessionScope.loginMember.memberNo };
		console.log('================ sessionscope memberNo ::: '+str);
		websocket.send(str);
		
	}
	function onMessage(evt){
		console.log("소켓테스트 ==== 새 메일 알림 갯수 : " + evt.data);
		var alert = evt.data;
		
		if(alert != 0 ){
			
			
		$(".mailAlert").css("display","inline").text(alert);
//			var $span = $("<span>").prop("data-toggle","tooltip").prop("title","New Messages").prop("class", "badge bg-primary mailAlert").text(alert);
//			$("#tool").append($span);
			
		}
	}
	
	function onError(evt){
		
	}
	
	$(function(){
		$(".mailAlert").css("display","none");

		insertMail()
		sendMessage();
	});
</script>

</body>
</html>