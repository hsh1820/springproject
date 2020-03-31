<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>(주) 오정상사 그룹웨어 - 채팅</title>
<!-- jQuery -->
   <script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

	
 <style>
 .direct-chat-text{
 	position: absolute;
 }
 .right-txt{
 	    right: 2%;
 }
 .left-txt{
 	    left: 2%;
 }
    .direct-chat-primary .right>.direct-chat-text::after,
    .direct-chat-primary .right>.direct-chat-text::before {
      border-left-color: rgb(52, 58, 64);
    }

    .direct-chat-primary .right>.direct-chat-text {
      background: rgb(52, 58, 64);
      border-color: rgb(52, 58, 64);
    }

    .bg-primary {
      background-color: rgb(255, 0, 0) !important;
    }

    .bg-primary-top {
      background-color: rgb(52, 58, 64) !important;
      color: white;
      font-size: 13px;
    }

    .btn-primary {
      color: #fff;
      background-color: rgb(52, 58, 64);
      border-color: rgb(52, 58, 64);
      box-shadow: none;
    }

    .btn-primary:hover {
      color: #fff;
      background-color: black;
      border-color: black;
    }

    .btn-primary:not(:disabled):not(.disabled).active,
    .btn-primary:not(:disabled):not(.disabled):active,
    .show>.btn-primary.dropdown-toggle {
      color: #fff;
      background-color: black;
      border-color: black;
    }
    .info-box {
      background-color: #001f3f !important;
    }

    .info-box::-webkit-scrollbar{width: 16px;}
      .info-box::-webkit-scrollbar-track {background-color: #001f3f;}
      .info-box::-webkit-scrollbar-thumb {background-color:rgb(24, 27, 29)}
      .info-box::-webkit-scrollbar-thumb:hover {background: rgb(52, 58, 64)}
      .info-box::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
      width:16px;height:16px;background:#001f3f;} 

  </style>


<body class="hold-transition sidebar-mini">
   <div class="wrapper">

      <jsp:include page="../common/nav.jsp" />
      <jsp:include page="../common/sidebar.jsp" />
      <input type="hidden" id="userEmail"
         value="${loginMember.memberEmail }">
      <!-- 유저이메일 -->
      <input type="hidden" id="userName" value="${loginMember.memberName }">
      <!-- 유저이름 -->
      <input type="hidden" id="room" value="${room }">
      <!-- 현재 유저가 접속한 방이름 -->

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

         

         
         <!-- 인원수 증가, 감소 버튼 클릭시, 실행되는 스크립트 -->
         <script type="text/javascript">
            function count_back() {
               var count = $("#count").val();
               count = (Number(count) - 1);
               if (count >= 2) {
                  $("#count").val(count);
               }
            };
            function count_next() {
               var count = $("#count").val();
               count = (Number(count) + 1);
               if ($("#count").val() < 30) {
                  $("#count").val(count);
               }
            };
         </script>

         <!-- 접속자 명단에서 아이디 클릭 시 귓속말에 바로 세팅 -->
         <script type="text/javascript">
            function insertWisper(id) {
               if ($("#userName").val() == id) {
                  alert("본인에게는 귓속말을 할 수 없습니다.");
               } else {
                  $("#wisper").val(id);
               }

            }
         </script>

         <script type="text/javascript">
            $("#wisper").click(function() {
               $("#wisper").val("");
            });
         </script>


         <!-- Main content -->
         <div class="content">
            <div class="container-fluid" style="padding-left: 60px;">
               <!-- Direct Chat -->
               <div class="row">
                  <div class="col-md-10">
                     <!-- DIRECT CHAT PRIMARY -->
                     <div
                        class="card card-prirary cardutline direct-chat direct-chat-primary"
                        style="height: 800px;">
                        <div class="card-header bg-navy">
                           <h3 class="card-title" id="curroomName">
                              <c:if test="${room == 'all'}">전체 채팅방</c:if>
                              <c:if test="${room != 'all'}">${room}</c:if>
                           </h3>

                           <div class="card-tools">
                              <span data-toggle="tooltip" title="New Messages"
                                 class="badge bg-primary">3</span>
                              <button type="button" class="btn btn-tool"
                                 data-card-widget="collapse">
                                 <i class="fas fa-minus"></i>
                              </button>
                              <button type="button" class="btn btn-tool"
                                 data-toggle="tooltip" title="Contacts"
                                 data-widget="chat-pane-toggle">
                                 <i class="fas fa-comments"></i>
                              </button>
                              <button type="button" class="btn btn-tool"
                                 data-card-widget="remove">
                                 <i class="fas fa-times"></i>
                              </button>
                           </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                           <!-- Conversations are loaded here -->
                           <div class="direct-chat-messages" style="height: 680px ; width:95%; overflow-x:hidden;"
                              id="output">
                              
                              <c:forEach var = "i" items="${msgList}" >
	                              <c:forEach var = "each" items="${i}" varStatus="vs">
	                              <c:choose>
	                              	<c:when test="${vs.index == 0}">
	                              		<c:set var="chatContent" value="${each}"/>
	                              	</c:when>
	                              	<c:when  test="${vs.index == 1}"> <!-- 귓속말 -->
	                              		<c:set var="whisper" value="${each }"/>
	                              	</c:when>
	                              	<c:when test="${vs.index == 2}">
	                              		<c:set var="roomName" value="${each }"/>
	                              	</c:when>
	                              	<c:when test="${vs.index == 3}">
	                              		<c:set var="sendTime" value="${each }"/>
	                              	</c:when>
	                              	<c:when test="${vs.index == 4}">
	                              		<c:set var="writer" value="${each }"/>
	                              	</c:when>
	                              </c:choose>
	                              </c:forEach>
                              
                              
                              
                              <c:choose>
                              	<c:when test="${whisper != 'emp' && writer != loginMember.memberName}}">
                              		<!-- 귓속말 -->
                              		<a href='#none' onclick="insertWisper('${writer  }')">
									<i class='user icon'></i>
									<b style='color:green'>[${writer }]</b></a>님의 귓속말 : ${chatContent }&nbsp;
									${sendTime } 에 보냄 
									<br>  
                              	</c:when>
                              	<c:when test="${whisper != 'emp' && writer == loginMember.memberName}" >
                              	<!-- 내가 상대에게 보낸 귓속말 -->
                              	<i class='user icon'></i>
								<b style='color:blue'>[${loginMember.memberName}]</b> : 
								[<b style='color:green'>
								${whisper }
								</b>]님에게귓속말 : 
								${chatContent }
								&nbsp;
								${sendTime }
								 에 보냄 
								<br>   
                              	</c:when>
                              	
                              	<c:when test="${loginMember.memberName == writer}">
	                              	<div class='direct-chat-msg right'>
									<div class='direct-chat-infos clearfix'>
									<span class='direct-chat-name float-right'>
									 ${loginMember.memberName}
									</span>
									<span class='direct-chat-timestamp float-right'> ${sendTime } </span></div>
									<img class='direct-chat-img' src='${contextPath}/resources/dist/img/user3-128x128.jpg'>
									<div class='direct-chat-text right-txt'>
									 ${chatContent }
									</div></div>
                              	</c:when>
                              	
                              	<c:when test="${loginMember.memberName != writer}">
                              		<!-- 왼쪽 말풍선 -->
                              		<div class="direct-chat-msg"> 
									<div class="direct-chat-infos clearfix"> 
									<span class="direct-chat-name float-left">
									<a href='#none' onclick="insertWisper('name')">${writer }</a>
									</span>  
									<span class="direct-chat-timestamp float-left"> ${sendTime } </span></div>  
									<img class="direct-chat-img" src="${contextPath}/resources/dist/img/user1-128x128.jpg" alt="Message User Image">
									<div class="direct-chat-text left-txt">  
									${chatContent }  </div></div>
									
                              	</c:when>
                              	<c:otherwise>
                              	</c:otherwise>
                              	</c:choose>
                              	</c:forEach>
                           </div>
                              <!-- Message. Default to the left -->

                              <!-- /.direct-chat-msg -->
                           
                           <!--/.direct-chat-messages-->

                           <%-- <!-- Contacts are loaded here -->
                           <div class="direct-chat-contacts"  style="margin-left:0px; " >
                              <ul class="contacts-list">
                                 <li><a href="#"> <img class="contacts-list-img"
                                       src="<%=request.getContextPath()%>/resources/dist/img/user1-128x128.jpg">
                                       <div class="contacts-list-info">
                                          <span class="contacts-list-name"> Count Dracula <small
                                             class="contacts-list-date float-right">2/28/2015</small>
                                          </span> <span class="contacts-list-msg">How have you been?
                                             I was...</span>
                                          
                                       </div> <!-- /.contacts-list-info -->
                                 </a></li>
                                 <!-- End Contact Item -->
                              </ul>
                              <!-- /.contatcts-list -->
                           </div> --%>
                           
                           <!-- /.direct-chat-pane -->
                        </div>
                        <!-- /.card-body -->
                        <div class="row">
                        <div class="form-group col-md-12 ml-2">
                              <input type="text" id="wisper" value="" placeholder="귓속말 대상" name="who" class="form-control-row col-md-2" 
                              style="height:40px;"> 
                              
                              <input type="text" placeholder="Type Message ..."
                              class="form-control-row col-md-9" id="textID" name="chatInput" style="height:40px;">
                              
                              <input type="button"
                              class="btn btn-primary form-control-row" id="buttonMessage" value="send" style="width:100px; height:40px;">
                           
                        </div>
                     </div>
                     <!-- /.card-footer-->
                  </div>
                  
                  <!--/.direct-chat -->
               </div>
               <!-- /.card-footer -->
               <!-- /.col -->
               <div class="col-md-2" style="float:right">
                  <!-- /.card-footer -->

                  <form action="MoveChatRoom.do" method="post" id="moveChatForm">
                     <input type="hidden" name="roomName" value="">
                     <div class="info-box bg-navy"
                        style="overflow: scroll; height: 265px;" id="room">
                        <!-- 전체 채팅방 -->
                        <div class="info-box-content" id="getRoomList"></div>
                     </div>
                  </form>

                  <div class="input-group">
                     <input type="text" name="message" placeholder="방 제목"
                        class="form-control" id="searchRoomText"> <span
                        class="input-group-append"> <input type="button"
                        class="btn btn-primary" value="search" id="searchRoomBtn">
                     </span>
                  </div>
                  <br>
                  <div class="row">
                     <div class="col-md-12" style="padding: 10px; padding-top: 0;">
                        <input type="button" class="btn btn-outline-info" value="방 만들기"
                           id="createRoom"> <input type="button"
                           class="btn btn-outline-info" value="전체 방으로" id="backBtn">
                     </div>
                  </div>
                  <div class="card card-primary" style="height: 370px;">
                     <div class="card-header bg-navy"
                        style="height: 30px; font-size: 8px; padding: 8px;">
                        <h3 class="card-title" id="cardTitle">접속 인원</h3>

                        <div class="card-tools">
                           <button type="button" class="btn btn-tool"
                              data-card-widget="collapse">
                              <i class="fas fa-minus"></i>
                           </button>
                        </div>
                        <!-- /.card-tools -->
                     </div>
                     <!-- /.card-header -->
                     <div class="card-body"
                        style="height: 150px; padding: 5px; overflow: scroll;"
                        id="listPeople"></div>
                     <div class="card-body"
                        style="height: 150px; padding: 5px; overflow: scroll; display: none;"
                        id="showCreateRoom">
                        <!-- 방만들기 form이용 -->

                        <form action="createChatRoom.do" method="post" id="createForm">
                           <!-- hidden 정보  -->
                           <input type="hidden" id="chkRoomName" value="">
                           <!-- 방 제목 중복 확인 여부 -->

                           <!-- 방 만들기 버튼 클릭 시, 보여짐 -->

                           <!-- 방만들기 테이블 -->
                           <table style="width: 100%; height: 100%">
                              <col width="80px">
                              <!-- 방제목 -->
                              <tr style="padding: 1px; margin: 1px">
                                 <th>방제목</th>
                                 <td><input type="text" name="name" id="chkRoomName" placeholder="방이름"
                                    size="8" class="form-control"
                                    style="font-weight: bold; width: 100%; height: 15px">
                                 </td>
                              </tr>

                              <!-- 비밀번호 -->
                              <tr>
                                 <th>비밀번호</th>
                                 <td><input type="text" name="pwd" placeholder="방 비밀번호"
                                    size="8" class="form-control"
                                    style="font-weight: bold; width: 100%; height: 15px"
                                    title="작성하지않을시 공개방으로 생성됩니다"></td>
                              </tr>

                              <!-- 참여 인원 -->
                              <tr>
                                 <th>참여인원</th>
                                 <td><i
                                       class="fas fa-minus float-left" onclick="count_back()"
                                       title="1명 감소"></i> <input type="text" name="totalCount"
                                    value="4" size="2" readonly="readonly" id="count"
                                    class="form-control float-left"
                                    style="height: 15px; font-weight: bold; width: 50px;">

                                    <i class="fas fa-plus float-left"
                                       onclick="count_next()" title="1명 증가"></i></td>
                              </tr>
                              <!-- 내용 입력 -->
                              <tr>
                                 <th>내용</th>
                                 <td><input type="text" name="content" placeholder="내용"
                                    class="form-control"
                                    style="font-weight: bold; width: 100%; height: 15px">
                                 </td>
                              </tr>
                              <!-- 버튼 처리 -->
                           </table>

                           <div class="row">
                              <div class="col-md-12" style="padding: 10px; padding-top: 0;">
                                 <input type="button" id="submitBtn" value="방만들기"
                                    class="btn btn-secondary btn-sm " style="width: 100px;">
                                 <input type="button" id="backBtn" value="돌아가기"
                                    class="btn btn-secondary btn-sm" style="width: 100px;">
                              </div>
                           </div>
                        </form>
                     </div>
                     <!-- /.card-body -->
                  </div>
                  <!-- /.card -->
               </div>
               <!-- /.card -->
            </div>

            <!-- /.card -->

         </div>
         <!-- /.col -->
         <!-- /.row -->
         <!-- /.content -->
      </div>
   </div>
      
   <jsp:include page="../common/footer.jsp"/>
   </div>


   <!-- ./wrapper -->

   <!-- REQUIRED SCRIPTS -->

   
   <!-- Bootstrap -->
   <script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE -->
   <script
      src="<%=request.getContextPath()%>/resources/dist/js/adminlte.js"></script>

   <!-- OPTIONAL SCRIPTS -->
   <script
      src="<%=request.getContextPath()%>/resources/plugins/chart.js/Chart.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
   <script
      src="<%=request.getContextPath()%>/resources/dist/js/pages/dashboard3.js"></script>

<!-- 방제목 중복확인 -->
         <script type="text/javascript">
            $("[name='name']").blur(function() {
                var name = $("[name='name']").val();
                
               if (name != "") {
                  $.ajax({
                     type : "post",
                     url : "checkRoom.do",
                     async : true,
                     data : "name=" + name,
                     success : function(msg) {
                        if (msg == "1") {
                           alert("생성 가능한 방이름 입니다.");
                           $("#chkRoomName").val(name);
                        } else if (msg == "0") {
                           alert("이미 존재하는 방이름 입니다.");
                           $("[name='name']").val("");
                           $("[name='name']").focus();

                        }
                     },
                     error : function(){
                    	 console.log('방이름 중복검사 ajax 실패');
                     }
                  });

               } 
            });
         </script>
         <script type="text/javascript">
            var sock = null;
            var grade = '${loginMember.memberGrade}';
            var memberName = '${loginMember.memberName}';
            var now = new Date();
            var fm = now.getHours();
            var sentDate = "";
            
            if(fm > 12) fm = "오후 " + (fm-12);
            else fm = "오전 " + fm;
            
            sentDate = fm + ":"+ now.getMinutes() + ":" + now.getSeconds();
            
            $(document).ready(function() {
                		   /* if($("#room").val() == "all"){
                			   $.ajax({
                				   url : "readMsg",
                				   dataType : "json",
                				   type : "post",
                				   success : function(){
                					   
                				   },
                				   error : function(){
                					   console.log("readMsg ajax 통신 실패 ");
                				   }
                				   
                			   });
                		   }        	 */
            	
            	
                           $("#textID").focus();// 처음 접속시 메세지입력창에 focus

                           // 서버로 접속 할 때는 localhost로 설정해줘야됨(관리자)
                           // 본인 서버로 접속 할 경우, admin으로 들어가야만 채팅가능하다.
                           if (grade == 2) {/* 관리자 : 2 */
                              ws = new WebSocket(
                                    "ws://localhost:8080/ojungFinal/echo.do");
                           }
                           // 그 외 회원은 admin을 제외한 다른 아이디로 접속 시, 채팅참여가 가능하다.
                           else {
                              ws = new WebSocket(
                                    "ws://localhost:8080/ojungFinal/echo.do");
                           }

                           // 서버로 메세지 보낼 때
                           ws.onopen = function() {
                        	   
                              // 처음 접속 시에만 채팅방에 추가함(현재 방정보도 같이 출력)
                              $("#output")
                                    .append(
                                          "<div style='text-align:center;color:#ced4da;'><span class=\"direct-chat-name\">"
                                                + $('#room')
                                                      .val()
                                                + " 채팅방에 참여했습니다.</span></div>");
                              //보내기 버튼 눌렀을때
                              $("#buttonMessage")
                                    .click(
                                          function() {
                                             console
                                                   .log($(
                                                         'input[name=chatInput]')
                                                         .val());
                                             var msg = $(
                                                   'input[name=chatInput]')
                                                   .val()
                                                   .trim("!%/"); //메시지

                                             var wisper = $(
                                                   "#wisper")
                                                   .val()
                                                   .trim("!%/"); //귓속말 대상자

                                             var room = $(
                                                   "#room")
                                                   .val()
                                                   .trim("!%/"); //방이름(전체단톡방이면 all)

                                             //전체에게 보낼때
                                             if (wisper == ""
                                                   && msg != "") {
                                                //소켓으로 메세지 전달
                                                ws.send(msg
                                                      + "!%/"
                                                      + ""
                                                      + "!%/"
                                                      + room
                                                      + "!%/"
                                                      + sentDate);
                                                $("#output")
                                                      .append(
                                                            "<div class='direct-chat-msg right'>"
                                                                  + "<div class='direct-chat-infos clearfix'>"
                                                                  + "<span class='direct-chat-name float-right'>"
                                                                  + memberName
                                                                  + "</span>"
                                                                  + "<span class='direct-chat-timestamp float-right'>"+ sentDate +"</span></div>"
                                                                  + "<img class='direct-chat-img' src='${contextPath}/resources/dist/img/user3-128x128.jpg'>"
                                                                  + "<div class='direct-chat-text right-txt'>"
                                                                  + msg
                                                                  + "</div></div>");

                                                $("#output")
                                                      .scrollTop(
                                                            99999999); //글 입력 시 무조건 하단으로 보냄
                                                $("#textID")
                                                      .val(""); //입력창 내용지우기
                                                $("#textID")
                                                      .focus(); //입력창 포커스 획득
                                             }
                                             //귓속말
                                             else if (wisper != ""
                                                   && msg != "") {
                                                //본인에게 보낼경우
                                                if ($(
                                                      "#userName")
                                                      .val() == wisper) {
                                                   alert("본인에게는 보낼 수 없습니다.");
                                                   $("#wisper")
                                                         .focus();
                                                }
                                                //본인이 아닐 경우에만 메세지 전달
                                                else {
                                                   ws
                                                         .send(msg
                                                               + "!%/"
                                                               + wisper
                                                               + "!%/"
                                                               + room
                                                               + "!%/"
                                                               + sentDate); //현재 메세지 + 귓속말대상 + 방정보   

                                                   $("#output")
                                                         .append(
                                                               "<i class='user icon'></i>"
                                                                     + "<b style='color:blue'>[${loginMember.memberName}]</b> : "
                                                                     + "[<b style='color:green'>"
                                                                     + wisper
                                                                     + "</b>]님에게귓속말 : "
                                                                     + msg
                                                                     + "&nbsp;"
                                                                     + sentDate
                                                                     + " 에 보냄 "
                                                                     + "<br>");
                                                   $("#output")
                                                         .scrollTop(
                                                               99999999);
                                                   $("#textID")
                                                         .val(
                                                               "");
                                                   $("#textID")
                                                         .focus();
                                                }

                                             }

                                          });
                              //엔터키 입력처리
                              $("#textID")
                                    .keypress(
                                          function(event) {
                                             if (event.which == "13") {
                                                event
                                                      .preventDefault();

                                                var msg = $(
                                                      'input[name=chatInput]')
                                                      .val()
                                                      .trim(
                                                            "!%/"); //메시지

                                                var wisper = $(
                                                      "#wisper")
                                                      .val()
                                                      .trim(
                                                            "!%/"); //귓속말 대상자

                                                var room = $(
                                                      "#room")
                                                      .val()
                                                      .trim(
                                                            "!%/"); //방이름(전체단톡방이면 all)

                                                //전체에게 보낼때
                                                if (wisper == ""
                                                      && msg != "") {
                                                   //소켓으로 메세지 전달

                                                   ws
                                                         .send(msg
                                                               + "!%/"
                                                               + ""
                                                               + "!%/"
                                                               + room
                                                               + "!%/"
                                                               + sentDate);
                                                   $("#output")
                                                         .append(
                                                               "<div class='direct-chat-msg right'>"
                                                                     + "<div class='direct-chat-infos clearfix'>"
                                                                     + "<span class='direct-chat-name float-right'>"
                                                                     + memberName
                                                                     + "</span>"
                                                                     + "<span class='direct-chat-timestamp float-right'>"+ sentDate +"</span></div>"
                                                                     + "<img class='direct-chat-img clear:both' src='${contextPath}/resources/dist/img/user3-128x128.jpg'>"
                                                                     + "<div class='direct-chat-text right-txt'>"
                                                                     + msg
                                                                     + "</div></div>");

                                                   $("#output")
                                                         .scrollTop(
                                                               99999999); //글 입력 시 무조건 하단으로 보냄
                                                   $("#textID")
                                                         .val(
                                                               ""); //입력창 내용지우기
                                                   $("#textID")
                                                         .focus(); //입력창 포커스 획득
                                                }
                                                //귓속말
                                                else if (wisper != ""
                                                      && msg != "") {
                                                   //본인에게 보낼경우
                                                   if ($(
                                                         "#userName")
                                                         .val() == wisper) {
                                                      alert("본인에게는 보낼 수 없습니다.");
                                                      $(
                                                            "#wisper")
                                                            .focus();
                                                   }
                                                   //본인이 아닐 경우에만 메세지 전달
                                                   else {
                                                      ws
                                                            .send(msg
                                                                  + "!%/"
                                                                  + wisper
                                                                  + "!%/"
                                                                  + room
                                                                  + "!%/"
                                                                  + sentDate); //현재 메세지 + 귓속말대상 + 방정보   

                                                      $(
                                                            "#output")
                                                            .append(
                                                                  "<i class='user icon'></i>"
                                                                        + "<b style='color:blue'>[${loginMember.memberName}]</b> : "
                                                                        + "[<b style='color:green'>"
                                                                        + wisper
                                                                        + "</b>]님에게귓속말 : "
                                                                        + msg
                                                                        + "&nbsp;"
                                                                        + sentDate
                                                                        + " 에 보냄"
                                                                        + "<br>");
                                                      $(
                                                            "#output")
                                                            .scrollTop(
                                                                  99999999);
                                                      $(
                                                            "#textID")
                                                            .val(
                                                                  "");
                                                      $(
                                                            "#textID")
                                                            .focus();
                                                   }

                                                }
                                             }
                                          });
                              //방만들기
                              $("#createRoom").on(
                                    "click",
                                    function() {
                                       $("#listPeople")
                                             .slideToggle(300);
                                       $("#showCreateRoom")
                                             .slideToggle(300);

                                       var cardTitle = $(
                                             "#cardTitle")
                                             .text();
                                       if (cardTitle == '접속 인원') {
                                          $("#cardTitle").text(
                                                "방 만들기");
                                       } else {
                                          $("#cardTitle").text(
                                                "접속 인원");
                                       }
                                    });

                              /* <!-- 버튼처리 --> */
                              $("#submitBtn")
                                    .click(
                                          function() {
                                             if ($(
                                                   "[name='name']")
                                                   .val().length < 1) {
                                                alert("방제목을 입력하세요");
                                                $(
                                                      "[name='name']")
                                                      .focus();
                                             } else if ($(
                                                   "[name='name']")
                                                   .val() == "all") {
                                                alert("해당 방제목은 사용할 수 없습니다.");
                                             } else if ($(
                                                   "#chkRoomName")
                                                   .val() == "") {
                                            	 alert("이미 존재하는 방입니다.");
                                                $(
                                                      "[name='name']")
                                                      .focus();
                                             } else if ($(
                                                   "[name='content']")
                                                   .val().length < 1) {
                                                alert("방을 설명하기위한 내용을 입력하세요");
                                                $(
                                                      "[name='content']")
                                                      .focus();
                                             } else { 
                                                //form처리
                                                 $("#createForm")
                                                      .attr("target","_self").submit(); 
                                            	}
                                          });

                              $("#backBtn").click(
                                    function() {
                                       $("form").each(function() {
                                          this.reset();
                                       });
                                       $("#listPeople")
                                             .slideToggle(300);
                                       $("#showCreateRoom")
                                             .slideToggle(300);
                                    });

                              //방 검색
                              $("#searchRoomBtn")
                                    .click(
                                          function() {

                                             //검색어
                                             var text = $(
                                                   "#searchRoomText")
                                                   .val()
                                                   .trim(
                                                         "!%/&");
                                             ws.send("!%/&"
                                                   + text);

                                             $("#searchRoomText")
                                                   .val("");

                                          });
                           };
                           //서버로 부터 받은 메세지 보내주기
                           ws.onmessage = function(message) {
                        	   

                              //메세지 
                              var jsonData = JSON.parse(message.data);

                              if (jsonData.message != null) {
                                 $("#output").append(
                                       jsonData.message + "<br>");
                                 $("#output").scrollTop(99999999);
                              }

                              //접속자리스트
                              var jsonData2 = JSON
                                    .parse(message.data);
                              if (jsonData2.list != null) {
                                 $("#listPeople").html(
                                       jsonData2.list);
                              }

                              //방 정보
                              var jsonData3 = JSON
                                    .parse(message.data);
                              if (jsonData3.room != null) {
                                 //alert(jsonData3.room);
                                 var roomSplit = jsonData3.room
                                       .split(',');

                                 var str = "<div class='item'><div class='content'>"
                                       + "<b title='전체채팅방입니다' class= 'chatRoom' "
                                       + "onclick=\"moveRoom('all',0,10000,'null')\">"
                                       + "전체 채팅방</b> (총 "
                                       + roomSplit[0]
                                       + "명 참여)</div></div>";

                                 for (i = 1; i < roomSplit.length; i++) {
                                    var spl = roomSplit[i]
                                          .split("/");

                                    if (spl[0] == '방이 존재하지 않습니다.') {
                                       str += "<div class='item'><div class='content'><b title='방이존재하지않습니다'>"
                                             + spl[0]
                                             + "</b></div></div>";
                                    } else {
                                       //방이름 : spl[0] , 남은인원수 : spl[1] , 전체인원수:spl[2], 방내용:spl[3]
                                       str += "<div class='item'><div class='content'><b title='"
                                             + spl[3]
                                             + "' class='chatRoom' "
                                             + "onclick=\"moveRoom('"
                                             + spl[0]
                                             + "','"
                                             + spl[1]
                                             + "','"
                                             + spl[2]
                                             + "','"
                                             + spl[4]
                                             + "')\"> "
                                             + spl[0]
                                             + "</b> ("
                                             + spl[1]
                                             + "/"
                                             + spl[2]
                                             + ")</div></div>";
                                    }

                                 }

                                 $("#getRoomList").html(str);

                                 //moveRoom(room,remaincount,totalcount,pwd)
                              }

                           };

                           //닫힐때
                           ws.onclose = function(event) {
                           };
                        });
            /* <!-- 방이동 처리함수 --> */
            function moveRoom(room, remaincount, totalcount, pwd) {
               var currentRoom = $("#room").val(); //현재자신이있는방
               
               
               if (room == currentRoom) {
                  //들어가고자하는방 = 현재자신의방
                  alert("현재 선택하신 방에 있습니다.");
               }
               //방 이동 처리
               else {
                  if (parseInt(remaincount) < parseInt(totalcount)) {
                     if (pwd != 'null') {
                        var chkPwd = prompt("비밀번호를 입력하세요.");
                        if (chkPwd == pwd) {
                           $("[name='roomName']").val(room);
                           $("#moveChatForm").attr("target", "_self")
                                 .submit();
                        } else {
                           alert("비밀번호가 틀렸습니다.");
                        }
                     } else {
                        //비밀번호가 없다면 바로 이동하도록한다.
                        $("[name='roomName']").val(room);
                        $("#moveChatForm").attr("target", "_self").submit();
                        
                     }

                  } else {
                     alert("인원 수가 가득찼습니다.");
                  }
                  
               }
            };
            
            
            
            //방나가기
            $("#backBtn").click(function() {
               location.href = "chat.do";
            });
         </script>
</body>
</html>