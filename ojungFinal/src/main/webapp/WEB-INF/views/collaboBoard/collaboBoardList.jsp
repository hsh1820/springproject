<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>(주) 오정상사 그룹웨어 - 협업게시판 </title>
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
</head>
  <style>

    #cooper_btn{
      text-decoration-color: none;
    }
  </style>
<body>


<body class="hold-transition sidebar-mini">
<div class="wrapper">

<jsp:include page="../common/nav.jsp"/>
<jsp:include page="../common/sidebar.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>협업게시판</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">협업게시판</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>
	  <!-- Main content -->
      <section class="content">
        <!-- Default box -->
        <div class="card">
          <div class="card-header bg-navy">
            <div class="card-tools">
            	<!-- 검색 폼 -->
                <form action="collaboBoardList" method="GET" id="searchForm" >
                  <div class="input-group input-group-sm ">
	                  <div>
	                  <input type="radio" name="searchStatus" value="0" id="all" checked>
	                  <label for="all">전체</label>&nbsp;&nbsp;
	                  <input type="radio" name="searchStatus" value="1" id="offering">
	                  <label for="offering">요청중</label>&nbsp;&nbsp;
	                  <input type="radio" name="searchStatus" value="2" id="accepting">
	                  <label for="accepting">요청수락</label>&nbsp;&nbsp;
	                  <input type="radio" name="searchStatus" value="3" id="rejecting">
	                  <label for="rejecting">요청거절</label>&nbsp;&nbsp;
	                  <input type="radio" name="searchStatus" value="4" id="complete">
	                  <label for="complete">처리완료</label>&nbsp;&nbsp;
	                  </div><br>
		                <select name="searchKey" class="custom-select input-group-append "style="width:150px;">
		                	<option value="title">글 제목</option>
		                	<option value="content">내용</option>
		                	<option value="titcont">글 제목 + 내용</option>
		                	<option value="writer">작성자</option>
		                	<option value="accepter">담당자</option>
		                	<option value="myself">내가 쓴 글</option>
		                	<option value="myselfTask">내가 담당한 요청</option>
		                </select>
		                <input type="text" name="searchValue" style="width:350px" class="form-control float-right" placeholder="Search" >
		                <div class="input-group-append">
		                  <button id="searchBtn" type="submit" class="btn btn-default "><i class="fas fa-search"></i></button>
		                </div>
                	</div>
                 </form>
            </div>
          </div>
          <div class="card-body p-0">
            <table id="list-table" class="table table-striped projects">
              <thead>
                <tr>
                  <th style="width: 8%; text-align:center;">NO.</th>
                  <th style="width: 40%">글 제목</th>
                  <th style="width: 8%">작성자</th>
                  <th style="width: 10%">요청 부서</th>
                  <th style="width: 8%">작성 날짜</th>
                  <th style="width: 5%;  text-align:center;">상태</th>
                  <th style="width: 10%; text-align:center;" >담당자</th>
                  <th style="width: 8%;  text-align:center;">조회수</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${empty collabo }">
              	<tr><td colspan="8" style="text-align:center;">게시글이 존재하지 않습니다.</td></tr>
              </c:if>
              <c:if test="${!empty collabo }">
              <c:forEach var="collabo" items="${collabo }" varStatus="vs">
	              <tr>
		              <td style=" text-align:center;">${ collabo.collaboNo}
		              </td>
		              <td><%-- <a href="detail?no=${collabo.collaboNo}"> --%>${collabo.collaboTitle }<!-- </a> -->
		              <c:url var="detailUrl" value="detail">
	              		<c:if test="${!empty param.searchKey }">
		        		<c:param name="searchKey" value="${param.searchKey}"/>
			        	</c:if>
			        	<c:if test="${!empty param.searchValue }">
			        		<c:param name="searchValue" value="${param.searchValue}"/>
			        	</c:if>
			        	<c:if test="${!empty param.searchStatus }">
			        		<c:param name="searchStatus" value="${param.searchStatus}"/>
			        	</c:if>
	                 	<c:param name="currentPage" value="${pInf.currentPage}"/>
	               	  </c:url>
		              
		              <span> [ ${collabo.cmmtCount } ]</span>
		              <br>
		                  <small>${collabo.collaboContent }</small>
		              </td>
		              <td>${collabo.memberName }</td>
		              <td>${collabo.wirterDeptName} </td>
		              <td>${collabo.collaboCreateDate} </td>
		              <td class="project-state"  style=" text-align:center;">
			              <c:if test="${collabo.collaboStatusTitle == '처리완료'}">
			                <span class="badge badge-success">${collabo.collaboStatusTitle }</span>
			              </c:if>
			              <c:if test="${collabo.collaboStatusTitle == '요청중'}">
			                <span class="badge badge-success" style="background-color: gray;">${collabo.collaboStatusTitle}</span>
			              </c:if>
			              <c:if test="${collabo.collaboStatusTitle == '요청수락'}">
			                <span class="badge badge-success" style="background-color: rgb(38, 38, 224);">${collabo.collaboStatusTitle}</span>
			              </c:if>
			              <c:if test="${collabo.collaboStatusTitle == '요청거절'}">
			                <span class="badge badge-success" style="background-color: red;">${collabo.collaboStatusTitle}</span>
			              </c:if>
		              </td>
		              <td style=" text-align:center;">
			              <c:if test="${collabo.taskAccepterName != null}">${collabo.taskAccepterName }</c:if>
			              <c:if test="${collabo.taskAccepterName == null}">-</c:if>
		              </td>
		              <td style=" text-align:center;">
			              <c:if test="${collabo.collaboCount != null}">${collabo.collaboCount}</c:if>
		              </td>
	              </tr>
              </c:forEach>
              </c:if>
              </tbody>
            </table>
            
            <c:if test="${!empty loginMember }">
            <div class="card-footer">
            <div style="clear: both; ">
	            <ul class="pagination justify-content-center m-0">
	            	<c:if test="${pInf.currentPage > 1}">
		                <li class="page-item">
		                	<!-- 맨 처음으로(<<) -->
		                	<!-- 
		                		c:url 태그에 var 속성이 존재하지 않으면 변수처럼 사용되는 것이 아닌, 
		                		작성된 자리에 바로 URL 형식으로 표기된다.  
		                	-->
		                    <a class="page-link "  style="color : grey;" 
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
		                    		<c:param name="currentPage" value="1"/>
		                    	</c:url>
	                    	">
			                    <i class="fas fa-angle-double-left"></i>
			                </a>
		                </li>
		                
		                <li class="page-item">
		                	<!-- 이전으로(<) -->
	                   		<a class="page-link " style="color : grey;" 
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
		                    		<c:param name="currentPage" value="${pInf.currentPage-1}"/>
		                    	</c:url>
	                    	">
			                    <i class="fas fa-angle-left"></i>
			                </a>
		                </li>
	                </c:if>
	                
	                <!-- 10개의 페이지 목록 -->
	                <c:forEach var="p" begin="${pInf.startPage}" end="${pInf.endPage}">
	                
	                
	                	<c:if test="${p == pInf.currentPage}">
			                <li class="page-item">
			                    <a class="page-link">${p}</a>
			                </li>
		                </c:if>
	                	
	                	<c:if test="${p != pInf.currentPage}">
	                		<li class="page-item">
		                    	<a class="page-link "  style="color : grey;" 
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
			                    		<c:param name="currentPage" value="${p}"/>
			                    	</c:url>
		                    	">
				                    ${p}
				                </a>
		                	</li>
	                	</c:if>
	                	
                	</c:forEach>
	                
	                <!-- 다음 페이지로(>) -->
	                <c:if test="${pInf.currentPage < pInf.maxPage }">
		                <li class="page-item">
							<a class="page-link "  style="color : grey;" 
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
		                    		<c:param name="currentPage" value="${pInf.currentPage+1}"/>
		                    	</c:url>
	                    	">
			                   <i class="fas fa-angle-right"></i>
			                </a>
		                </li>
		                
		                <!-- 맨 끝으로(>>) -->
		                <li class="page-item">
		                    <a class="page-link "  style="color : grey;" 
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
		                    		<c:param name="currentPage" value="${pInf.maxPage}"/>
		                    	</c:url>
	                    	">
			                    <i class="fas fa-angle-double-right"></i>
			                </a>
		                </li>
	                
	                </c:if>
	            </ul>
	            </div>
            <a href="collaboBoardEditors" role="button" class="btn btn-outline-primary" style="float: right; margin-right: 2%; width: 100px; height: 40px;">
      		  협업 요청
            </a>
          </div>
          </c:if>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
        
        
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


  <jsp:include page="../common/footer.jsp"/>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="<%=request.getContextPath() %>/resources/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="<%=request.getContextPath() %>/resources/plugins/chart.js/Chart.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/demo.js"></script>
