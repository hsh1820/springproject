<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <style>
       .pagination {
            justify-content: center;
        }
        .nav-item a {
        	color:black;
        }
        
 </style>
<meta charset="UTF-8">
<title>(주) 오정상사 그룹웨어 - 전자결재 </title>
 <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
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
         <section class="content">
            <div class="container-fluid">

               <!-- /.row -->
               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-header bg-navy">
                           <h3 class="card-title">결재 할 문서</h3>
                        </div>
                        <ul class="nav nav-tabs" id="custom-content-above-tab"
                           role="tablist">
                           <li class="nav-item"><a class="nav-link active"
                              id="custom-content-above-home-tab" data-toggle="pill"
                              href="#custom-content-above-home" role="tab"
                              aria-controls="custom-content-above-home" aria-selected="true">결재 내역</a>
                           </li>
                           <li class="nav-item" id="waitList"><a class="nav-link"
                              id="custom-content-above-profile-tab" data-toggle="pill"
                              href="#custom-content-above-profile" role="tab"
                              aria-controls="custom-content-above-profile"
                              aria-selected="false">결재</a></li>
                        </ul>

                        <div class="tab-content" id="custom-content-above-tabContent"
                        	style="height:600px;">

                           <!-- 전체 -->
                           <div class="tab-pane fade show active"
                              id="custom-content-above-home" role="tabpanel"
                              aria-labelledby="custom-content-above-home-tab">
                              <div style="height:550px">
                              <table class="table table-hover text-nowrap secondTable"
                                 style="text-align: center">
                                 <thead>
                                    <tr>
                                       <th>No</th>
                                       <th>기안일자</th>
                                       <th>제목</th>
                                       <th>구분</th>
                                       <th>기안자</th>
                                       <th>결재 결과</th>
                                       <th>진행상태</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                 <c:if test="${empty allList}">
                                 <tr>
                           			<td colspan="8"> 조회된 결재 문서가 없습니다.</td>
                           		 </tr>
                                 </c:if>
                                 <c:if test="${!empty allList}">
                                 <c:forEach var="list" items="${allList}">
                                    <tr>
                                       <td>${list.docNo}</td>
                                       <td>${list.insertDate}</td>
                                       <td>${list.docTitle}</td>
                                       <td>${list.dTitle}</td>
                                       <td>${list.memberName}</td>
                                       <c:if test="${empty list.ssResult}">
                                          <td>-</td>
                                       </c:if>
                                       <c:if test="${list.ssResult  == 0}">
                                          <td>대기중</td>
                                       </c:if>
                                       <c:if test="${list.ssResult == 1}">
                                          <td>결재</td>
                                       </c:if>
                                       <c:if test="${list.ssResult == 2}">
                                          <td>반려</td>
                                       </c:if>
                                       
                                       <c:if test="${list.docStatus == 1}">
                                          <td>대기중</td>
                                       </c:if>
                                       <c:if test="${list.docStatus == 2}">
                                          <td>심사중</td>
                                       </c:if>
                                       <c:if test="${list.docStatus == 3}">
                                          <td>반려</td>
                                       </c:if>
                                       <c:if test="${list.docStatus == 4}">
                                          <td>결재완료</td>
                                       </c:if>
                                    </tr>
                                 </c:forEach>
                                 </c:if>
                                 </tbody>
                              </table>
                              </div>
                              <!--------------------------------- 페이징바  ---------------------------------->
                              <div style="clear: both;">
                                 <ul class="pagination">
                                    <c:if test="${pInf.currentPage > 1}">
                                       <li>
                                          <!-- 맨 처음으로(<<) --> <a class="page-link text-success"
                                          href="<c:url value="electronicSignList_payer"><c:param name="currentPage" value="1"/></c:url>">
                                             &lt;&lt; </a>
                                       </li>

                                       <li>
                                          <!-- 이전으로(<) --> <a class="page-link text-success"
                                          href="<c:url value="electronicSignList_payer"><c:param name="currentPage" value="${pInf.currentPage-1}"/></c:url>">&lt;
                                       </a>
                                       </li>
                                    </c:if>

                                    <!-- 10개의 페이지 목록 -->
                                    <c:forEach var="p" begin="${pInf.startPage}"
                                       end="${pInf.endPage}">


                                       <c:if test="${p == pInf.currentPage}">
                                          <li><a class="page-link">${p}</a></li>
                                       </c:if>

                                       <c:if test="${p != pInf.currentPage}">
                                          <li><a class="page-link text-success"
                                             href="<c:url value="electronicSignList_payer"><c:param name="currentPage" value="${p}"/></c:url>">
                                                ${p} </a></li>
                                       </c:if>

                                    </c:forEach>

                                    <!-- 다음 페이지로(>) -->
                                    <c:if test="${pInf.currentPage < pInf.maxPage }">
                                       <li><a class="page-link text-success"
                                          href="<c:url value="electronicSignList_payer"><c:param name="currentPage" value="${pInf.currentPage+1}"/></c:url>">
                                             &gt; </a></li>

                                       <!-- 맨 끝으로(>>) -->
                                       <li><a class="page-link text-success"
                                          href="<c:url value="electronicSignList_payer"><c:param name="currentPage" value="${pInf.maxPage}"/></c:url>">
                                             &gt;&gt; </a></li>

                                    </c:if>
                                 </ul>
                              </div>
                           </div>

   
                           <!-- 결재해야할 리스트 -->
                           <div class="tab-pane fade" id="custom-content-above-profile"
                              role="tabpanel"
                              aria-labelledby="custom-content-above-profile-tab">
                            <div style="height:550px;"> 
                              <table class="table table-hover text-nowrap secondTable" 
                                 style="text-align: center">
                                 <thead>
                                    <tr>
                                       <th>No</th>
                                       <th>기안일자</th>
                                       <th>제목</th>
                                       <th>구분</th>
                                       <th>기안자</th>
                                       <th>결재 결과</th>
                                       <th>진행상태</th>
                                    </tr>
                                 </thead>
                                 <tbody id="waitTobeListTable">
                                     <tr>
                                       <td class="docNo"></td>
                                       <td class="insertDate"></td>
                                       <td class="docTitle"></td>
                                       <td class="dTitle"></td>
                                       <td class="memberName"></td>
                                       <td class="ssResult"></td> <!-- 결재 결과 -->
                                       <td class="docStatus"></td>
                                    </tr>
                                 </tbody>
                              </table>
                              </div>
                              <!--------------------------------- 페이징바  ---------------------------------->
                              <div style="clear: both;">
                                 <ul class="pagination" id="waitTobePagination">

                                 </ul>
                              </div>
                           </div>
                           
                        </div>
                        <!-- /.card-header -->
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->

   <jsp:include page="../common/footer.jsp"/>
   </div>


