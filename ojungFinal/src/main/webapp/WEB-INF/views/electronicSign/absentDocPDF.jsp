<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
 <!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.min.js"></script>
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

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: black;
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
	border-color: black;
}

.tg .tg-0pky {
	border-color: black;
	text-align: center;
	vertical-align: middle
}

.tg .tg-0lax {
	text-align: center;
	vertical-align: middle
}
</style>
</head>

<body>

    <h2 style="text-align: center;">결근사유서</h2>
    


	<div id="wrapper">
		<!-- 첫 번째 div -->
		<div id="header">
			<div id="first-first" class="tg-wrap">
				<table class="tg">
					<tr>
						<th class="tg-cly1">문서번호</th>
						<td style="width: 150px;">99</td>
					</tr>
					<tr>
						<th class="tg-cly1">작성일자</th>
						<td style="width: 150px;">2020/02/29</td>
					</tr>
					<tr>
						<th class="tg-cly1">신청부서</th>
						<td style="width: 150px;">인사팀</td>
					</tr>
					<tr>
						<th class="tg-0lax">신청자</th>
						<td style="width: 150px;">한송희</td>
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
						<td class="tg-nrix"></td>
						<td class="tg-baqh"></td>
						<td class="tg-baqh"></td>
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
		<div>
			<table class="tg">
				<tr>
					<th class="tg-0pky">제목</th>
					<td class="tg-0pky"></td>
				</tr>
				<tr>
					<th class="tg-0pky">기간</th>
					<td class="tg-0pky">2020 년 02 월 28일 부터 ~ 2020 년 02 월 28일 까지
						&nbsp;&nbsp;(1 일간)</td>
				</tr>
				<tr>
					<th class="tg-0pky">결근사유</th>
					<td class="tg-0pky" colspan="2"></td>
				</tr>
				<tr>
					<th class="tg-0pky">비고</th>
					<td class="tg-0pky" colspan="2"></td>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="2">
						<p>위와 같은 내용으로 결근사유서를 제출합니다.</p>
						<p style="text-align: center;">2020년 02 월 29 일</p>
						<p style="text-align: right;">
							<sub>신청인: 한송희(인)</sub>
						</p>
					</td>
				</tr>
				<tr>
					<td class="tg-0lax" colspan="2" style="text-align: left;"><br>①
						천재지변 등 부득이하게 결근한 경우에는 결근 익일 퇴근시 까지 결근사유서를 제출하기 바랍니다.<br>②&nbsp;&nbsp;결근일수가
						1주일 이상이 될 경우에는 의사의 진단서나 기타 증명서를 첨부해야 합니다.<br></td>
				</tr>
			</table>

            <br>
            <br>
		</div>
<hr>
<br>
     <!--  <button onclick="printPdf()" style="width: 100px; height: 50px; float: right; border: 1px solid lightgrey">인쇄</button> -->
        
</div>
	<script type="text/javascript"> 
	$(function(){
		window.print();
	});
	/* function printPdf(){
		window.print();
	} */
	</script>

</body>

</html>