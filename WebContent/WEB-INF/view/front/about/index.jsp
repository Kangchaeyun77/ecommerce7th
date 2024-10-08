<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 HAPPYSTEPS.COM에 있으며,
 * HAPPYSTEPS.COM이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * HAPPYSTEPS.COM의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-01][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/front/about/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>소개</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		p {
			margin-top: 5px;
			line-height: 1.6;
			margin-bottom: 10px;
		}
		.container {
			max-width: 3000px;
			margin: 0 auto;
			padding: 0 20px;
		}
		.snb {
			background-color: #F9F3EC;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		}
		.snb ul {
			list-style-type: none;
			padding: 0;
			margin: 0;
		}
		.snb li {
			display: inline;
			margin-right: 15px;
		}
		.snb a {
			text-decoration: none;
			color: #000;
			padding: 15px 20px;
			border-radius: 4px;
			transition: background-color 0.3s;
		}
		.snb a:hover {
			background-color: #E0E0E0;
		}
		body {
			font-family: 'RixXladywatermelonR', Arial, sans-serif;
			background-color: #ffffff;
			color: #000;
			margin: 0 auto;
			padding: 20px;
			max-width: 2000px;
		}
		.txtCenter {
			text-align: center;
			margin-bottom: 20px;
			background-color: #ffffff;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		}
		button.accordion {
			background-color: #FFFFF0;
			color: #000;
			cursor: pointer;
			padding: 10px;
			width: 100%;
			border: none;
			text-align: left;
			outline: none;
			font-size: 16px;
			transition: background-color 0.3s;
			border-radius: 5px;
			margin: 5px 0;
		}
		button.accordion:hover {
			background-color: #FFC107;
		}
		button.accordion.active {
			background-color: #FAEBD7;
		}
		.accordion2 {
			background-color: #FFF;
			color: #000;
			cursor: text;
			padding: 10px;
			width: 950px;
			border: 1px solid #ddd;
			border-radius: 5px;
			margin: 5px 0;
			resize: none;
			overflow: auto;
			height: auto;
		}
		.panel {
			padding: 1px 1px;
			background-color: white;
			overflow: hidden;
			display: none;
			height: auto;
		}
	</style>
</head>
<body>
	<form id="frmMain">
		<div class="container">
			<article class="txtCenter">
				<div style="position: relative; height: 350px; overflow: hidden; margin-top: 10px;">
					<a href="/front/">
						<img src="/images/logo/logo3.png" alt="로고" style="width: 380px; height: 250px; object-fit: cover;"/>
					</a>
					<nav class="snb">
						<ul>
							<li><a href="/front/about/index.web" class="menuSnb">소개</a></li>
							<li><a href="/front/intro/service.web" class="menuSnb">서비스 안내</a></li>
							<li><a href="/#" class="menuSnb">윤리경영</a></li>
							<li><a href="/#" class="menuSnb">미션/비전</a></li>
							<li><a href="/#" class="menuSnb">조직도</a></li>
							<li><a href="/front/intro/map.web" class="menuSnb">오시는 길</a></li>
						</ul>
					</nav>
				</div>
				<img src="/images/about.png" style="width: 50%; height: auto;">
				<br><br><br>
				<div style="text-align: left; width: 50%; height: auto; margin: 0 auto;">
					<p>안녕하세요, 따뜻한 마음으로 <strong>반려동물과 유기동물을 사랑하는 여러분!</strong></p>
					<p>저희 이커머스 플랫폼에 <strong>오신 것을 진심으로 환영합니다.</strong> 저희 플랫폼은 단순히 상품을 구매하는 곳을 넘어, 반려동물과 유기동물의 행복한 삶을 함께 만들어가는 특별한 공간입니다.</p>
					<p>반려동물은 우리에게 한결같은 사랑과 위로를 주는 소중한 친구입니다. 그리고 그 친구들의 행복이 곧 우리의 행복이라고 믿고 있기에, 저희는 반려동물의 삶의 질을 높이고, 유기동물에게 따뜻한 가정을 제공하기 위해 최선을 다하고 있습니다.</p>
					<p>저희 플랫폼의 <strong>특별한 서비스는 다음과 같습니다:</strong></p>
					<div>
						<strong>애완동물 용품 판매:</strong> 반려동물에게 필요한 모든 용품을 쉽게 찾고 구매할 수 있도록 다양한 상품을 제공하고 있습니다.<br><br>
						<strong>유기동물 입양 지원:</strong> 유기동물과 새로운 가족이 될 수 있도록 입양 절차와 필요한 정보를 제공하며, 입양 후에도 필요한 모든 도움을 지속적으로 제공합니다.<br><br>
						<strong>커뮤니티:</strong> 반려동물에 대한 정보와 경험을 공유하고, 유기동물 입양 문화를 확산하는 따뜻한 커뮤니티를 운영하고 있습니다.<br><br>
						<strong>병원 예약 서비스:</strong> 반려동물의 건강을 위해 간편하게 병원을 예약할 수 있는 기능도 제공하고 있습니다.<br><br>
					</div>
					<p>저희는 반려동물과 유기동물을 사랑하는 모든 이들이 하나의 <strong>커다란 공동체로 연결될 수 있도록 계속해서 노력하고 있습니다.</strong></p>
					<p>함께 더 나은 세상을 만들어 가며, 반려동물과 유기동물이 행복하게 살아갈 수 있는 밝은 미래를 만들어 나가길 소망합니다. 여러분의 따뜻한 관심과 참여가 그 시작입니다.</p>
					<br><br>
					</div>
			</article>
		</div>			
		<footer>
			<%@ include file="/include/front/login_footer.jsp" %>
		</footer>
	</form>
</body>
</html>