<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<%-- <!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script> --%>
<!-- Bootstrap -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/plugins/chart.js/Chart.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>

<script>

   var currentPage;
   var maxPage;
   var startPage;
   var endPage;
   var ajaxUrl;
   var tableId;
   var pageId;
   /* $("#waitList").on("click",function(){
      createPage();
   }); */
   $(".nav-item").on("click",function(){
      currentPage = 1;
      var tabTitle = $(this).text().trim();
      console.log(tabTitle);
      switch(tabTitle){
      case "결재" : console.log("1"); ajaxUrl = "selectWaitTobeList"; tableId="#waitTobeListTable"; pageId="#waitTobePagination"; break;
      }

      createPage();
      console.log("createPage하냐");
   });
   
   
   $(document).on("click",".pagination a", function(){
      var pageNo = $(this).text();
      
      switch(pageNo){
      case "<<" : currentPage=1; break;
      case "<" :  currentPage--; break;
      case ">>" : currentPage=maxPage; break;
      case ">" :  currentPage++; break;   
      default : currentPage = pageNo;
      }
      
      createPage();
   });
   
   
   function createPage(){
      
      $.ajax({
         url : ajaxUrl,
         type : "POST",
         data : {"currentPage" : currentPage},
         dataType : "json",
         success : function(map){
            console.log("ajax 통신성공");
            console.log(map);
            
            console.log("pInf : " + map.pInf);
            console.log("waitList : " + map.waitList);
            
            var $waitListTable = $(tableId);
            
            console.log("tableId = " + tableId);
            
            if(waitList == ""){
               $waitListTable.html("조회된 기록이 없습니다.");
            }else{
               
               $waitListTable.html("");
               
               $.each(map.waitList,function(i){
                  console.log("찍히나 : "+ map.waitList[i]);
                  console.log(map.waitList[i].docNo);
                  var docStatus = "";
                  var ssResult = "";
                  
                  var $tr = $("<tr>");
                  var $docNo = $("<td>").prop("class","docNo").html(map.waitList[i].docNo);
                  var $insertDate = $("<td>").prop("class","insertDate").html(map.waitList[i].insertDate);   
                  var $docTitle = $("<td>").prop("class","docTitle").html(map.waitList[i].docTitle);
                  var $dTitle = $("<td>").prop("class","dTitle").html(map.waitList[i].dTitle);
                  var $memberName = $("<td>").prop("class","memberName").html(map.waitList[i].memberName);
                  
                  if(map.waitList[i].ssResult == 0){
                     ssResult = "대기중";
                  }else if(map.waitList[i].ssResult == 1){
                     ssResult = "합의";
                  }else{
                     ssResult = "결재";
                  }
                  var $ssResult = $("<td>").prop("class","ssResult").html(ssResult);
                  
                  if(map.waitList[i].docStatus == 1){
                     docStatus = "대기중";
                  }else if(map.waitList[i].docStatus == 2){
                     docStatus = "심사중";
                  }else if(map.waitList[i].docStatus == 3){
                     docStatus = "반려";
                  }else{
                     docStatus = "결재 완료";
                  }
                  var $docStatus = $("<td>").prop("class","docStatus").html(docStatus);
                  
                  $tr.append($docNo).append($insertDate).append($docTitle).append($dTitle).append($memberName).append($ssResult).append($docStatus);
                  $waitListTable.append($tr);
                  
                  
                  
               })
               /* 페이징바 */
               currentPage = map.pInf.currentPage;
               maxPage = map.pInf.maxPage;
               startPage = map.pInf.startPage;
               endPage = map.pInf.endPage;
               
               console.log("currentPage : " + currentPage);
               
               var $pagination = $(pageId);
               //var $li1 = $("<li>").html("<a class='page-link text-success' href='<c:url value='selectWaitList'><c:param name='currentPage' value='1'/></c:url>'>&lt;&lt;</a>");
               //var $li2 = $("<li>").html("<a class='page-link text-success' href='<c:url value='selectWaitList'><c:param name='currentPage' value='${map.pInf.currentPage-1}'/></c:url>'>&lt;</a>")
               
               $pagination.html("");
               
               var url = ajaxUrl+"?currentPage=";
               
               if(currentPage > 1){
                  //var $li1 = $("<li>").html("<a class='page-link text-success' href='"+url+"1"+"'>&lt;&lt;</a>");
                  //var $li2 = $("<li>").html("<a class='page-link text-success' href='"+url+(currentPage - 1)+"'>&lt;</a>")
                  var $li1 = $("<li>").html("<a class='page-link text-success'>&lt;&lt;</a>");
                  var $li2 = $("<li>").html("<a class='page-link text-success'>&lt;</a>")
                  $pagination.append($li1).append($li2);
               }
               for(var i=startPage; i<=endPage; i++){
                  console.log(i);
                  if(i == currentPage){
                     var $li1 = $("<li>").html(" <a class='page-link'>"+i+"</a>");
                     $pagination.append($li1);
                  }else{
                     //var $li1 = $("<li>").html("<a class='page-link text-success' href='"+url+i+"'>"+i+"</a>");
                     var $li1 = $("<li>").html("<a class='page-link text-success'>"+i+"</a>");
                     $pagination.append($li1);
                  }
                  
               }
               
               if(currentPage < maxPage){
                  //var $li1 = $("<li>").html("<a class='page-link text-success' href='"+url+(currentPage + 1)+"'>&gt;</a>");
                  //var li2 = $("<li>").html("<a class='page-link text-success' href='"+url+maxPage+"'>&gt;&gt;</a>");
                  var $li1 = $("<li>").html("<a class='page-link text-success'>&gt;</a>");
                  var $li2 = $("<li>").html("<a class='page-link text-success'>&gt;&gt;</a>");
                  
                  $pagination.append($li1).append($li2);
               }
               
            }
            
            
            
         }, 
         error : function(){
            console.log("ajax 통신실패");
         }
         
      });
      
   }
   
   $(document).on("click", ".secondTable > tbody > tr", function(){
	  console.log($(this).children().eq(0).text()); 
	 
	  var no = $(this).children().eq(0).text();
	  
	  <c:url var = "detailUrl" value="sgnDocReceiver">
	  </c:url>
	  
	  location.href="${contextPath}/electronicSign/sgnDocReceiver?no="+no;
   }).mouseenter(function(){
	   $(this).parent().css("cursor","pointer");
   });
</script>

</body>
</html>