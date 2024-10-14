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
<%@ page info="/WEB-INF/view/front/community/board/storyboard/writeForm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/form.css">
	<style></style>
	<script>
		function goList(value) {
			var cd_ctg = document.getElementById("cd_ctg").value;
			redirectUrl = "/front/community/board/list.web?cd_bbs_type=" + cd_ctg;
			window.location.href = redirectUrl;
		}
		function writeProc() {
			var frmMain = document.getElementById("frmMain");
			var selectedCtg = document.getElementById("cd_ctg").value; // 선택된 카테고리 값 가져오기
			alert("선택된 카테고리: " + selectedCtg); // 선택된 값 출력

			// 필수 항목 체크
			if (document.getElementById("title").value === "" ||
				selectedCtg === "0" ||
				document.getElementById("cd_ctg_pet").value === "0" ||
				document.getElementById("cd_ctg").value === "0" ||
				document.getElementById("content").value === "") {
				alert("필수 항목을 입력하세요!");
				return;
			}

			// 게시판 유형에 따른 처리
			frmMain.action = "/front/community/board/writeProc.web?cd_bbs_type=" + selectedCtg; // 수정된 부분
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
	<form class="frmMain" id="frmMain" method="POST" enctype="multipart/form-data">
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
							<th>카테고리(*)</th>
							<td>
								<div class="category-container">
									<select id="cd_ctg" name="cd_ctg" required class="category-select">
										<option value="0">선택</option>
										<option value="7">자유게시판</option>
										<option value="9">입양후기</option>
										<option value="11">정보글</option>
									</select>
									&nbsp;&nbsp;&nbsp;
									<label class="label-pet">반려동물(*)</label>
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
							</td>
						</tr>
					</table>
					<div style="display: flex; justify-content: center; width: 70%; margin-left: auto; margin-right: auto;">
						<button type="button" class="submit-btn" style="margin-right: 10px; font-size: 0.9rem;" onclick="goList();">목록</button>
						<button type="button" class="submit-btn" onclick="writeProc();">게시글 작성</button>
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