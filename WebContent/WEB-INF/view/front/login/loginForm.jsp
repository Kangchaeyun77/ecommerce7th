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
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: com.github.ecommerce7th
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002100000][hyeen103#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/login/loginForm.jsp" %>
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
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
		
		function checkForm() {
			
			var frmMain = document.getElementById("frmMain");
			/*
			alert("이메일(아이디)=" + document.getElementById("email").value + "\n"
					+ "비밀번호=" + document.getElementById("passwd").value);
			*/
			/*
			alert("이메일(아이디)=" + document.frmMain.email.value + "\n"
					+ "비밀번호=" + document.frmMain.passwd.value);
			*/
			// if (document.getElementById("email").value == "") {
			if (document.getElementById("id").value == "") {
				alert("아이디를 6 ~ 10자 이내로 입력하세요!");
				document.getElementById("id").focus();
				// document.getElementById("email").select();
				return;
			}
			
			if (document.getElementById("passwd").value.length < 8
					|| document.getElementById("passwd").value.length > 16) {
				alert("비밀번호를 8 ~ 16자 이내로 입력하세요!");
				document.getElementById("passwd").focus();
				return;
			}
			
			frmMain.action = "/front/login/loginProc.web";
			frmMain.submit();
		}
		/*
		$(function() {
			var $frm = $("#frmMain");
			
			$frm.on("submit", function(e) {
				
				// 이메일과 비밀번호가 7자리 이하 또는 @가 없으면
				if ($("#email").val().length <=7
						|| $("#passwd").val().length <=7
						|| $("#email").val().indexOf("@") <= 0) {
					alert("이메일/아이디(@ 포함)와 비밀번호는 8자리 이상을 입력하세요!");
					return false;
				}
				
				e.preventDefault();
				var myData = $frm.serialize();
				//alert(myData);
				
				$.ajax({
					type: "POST",
					url: $frm.attr("action"),
					data: myData,
					success:function(res) {
						
						if (res) {
							var jsonData = JSON.parse(res);
							//alert(jsonData);
							
							var message = "";
							//alert("[" + jsonData.name + "]");
							
							if (jsonData.name != "") {
								message = jsonData.name
										+ "(" + jsonData.email
										+ ")" + "님 반갑습니다.";
							}
							else {
								message = jsonData.email
										+ ", 너 누구냐?";
							}
							
							$(".container").html(message);
						}
					}
				});
			});
		});
		*/
	</script>
</head>
<body>
<form id="frmMain" name="frmMain" method="POST">
<!-- <form id="frmMain" method="POST" action="/loginProc.jsp"> -->
<div class="container">
	<header style="display: flex; justify-content: center; align-items: center; height: 120px;">
<div style="position: relative; height: 200px; overflow: hidden; margin-top: 50px;">
		<a href="/front/"><img src="/images/logo3.png" alt="로고" style="width: 300px; height: 250px; object-fit: cover; "/></a>
</div>
	</header>
	
	<section class="content" style="display: flex; justify-content: center; align-items: flex-start; height: 100vh;" >
		<nav></nav>
		<article class="txtCenter">
			<table class="headLeft_01" style="margin-top: 120px;" >
				<tr>
					<th style="text-align: left;">아이디</th>
					<td><input type="text" id="id" name="id" value="plutomsw" maxlength="15" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
					
				</tr>
				<tr>
					<th style="text-align: left;">비밀번호</th>
					<td><input type="password" id="passwd" name="passwd" value="12345678!a" maxlength="16" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;border-bottom:0px;padding-top: 10px"><input type="checkbox" id="rememberMe" name="rememberMe" style="width:20px" onClick="rememberId()"/>아이디 저장</td>
				</tr>
				<tr>
				<td colspan="2" style="text-align:center;border-bottom:0px;padding-top: 10px">
					<input type="button" 
						value="로그인 하기" 
						style="width:100%; padding:10px; background-color:#dead6f; color:white; border:none; border-radius:5px; cursor:pointer; font-size:16px;"
						onMouseOver="this.style.backgroundColor='#d9c88c';" 
						onMouseOut="this.style.backgroundColor='#dead6f';" 
						onClick="checkForm();"/>
				</td>
				</tr>
			</table>
			<table>
				<tr>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/findIdForm.web">[아이디 찾기]</a></td>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/findPasswdForm.web">[비밀번호 찾기]</a></td>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/termAgreeForm.web">[회원 가입]</a></td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>