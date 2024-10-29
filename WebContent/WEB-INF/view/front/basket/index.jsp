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
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241014174700][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<%@ page import="com.happySteps.front.basket.dto.BasketDto" %>
<!DOCTYPE html>
<html>
<head>
	<title>장바구니</title>
	<link rel="stylesheet" type="text/css" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" href="/css/table.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function removeItem(seqBsk) {
			$.ajax({
				url: '/front/basket/removeItem.web',
				type: 'POST',
				data: { seq_bsk: seqBsk },
				success: function(response) {
					alert('상품이 삭제되었습니다.');
					window.location.reload();
				},
				error: function(xhr, status, error) {
					alert('상품 삭제 중 오류가 발생했습니다.');
				}
			});
		}

		function updateTotalPrice() {
			let total = 0;
			document.querySelectorAll('input[name="selectedItems"]:checked').forEach(function(checkbox) {
				let price = parseInt(checkbox.getAttribute("data-price"));
				let count = parseInt(checkbox.getAttribute("data-count"));
				total += price * count;
			});
			document.getElementById("totalPriceDisplay").textContent = total + " 원";
			document.getElementById("totalPrice").value = total;
		}
		
		document.addEventListener("DOMContentLoaded", function() {
			updateTotalPrice(); // 페이지 로드 시 총 가격 계산
		});

		function proceedToPayment() {
			const selectedItems = document.querySelectorAll('input[name="selectedItems"]:checked');
			if (selectedItems.length === 0) {
				alert("결제할 상품을 선택해주세요.");
				return;
			}

			const form = document.getElementById("frmMain");
			form.innerHTML = ''; // 폼 초기화

			selectedItems.forEach(function(item) {
				const input = document.createElement("input");
				input.type = "hidden";
				input.name = "selectedItems";
				input.value = item.value; // 선택된 상품의 seq_bsk 값
				form.appendChild(input);
			});

			form.action = "/front/pay/payment.web";
			form.submit();
		}
		
		function goWriteForm(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("cd_ctg_pet").value = value;
			document.getElementById("seq_sle").value = value;
			frmMain.action = "/front/buy/writeForm.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="/include/front/header.jsp" %>
		<%@ include file="/include/front/top.jsp" %>
	</header>
	<section class="content">
		<nav></nav>
		<form id="frmMain" method="POST">
			<c:if test="${empty sessionScope.SEQ_MBR}">
				<script type="text/javascript">
					window.location.href = '/front/member/login.jsp';
				</script>
			</c:if>
			
			<c:if test="${not empty sessionScope.SEQ_MBR}">
				<c:if test="${not empty basketList}">
					<table id="productBasket" class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto;">
						<tr>
							<th>선택</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>수량</th>
							<th>1개당 가격</th>
							<th>삭제</th>
						</tr>
						<c:forEach var="item" items="${basketList}">
							<tr>
								<td><input type="checkbox" name="selectedItems" value="${item.seq_bsk}" data-price="${item.price}" data-count="${item.count}" checked  onclick="updateTotalPrice()"></td>
								<td><a href="/front/buy/writeForm.web?seq_sle=${item.seq_sle}"><img src="${item.img}" alt="상품 이미지" height="100px"/></a></td>
								<td><a href="/front/buy/writeForm.web?seq_sle=${item.seq_sle}">${item.sle_nm}</a></td>
								<td>${item.count}</td>
								<td>${item.price} 원</td>
								<td><a href="javascript:void(0);" onclick="removeItem(${item.seq_bsk})">삭제</a></td>
							</tr>
						</c:forEach>
					</table>
					<div class="total" style="text-align:center">
						<p>총 결제금액: <span id="totalPriceDisplay">0 원</span></p>
						<input type="hidden" name="totalPrice" id="totalPrice" value="0">
						<button type="button" onclick="proceedToPayment();" style="padding: 10px 20px; font-size: 16px;">결제 페이지로 이동</button>
					</div>
				</c:if>
				<c:if test="${empty basketList}">
					<p>장바구니가 비어 있습니다.</p>
				</c:if>
			</c:if>
		</form>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</body>
</html>
