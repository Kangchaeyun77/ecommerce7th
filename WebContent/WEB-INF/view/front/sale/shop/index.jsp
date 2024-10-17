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
<%@ page info="/WEB-INF/view/front/sale/shop/index.jsp" %>
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
	<style>
	    .brdSearchArea {
	        display: flex;
	        justify-content: flex-start;
	        gap: 5px; /* 요소 간의 간격 조정 */
	    }
	    .brdSearchArea select,
	    .brdSearchArea input[type="text"],
	    .brdSearchArea input[type="submit"] {
	        font-size: 14px; /* 글씨 크기 조정 */
	        border: 0;
			border-radius: 15px;
			outline: none;
			background-color: #F5F5F5
	    }
	    /* 필요에 따라 최대 너비 설정 */
	    .brdSearchArea select {
	        width: 100px; /* 예: select 박스 너비 설정 */
	    }
	    .brdSearchArea input[type="text"] {
	        width: 150px; /* 예: 텍스트 입력 박스 너비 설정 */
	    }
	    .product-container {
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		    gap: 20px;
		    justify-items: center;
		}
		.product {
		    background-color: white;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    padding: 20px;
		    width: 250px;
		    text-align: center;
		}
	</style>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="cd_ctg_pet" 	name="cd_ctg_pet"	value="${paging.cd_ctg_pet}"/>
<input type="hidden" id="seq_sle"		name="seq_sle"		value="${paging.seq_sle}">
<input type="hidden" id="seq_mbr"		name="seq_mbr"/>
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="currentPage"	name="currentPage"	value="${paging.currentPage}" />
<div style="text-align: center;">
	<%@ include file="/include/front/gnb_shopping.jsp" %>
</div>
<script>
		
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_ctg_pet").value = value;
			frmMain.action="/front/sale/shop/list.web";
			frmMain.submit();
		}
	
		function goWriteForm(value) {
		    var frmMain = document.getElementById("frmMain");
		    
		    document.getElementById("cd_ctg_pet").value = value;
		    document.getElementById("seq_sle").value = value;
		    frmMain.action = "/front/buy/writeForm.web";
		    frmMain.submit();
		}
		
</script>
<div class="container" id="content">
	<section class="content">
		<article class="txtCenter">
		 
			<div class="brdSearchArea">
			<%--
				<select name="cd_ctg_pet_items" id="cd_ctg_pet_items">
					<option value="1"<c:if test="${paging.cd_ctg_pet == 1}">selected</c:if>>강아지</option>
					<option value="2"<c:if test="${paging.cd_ctg_pet == 2}">selected</c:if>>고양이</option>
					<option value="3"<c:if test="${paging.cd_ctg_pet == 3}">selected</c:if>>햄스터</option>
					<option value="4"<c:if test="${paging.cd_ctg_pet == 4}">selected</c:if>>파충류</option>
				</select>
				--%>
			<%-- 
				<c:choose>
					<c:when test="${cd_ctg_pet == 1}">
						<select name="cd_ctg_pet" id="cd_ctg_pet_dog">
							<option value="11"<c:if test="${paging.cd_ctg_pet == 11}">selected</c:if>>사료</option>
							<option value="12"<c:if test="${paging.cd_ctg_pet == 12}">selected</c:if>>간식</option>
							<option value="13"<c:if test="${paging.cd_ctg_pet == 13}">selected</c:if>>하우스</option>
							<option value="14"<c:if test="${paging.cd_ctg_pet == 14}">selected</c:if>>기타</option>
						</select>
					</c:when>
				<c:otherwise>
					<c:if test="${cd_ctg_pet == 2}">
						<select name="cd_ctg_pet" id="cd_ctg_pet_cat">
							<option value="21"<c:if test="${paging.cd_ctg_pet == 21}">selected</c:if>>사료</option>
							<option value="22"<c:if test="${paging.cd_ctg_pet == 22}">selected</c:if>>간식</option>
							<option value="23"<c:if test="${paging.cd_ctg_pet == 23}">selected</c:if>>하우스</option>
							<option value="24"<c:if test="${paging.cd_ctg_pet == 24}">selected</c:if>>기타</option>
						</select>
					</c:if>
					<c:if test="${cd_ctg_pet == 3}">
						<select name="cd_ctg_pet" id="cd_ctg_pet_hamster">
							<option value="31"<c:if test="${paging.cd_ctg_pet == 31}">selected</c:if>>사료</option>
							<option value="32"<c:if test="${paging.cd_ctg_pet == 32}">selected</c:if>>간식</option>
							<option value="33"<c:if test="${paging.cd_ctg_pet == 33}">selected</c:if>>하우스</option>
							<option value="34"<c:if test="${paging.cd_ctg_pet == 34}">selected</c:if>>기타</option>
						</select>
					</c:if>
					<c:if test="${cd_ctg_pet == 4}">
						<select name="cd_ctg_pet" id="cd_ctg_pet_reptile">
							<option value="41"<c:if test="${paging.cd_ctg_pet == 41}">selected</c:if>>사료</option>
							<option value="42"<c:if test="${paging.cd_ctg_pet == 42}">selected</c:if>>간식</option>
							<option value="43"<c:if test="${paging.cd_ctg_pet == 43}">selected</c:if>>하우스</option>
							<option value="44"<c:if test="${paging.cd_ctg_pet == 44}">selected</c:if>>기타</option>
						</select>
					</c:if>
				</c:otherwise>
				</c:choose>
				--%>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}"/><input type="submit" value="검색"/>
			</div>
			<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
				<div class="product-container" style="display: flex; flex-wrap: wrap;">
					<c:choose>
						<c:when test="${empty list}">
							등록된 상품이 없습니다.
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list">
								<div class="product">
									<a href="javascript:goWriteForm(${list.seq_sle});"><img src="${list.img}" class="img-fluid rounded-4" alt="image"></a>
									<div>
										<a href="javascript:goWriteForm(${list.seq_sle});"><span>${list.sle_nm}</span>
										</a>
										<div class="card-text">
											<span class="rating secondary-font">
											    ⭐️
											    ⭐️
											    ⭐️
											    ⭐️
											    ⭐️
											    5.0
											</span>
											<h3 class="secondary-font text-primary"><fmt:formatNumber value="${list.price_sale}" pattern="#,###" />원</h3>
												<div class="d-flex flex-wrap mt-3">
													<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="display: flex; align-items: center; justify-content: center; font-size: 18px;">
													    <span class="text-uppercase m-0">장바구니</span>
													</a>
													    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px;">
													        <span  class="fs-5" style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
														</a>
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