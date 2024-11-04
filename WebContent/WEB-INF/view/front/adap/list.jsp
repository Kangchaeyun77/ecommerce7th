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
 * Copyright (C) 2024 happySteps All Rights Reserved.
 *
 *
 * Program		:com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202411011400][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/adap/list.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<title>동물 입양공고 조회</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.card-container {
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between; /* 각 카드 사이 공간 확보 */
		}
		.animal-card {
			width: 23%; /* 카드의 너비를 조정하여 한 줄에 4개가 들어가도록 설정 */
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 카드 그림자 추가 */
			margin-bottom: 20px; /* 카드 아래 여백 */
			padding: 10px; /* 카드 내부 여백 */
			border: 1px solid #ccc; /* 카드 경계선 */
			border-radius: 5px; /* 카드 모서리 둥글게 */
			transition: transform 0.3s ease, box-shadow 0.3s ease; /* 부드러운 전환 효과 */
		}
		.animal-card img {
			width: 100%; /* 이미지 너비 100%로 설정 */
			height: 200px; /* 비율에 맞게 높이 조정 */
			object-fit: cover; /* 이미지 비율 유지 */
			border-radius: 5px; /* 이미지 모서리 둥글게 */
		}
		.animal-card:hover {
		transform: translateY(-5px); /* 마우스를 올렸을 때 위로 이동 */
		box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2); /* 그림자 강도 증가 */
	}
	</style>
	<script>
	
	let currentPage = 1; // 전역 변수로 현재 페이지를 정의
	let totalPages = 10; // 예시로 최대 페이지 수를 10으로 설정. 실제 데이터에 따라 수정 필요.

	function changePage(direction) {
		currentPage += direction; // 페이지 변경

		// 페이지 범위 체크
		if (currentPage < 1) {
			currentPage = 1; // 최소 페이지 1
		} else if (currentPage > totalPages) {
			currentPage = totalPages; // 최대 페이지 제한
		}

		fetchAnimalData(currentPage); // 변경된 페이지에 대한 데이터 요청
	}

	function fetchAnimalData(page) {
		$.ajax({
			url: '/front/adap/list.web', // 데이터 요청 URL
			method: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify({ pageIndex: page }), // 요청 데이터
			success: function(response) {
				if (response.AbdmAnimalProtect) {
					let items = response.AbdmAnimalProtect[1].row; // 데이터 배열
					let html = ''; // 카드 HTML을 저장할 변수

					items.forEach(function(item) {
						// 카드 HTML 생성
						html += '<div class="animal-card">';
						html += '<img src="' + (item.IMAGE_COURS || '') + '" alt="동물 이미지">';
						html += '<p><strong>공고번호:</strong> ' + (item.PBLANC_IDNTFY_NO || '') + '</p>';
						html += '<p><strong>품종:</strong> ' + (item.SPECIES_NM || '') + '</p>';
						html += '<p><strong>성별:</strong> ' + (item.SEX_NM || '') + '</p>';
						html += '<p><strong>발견장소:</strong> ' + (item.DISCVRY_PLC_INFO || '') + '</p>';
						html += '<p><strong>특징:</strong> ' + (item.SFETR_INFO || '') + '</p>';
						html += '</div>'; // 카드 닫기
					});
					
					$('#animalList').html(html); // 동물 목록 업데이트
				} else {
					$('#animalList').html('<p>데이터가 없습니다.</p>'); // 데이터 없음 메시지
				}
			},
			error: function(xhr, status, error) {
				console.error('API 호출 실패:', error);
				$('#animalList').html('<p>오류 발생: ' + error + '<br>상태 코드: ' + xhr.status + '</p>'); // 오류 메시지
			}
		});
	}
	function updatePagination() {
		// 현재 페이지와 총 페이지 수를 표시
		$('#current-page').text(currentPage + ' / ' + totalPages);
	}
	$(document).ready(function() {
		fetchAnimalData(currentPage); // 첫 페이지 데이터 가져오기
	});
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" />
<div class="container">
	<header>
	</header>
	<nav>
	</nav>
	<section class="content">
	<nav>
	<%@ include file="/include/front/gnbAdap.jsp" %>
	</nav>
		<img src="/images/adap_benner.png" alt="입양페이지 공지" style="width: 100%; height: 40%; object-fit: cover; float: center; margin-left: 10px; margin-bottom: 10px; margin-top: 20px;"/>
	<div>
		<div style="border: 1px solid red; margin-top: 20px;">
			<label>날짜:</label>
			<input type="date" id="startDate"> ~ <input type="date" id="endDate"><br>
			<label>시도:</label>
			<select id="sigun">
			<option value="all">		전체			</option>
			<option value="gangwon">	강원특별자치도	</option>
			<option value="gyeonggi">	경기도		</option>
			<option value="gyeongbuk">	경상북도		</option>
			<option value="gyeongnam">	경상남도		</option>
			<option value="gwangju">	광주광역시		</option>
			<option value="daegu">		대구광역시		</option>
			<option value="daejeon">	대전광역시		</option>
			<option value="busan">		부산광역시		</option>
			<option value="seoul">		서울특별시		</option>
			<option value="ulsan">		울산광역시		</option>
			<option value="incheon">	인천광역시		</option>
			<option value="jeonbuk">	전북특별자치도	</option>
			<option value="jeonnam">	전라남도		</option>
			<option value="jeju">		제주특별자치도	</option>
			<option value="chungbuk">	충청북도		</option>
			<option value="chungnam">	충청남도		</option>
			<option value="sejong">		세종특별자치시	</option>
			</select>
	
			<label>시군구:</label>
			<select id="sigungu">
			<option value="all">		전체</option>
			<!-- 시군구 옵션 추가 -->
			</select><br>
	
			<label>종류:</label>
			<select id="type">
				<option value="all">전체	</option>
				<option value="dog">개		</option>
				<option value="cat">고양이	</option>
				<option value="else">기타	</option>
			</select>
	
			<label>성별:</label>
			<select id="gender">
				<option value="all">전체</option>
				<option value="M">수컷</option>
				<option value="F">암컷</option>
				<option value="Q">미상</option>
			</select><br>
	
			<label>동물등록번호:</label>
			<input type="text" id="registrationNumber">
	
			<button onclick="searchAnimals()">조회</button>
			<br>
			<br>
			<br>
			<!-- 카드 리스트 부분 -->
			<div class="card-container" id="animalList">
				
			</div>
		</div>
	</div>
	<div class="card-container"></div>
			<br/>
		<div style="display: flex; justify-content: center;">
			<span class="pageNavi_front_image">
				<img src="/images/btn/btn_pageFirst.gif" border="0" alt="처음으로" onclick="goToPage(1)" />&nbsp;
				<img src="/images/btn/btn_pagePrev.gif" border="0" alt="이전페이지" onclick="changePage(-1)" />&nbsp;
				<strong id="current-page"></strong>&nbsp;
				<img src="/images/btn/btn_pageNext.gif" border="0" alt="다음페이지" onclick="changePage(1)" />&nbsp;
				<img src="/images/btn/btn_pageLast.gif" border="0" alt="마지막으로" onclick="goToPage(totalPages)" />&nbsp;
			</span>
		</div>
			<br/>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>