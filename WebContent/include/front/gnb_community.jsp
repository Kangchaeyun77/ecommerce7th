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
 * Copyright (C) 2024 HAPPYSTEPS.COM All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410091832][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
 %>
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
		<style>
		{
	font-family: Arial, sans-serif;
	display: flex;
	justify-content: center; /* 가운데 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	height: 100vh; /* 화면 전체 높이 사용 */
	margin: 0;
}

.write-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #F9F3EC; 
	color: black; /* 글자색 검정 */
	text-decoration: none; /* 밑줄 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	transition: background-color 0.3s; /* 배경색 전환 효과 */
}

.write-button:hover {
    background-color: #f5f5dc; /* 호버 시 색상 변경 */
}
		.gnb ul {
			list-style-type: none;
			padding: 0;
			margin: 0;
		}
		.gnb li {
			display: inline;
			margin-right: 15px;
		}
		.gnb a {
			text-decoration: none;
			color: #000;
			padding: 15px 20px;
			border-radius: 4px;
			transition: background-color 0.3s;
		}
		.gnb a:hover {
			background-color:#f5f5dc;
		}</style>
		
		<nav class="gnb" >
			<span >
				<a href="/front/community/index.web" class="menugnb">커뮤니티 메인</a>
				<a href="/front/community/board/list.web?cd_bbs_type=5" class="menugnb">전체글 보기</a>
				<a href="/front/community/board/list.web?cd_bbs_type=6" class="menugnb">인기글 보기</a>
				<a href="/front/community/board/list.web?cd_bbs_type=7" class="menugnb">자유게시판</a>
				<a href="/front/community/board/list.web?cd_bbs_type=8" class="menugnb">QnA</a>
				<a href="/front/community/board/list.web?cd_bbs_type=9" class="menugnb">입양후기</a>
				<a href="/front/community/board/list.web?cd_bbs_type=11" class="menugnb">정보글</a>
				 <a href="your-link-here.html" class="write-button">글쓰기</a> <!-- 버튼 -->
			</span>
		</nav>