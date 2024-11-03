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
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<link rel="stylesheet" href="/css/lnb.css">
		<title>동물 입양공고 조회</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.card-container {
			display: flex;
			flex-wrap: wrap;
			justify-content: center; /* 중앙 정렬 */
			gap: 16px; /* 카드 간격 */
			margin-top: 20px;
		}

		.animal-card {
			border: 1px solid #ddd;
			border-radius: 8px;
			padding: 16px;
			width: 200px; /* 카드 너비 설정 */
			box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
			text-align: center;
		}

		.animal-card img {
			max-width: 100%;
			height: auto;
			border-radius: 8px;
			margin-bottom: 10px;
		}

		.animal-card p {
			margin: 4px 0;
			font-size: 14px;
			color: #333;
		}

		.animal-card strong {
			font-weight: bold;
		}
	</style>
	<script>
	$(document).ready(function() {
	    $.ajax({
	        url: '/front/adap/list.web',
	        method: 'POST',
	        contentType: 'application/json', // JSON 데이터 전송을 위한 설정
	        dataType: 'json',
	        data: JSON.stringify({}), // 요청할 JSON 데이터가 필요하다면 여기에 추가
	        success: function(response) {
	            console.log('API 호출 성공:', response);
	            
	            // API 응답 데이터 처리
	            console.log(response.AbdmAnimalProtect[1].row)
	            if (response.AbdmAnimalProtect) {
	                let items = response.AbdmAnimalProtect[1].row;
	                let html = '<table class="table">';
	                html += '<thead><tr>';
	                html += '<th>접수번호</th>';
	                html += '<th>품종</th>';
	                html += '<th>발견장소</th>';
	                html += '<th>발견날짜</th>';
	                html += '</tr></thead>';
	                html += '<tbody>';
	                
	                items.forEach(function(item) {
	                    html += '<tr>';
	                    html += '<td>' + (item.REGIST_NO || '') + '</td>';
	                    html += '<td>' + (item.SPECIES_NM || '') + '</td>';
	                    html += '<td>' + (item.DISCVRY_PLC_INFO || '') + '</td>';
	                    html += '<td>' + (item.RECEPT_DE || '') + '</td>'; // 발견날짜는 Recept Date를 사용
	                    html += '</tr>';
	                });
	                
	                html += '</tbody></table>';
	                $('#animalList').html(html);
	            } else {
	                $('#animalList').html('<p>데이터가 없습니다.</p>');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('API 호출 실패:', {
	                status: xhr.status,
	                statusText: xhr.statusText,
	                responseText: xhr.responseText
	            });
	            $('#responseContainer').html('<p>오류 발생: ' + error + '<br>상태 코드: ' + xhr.status + '</p>');
	        }
	    });
	});
	<%--
	function displayAnimals() {
	    const container = document.getElementById("animalList");
	    container.innerHTML = ''; // 기존 내용을 지우기

	    // 하드코딩된 동물 데이터
	    const animals = [
	        {
	            thumb_image_cours: "/images/blog-lg2.jpg",
	            species_nm: "강아지",
	            pblanc_idntfy_no: "20230001",
	            sex_nm: "수컷",
	            discvry_plc_info: "서울",
	            partclr_matr: "귀여운 강아지입니다."
	        },
	        {
	            thumb_image_cours: "/images/banner-img3.png",
	            species_nm: "고양이",
	            pblanc_idntfy_no: "20230002",
	            sex_nm: "암컷",
	            discvry_plc_info: "부산",
	            partclr_matr: "장난기 많은 고양이입니다."
	        }
	    ];
	    animals.forEach(animal => {
	        console.log('현재 처리중인 동물:', animal); // 전체 동물 객체 로깅
	        console.log('종류:', animal.species_nm); // species_nm 값 확인

	        const card = document.createElement("div");
	        card.className = "animal-card";
	        
	        const cardContent = 
	            '<img src="' + animal.thumb_image_cours + '" alt="동물 이미지" style="width: 100%; height: auto;">' +
	            '<p><strong>종류:</strong> ' + animal.species_nm + '</p>' +
	            '<p><strong>공고번호:</strong> ' + animal.pblanc_idntfy_no + '</p>' +
	            '<p><strong>성별:</strong> ' + animal.sex_nm + '</p>' +
	            '<p><strong>발견장소:</strong> ' + animal.discvry_plc_info + '</p>' +
	            '<p><strong>특징:</strong> ' + animal.partclr_matr + '</p>';
	        
	        card.innerHTML = cardContent;
	        console.log('생성된 카드 HTML:', cardContent);

	        container.appendChild(card);
	    });
	}

	document.addEventListener("DOMContentLoaded", () => {
	    displayAnimals();
	});
	--%>
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
	<section class="content" style="display: flex; justify-content: space-between; margin-top: 20px;">
	<nav>
	<%@ include file="/include/front/lnbAdap.jsp" %>
	</nav>
	<article>
	<%-- 
		<img src="/images/adap_benner.png" alt="입양페이지 공지" style="width: auto; height: 40%; object-fit: cover; float: center; margin-left: 10px; margin-bottom: 10px; margin-top: 20px;"/>
	--%>
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
		<option value="all">		전체			</option>
		<!-- 시군구 옵션 추가 -->
		</select><br>

		<label>종류:</label>
		<select id="type">
			<option value="all">전체		</option>
			<option value="dog">개		</option>
			<option value="cat">고양이	</option>
			<option value="else">기타	</option>
		</select>

		<label>성별:</label>
		<select id="gender">
			<option value="">전체</option>
			<option value="M">수컷</option>
			<option value="F">암컷</option>
			<option value="Q">미상</option>
		</select><br>

		<label>동물등록번호:</label>
		<input type="text" id="registrationNumber">

		<button onclick="searchAnimals()">조회</button>
		
			<!-- 동물 카드 리스트 -->
			<div class="card-container" id="animalList">
			<!-- 카드가 여기에 표시됩니다. -->
			</div>
		
	</div>
	</article>
</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>