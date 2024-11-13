<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/pharmacy/list.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>동물병원 목록</title>
		<style>
			.container {
				width: 80%;
				margin: 0 auto;
				padding: 20px;
			}

			h1 {
				text-align: center;
				color: #333;
			}

			.hospital-list {
				list-style-type: none;
				padding: 0;
			}

			.hospital-item {
				border-bottom: 1px solid #ddd;
				padding: 10px 0;
			}

			.hospital-item:last-child {
				border-bottom: none;
			}

			.hospital-name {
				font-weight: bold;
				font-size: 18px;
			}

			.hospital-address,
			.hospital-phone {
				color: #555;
				font-size: 14px;
			}

			.hospital-name a {
				text-decoration: none;
				color: #007BFF;
			}

			.hospital-name a:hover {
				text-decoration: underline;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h1>동물병원 목록</h1>
			<ul class="hospital-list">
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">아프리카 동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 서현로 170</div>
					<div class="hospital-phone">전화번호: 705-7776</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">해마루 동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 황새울로319번길 8-6</div>
					<div class="hospital-phone">전화번호: 031-781-2992</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">분당중앙 동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 중앙공원로39번길 49</div>
					<div class="hospital-phone">전화번호: 031-708-8875</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">우성동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 돌마로 481</div>
					<div class="hospital-phone">전화번호: 707-1776</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">이레외과동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 백현로101번길 11</div>
					<div class="hospital-phone">전화번호: 031-605-0190</div>
				</li>
			</ul>
		</div>
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