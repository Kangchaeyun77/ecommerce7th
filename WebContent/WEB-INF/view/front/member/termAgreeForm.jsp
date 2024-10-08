<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 HAPPYSTEPS.COM 에 있으며,
 * HAPPYSTEPS.COM이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * HAPPYSTEPS.COM의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 HAPPYSTEPS.COM All Rights Reserved.
 *
 *
 * Program		: com.github.ecommerce7th
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004134100][kbs@>_<.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/termAgreeForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
		<title>약관 페이지</title>
		<style>
			
			.accordion {
				background-color: #eee;
				color: #444;
				cursor: pointer;
				padding: 2px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 15px;
				transition: 0.4s;
			}
			.accordion2 {
				background-color: #eee;
				color: #666;
				cursor: pointer;
				padding: 0px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 15px;
				transition: 0.4s;
				resize: none;
				overflow: auto; /* 스크롤바를 활성화합니다 */
			}

			/* 스크롤바 스타일링 */
			.accordion2::-webkit-scrollbar {
				width: 6px; /* 스크롤바의 너비 */
			}

			.accordion2::-webkit-scrollbar-thumb {
				background-color: #888; /* 스크롤바의 색상 */
				border-radius: 10px; /* 스크롤바의 둥근 모서리 */
			}

			.accordion2::-webkit-scrollbar-thumb:hover {
				background-color: #555; /* 스크롤바의 색상이 마우스를 올렸을 때 변경 */
			}

			.accordion2::-webkit-scrollbar-track {
				background: #f1f1f1; /* 스크롤바의 트랙 색상 */
			}
			
			/* 아코디언 액션 스타일링 */
			.accordion.active, .accordion:hover {
				background-color: #ccc;
			}

			.panel {
				padding: 1px 1px;
				background-color: white;
				overflow: hidden;
				display: none;
				height: 10%;
				width: 100%;
			}
			
			.panel.show {
				display: block;
			}
			
		</style>
		
</head>
<body id="site-header">
	<div class="container" >
		<header style="display: flex; justify-content: center; align-items: center; height: 120px;">
			<div style="position: relative; height: 200px; overflow: hidden; margin-top: 50px;">
				<a href="/front/"><img src="/images/logo/logo3.png" alt="로고" style="width: 300px; height: 250px; object-fit: cover;" /></a>
			</div>
		</header><br><br><br><br>
	</div>
	<section class="content" style="display: flex; justify-content: center; align-items: flex-start; height: 50%;">
		<nav></nav>
		<article class="txtCenter margin-top: 100%;">
			서비스 이용 약관
			<form id="termsForm" action="registerForm.web" method="POST">
				<!-- 첫 번째 아코디언 -->
				<button class="accordion" type="button">1. 필수 약관 (*)</button>
				<div class="panel show" >
					<textarea class="accordion2" readonly> 여기에 서비스 이용에 대한 일반 사항을 설명합니다. 여기에 서비스 이용에 대한 일반 사항을 설명합니다.</textarea>
					<label for="term1">약관에 동의합니다</label>
					<input type="checkbox" id="term1" name="term1" value="Y" required />
				</div><br>

			<!-- 두 번째 아코디언 -->
				<button class="accordion" type="button">2. 마켓팅 수신 동의</button>
				<div class="panel">
					<textarea class="accordion2" readonly> 개인정보의 수집, 사용, 저장에 대한 정책을 여기에 설명합니다.</textarea>
					<label for="term2">약관에 동의합니다</label>
					<input type="checkbox" id="term2" name="term2" value="Y" />
				</div><br>

			<!-- 세 번째 아코디언 -->
				<button class="accordion" type="button">3. 후원 동의 </button>
				<div class="panel">
					<textarea class="accordion2" readonly> 결제 및 환불 절차에 대해 여기에 설명합니다.</textarea>
					<label for="term3">약관에 동의합니다</label>
					<input type="checkbox" id="term3" name="term3" value="Y" />
				</div><br>

			<!-- 제출 버튼 -->
				<button type="button" onclick="submitForm()">체크 항목 동의하고 계속</button>
			</form>
			<!-- 폼 끝 -->
		</article>
			<script>
				// 아코디언 기능
				var acc = document.getElementsByClassName("accordion");
				for (var i = 0; i < acc.length; i++) {
					acc[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var panel = this.nextElementSibling;
						if (panel.style.display === "block") {
						 panel.style.display = "none";
						} else {
						 panel.style.display = "block";
						}
					});
				}

				// 체크박스 검증
				function validateForm() {
					var term1Checkbox = document.getElementById('term1');
					if (!term1Checkbox.checked) {
						alert("필수 약관에 동의해야 합니다.");
						return false; // 제출 방지
					}
					return true; // 제출 허용
				}

				// 폼 제출 전 체크박스 상태 처리
				function submitForm() {
					if (validateForm()) { // 검증 후 제출
						var form = document.getElementById('termsForm');

						// term_1 처리
						var term1Checkbox = document.getElementById('term1');
						if (!term1Checkbox.checked) {
						var hiddenInput1 = document.createElement('input');
						hiddenInput1.type = 'hidden';
						hiddenInput1.name = 'term1';
						hiddenInput1.value = 'N';
						form.appendChild(hiddenInput1);
						}

						// term_2 처리
						var term2Checkbox = document.getElementById('term2');
						if (!term2Checkbox.checked) {
						var hiddenInput2 = document.createElement('input');
						hiddenInput2.type = 'hidden';
						hiddenInput2.name = 'term2';
						hiddenInput2.value = 'N';
						form.appendChild(hiddenInput2);
						}

						// term_3 처리
						var term3Checkbox = document.getElementById('term3');
						if (!term3Checkbox.checked) {
						var hiddenInput3 = document.createElement('input');
						hiddenInput3.type = 'hidden';
						hiddenInput3.name = 'term3';
						hiddenInput3.value = 'N';
						form.appendChild(hiddenInput3);
						}

						// 폼을 제출
						form.submit();
					}
				}
			</script>
	</section>
	<footer><br><br><br><br><br><br><br><br>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
</body>
</html>