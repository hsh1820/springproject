<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	
	<c:if test="${!empty msg}">
		<script>alert("${msg}")</script>
		<c:remove var="msg"/>
	</c:if>

   <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="<%=request.getContextPath() %>/admin/login" class="nav-link">메인으로</a>
      </li>
 
    </ul>



    <!-- Right navbar links 알림창 -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item">
        <a class="nav-link"  href="<%=request.getContextPath() %>/chat.do">
          <i class="far fa-comments">채팅</i>
        </a>

      <!-- Notifications Dropdown Menu -->
      <li class="nav-item ">
        <a class="nav-link" href="<%=request.getContextPath() %>/personalMessage/personalMessage">
          <i class="far fa-bell">쪽지</i>
        </a>

      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
            class="fas fa-th-large"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->




</body>
</html>