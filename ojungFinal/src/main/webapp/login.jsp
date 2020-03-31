<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
   <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>(주)O.正 상사 인트라넷 로그인</title>
   <link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous">
   <style type="text/css">
      /* body * {
         border: 1px solid red;
         box-sizing: border-box;
      } */
      body {
         
         background: linear-gradient(rgb(83,83,83), rgb(32,33,36)) fixed;
         color:rgb(195,195,195);
      }
      
      .tp{
        display: block;
        margin-left: auto;
        margin-right: auto;
        margin-top: 10%;
        margin-bottom: auto;
        width: 30%;
      }
      
      .loginBtn{
         width : 100px;
         height : 95px;
      }
      
      img {
         width : 150px;
      }
   </style>
</head>
<body>
<div class="tp">
<div class="container-fluid">
   <div class="row">
      <div class="col-md-12">
         <div class="row">
            <div class="col-md-12" style="">
               <h1 class="text-left"><b style="color:rgb(238,238,238); width:160px; display:inline-block">오정상사</b> <b style="color:rgb(183,198,235); display:inline-block">로그인</b></h1>
               <p style=" width:380px; display:inline-block"><br>오정 그룹 내부에서 사용하는 페이지 입니다.<br>외부인들의 접근을 금합니다.</p>
      
               <img src="resources/images/lock.png" style=" display:inline-block"/>
               <!-- <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" /> -->
            
            </div>
         </div>
         <div class="row">
            <div class="col-md-12">
               <h3>
                  <h3>LOGIN</h3>
                  <p style=" width:500px; ">사내 이메일과 비밀번호를 입력하신 후 로그인 버튼을 눌러주세요.</p>
               </h3>
               <div class="row">
                  <div class="col-md-12">
                  <form action="<%=request.getContextPath() %>/admin/login" method="post">
                  <table class="">
                     <tr>
                     <td class="input-group-prepend mt-3" style="width:80px; display:inline-block">&nbsp;&nbsp;이메일 </td>
                     <td style="width:400px;">
                        <input class="input-group-text" type="text" size="40" maxlength="50"
                        placeholder="이메일을 입력해주세요." name="memberEmail" required>
                     <td colspan="2" rowspan="2">
                         <button class="loginBtn m-2 btn btn-success " type="submit">Login</button>
                     </td>
                     </tr>
                     <tr>
                     <td>비밀번호 </td>
                     <td>
                        <input class="input-group-text" type="password" size="40" maxlength="50"
                         placeholder="비밀번호를 입력해주세요." name="memberPwd" required>
                     </tr>
                  </table>
                  </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
         <div class="alert alert-success alert-dismissable" hidden>
             
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
               ×
            </button>
            <h4>
               Alert!
            </h4> <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#" class="alert-link">alert link</a>
         </div> 
</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
      integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"></script>
</body>
</html>