<script src="<%=request.getContextPath() %>/resources/dist/js/pages/dashboard3.js"></script>
<script>
$(function(){
	$("#list-table td").click(function(){
		var boardNo = ($(this).parent().children().eq(0).text().trim());
		<c:url var="detailUrl" value="detail">
  		<c:if test="${!empty param.searchKey }">
		<c:param name="searchKey" value="${param.searchKey}"/>
    	</c:if>
    	<c:if test="${!empty param.searchValue }">
    		<c:param name="searchValue" value="${param.searchValue}"/>
    	</c:if>
    	<c:if test="${!empty param.searchStatus }">
    		<c:param name="searchStatus" value="${param.searchStatus}"/>
    	</c:if>
    	
    	
     	<c:param name="currentPage" value="${pInf.currentPage}"/>
   	</c:url>
	
	location.href="${detailUrl}&no="+boardNo;
	
	//location.href="${contextPath}/board/detail?no=" + boardNo +"&currentPage="+${pInf.currentPage};

	}).mouseenter(function(){
		$(this).parent().css("cursor", "pointer");
	
	});
	
	var searchKey = "${param.searchKey}";
	var searchValue = "${param.searchValue}";
	var searchStatus = "${param.searchStatus}";
	
	if(searchKey != "null" && searchValue != "null"){
		$.each($("select[name=searchKey] > option"), function(index, item){
			if($(item).val() == searchKey){
				$(item).prop("selected","true");
			} 
		});
		$("input[name=searchValue]").val(searchValue);
	}

});


<c:forEach var="ct" items="${paramValues.searchStatus}" varStatus="vs">
$.each($("input[name=searchStatus]"), function(index, item){
 	if($(item).val() == "${ct}"){
		$(item).prop("checked","true");
	} 
});

</c:forEach>
</script>

</body>
</html>