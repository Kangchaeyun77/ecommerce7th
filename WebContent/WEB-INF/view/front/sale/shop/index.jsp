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
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
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
			transition: transform 0.3s ease-in-out;
		}
		.product:hover {
		transform: translateY(-10px);
		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
		}
		.product_name {
        	font-size: 21px;
        	font-weight: bold;
        	margin : 20px;
        }
	</style>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="cd_ctg_pet" 	name="cd_ctg_pet"	value="${paging.cd_ctg_pet}"/>
<input type="hidden" id="pet_items" 	name="pet_items" 	value="${paging.pet_items}"/>
<input type="hidden" id="seq_sle"		name="seq_sle"		value="${paging.seq_sle}">
<input type="hidden" id="seq_mbr"		name="seq_mbr"/>
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="currentPage"	name="currentPage"	value="${paging.currentPage}" />
<div style="text-align: center;">
	<%@ include file="/include/front/gnb_shopping.jsp" %>
</div>
<script>

	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		frmMain.currentPage.setAttribute("value", value);
		frmMain.action="/front/sale/shop/index.web";
		frmMain.submit();
	}
	function goList(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_ctg_pet").value = value;
		frmMain.action = "/front/sale/shop/list.web";
		frmMain.submit();
	}

	function goWriteForm(value) {
		var frmMain = document.getElementById("frmMain");
		document.getElementById("cd_ctg_pet").value = value;
		document.getElementById("seq_sle").value = value;
		frmMain.action = "/front/buy/writeForm.web";
		frmMain.submit();
	}

	function addToCart(seqSle, seqPrd, sleNm, price, img) {

		const data = {
			seq_sle: seqSle,
			seq_prd: seqPrd, 
			sle_nm: sleNm,
			price: price,
			count: 1, // 기본 수량 1로 설정
			img: img
		};

		$.ajax({
			url: '/front/basket/addItem.web', 
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function(response) {
				if (confirm('상품이 장바구니에 추가되었습니다. 장바구니 페이지로 이동할까요?')) {
					window.location.href ='/front/basket/index.web';
				}
			},
			error: function(xhr, status, error) {
				alert('장바구니 추가 중 오류가 발생했습니다.');
			}
		});
	}
	</script>
<div class="container" id="content">
	<section class="content">
		<article class="txtCenter">
			<div class="brdSearchArea" style="margin: 30px; margin-left: 0px; margin-bottom: 15px">
				<select id="cd_ctg_pet" name="cd_ctg_pet" required>
					<option value="0"<c:if test="${paging.cd_ctg_pet == 0}"> selected</c:if>>전체</option>
					<option value="1"<c:if test="${paging.cd_ctg_pet == 1}"> selected</c:if>>강아지</option>
					<option value="2"<c:if test="${paging.cd_ctg_pet == 2}"> selected</c:if>>고양이</option>
					<option value="3"<c:if test="${paging.cd_ctg_pet == 3}"> selected</c:if>>햄스터</option>
					<option value="4"<c:if test="${paging.cd_ctg_pet == 4}"> selected</c:if>>파충류</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}"/><input type="submit" value="검색"/>
			</div>
			<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
				<div class="product-container" style="display: flex; flex-wrap: wrap; margin: 30px; margin-left: 0px">
					<c:choose>
						<c:when test="${empty list}">
							등록된 상품이 없습니다.
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list">
								<div class="product" style="text-decoration: none;">
									<a href="javascript:goWriteForm(${list.seq_sle});"><img src="${list.img}" class="img-fluid rounded-4" alt="image"></a>
									<div>
										<div class="product_name">
											<a href="javascript:goWriteForm(${list.seq_sle});">
											<span>${list.sle_nm}</span>
											</a>
										</div>
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
												<a href="javascript:addToCart(${list.seq_sle}, ${list.seq_prd}, '${list.sle_nm}', ${list.price_sale}, '${list.img}');" 
													class="btn-cart me-3 px-3 pt-2 pb-2" style="display: flex; align-items: center; justify-content: center; font-size: 18px;">
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
			<div class="center-container"  style= "display: flex; justify-content: center;">
			<plutozoneUtilTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage"/>
			</div>
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