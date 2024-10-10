<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241008172500][hyeen103#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/dogshop/list.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/top.jsp" %>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<style></style>
	<script>
	<%-- 
		function goView(value) {
			
			/*
			document.getElementById("currentPage").remove();
			document.getElementById("searchKey").remove();
			document.getElementById("searchWord").remove();
			*/
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("seq_bbs").value = value;
			
			frmMain.action="/front/center/board/view.web";
			frmMain.submit();
		}
		
		function goPage(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = value;
			
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
		
		function goList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("searchWord").value = "";
			document.getElementById("currentPage").value = "1";
			document.getElementById("cd_bbs_type").value = value;
			
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
	--%>
		function goShop(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_ctg_pet").value = value;
			document.getElementById("searchWord").value = "";
			document.getElementById("currentPage").value = "1";
			
			frmMain.action="/front/sale/dogshop/list.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
<div class="container" id="content">
	<section class="content">
		<article class="txtCenter">
			<div class="brdSearchArea">
				<select name="searchKey">
					<option value="sle_nm">상품명</option>
					<option value="sle_desces">상품설명</option>
					<option value="sle_desces_and_nm">상품명 및 설명</option>
				</select>
				<select name="cd_ctg" id="cd_ctg">
					<option value="1"<c:if test="${paging.cd_ctg_pet == 1}">selected</c:if>>강아지</option>
					<option value="2"<c:if test="${paging.cd_ctg_pet == 2}">selected</c:if>>고양이</option>
					<option value="3"<c:if test="${paging.cd_ctg_pet == 3}">selected</c:if>>햄스터</option>
					<option value="4"<c:if test="${paging.cd_ctg_pet == 4}">selected</c:if>>파충류</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}"/ ><input type="submit" value="검색"/>
			</div>
			<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
<div>
	<c:choose>
		<c:when test="${empty list}">
			등록된 상품이 없습니다.
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="list">
				<div class="swiper-wrapper">
			
					<!-- 각 상품을 나타내는 슬라이드,NEW영역 -->
					<div class="swiper-slide">
						<!-- 'New' 라벨 표시-->
						<div class="card position-relative">
							<!-- NEW상품1 이미지 링크 -->
							<a href="/front/sale/view.web?seq_sle=${list.seq_sle}"><img src="sle_img" class="img-fluid rounded-4" alt="image"></a>
							<div class="card-body p-0">
									<span class="card-title pt-4 m-0">${list.sle_nm}</span>
										<!-- h3대신 span로 대체 
											<h3 class="card-title pt-4 m-0">Grey hoodie</h3>
										-->
								</a>
								<div class="card-text">
													<!-- 
										<span class="rating secondary-font">
												<iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
												<iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
												<iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
												<iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
												<iconify-icon icon="clarity:star-solid" class="text-primary"></iconify-icon>
												5.0
											</span>
											 -->
											<span class="rating secondary-font">
											    ⭐️
											    ⭐️
											    ⭐️
											    ⭐️
											    ⭐️
											    5.0
											</span>
								<h3 class="secondary-font text-primary">$18.00${list.sle_price_sale}</h3>
								<div class="d-flex flex-wrap mt-3">
									<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
									    <span class="text-uppercase m-0">Add to Cart</span>
									</a>
									    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
									        <span  class="fs-5" style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
										</a>
								 </div>
								<!-- 'Add to Cart'와 'Wishlist' 버튼 
								<div class="d-flex flex-wrap mt-3">
									<a href="#" class="btn-cart me-3 px-4 pt-3 pb-3">
										<h5 class="text-uppercase m-0">Add to Cart</h5>
									</a>
									<a href="#" class="btn-wishlist px-4 pt-3 ">
										<iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
									</a>
								</div>
									-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
	<br/>
	<plutozoneUtilTag:page styleID="admin_text" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages"/>
	<br/>
	</article>
	<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>