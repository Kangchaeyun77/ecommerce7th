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
 * File			: donationForm.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410072000][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/donation/donationForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/top.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<style>
		.donation-form {
			max-width: 600px;
			margin: 20px auto;
			padding: 20px;
			border: 1px solid #ddd;
			border-radius: 8px;
		}

		.donation-form h2 {
			text-align: center;
			font-size: 24px;
		}

		fieldset {
			margin-bottom: 20px;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
		}

		legend {
			font-weight: bold;
			font-size: 18px;
		}

		label {
			display: block;
			margin: 10px 0 5px;
		}

		input[type="text"],
		input[type="email"],
		input[type="tel"],
		input[type="number"] {
			width: 100%;
			padding: 8px;
			margin-bottom: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}

		.cms-info {
			display: none;
		}

		input[name="payment_method"][value="cms"]:checked ~ .cms-info {
			display: block;
		}

		button {
			width: 100%;
			padding: 10px;
			background-color: #4CAF50;
			color: white;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			font-size: 16px;
		}

		button[type="reset"] {
			background-color: #f44336;
		}
	</style>
	<script></script>
</head>
<body>
	<form>
		<div class="donation-form">
			<h2>후원 신청</h2>
			
			<!-- 기본 정보 -->
			<fieldset>
				<legend>기본 정보</legend>
				
				<!-- 개인/단체 선택 -->
				<label><input type="radio" name="type" value="individual" checked> 개인</label>
				<label><input type="radio" name="type" value="organization"> 단체</label><br>
				
				<!-- 이름(단체명) -->
				<label>이름(단체명):</label>
				<input type="text" name="name" required><br>
				
				<!-- 연락처 -->
				<label>연락처:</label>
				<input type="tel" name="contact" required><br>
				
				<!-- 주민등록번호(사업자등록번호) -->
				<label>주민등록번호(사업자등록번호):</label>
				<input type="text" name="id_number" placeholder="주민(사업자)등록번호"><br>
				<small>*개인정보보호법 개정에 따라 기부금영수증 발행 시, 주민(사업자)등록번호를 기입해야 합니다. 발급을 원하지 않으실 경우 생년월일을 기입해주세요.</small><br>
				
				<!-- 주소 검색 -->
				<label>주소:</label>
				<input type="text" name="address" placeholder="주소 검색"><br>
				
				<!-- 이메일 -->
				<label>이메일:</label>
				<input type="email" name="email" required><br>
				
				<!-- 연말정산 간소화 여부 -->
				<label>연말정산 간소화 여부:</label>
				<label><input type="radio" name="tax_simplification" value="agree" checked> 동의</label>
				<label><input type="radio" name="tax_simplification" value="disagree"> 미동의</label><br>
			</fieldset>

			<!-- 후원 정보 -->
			<fieldset>
				<legend>후원 정보</legend>
				
				<!-- 정기/비정기 후원 선택 -->
				<label><input type="radio" name="donation_type" value="regular" checked> 정기 후원</label>
				<label><input type="radio" name="donation_type" value="irregular"> 비정기 후원</label><br>
				
				<!-- 후원 금액 -->
				<label>후원 금액:</label>
				<label><input type="radio" name="donation_amount" value="5000"> 5,000원</label>
				<label><input type="radio" name="donation_amount" value="10000"> 10,000원</label>
				<label><input type="radio" name="donation_amount" value="30000"> 30,000원</label>
				<label><input type="radio" name="donation_amount" value="other"> 기타</label>
				<input type="number" name="custom_amount" placeholder="직접 입력" min="30000" disabled><br>
			</fieldset>

			<!-- 후원 방법 -->
			<fieldset>
				<legend>후원 방법</legend>
				
				<!-- 계좌 입금 -->
				<label><input type="radio" name="payment_method" value="bank" checked> 계좌 입금 (국민은행 000-01-0000-000 / 예금주: HappySteps)</label><br>
				
				<!-- CMS 자동이체 -->
				<label><input type="radio" name="payment_method" value="cms"> CMS 자동이체</label><br>
				
				<!-- CMS 출금 정보 -->
				<div class="cms-info">
					<label>은행명:</label>
					<input type="text" name="bank_name"><br>
					<label>계좌번호:</label>
					<input type="text" name="account_number"><br>
					<label>예금주명:</label>
					<input type="text" name="account_holder"><br>
					<label>매월 이체일:</label>
					<select name="transfer_day">
						<option value="10">10일</option>
						<option value="25">25일</option>
					</select><br>
					<label>전화번호:</label>
					<input type="tel" name="phone_number"><br>
				</div>
			</fieldset>

			<!-- 버튼 -->
			<button type="submit">신청 완료</button>
			<button type="reset">취소</button>
		</div>
		<footer>
			<%@ include file="/include/front/footer.jsp" %>
		</footer>
	</form>
</body>
</html>