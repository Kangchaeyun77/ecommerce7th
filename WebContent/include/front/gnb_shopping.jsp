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
			background-color: #f5f5dc;
		}
		</style>
		
		<nav class="gnb" >
			<span >
				<a href="/front/sale/index.web">전체</a>
				<a href="/front/sale/list.web?cd_ctg_pet=1">강아지</a>
				<a href="/front/sale/catshop/list.web">고양이</a>
				<a href="/front/sale/hamstershop/list.web">햄스터</a>
				<a href="/front/sale/reptileshop/list.web">파충류</a>
			</span>
		</nav>