<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: happySteps.com
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004123400][kbs@>_<.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/vendor.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
	
	<script>
	
	document.addEventListener("DOMContentLoaded", function() {
		let lastScrollTop = 0;
		const fixedElement = document.getElementById('fixedElement');

		window.addEventListener('scroll', function() {
			let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

			if (scrollTop > lastScrollTop) {
				// 스크롤 다운 시 사라지기
				fixedElement.style.opacity = '0'; // 요소를 투명하게
			} else {
				// 스크롤 업 시 나타나기
				fixedElement.style.opacity = '1'; // 요소를 다시 보이게
			}
			lastScrollTop = scrollTop;
		});
	});
</script>

<div class="container py-2">
	<div class="row py-4 pb-0 pb-sm-4 align-items-center ">
		<div class="col-sm-4 col-lg-3 text-center text-sm-start">
<span style="position: absolute; top: 0; right: 0; line-height: 43px; vertical-align: middle;">
	<div>
		<ul class="list-unstyled d-flex m-0">
			<li style="margin: 0 8px;">
				<c:if test="${empty sessionScope.SEQ_MBR}"><%--로그인--%>
					<a href="/front/login/loginForm.web">
						<iconify-icon icon="uis:lock-alt" style="width: 24px; height: 50px; color: #000; vertical-align: middle; margin-top: 4px;"></iconify-icon>
					</a>
				</c:if>
				<c:if test="${not empty sessionScope.SEQ_MBR}"><%--로그아웃--%>
					<a href="/front/login/loginForm.web">
						<img src="/images/logoutlogo.png" style="width: 26px; height: 28px; object-fit: contain; vertical-align: middle;">
					</a>
				</c:if>
			</li>
			<li style="margin: 0 8px;">
				<a href="/front/myPage/index.web"><%--마이페이지--%>
					<iconify-icon icon="healthicons:person" class="fs-4" style="width: 24px; height: 24px; color: #000; vertical-align: middle; margin-top: 4px;"></iconify-icon>
				</a>
			</li>
			<li style="margin: 0 8px;">
				<a href="#"><%--찜--%>
					<iconify-icon icon="mdi:heart" class="fs-4" style="width: 24px; height: 24px; color: #000; vertical-align: middle; margin-top: 4px;"></iconify-icon>
				</a>
			</li>
			<li style="margin: 0 8px;">
				<a href="#"><%--장바구니--%>
					<iconify-icon icon="mdi:cart" class="fs-4 position-relative" style="width: 24px; height: 24px; color: #000; vertical-align: middle; margin-top: 4px;"></iconify-icon>
				</a>
			</li>
		</ul>
	</div>
</span>
			<div class="main-logo">
				<a href="/front/index.web">
					<img src="/images/logo/logo3.png" alt="logo" class="img-fluid">
				</a>
			</div>
		</div>
		<div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
			<div class="search-bar border rounded-2 px-3 border-dark-subtle">
				<form id="search-form" class="text-center d-flex align-items-center" action="" method="">
					<input type="text" class="form-control border-0 bg-transparent" placeholder="다양한 상품을 검색하세요" />
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						<path fill="currentColor" d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
					</svg>
				</form>
			</div>
		</div>
		<div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
			<div class="support-box text-end d-none d-xl-block">
				<span class="fs-6 secondary-font text-muted">Phone</span>
				<h5 class="mb-0">010-1234-5678</h5>
			</div>
			<div class="support-box text-end d-none d-xl-block">
				<span class="fs-6 secondary-font text-muted">Email</span>
				<h5 class="mb-0">HappySteps@gmail.com</h5>
			</div>
		</div>
		
	</div>
</div>

