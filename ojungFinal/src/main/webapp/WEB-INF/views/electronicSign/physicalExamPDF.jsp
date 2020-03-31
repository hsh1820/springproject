<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title></title>
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
            height: 800px;

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

        #first-second {
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

        #center {
            width: 100%;
            height: 20%;
        }
    </style>
</head>

<body>
    <h2 style="text-align: center;">진료비지원신청서</h2>

    <div id="wrapper">
        <!-- 첫 번째 div -->
        <div id="header">
            <div id="first-first" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1">문서번호</th>
                        <td style="width: 150px;">10</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">작성일자</th>
                        <td style="width: 150px;">2020/02/28</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1">신청부서</th>
                        <td style="width: 150px;">인사팀</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax">신청자</th>
                        <td style="width: 150px;">윤소희</td>
                    </tr>
                </table>
            </div>
            <div id="first-second"></div>
            <div id="first-third" class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-yla0" rowspan="3">결재</th>
                        <th class="tg-nrix">부장</th>
                        <th class="tg-baqh">상무</th>
                        <th class="tg-baqh">사장</th>
                    </tr>
                    <tr>
                        <td class="tg-nrix" style="height: 50px;"></td>
                        <td class="tg-baqh" style="height: 50px;"></td>
                        <td class="tg-baqh" style="height: 50px;"></td>
                    </tr>
                    <tr>
                        <td class="tg-nrix">2020/02/28</td>
                        <td class="tg-baqh">2020/02/29</td>
                        <td class="tg-baqh">2020/03/02</td>
                    </tr>
                </table>
            </div>

        </div>
        <hr>
        <!-- 두 번째 div -->
        <div id="center">
            <div class="tg-wrap">
                <table class="tg" style="text-align: center;">
                    <tr>
                        <th class="tg-cly1" style="text-align: center; width: 100px;">제목</th>
                        <td style="width: 900px;">진료비 지원 신청서_윤소희</td>
                    </tr>
                    <tr>
                        <td class="tg-cly1" colspan="2">건강검진으로 인한 진료비 지원 신청합니다.</td>
                    </tr>
                </table>
            </div>
        </div>

        <hr>
        <!-- 세 번째 div -->
        <div>
            <div class="tg-wrap">
                <table class="tg">
                    <tr>
                        <th class="tg-cly1" style="width: 100px; text-align: center;">진료기관명</th>
                        <td style="width: 900px;">분당서울대병원</td>
                    </tr>
                    <tr>
                        <th class="tg-cly1" style="width: 100px; text-align: center;">병명</th>
                        <td style="width: 900px;">건강검진</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax" style="width: 100px; text-align: center;">신청금액</th>
                        <td style="width: 900px;">200000원</td>
                    </tr>
                    <tr>
                        <th class="tg-0lax" style="width: 100px; text-align: center;">본인부담금</th>
                        <td style="width: 900px;">50000원</td>
                    </tr>
                </table>
            </div>
        </div>
<br>
<br>
<hr>
<br>
 <button onclick="printPdf()" style="width: 100px; height: 50px; float: right; border: 1px solid lightgrey">인쇄</button>
    </div>
    
    <script type="text/javascript"> 
	function printPdf(){
		window.print();
	}
	</script>
</body>