<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>품의서</title>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-cly1 {
            text-align: left;
            vertical-align: middle
        }

        .tg .tg-buh4 {
            background-color: #f9f9f9;
            text-align: left;
            vertical-align: top
        }

        .tg .tg-yjjc {
            background-color: #f9f9f9;
            text-align: left;
            vertical-align: middle
        }

        .tg .tg-0lax {
            text-align: left;
            vertical-align: top
        }

        @media screen and (max-width: 767px) {
            .tg {
                width: auto !important;
            }

            .tg col {
                width: auto !important;
            }

            .tg-wrap {
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
            }
        }

        #wrapper {
            width: 1000px;
            height: 700px;

            margin: auto;
        }

        #header {
            width: 100%;
            height: 20%;
        }

        #first-first {
            width: 25%;
            height: 100%;
            float: left;
            position: relative;
        }

        #first-second{
            width: 50%;
            height: 100%;
            float: left;
            position: relative;
        }
        #first-third {
            width: 25%;
            height: 100%;
            float: left; 
        }


        #third-first {
            width: 100%;
            height: 100%;
            float: left;
            /* position: relative; */
        }
    </style>
</head>

<body>
    <h2 style="text-align: center;">품 의 서</h2>

    <div id="wrapper">
        <!-- 첫 번째 div -->
        <div id="header">
            <div id="first-first" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1">문서번호</th>
                        <td style="width: 150px;">${docList[0].docNo}</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">작성일자</th>
                        <td style="width: 150px;">${docList[0].insertDate}</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">신청부서</th>
                        <td style="width: 150px;">${deptNm}</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax">신청자</th>
                        <td style="width: 150px;">${docList[0].drafterName}</td>
                    </tr>
                </table>
            </div>
            <div id="first-second"></div>
            <div id="first-third" class="tg-wrap">
                <table class="tg">
                    <tr>
                    <c:set var="lastIndex" value="${lastSignImageIndex}"/>
                        <th class="tg-yla0" rowspan="3">결재</th>
                        <th class="tg-nrix">${docList[lastIndex].userPos}</th>
                        <th class="tg-baqh">상무</th>
                        <th class="tg-baqh">사장</th>
                    </tr>
                    <tr>
                    <c:set var="src" value="${contextPath}/resources/uploadFiles/${docList[lastIndex].signChangeNm}" />
                        <td class="tg-nrix" >
                        <img alt="" src="${src}" style="width: 90px; height: 90px">
                        </td>
                        <td class="tg-baqh" style="height: 50px;"></td>
                        <td class="tg-baqh" style="height: 50px;"></td>
                    </tr>
                    <tr>
                        <td class="tg-nrix">${docList[lastIndex].signDate}</td>
                        <td class="tg-baqh">2020/02/29</td>
                        <td class="tg-baqh">2020/03/02</td>
                    </tr>
                </table>
            </div>

        </div>
        <br>
        <hr>
        <!-- 두 번째 div -->
        <div>
            

        </div>
		<br>
        <!-- 세 번째 div -->
        <div id="wrapper">
            <div id="third-first" class="tg-wrap">
                <table class="tg" style="width: 100%;">
                    <tr>
                        <th class="tg-0pky" style="width: 70px;">제목</th>
                        <td class="tg-0pky" style="width: 200px;">${docList[0].docTitle }</td>
                    </tr>
                   
                    <tr>
                        <th class="tg-0pky" colspan="4">결재자 부기사항</th>
                    </tr>
                    <tr>
                        <td class="tg-0lax" colspan="4" style="height: 200px;">${docList[0].additional}</td>
                    </tr>
                    <tr>
                        <th class="tg-0pky" colspan="4">품 의 내 용</th>
                    </tr>
                    <tr>
                        <td class="tg-0lax" colspan="4" style="height: 200px;">${docList[0].docContents}</td>
                    </tr>
                    <tr>
                        <th class="tg-0pky" colspan="4">지 시 사 항</th>
                    </tr>
                    <tr>
                        <td class="tg-0lax" colspan="4" style="height: 200px;">${docList[0].order}</td>
                    </tr>
                    <tr>
                        <th class="tg-0pky" colspan="4" style="text-align: left;">※이 품의서는 기안자가 지정한 최종 결재자에게 필히 결재를 받아야 한다.</th>
                    </tr>
                  </table>
                  <br>
                  <br>
                  <hr>
                  <br>
   
                  <br>
                  <br>
            </div>

        </div>
    </div>
    
    <script type="text/javascript"> 
    $(function(){
    	window.print();
    });
	
	</script>
</body>

</html>