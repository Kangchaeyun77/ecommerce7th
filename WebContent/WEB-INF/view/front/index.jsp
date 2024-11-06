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
<%@ page info="/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<title>HappySteps - 행복한발걸음</title>
</head>
<body>
<header>
	<%@ include file="/include/front/header.jsp" %>
</header>
<top>
	<%@ include file="/include/front/top.jsp" %>
</top>
<script>
function goWriteForm(value) {
	var frmMain = document.getElementById("frmMain");
	
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
<!-- 슬라이드 배너 영역(첫페이지) -->
<section id="banner" style="background: #F9F3EC;">
	<div class="container">
		<div class="swiper main-swiper">
<div class="swiper-wrapper">
				<div class="swiper-slide py-5">
					<div class="row banner-content align-items-center">
						<div class="img-wrapper col-md-5">
							<img src="../images/banner-img.png" class="img-fluid">
						</div>
						<div class="content-wrapper col-md-7 p-5 mb-5">
							<div class="secondary-font text-primary text-uppercase mb-4">사랑하는 내 강아지를 위해서</div>
							<h2 class="banner-title display-1 fw-normal">Best choice <br>
							<span class="text-primary">강아지 용품</span>
							</h2>
							<a href="/front/sale/shop/list.web?cd_ctg_pet=1" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
								바로가기
								<!-- 
								<svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
									<use xlink:href="#arrow-right"></use>
								</svg>
								 -->
							</a>
						</div>
					</div>
				</div>
<!-- 슬라이드 배너 영역(두번째 페이지) -->
<div class="swiper-slide py-5">
	<div class="row banner-content align-items-center">
		<div class="img-wrapper col-md-5">
			<img src="../images//banner-img3.png" class="img-fluid">
		</div>
		<div class="content-wrapper col-md-7 p-5 mb-5">
			<div class="secondary-font text-primary text-uppercase mb-4">사랑하는 내 고양이를 위해서</div>
			<h2 class="banner-title display-1 fw-normal">Best choice <br>
				<span class="text-primary">고양이 용품</span>
			</h2>
			<a href="/front/sale/shop/list.web?cd_ctg_pet=2" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
				바로가기
			</a>
		</div>
	</div>
</div>
<!-- 슬라이드 배너 영역(세번째 페이지) -->
<div class="swiper-slide py-5">
	<div class="row banner-content align-items-center">
		<div class="img-wrapper col-md-5">
			<img src="../images/banner-img4.png" class="img-fluid">
		</div>
		<div class="content-wrapper col-md-7 p-5 mb-5">
			<div class="secondary-font text-primary text-uppercase mb-4">사랑하는 내 햄스터를 위해서</div>
			<h2 class="banner-title display-1 fw-normal">Best choice <br>
				<span class="text-primary">햄스터 용품</span>
			</h2>
			<a href="/front/sale/shop/list.web?cd_ctg_pet=3" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
				바로가기
			</a>
		</div>
	</div>
</div>
<!-- 슬라이드 배너 영역(네번째 페이지) -->
<div class="swiper-slide py-5">
	<div class="row banner-content align-items-center">
		<div class="img-wrapper col-md-5">
			<img src="../images/banner-img5.png" class="img-fluid">
		</div>
		<div class="content-wrapper col-md-7 p-5 mb-5">
			<div class="secondary-font text-primary text-uppercase mb-4">사랑하는 내 파충류를 위해서</div>
			<h2 class="banner-title display-1 fw-normal">Best choice <br>
				<span class="text-primary">파충류 용품</span>
			</h2>
			<a href="/front/sale/shop/list.web?cd_ctg_pet=4" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
				바로가기
			</a>
			</div>
		</div>
	</div>
</div>
<!-- swiper 라이브러리 -->
<div class="swiper-pagination mb-5"></div>
	</div>
	</div>
</section>
<!-- 카테고리영역 -->
 <section id="categories">
	<div class="container my-3 py-5">
		<div class="row my-5">
			<div class="col text-center">
				<a href="/front/sale/shop/index.web" class="categories-item">
				<img src="../images/categories-item/all.png" class="img-fluid">
				<!--이전코드
					<iconify-icon class="category-icon" icon="ph:cat"></iconify-icon> -->
				</a>
			</div>
			<div class="col text-center">
				<a href="/front/sale/shop/list.web?cd_ctg_pet=1" class="categories-item">
					<img src="../images/categories-item/dogShop.png" class="img-fluid">	
				</a>
			</div>
			<div class="col text-center">
				<a href="/front/sale/shop/list.web?cd_ctg_pet=2" class="categories-item">
					<img src="../images/categories-item/catShop.png" class="img-fluid">
				</a>
			</div>
			<div class="col text-center">
				<a href="/front/sale/shop/list.web?cd_ctg_pet=3" class="categories-item">
					<img src="../images/categories-item/hamsterShop.png" class="img-fluid">
				</a>
			</div>
			<div class="col text-center">
				<a href="/front/sale/shop/list.web?cd_ctg_pet=4" class="categories-item">
					<img src="../images/categories-item/reptilesShop.png" class="img-fluid">
				</a>
			</div>
		</div>
	</div>
</section>
<section id="bestselling" class="my-5 overflow-hidden">
	<div class="container py-5 mb-5">

		<div class="section-header d-md-flex justify-content-between align-items-center mb-3">
			<h2 class="display-3 fw-normal" style="font-size: 55px">오늘의 쇼핑 제안🛍️</h2><%--Best selling products --%>
			<div>
				<a href="/front/sale/shop/index.web" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
					전체 상품 보러가기
					<span class="arrow-text">→</span> <!-- 화살표 텍스트 -->
				</a>
			</div>
		</div>

		<div class="swiper bestselling-swiper">
			<div class="swiper-wrapper">

				<c:choose>
					<c:when test="${empty randomProducts}">
						등록된 상품이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach items="${randomProducts}" var="product">
						<div class="swiper-slide">
							<div class="card position-relative">
								<a href="javascript:goWriteForm(${product.seq_sle});"><img src="${product.img}" class="img-fluid rounded-4" alt="image"></a>
								<div class="card-body p-0">
									<a href="javascript:goWriteForm(${product.seq_sle});">
									<span><strong>${product.sle_nm}</strong></span>
									</a>
									<div class="card-text">
										<span class="rating star" >
											⭐️
											⭐️
											⭐️
											⭐️
											⭐️
											5.0
										</span>
										<h3 class="secondary-font text-primary"><fmt:formatNumber value="${product.price_sale}" pattern="#,###" />원</h3>
										<div class="d-flex flex-wrap mt-3">
											<a href="javascript:addToCart(${product.seq_sle}, ${product.seq_prd}, '${product.sle_nm}', ${product.price_sale}, '${product.img}');" 
												class="btn-cart me-3 px-3 pt-2 pb-2" style="display: flex; align-items: center; justify-content: center; font-size: 18px;">
											<span class="text-uppercase m-0">장바구니</span>
											</a>
												<a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px;" onclick="toggleHeart(this)">
													<span class="fs-5" style="color: black; font-size: 20px; line-height: 1;">&#9825;</span>
												</a>
										 </div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		
	</div>
</section>

<section id="pop_item" class="my-5 overflow-hidden">
	<div class="container pb-5">


		<div class="section-header d-md-flex justify-content-between align-items-center mb-3">
			<h2 class="display-3 fw-normal" style="font-size: 55px;">
			지금 이 상품이 필요하신가요?<span style="font-size: 20px;"> 💡광고</span>
			</h2>
		<div>
			<a href="/front/sale/shop/index.web" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
				전체 상품 보러가기
				 <span class="arrow-text">→</span> <!-- 화살표 텍스트 -->
			</a>
		</div>
		</div>

		<div class="products-carousel swiper">
			<div class="swiper-wrapper">

				<c:choose>
					<c:when test="${empty randomProducts2}">
						등록된 상품이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach items="${randomProducts2}" var="product2">
						<div class="swiper-slide">
							<div class="card position-relative">
								<a href="javascript:goWriteForm(${product2.seq_sle});"><img src="${product2.img}" class="img-fluid rounded-4" alt="image"></a>
								<div class="card-body p-0">
									<a href="javascript:goWriteForm(${product2.seq_sle});">
									<span><strong>${product2.sle_nm}</strong></span>
									</a>
									<div class="card-text">
										<span class="rating star" >
											⭐️
											⭐️
											⭐️
											⭐️
											⭐️
											5.0
										</span>
										<h3 class="secondary-font text-primary"><fmt:formatNumber value="${product2.price_sale}" pattern="#,###" />원</h3>
										<div class="d-flex flex-wrap mt-3">
											<a href="javascript:addToCart(${product2.seq_sle}, ${product2.seq_prd}, '${product2.sle_nm}', ${product2.price_sale}, '${product2.img}');" 
												class="btn-cart me-3 px-3 pt-2 pb-2" style="display: flex; align-items: center; justify-content: center; font-size: 18px;">
											<span class="text-uppercase m-0">장바구니</span>
											</a>
												<a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px;" onclick="toggleHeart(this)">
													<span class="fs-5" style="color: black; font-size: 20px; line-height: 1;">&#9825;</span>
												</a>
										 </div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
</section>

<section id="Popular" class="my-5">
	<div class="container my-5 py-5">
		<div class="section-header d-md-flex justify-content-between align-items-center">
			<h2 class="display-3 fw-normal" style="font-size: 55px;">품목별 추천 상품</h2><%--Popular products --%>
			<div class="mb-4 mb-md-0">
				<p class="m-0">
					<button class="filter-button me-4 active" data-filter="*">ALL</button>
					<button class="filter-button me-4" data-filter=".dog">강아지</button>
					<button class="filter-button me-4" data-filter=".cat">고양이</button>
					<button class="filter-button me-4" data-filter=".hamster">햄스터</button>
					<button class="filter-button me-4" data-filter=".reptile">파충류</button>
				</p>
			</div>
			<div>
				<a href="/front/sale/shop/index.web" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
					보러가기
					 <span class="arrow-text">→</span> <!-- 화살표 텍스트 -->
					 <!-- 
					<svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
						<use xlink:href="#arrow-right"></use>
					</svg>
					 -->
				</a>
			</div>
		</div>
       <div class="isotope-container row">

        <div class="item cat col-md-4 col-lg-3 my-4">
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/cat1.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
               <span class="card-title pt-4 m-0">로얄캐닌 인도어 4kg</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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

				<h3 class="secondary-font text-primary">55,800원</h3>

				<div class="d-flex flex-wrap mt-3">
						<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
						    <span class="text-uppercase m-0">Add to Cart</span>
						</a>
						    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
						        <span  class="fs-5" style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
						        <!--  
						            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
						        -->
							</a>
				</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item dog col-md-4 col-lg-3 my-4">
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/dog1.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
              <span class="card-title pt-4 m-0">에코 7 센시티브솔루션 (램)</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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
                <h3 class="secondary-font text-primary">16,000원</h3>

			<div class="d-flex flex-wrap mt-3">
					<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
					    <span class="text-uppercase m-0">Add to Cart</span>
					</a>
					    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
					        <span class="fs-5 style=" color: black; font-size: 20px; line-height: 1;">❤︎</span>
					        <!--  
					            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
					        -->
					    </a>
			</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item hamster col-md-4 col-lg-3 my-4">
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/ham11.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
               <span class="card-title pt-4 m-0">그레이트 믹스 골든 600g</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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
                <h3 class="secondary-font text-primary">12,000원</h3>

			<div class="d-flex flex-wrap mt-3">
					<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
					    <span class="text-uppercase m-0">Add to Cart</span>
					</a>
					    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
					        <span  class="fs-5" style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
					        <!--  
					            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
					        -->
					    </a>
			</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item reptile col-md-4 col-lg-3 my-4">
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/rep1.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
                <span class="card-title pt-4 m-0">아마존젤리/벌크(400P)</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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
                <h3 class="secondary-font text-primary">35,000원</h3>

	<div class="d-flex flex-wrap mt-3">
			<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
			    <span class="text-uppercase m-0">Add to Cart</span>
			</a>
			    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
			        <span style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
			        <!--  
			            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
			        -->
			    </a>
			</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item reptile col-md-4 col-lg-3 my-4">
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/rep3.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
                <span class="card-title pt-4 m-0">엑소테라 채집통 (특대)</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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

                <h3 class="secondary-font text-primary">16,000원</h3>

	<div class="d-flex flex-wrap mt-3">
			<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
			    <span class="text-uppercase m-0">Add to Cart</span>
			</a>
			    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
			        <span style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
			        <!--  
			            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
			        -->
			    </a>
			</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item cat col-md-4 col-lg-3 my-4">
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/cat2.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
                <span class="card-title pt-4 m-0">웰니스 코어 시그니쳐 셀렉트</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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

                <h3 class="secondary-font text-primary">2,900원</h3>

	<div class="d-flex flex-wrap mt-3">
			<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
			    <span class="text-uppercase m-0">Add to Cart</span>
			</a>
			    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
			        <span style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
			        <!--  
			            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
			        -->
			    </a>
			</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item dog col-md-4 col-lg-3 my-4">
          <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
            Sale
          </div>
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/dog2.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
                 <span class="card-title pt-4 m-0">퓨어치킨 닭가슴살 100g</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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
                <h3 class="secondary-font text-primary">5,500원</h3>

			<div class="d-flex flex-wrap mt-3">
			<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
			    <span class="text-uppercase m-0">Add to Cart</span>
			</a>
			    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
			        <span style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
			        <!--  
			            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
			        -->
			    </a>
			</div>
              </div>
            </div>
          </div>
        </div>

        <div class="item hamster col-md-4 col-lg-3 my-4">
          <!-- <div class="z-1 position-absolute rounded-3 m-3 px-3 border border-dark-subtle">
            New
          </div> -->
          <div class="card position-relative">
            <a href="single-product.html"><img src="/images/temporary/ham12.png" class="img-fluid rounded-4" alt="image"></a>
            <div class="card-body p-0">
              <a href="single-product.html">
                 <span class="card-title pt-4 m-0">동결건조 이갈이 롤리팝 1P</span>
				<!-- <h3 class="card-title pt-4 m-0">Grey hoodie</h3> -->
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
                <h3 class="secondary-font text-primary">950원</h3>

			<div class="d-flex flex-wrap mt-3">
			<a href="#" class="btn-cart me-3 px-3 pt-2 pb-2" style="font-family: 'Nunito', sans-serif; display: flex; align-items: center; justify-content: center; font-size: 14px;"> <!-- Nunito로 글씨체 변경 -->
			    <span class="text-uppercase m-0">Add to Cart</span>
			</a>
			    <a href="#" class="btn-wishlist px-4 pt-3" style="display: inline-block; border: 1px solid #ccc; border-radius: 5px; text-decoration: none; text-align: center; padding: 10px; font-family: 'Nunito', sans-serif;"> <!-- Nunito로 글씨체 변경 -->
			        <span style="color: black; font-size: 20px; line-height: 1;">❤︎</span>
			        <!--  
			            <iconify-icon icon="fluent:heart-28-filled" class="fs-5"></iconify-icon>
			        -->
			    </a>
			</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  
<!-- 인기상품 아래 배너 -->
<section id="banner-2" class="my-3" style="background: #F9F3EC;">
	<div class="container">
		<div class="row flex-row-reverse banner-content align-items-center">
			<div class="img-wrapper col-12 col-md-6">
				<img src="../images/banner-img2.png" class="img-fluid">
			</div>
			<div class="content-wrapper col-12 offset-md-1 col-md-5 p-5">
				<div class="secondary-font text-primary text-uppercase mb-3 fs-4">새로운 가족을 만났어요!</div>
				<h2 class="banner-title display-1 fw-normal">입양후기</h2>
				<a href="/front/community/board/list.web?cd_bbs_type=9" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
					입양 후기글 보러가기
					 <span class="arrow-text">→</span> <!-- 화살표 텍스트 -->
					 <!-- 
					<svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
						<use xlink:href="#arrow-right"></use>
					</svg>
					 -->
				</a>
			</div>
		</div>
	</div>
</section>

<section id="testimonial">
	<div class="container my-5 py-5">
		<div class="row">
			<div class="offset-md-1 col-md-10">
				<div class="swiper testimonial-swiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="row">
								<div class="col-2">
								 <img src="/images/say.png" alt="쌍따움표 아이콘" style="width: 200px; height: auto;">  
								 <!--
									<iconify-icon icon="ri:double-quotes-l" class="quote-icon text-primary"></iconify-icon>
									  -->
								</div>
								<div class="col-md-10 mt-md-5 p-5 pt-0 pt-md-5">
									<p class="testimonial-content fs-2">초코를 만날 수 있어서 다행이에요~</p>
									<p class="text-black">- 초코가족님</p>
								</div>
							</div>
						</div>

						<div class="swiper-slide">
							<div class="row">
								<div class="col-2">
								  <img src="/images/say.png" alt="쌍따움표 아이콘" style="width: 200px; height: auto;">  
								 <!--
									<iconify-icon icon="ri:double-quotes-l" class="quote-icon text-primary"></iconify-icon>
									  -->
								</div>
								<div class="col-md-10 mt-md-5 p-5 pt-0 pt-md-5">
									<p class="testimonial-content fs-2">네오만큼 착한 고양이는 세상 어디에도 없을걸요?</p>
									<p class="text-black">- 네오누나님</p>
								</div>
							</div>
						</div>

						<div class="swiper-slide">
							<div class="row">
								<div class="col-2">
								 <img src="/images/say.png" alt="쌍따움표 아이콘" style="width: 200px; height: auto;">  
								 <!--
									<iconify-icon icon="ri:double-quotes-l" class="quote-icon text-primary"></iconify-icon>
									  -->
								</div>
								<div class="col-md-10 mt-md-5 p-5 pt-0 pt-md-5">
									<p class="testimonial-content fs-2">우리 햄찌를 입양 할 수 있도록 해주셔서 감사해요</p>
									<p class="text-black">- 햄찌최고님</p>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 입양공고 영역 -->
<section id="latest-blog" class="my-5">
	<div class="container py-5 my-5">
		<div class="row mt-5">
			<div class="section-header d-md-flex justify-content-between align-items-center mb-3">
				<h2 class="display-3 fw-normal" style="font-family: 'Arial Rounded MT Bold', 'Nunito', sans-serif;">입양공고💌</h2>
				<div>
					<a href="/front/adap/list.web" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1">
						입양 공고 목록 바로가기
						<span class="arrow-text">→</span> <!-- 화살표 텍스트 -->
						<!-- <svg width="24" height="24" viewBox="0 0 24 24" class="mb-1">
							<use xlink:href="#arrow-right"></use>
						</svg> -->
					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 my-4 my-md-0">
				<div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
					<h3 class="secondary-font text-primary m-0"></h3>
					<p class="secondary-font fs-6 m-0"></p>
				</div>
				<div class="card position-relative">
					<a href="single-post.html"><img src="/images/temporary/petadap1.png" class="img-fluid rounded-4" style="width: 500px; height: 500px;" alt="image"></a>
					<div class="card-body p-0">
						<a href="single-post.html">
						<!-- 기존 h3코드가 문법에 맞지 않아 span태그로 변경함 -->
						<span class="card-title pt-4 pb-3 m-0">[개] 골든 리트리버 성별: F</span>
						</a>
						<div class="card-text">
							<p class="blog-paragraph fs-6">발견장소: 경기도 남양주시 화도읍 창현로 53 <br>특징: 주인 기다리는 예쁜 반려견</p>
							<a href="#" class="blog-read">보러가기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 my-4 my-md-0">
				<div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
					<%-- 
					<h3 class="secondary-font text-primary m-0">21</h3>
					<p class="secondary-font fs-6 m-0">Feb</p>
					--%>
				</div>
				<div class="card position-relative">
					<a href="single-post.html"><img src="/images/temporary/petadap2.png" class="img-fluid rounded-4" style="width: 500px; height: 500px;"alt="image"></a>
					<div class="card-body p-0">
						<a href="single-post.html">
						<!-- 기존 h3코드가 문법에 맞지 않아 span태그로 변경함 -->
							<span class="card-title pt-4 pb-3 m-0">품종: [고양이] 한국 고양이 성별: F</span>
						</a>
						<div class="card-text">
							<p class="blog-paragraph fs-6">발견장소: 광주시 쌍령동 일대 <br>특징: 11-3, 50일령, 저체온, 야윔, 따뜻한 돌봄이 필요</p>
							<a href="#" class="blog-read">보러가기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 my-4 my-md-0">
				<div class="z-1 position-absolute rounded-3 m-2 px-3 pt-1 bg-light">
					<%-- 
					<h3 class="secondary-font text-primary m-0">22</h3>
					<p class="secondary-font fs-6 m-0">Feb</p>
					--%>
				</div>
				<div class="card position-relative">
					<a href="single-post.html"><img src="/images/temporary/petadap3.png" class="img-fluid rounded-4" style="width: 500px; height: 500px;"alt="image"></a>
					<div class="card-body p-0">
						<a href="single-post.html">
						<!-- 기존 h3코드가 문법에 맞지 않아 span태그로 변경함 -->
							<span class="card-title pt-4 pb-3 m-0">품종: [기타축종]토끼</span>
						</a>
						<div class="card-text">
							<p class="blog-paragraph fs-6">발견장소: 기흥구 어정로 128 어정역<br>특징: 귀여운 아이</p>
							<a href="#" class="blog-read">보러가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- [TODO]서비스 설명 관련 영역이지만 추후 사용여부 논의 필요
<section id="service">
	<div class="container py-5 my-5">
		<div class="row g-md-5 pt-4">
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
				[TODO]span태그로 iconify-icon class="service-icon text-primary" 대체가능한지 확인
						<span class="iconify" data-icon="la:shopping-cart" data-inline="false" aria-label="Shopping Cart"></span>
						<iconify-icon class="service-icon text-primary" icon="la:shopping-cart"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">Free Delivery</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:user-check"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">100% secure payment</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:tag"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">Daily Offer</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 my-3">
				<div class="card">
					<div>
						<iconify-icon class="service-icon text-primary" icon="la:award"></iconify-icon>
					</div>
					<h3 class="card-title py-2 m-0">Quality guarantee</h3>
					<div class="card-text">
						<p class="blog-paragraph fs-6">Lorem ipsum dolor sit amet, consectetur adipi elit.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
-->
<!-- 하단에 있는 사진영역(인스타표시) -->
<section id="insta" class="my-5 d-flex justify-content-center">
	<div class="row g-3 py-5 justify-content-center">
		<div class="col instagram-item text-center position-relative">
			<div class="icon-overlay d-flex justify-content-center position-absolute">
				<!--  <iconify-icon class="text-white" icon="la:instagram"></iconify-icon>-->
			</div>
			<a href="#">
				<img src="../images/insta1.jpg" alt="insta-img" class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item text-center position-relative">
			<div class="icon-overlay d-flex justify-content-center position-absolute">
			</div>
			<a href="#">
				<img src="../images/insta2.jpg" alt="insta-img" class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item text-center position-relative">
			<div class="icon-overlay d-flex justify-content-center position-absolute">
			</div>
			<a href="#">
				<img src="../images/insta3.jpg" alt="insta-img" class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item text-center position-relative">
			<div class="icon-overlay d-flex justify-content-center position-absolute">
			</div>
			<a href="#">
				<img src="../images/insta4.jpg" alt="insta-img" class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item text-center position-relative">
			<div class="icon-overlay d-flex justify-content-center position-absolute">
			</div>
			<a href="#">
				<img src="../images/insta5.jpg" alt="insta-img" class="img-fluid rounded-3">
			</a>
		</div>
		<div class="col instagram-item text-center position-relative">
			<div class="icon-overlay d-flex justify-content-center position-absolute">
			</div>
			<a href="#">
				<img src="../images/insta6.jpg" alt="insta-img" class="img-fluid rounded-3">
			</a>
		</div>
	</div>
</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</html>