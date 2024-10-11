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
 *				: [20240626130000][pluto@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/product/index.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"					uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<%@ include file="/include/front/top.jsp" %>
	<%@ include file="/include/front/header.jsp" %>
	<header>
	<div style="text-align: center;">
	<%@ include file="/include/front/gnb_shopping.jsp" %>
	</div>
	</header>
	<style>
		 /* select 요소와 input 요소의 높이를 같게 하려면 */
	    select, input[type="text"] [type="submit"]{
	        height: 38px; /* 원하는 높이로 설정 */
	        line-height: 38px; /* 텍스트 중앙 정렬을 위해 같은 값을 설정 */
	        padding: 0 10px; /* 좌우 패딩 추가 */
	        font-size: 14px; /* 폰트 크기 조정 */
	        border: 1px solid #ccc; /* 테두리 스타일 */
	        border-radius: 4px; /* 테두리 둥글게 */
	        box-sizing: border-box; /* 패딩과 테두리를 포함한 크기 계산 */
	    }
	</style>
	<script>
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
<input type="hidden" id="cd_ctg_pet" name="cd_ctg_pet" />
<input type="hidden" name="seq_sle"		id="seq_sle" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />
<div class="container" id="content">
	<section class="content">
		<article class="txtCenter">
			<div class="brdSearchArea">
				<select name="cd_ctg" id="cd_ctg">
					<option value="1"<c:if test="${paging.cd_ctg_pet == 1}">selected</c:if>>강아지</option>
					<option value="2"<c:if test="${paging.cd_ctg_pet == 2}">selected</c:if>>고양이</option>
					<option value="3"<c:if test="${paging.cd_ctg_pet == 3}">selected</c:if>>햄스터</option>
					<option value="4"<c:if test="${paging.cd_ctg_pet == 4}">selected</c:if>>파충류</option>
				</select>
				<select name="cd_state_sale" id="cd_state_sale">
					<option value="1"<c:if test="${paging.cd_state_sale == 1}">selected</c:if>>판매중</option>
					<option value="2"<c:if test="${paging.cd_state_sale == 2}">selected</c:if>>판매중지</option>
					<option value="3"<c:if test="${paging.cd_state_sale == 3}">selected</c:if>>반려</option>
					<option value="9"<c:if test="${paging.cd_state_sale == 9}">selected</c:if>>품절</option>
				</select>
				
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}"/><input type="submit" value="검색"/>
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
<footer>
	<%@ include file="/include/front/footer.jsp" %>
</footer>
</html>