<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: happySteps.com
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004123400][kbs@>_<.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<a href="/"><img src="/image/logo.jpg" alt="로고" width="200px" /></a>
		<span style="float:right;line-height:43px;vertical-align:middle;">
			<c:if test="${not empty sessionScope.SEQ_MBR}">
				<a href="/front/basket/main.web"">[장바구니]</a>
				 <a href="/front/myPage/" title="<%=session.getAttribute("NAME")%>">[마이페이지]</a>
				 <a href="/front/login/logout.web">[로그아웃]</a>
			</c:if>
			<c:if test="${empty sessionScope.SEQ_MBR}">
				<a href="/front/login/loginForm.web">[로그인]</a>
			</c:if>
		</span>
