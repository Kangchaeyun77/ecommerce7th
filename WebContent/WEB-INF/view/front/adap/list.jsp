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
/* 검색 영역 스타일 */
.search-form {
    display: flex;
    justify-content: flex-start;
    gap: 5px;
}

.search-form select,
.search-form input[type="text"],
.search-form input[type="submit"] {
    font-size: 14px;
    border: 0;
    border-radius: 15px;
    outline: none;
    background-color: #F5F5F5;
}

.search-form select {
    width: 100px;
}

.search-form input[type="text"] {
    width: 150px;
}

/* 카드 컨테이너 스타일 */
.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    justify-items: center;
    flex-wrap: wrap;
    margin: 30px;
    margin-left: 0px;
}

/* 개별 카드 스타일 */
.animal-card {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 20px;
    width: 250px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
}

.animal-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

/* 카드 내용 스타일 */
.info-item {
    font-size: 21px;
    font-weight: bold;
    margin: 20px;
}

/* 이미지 컨테이너는 유지 */
.image-container {
    width: 100%;
    height: 200px;
    overflow: hidden;
}

.animal-card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
	</style>
	<script>
	$(document).ready(function() {
	    fetchAnimalData(); // 데이터 가져오기 함수 호출

	    function fetchAnimalData() {
	        $.ajax({
	            url: '/front/adap/list.web', // 데이터 요청 URL
	            method: 'POST',
	            contentType: 'application/json',
	            dataType: 'json',
	            data: JSON.stringify({}), // 요청 데이터
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
	});
	<%--
	    $(document).ready(function() {
        // 페이지 로드 시 동물 정보를 자동으로 조회
        fetchAnimalData();

        // AJAX 요청을 통해 동물 정보를 가져오는 함수
        function fetchAnimalData() {
            $.ajax({
                url: '/front/adap/list.web',
                method: 'POST',
                contentType: 'application/json', // JSON 데이터 전송을 위한 설정
                dataType: 'json',
                data: JSON.stringify({}), // 요청할 JSON 데이터가 필요하다면 여기에 추가
                success: function(response) {
                    console.log('API 호출 성공:', response);
                    
                    // API 응답 데이터 처리
                    if (response.AbdmAnimalProtect) {
                        let items = response.AbdmAnimalProtect[1].row;
                        let html = '<table class="table">';
                        html += '<thead><tr>';
                        html += '<th>이미지</th>'; // 이미지 열 추가
                        html += '<th>공고번호</th>';
                        html += '<th>품종</th>';
                        html += '<th>성별</th>';
                        html += '<th>발견장소</th>';
                        html += '<th>특징</th>';
                        html += '</tr></thead>';
                        html += '<tbody>';
                        
                        items.forEach(function(item) {
                            html += '<tr>';
                            // 이미지 추가
                            html += '<td><img src="' + (item.IMAGE_COURS) + '" alt="동물 이미지" style="width: 100px; height: auto;"></td>';
                            html += '<td>' + (item.PBLANC_IDNTFY_NO || '') + '</td>';
                            html += '<td>' + (item.SPECIES_NM || '') + '</td>';
                            html += '<td>' + (item.SEX_NM || '') + '</td>';
                            html += '<td>' + (item.DISCVRY_PLC_INFO || '') + '</td>';
                            html += '<td>' + (item.SFETR_INFO || '') + '</td>';
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
                    $('#animalList').html('<p>오류 발생: ' + error + '<br>상태 코드: ' + xhr.status + '</p>');
                }
            });
        }
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
	<section class="content">
	<%--
	<nav>
	<%@ include file="/include/front/lnbAdap.jsp" %>
	</nav>


		<img src="/images/adap_benner.png" alt="입양페이지 공지" style="width: auto; height: 40%; object-fit: cover; float: center; margin-left: 10px; margin-bottom: 10px; margin-top: 20px;"/>
	 --%>
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
			<option value="all">전체</option>
			<option value="M">수컷</option>
			<option value="F">암컷</option>
			<option value="Q">미상</option>
		</select><br>

		<label>동물등록번호:</label>
		<input type="text" id="registrationNumber">

		<button onclick="searchAnimals()">조회</button>
		
		<!-- 카드 리스트 부분 -->
		<div class="card-container">
		    <ul class="animals-list" id="animalList">
		        <!-- 카드가 여기에 표시됩니다. -->
		    </ul>
		</div>
		
	</div>
	</div>
</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>