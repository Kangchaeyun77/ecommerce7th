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
 *				: [20240808142000][hyebongssss@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"					uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<style>
		ul {
		    list-style-type: none;
		    padding: 0;
		    margin: 0;
		}
		body {
		    font-family: Arial, sans-serif;
		    margin: 0;
		    padding: 0;
		}
		
		.product-detail {
		    display: flex;
		    padding: 80px;
		}
		
		.product-image {
		    flex: 1;
		    padding-right: 20px;
		}
		
		.product-image img {
		    max-width: 100%;
		    height: auto;
		}
		
		.product-info {
		    flex: 1;
		}
		
		.product-name {
		    font-size: 24px;
		    font-weight: bold;
		    margin-bottom: 10px;
		}
		
		.product-description {
		    font-size: 16px;
		    margin-bottom: 20px;
		}
		
		.sale-price {
		    font-size: 20px;
		    color: #E74C3C; /* 원하는 가격 색상 */
		}
		
		.button-container {
		    margin-top: 20px;
		    margin: 0 10px;
		}
		.item_goods_tab ul {
		    list-style: none; /* 기본 리스트 스타일 제거 */
		    padding: 0; /* 패딩 제거 */
		    margin: 0; /* 마진 제거 */
		    display: flex; /* 가로로 배치 */
		}
		
		.item_goods_tab li {
		    margin-right: 20px; /* 항목 간 간격 조정 (필요에 따라 조정) */
		}
		
		.item_goods_tab li.on a {
		    font-weight: bold; /* 선택된 항목 강조 (필요에 따라 조정) */
		}
		.product-detail {
		    display: flex;
		    justify-content: space-between; /* 두 요소를 좌우에 배치 */
		    align-items: flex-start; /* 세로 정렬을 상단에 맞춤 */
		}
		
		.product-image {
		    flex: 1; /* 이미지 영역의 크기를 조정 (필요에 따라 변경 가능) */
		}
		
		.product-biginfo {
		    flex: 2; /* 정보 영역의 크기를 조정 (필요에 따라 변경 가능) */
		}
		.product-count input[type="number"],
		.product-count input[type="submit"] {
		    font-size: 20px; /* 글씨 크기 조정 */
		    border: 0;
		    border-radius: 15px;
		    outline: none;
		    background-color: #F5F5F5;
		    text-align: center; /* 텍스트를 중앙으로 정렬 */
		}
		.circular-button {
		    width: 30px; /* 너비 설정 */
		    height: 30px; /* 높이 설정 */
		    border: 0;
		    border-radius: 60%; /* 원형 만들기 */
		    outline: none;
		    background-color: #F5F5F5;
		    line-height: 10px;
		    cursor: pointer; /* 포인터 커서 추가 (선택 사항) */
		  }
		  .button list-button {
		  	width:100%; 
		  	padding:10px; 
		  	background-color:#dead6f; 
		  	color:white; 
		  	border:none; 
		  	border-radius:5px; 
		  	cursor:pointer; 
		  	font-size:16px;
		  }
		  .tabcontent {
		    display: none; /* 기본적으로 숨김 */
		    border: 1px solid #ccc;
		    padding: 10px;
		    margin-top: 10px;
		}
		
		.tablinks {
		    cursor: pointer;
		}
		
		.tablinks:hover {
		    text-decoration: underline;
		}
	</style>
	
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="seq_prd" 	id="seq_prd"	value="${saleDto.seq_prd}" />
<input type="hidden" name="seq_sle" 	id="seq_sle"	value="${saleDto.seq_sle}" />
<input type="hidden" name="sle_nm" 		id="sle_nm"		value="${saleDto.sle_nm}" />
<input type="hidden" name="price_sale" 	id="price_sale"	value="${saleDto.price_sale}" />
<input type="hidden" name="cd_ctg_pet"  id="cd_ctg_pet"	value="${saleDto.cd_ctg_pet}"/>

<input type="hidden" name="buyList[0].seq_sle" 			value="${saleDto.seq_sle}" />
<input type="hidden" name="buyList[0].seq_prd" 			value="${saleDto.seq_prd}" />
<div class="container">
	<div style="text-align: center;">
	<%@ include file="/include/front/gnb_shopping.jsp" %>
	</div>
	<script>
	
		<c:if test="${empty sessionScope.SEQ_MBR}">
		var isLogin = false;
		</c:if>
		
		<c:if test="${not empty sessionScope.SEQ_MBR}">
		var isLogin = true;
		</c:if>
		
		function writeProc() {
			
			if (!isLogin) {
				alert("로그인이 필요합니다!");
				return;
			}
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/front/buy/writeProc.web";
			frmMain.submit();
		}
		function setBasketIframe() {
			
			if (!isLogin) {
				alert("로그인이 필요합니다!");
				return;
			}
			
			// 화면의 구매할 상품 정보(수량 포함)를 서버로 전송
			var seq_sle		= document.getElementById("seq_sle").value;		// 판매 상품 일련번호
			var seq_prd		= document.getElementById("seq_prd").value;		// 상품 일련번호
			var seq_mng		= document.getElementById("seq_mng").value;		// 판매자 일련번호
			var sle_nm		= document.getElementById("sle_nm").value;		// 판매 상품명
			var price_sale	= document.getElementById("price_sale").value;		// 판매 상품 가격
			var count		= document.getElementById("count").value;		// 구매 수량
			var img			= document.getElementById("img").src;			// 판매 상품 이미지
			
			var item = seq_sle + "|" + seq_prd + "|" + seq_mng + "|" + sle_nm + "|" + price_sale + "|" + count + "|"	+ img;
			document.getElementById("item").value = item;
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/front/basket/setBasketIframe.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
		}
		
		function setBasketCookie() {
			
			if (!isLogin) {
				alert("로그인이 필요합니다!");
				return;
			}
			
			var seq_sle		= document.getElementById("seq_sle").value;		// 판매 상품 일련번호
			var seq_prd		= document.getElementById("seq_prd").value;		// 상품 일련번호
			var seq_sll		= document.getElementById("seq_mng").value;		// 판매자 일련번호
			var seq_mng		= document.getElementById("sle_nm").value;		// 판매 상품명
			var price_sale	= document.getElementById("price_sale").value;		// 판매 상품 가격
			var count		= document.getElementById("count").value;		// 구매 수량
			var img			= document.getElementById("img").src;			// 판매 상품 이미지
			
			var item = seq_sle + "|" + seq_prd + "|" + seq_sll + "|" + sle_nm + "|" + price + "|" + count + "|"	+ img;
			//alert(item);
			
			// 쿠키에 구매 정보를 저장
			insertBasket(item);
			
			if (confirm("장바구니로 이동하시겠습니까?")) {
				location.href = "/front/basket/main.web";
			}
			else {
				location.href = "/front/sale/";
			}
			
		}
		
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_ctg_pet").value = value;
			
			frmMain.action="/front/sale/shop/list.web";
			frmMain.submit();
		}
		
		function writeProc() {
			/* JavaScript + Cookie */
			// [2024-08-26][pluto@himedia.co.kr][TODO: 쿠키 정보(장바구니) 삭제(정상적으로 구매 및 결제된 경우만)]
			document.cookie = "productBasket=; path=/; expires=Sat, 01 Jan 1972 00:00:00 GMT";
			
			/* Session + iFrame
			[2024-08-27][pluto@himedia.co.kr][TODO: 세션 정보(장바구니) 삭제 필요(정상적으로 구매 및 결제된 경우)]
			*/
			
			/* Database + iFrame
			[2024-08-27][pluto@himedia.co.kr][TODO: 데이터베이스 정보(장바구니) 삭제 처리 필요(정상적으로 구매 및 결제된 경우)]
			*/
			
			var frmMain = document.getElementById("frmMain");
			frmMain.action = "/front/buy/writeProc.web";
			frmMain.submit();
		}
		function changeQuantity(delta) {
		    var countInput = document.getElementById("count");
		    var currentValue = parseInt(countInput.value) || 0; // 현재 수량 가져오기
		    var newValue = currentValue + delta; // 새로운 수량 계산하기
		    if (newValue >= 1) { // 최소 수량 제한
		        countInput.value = newValue; // 새로운 수량 설정
		    }
		}
		function validateInput(input) {
		    // 숫자가 아닌 문자 제거
		    input.value = input.value.replace(/[^0-9]/g, '');

		    // 입력값이 1보다 작으면 1로 설정
		    if (input.value === '' || parseInt(input.value) < 1) {
		        input.value = '1';
		    }
		}
		function openTab(evt, tabName) {
		    // 모든 탭 내용을 숨김
		    const tabcontents = document.querySelectorAll('.tabcontent');
		    tabcontents.forEach(tab => {
		        tab.style.display = "none";
		    });

		    // 클릭한 탭 버튼 활성화
		    const tablinks = document.querySelectorAll('.tablinks');
		    tablinks.forEach(tab => {
		        tab.classList.remove('active');
		    });

		    // 클릭한 탭 내용 표시 및 버튼 활성화
		    document.getElementById(tabName).style.display = "block";
		    evt.currentTarget.classList.add('active');
		}

		// 기본적으로 첫 번째 탭 열기
		document.addEventListener('DOMContentLoaded', () => {
		    document.querySelector('.tablinks').click(); // 첫 번째 탭 클릭
		});
	</script>
	<section class="content">
		<article class="txtCenter">
			<div class="product-detail" style="display: flex; justify-content: center; align-items: top; margin: 10px;">
		        <div class="product-image">
		            <img src="${saleDto.img}" class="img-fluid rounded-4" />
		        </div>
				<div class="product-biginfo" style="flex: 1; text-align: left;"">
			        <div class="product-info">
			        	<h1 class="product-name">${saleDto.sle_nm}</h1>
			            <p class="product-description">${saleDto.desces}</p>
			            <p class="product-price"><fmt:formatNumber value="${productDto.price_cost}" pattern="#,###" />원가</p>
			            <p class="sale-price">할인가: <fmt:formatNumber value="${saleDto.price_sale}" pattern="#,###" />원</p>
			        </div>
			        <div class="box__score-awards" onclick="javascript:clickReviewSummary('200011603', '30', '3', 'B');">
						<a href="#" class="sprite__vip2x--before link__score">
							<span class="text__score"><span class="for-a11y">평점</span>4.8</span>
							<span class="text__num">리뷰 5개</span>
						</a>
					</div>
			        <div class="quantity-container" style="margin: 90px; margin-left: 0px ">
					    <button type="button" onclick="changeQuantity(-1)" class="circular-button">-</button>
					    <input type="text" id="count" name="buyList[0].count" value="1" style="text-align: center;" oninput="validateInput(this)">
					    <button type="button" onclick="changeQuantity(1)" class="circular-button">+</button>
					</div>
			    </div>
			</div>
			<div class="button-container" style="text-align:center; padding-top:30px; padding-bottom:60px">
                <button class="button list-button" onclick="javascript:goList()" >목록</button>
                <button class="button buy-button" onclick="#">구매</button>
                <button class="button cart-button" onclick="javascript:setBasketCookie()">장바구니</button>
            </div>
			<div class="item_goods_tab">
		        <ul style="list-style: none; padding: 0; margin: 0; display: flex; justify-content: center;">
		            <li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'details')">
		                상품상세정보
		            </li>
		            <li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'delivery')">
		                배송안내
		            </li>
		            <li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'returns')">
		                교환 및 반품안내
		            </li>
		            <li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'reviews')">
		                상품후기 <strong>(0)</strong>
		            </li>
		            <li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'inquiries')">
		                상품문의 <strong>(0)</strong>
		            </li>
		        </ul>
		    </div>
		    <div id="details" class="tabcontent">
		        <h3>상품상세정보</h3>
		        <p>여기에 상품 상세 정보가 표시됩니다. ${saleDto.desces}</p>
		    </div>
		
		    <div id="delivery" class="tabcontent">
		        <h3>배송안내</h3>
		        <p>배송안내
					- 배송비 : 기본배송료는 3,000원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)  
					<br>
		            40,000원 이상 구매시 무료배송입니다.
					<br>
		            일부 부피가 큰 제품의 경우 제품당 5,000원의 추가 배송비가 부과됩니다.
					<br>
					- 본 상품의 평균 배송일은 2~3일입니다.
					<br>
					  (입금 확인 후) 설치 상품의 경우 다소 늦어질수 있습니다.
					<br>
					  [배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]
					<br>
					
					- 본 상품의 배송 가능일은 2~3일 입니다. 
					<br>
					  배송 가능일이란 본 상품을 주문 하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. 
					<br>
					  (단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.)</p>
		    </div>
		
		    <div id="returns" class="tabcontent">
		        <h3>교환 및 반품안내</h3>
		        <p>교환 및 반품안내
					- 상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 상품수령후 7일 이내라도 교환 및 반품이 불가능합니다.
					<br>
					- 저단가 상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다(제품의 하자,배송오류는 제외)
					<br>
					- 일부 상품은 신모델 출시, 부품가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.
					<br>
					- 신발의 경우, 실외에서 착화하였거나 사용흔적이 있는 경우에는 교환/반품 기간내라도 교환 및 반품이 불가능 합니다.
					<br>
					- 수제화 중 개별 주문제작상품(굽높이,발볼,사이즈 변경)의 경우에는 제작완료, 인수 후에는 교환/반품기간내라도 교환 및 반품이 불가능 합니다. 
					<br>
					- 수입,명품 제품의 경우, 제품 및 본 상품의 박스 훼손, 분실 등으로 인한 상품 가치 훼손 시 교환 및 반품이 불가능 하오니, 양해 바랍니다.
					<br>
					- 일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이 불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오. 
					<br>
					환불안내
					- 상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.</p>
		    </div>
		
		    <div id="reviews" class="tabcontent">
		        <h3>상품후기</h3>
		        <p>여기에 상품 후기가 표시됩니다.</p>
		    </div>
		
		    <div id="inquiries" class="tabcontent">
		        <h3>상품문의</h3>
		        <p>여기에 상품 문의 내용이 표시됩니다.</p>
		    </div>
		    
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