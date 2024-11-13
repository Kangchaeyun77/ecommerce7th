<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>약국 목록</title>
	<style>
		h1 {
			text-align: center;
			color: #333;
			padding: 20px 0;
	
		}

		table {
			width: 80%;
			margin: 20px auto;
			border-collapse: collapse;
			background-color: white;
		}

		th, td {
			padding: 12px;
			text-align: left;
			border: 1px solid #ddd;
		}

		th {
			background-color: #4CAF50;
			color: white;
		}

		tr:nth-child(even) {
			background-color: #f2f2f2;
		}

		tr:hover {
			background-color: #ddd;
		}

		table caption {
			font-size: 1.5em;
			margin: 10px 0;
		}

		table td {
			font-size: 1em;
		}
	</style>
</head>
<body>
	<h1>약국 목록</h1>
	<table>
		<thead>
			<tr>
				<th>약국명</th>
				<th>주소</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>휴베이스드림약국</td>
				<td>경기도 성남시 분당구 성남대로 1234</td>
				<td>031-123-4567</td>
			</tr>
			<tr>
				<td>더조은약국</td>
				<td>경기도 성남시 분당구 야탑로 5678</td>
				<td>031-234-5678</td>
			</tr>
			<tr>
				<td>분당종로약국</td>
				<td>경기도 성남시 분당구 정자로 91011</td>
				<td>031-345-6789</td>
			</tr>
			<tr>
				<td>서현봄약국</td>
				<td>경기도 성남시 분당구 서현동 2233</td>
				<td>031-456-7890</td>
			</tr>
			<tr>
				<td>코리아약국</td>
				<td>경기도 성남시 분당구 대왕판교로 4455</td>
				<td>031-567-8901</td>
			</tr>
			<tr>
				<td>원이약국</td>
				<td>경기도 성남시 분당구 동판교로 6677</td>
				<td>031-678-9012</td>
			</tr>
			<tr>
				<td>세계로약국</td>
				<td>경기도 성남시 분당구 분당로 7890</td>
				<td>031-789-0123</td>
			</tr>
			<tr>
				<td>새로운약국</td>
				<td>경기도 성남시 분당구 미금로 1011</td>
				<td>031-890-1234</td>
			</tr>
			<tr>
				<td>복정동서울약국</td>
				<td>경기도 성남시 수정구 복정로 1213</td>
				<td>031-901-2345</td>
			</tr>
			<tr>
				<td>한사랑약국</td>
				<td>경기도 성남시 분당구 탄천로 1415</td>
				<td>031-012-3456</td>
			</tr>
			<tr>
				<td>오아시스약국</td>
				<td>경기도 성남시 분당구 수내로 1617</td>
				<td>031-123-4568</td>
			</tr>
			<tr>
				<td>청아약국</td>
				<td>경기도 성남시 분당구 황새울로 1819</td>
				<td>031-234-5679</td>
			</tr>
			<tr>
				<td>위례진약국</td>
				<td>경기도 성남시 수정구 위례동 2021</td>
				<td>031-345-6780</td>
			</tr>
			<tr>
				<td>큰나무약국</td>
				<td>경기도 성남시 분당구 성남대로 2223</td>
				<td>031-456-7891</td>
			</tr>
			<tr>
				<td>해봄약국</td>
				<td>경기도 성남시 분당구 미금로 2425</td>
				<td>031-567-8902</td>
			</tr>
		</tbody>
	</table>
	<div style="display: flex; justify-content: center;">
			<span class="pageNavi_front_image">
				<img src="/images/btn/btn_pageFirst.gif" border="0" alt="처음으로" onclick="goToPage(1)" />&nbsp;
				<img src="/images/btn/btn_pagePrev.gif" border="0" alt="이전페이지" onclick="changePage(-1)" />&nbsp;
				<strong id="current-page">1</strong>&nbsp;
				<img src="/images/btn/btn_pageNext.gif" border="0" alt="다음페이지" onclick="changePage(1)" />&nbsp;
				<img src="/images/btn/btn_pageLast.gif" border="0" alt="마지막으로" onclick="goToPage(totalPages)" />&nbsp;
			</span>
		</div>
		<footer>
			<%@ include file="/include/front/footer.jsp" %>
		</footer>
</body>
</html>