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
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: list.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-10][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/qna/view.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
		.category-container {
		display: flex;
		align-items: center;
		margin-top: 10px;
	}
	.category-select {
		flex: 1; /* 균등하게 분배하되 */
		max-width: 150px; /* 최대 너비 설정 */
		margin-right: 5px; /* 간격 줄임 */
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 8px;
		background-color: #FFFFFF;
		font-size: 0.9rem;
		transition: border-color 0.3s ease;
	}

	.category-select:last-child {
		margin-right: 0; /* 마지막 요소는 오른쪽 여백 없앰 */
	}

	.category-select:focus {
		border-color: #888;
		outline: none;
	}

	.label-pet {
	margin-right: 20px; /* 레이블과 선택박스 간격 줄임 */
	font-weight: bold;
	color: #000000;
	font-size: 1rem; /* 글자 크기 증가 */
	margin-top: 0.1px; /* 위쪽 여백을 줄임 */
	}
	}
		h1 {
			text-align: center;
			color: #333;
		}

		label {
			font-weight: bold;
			color: #555;
			margin-top: 10px;
			display: block;
		}

		input[type="text"], textarea {
			width: 90%;
			padding: 12px;
			margin-top: 5px;
			margin-bottom: 20px;
			border: 1px solid #ccc;
			border-radius: 10px;
			background-color: #FFFFFF;
		}

		textarea {
			height: 200px;
			resize: none;
		}

		input[type="file"] {
			display: block;
			margin-bottom: 20px;
		}

		.submit-btn {
			display: block;
			width: 100%;
			padding: 15px;
			background-color: #F9F3EC;
			border: none;
			border-radius: 25px;
			font-size: 1.1rem;
			font-weight: bold;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}

		.submit-btn:hover {
			background-color: #f5f5dc;
		}

		.required {
			color: red;
			font-weight: normal;
		}
	</style>
	<script>
		function setActiveCategory(button) {
			var buttons = document.querySelectorAll('.category-buttons button');
			buttons.forEach(function(btn) {
				btn.classList.remove('active');
			});
			button.classList.add('active');
		}
		
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/community/board/list.web";
			frmMain.submit();
		}
		
		function writeProc(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("cd_bbs_type").value = value;
			
			if (document.getElementById("title").value == ""
					|| document.getElementById("cd_ctg_pet").value == "0"
					|| document.getElementById("content").value == "") {
				alert("필수 항목을 입력하세요!");
				return;
			}
			frmMain.action="/front/community/board/writeProc.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
		<div style="position: relative; height: 250px; overflow: hidden; margin-top: 10px;">
				<a href="/front/">
				<img src="/images/logo/logo3.png" alt="로고" style="width: 380px; height: 250px; object-fit: cover; display: block; margin: 0 auto;" />
				</a>
				</div>
				<br>
	<form class="form-container" id="frmMain" method="POST" enctype="multipart/form-data">
		<input type="hidden" id="cd_bbs_type" name="cd_bbs_type" />
		<div class="container">
			<%@ include file="/include/front/gnb_community.jsp" %>
			<br>
			<section class="content">
				<article class="txtCenter">
					<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
						<tr>
							<th style="width: 150px;">제목(*)</th>
							<td>
								<input type="text" id="title" name="title" style="width: 90%;" required />
							</td>
						</tr>
						<tr>
					<th>반려동물</th>
						<td>
							<div class="category-container">
								<select id="cd_ctg_pet" name="cd_ctg_pet" required class="category-select">
									<option value="0">선택</option>
									<option value="1">강아지</option>
									<option value="2">고양이</option>
									<option value="3">햄스터</option>
									<option value="4">파충류</option>
									<option value="5">기타</option>
								</select>
							</div>
						</td>
					</tr>
						<tr>
							<th>내용(*)</th>
							<td>
								<textarea id="content" name="content" required></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td>
								<input type="file" id="files[0]" name="files[0]" />
								<!--
								<input type="file" id="files[1]" name="files[1]" />
								<input type="file" id="files[2]" name="files[2]" />
								-->
							</td>
						</tr>
					</table>
					<div style="display: flex; justify-content: center; width: 70%; margin-left: auto; margin-right: auto;">
						<button type="button" class="submit-btn"style="margin-right: 10px; font-size: 0.9rem;" onclick="javascript:goList(3);">목록</button>
						<button type="button" class="submit-btn" style=" font-size: 0.9rem;" onclick="javascript:writeProc(3);">등록</button>
					</div>
				</article>
			</section>
			<footer>
				<%@ include file="/include/front/login_footer.jsp" %>
			</footer>
		</div>
	</form>
</body>
</html>