<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 20%;
	float: left;
	position: relative;
}

#first-second {
	width: 50%;
	height: 20%;
	float: left;
	position: relative;
}

#first-third {
	width: 25%;
	height: 20%;
	float: left;
}
</style>
</head>

<body>
	<h2 style="text-align: center;">야근 식대 전표</h2>

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
						<td style="width: 150px;">김별하</td>
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
					<tr style="height: 60px;">
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
			<br> <br> 기안번호 : 2020/02/29-1
			<table class="tg">
				<tr>
					<th class="tg-cly1">참조기안서</th>
					<td style="width: 910px;"></td>
				</tr>
			</table>

			<div
				style="width: 992px; height: 300px; border: 1px solid lightgrey;">
				<table class="tg" style="width: 992px; padding:10px;">
					<tr>
						<th class="tg-c3ow">적요</th>
						<th class="tg-0pky">금액</th>
						<th class="tg-0pky">거래처명</th>
					</tr>
					<tr>
						<td class="tg-c3ow">야근식대</td>
						<td class="tg-0pky">5000</td>
						<td class="tg-0pky">김밥천국</td>
					</tr>
				</table>
				
				<br>
				<br>
				
				<p style="text-align: center;">위와 같은 내용으로 야근 식대전표를 제출합니다.</p>
						<p style="text-align: center;">2020년 03 월 06 일</p>
						<p style="text-align: right;">
							<sub>신청인: 김별하(인)</sub>
						</p>
				
			</div>

			<br> <br>

		</div>


		<!-- 세 번째 div -->






		<br> <br>
		<hr>
		<br>

		<button onclick="printPdf()"
			style="width: 100px; height: 50px; float: right; border: 1px solid lightgrey">인쇄</button>
	</div>

	<script type="text/javascript">
		function printPdf() {
			window.print();
		}
	</script>
</body>
</html>