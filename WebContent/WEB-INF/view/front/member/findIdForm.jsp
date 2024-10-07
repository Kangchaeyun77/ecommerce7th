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
 * Program		: com.github.ecommerce7th
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002130000][hyeen103#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/findIdForm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		table {
		  width: 100%;
		}
		td {
		  padding: 5px;
		}
		.left, .center, .right {
		  width: 33%;
		}
	</style>
	<script>
	</script>
</head>
<body>
<form id="frmMain" name="frmMain" method="POST">
<!-- <form id="frmMain" method="POST" action="/loginProc.jsp"> -->
<div class="container">
	<header style="display: flex; justify-content: center; align-items: center; height: 120px margin-top = 50px;">
		<a href="/front/"><img src="/images/logo/logo3.png" alt="로고" style="width: 300px; height: 250px; object-fit: cover; "/></a>
	</header>
	
	<section class="content" style="display: flex; justify-content: center; align-items: flex-start; height: 100vh;">
		<nav></nav>
		<article class="txtCenter">
			<table class="headLeft_01" style="margin-top: 120px;" >
				<tr>
					<th></th>
					<td><input type="text" id="name" name="name" placeholder="이름을 입력하세요!" maxlength="6" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"
					/></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" id="email" name="email" placeholder="이메일을 입력하세요!" maxlength="16" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align:center;border-bottom:0px;padding-top: 10px"><input type="button" value="아이디 찾기" style="width:200px" onClick="findForm();"/></td>
				</tr>
			</table>
			<table>
				<c:choose>
					<c:when test="${empty id}">
						<tr>
							<td>등록된 아이디가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td style="text-align: center">
								<c:if test="${not empty id}">
									<a href="/front/member/findPasswdForm.jsp">비밀번호 찾기</a>
									<a href="front/login/loginForm.jsp">로그인</a>
								</c:if>
								<c:if test="${empty id}">
									<a href="/front/member/registerForm.jsp">회원가입하기</a>
								</c:if>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</article>
		<aside></aside>
	</section>
	<footer>
	</footer>
</div>
</form>
</body>
</html>