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
<%@ taglib prefix="c" 					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
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
	<%--
	    function findIdForm() {
	        var frmMain = document.getElementById("frmMain");
	        
	        // 사용자가 입력한 이름과 이메일 값을 가져옵니다.
	        var mbr_nm = document.getElementById("findNm").value; // 실제 이름을 입력받는 input 요소의 ID입니다.
	        var email = document.getElementById("findEmail").value; // 이메일을 입력받는 input 요소의 ID입니다.
			
	        // hidden input 필드에 값을 설정합니다. (이 부분은 불필요할 수도 있습니다)
	        document.getElementById("findNm").value = mbr_nm;
	        document.getElementById("findEmail").value = email;
	
	        // 입력된 값들을 콘솔에 출력하여 확인합니다.
	        console.log("name:", mbr_nm);
	        console.log("email:", email);
	
	        alert("아이디를 찾아줘");
	
	        // action 설정 후 폼을 제출합니다.
	        frmMain.action = "/front/member/findIdProc.web";
	        frmMain.submit();
	    }
	    --%>
	    function findIdForm(value) {
	        var frmMain = document.getElementById("frmMain");
	    	
	        var findNm = document.getElementById("findNm").value; 
	        var findEmail = document.getElementById("findEmail").value; 
	      
	        if (findNm === "" || findEmail === "") {
	            alert("필수값을 입력해주세요");
	            return; // 이 위치에서 함수를 종료합니다.
	        }
	        console.log(findNm);
	        console.log(findEmail);
	        frmMain.action = "/front/member/findIdProc.web";
	        frmMain.submit(); // 필수값이 모두 입력되면 폼을 제출합니다.
	    }

	</script>
</head>
<body>
<input type="hidden" id="hiddenFindNm" name="hiddenFindNm" value="<%= session.getAttribute("findNm") %>" />  
<input type="hidden" id="hiddenFindEmail" name="hiddenFindEmail" value="<%= session.getAttribute("findEmail") %>" />
<form id="frmMain" name="frmMain" method="POST" enctype="multipart/form-data">
	<%--
<input type="hidden" name="findNm" id="findNm" />
<input type="hidden" name="findEmail" id="findEmail" />
 --%>
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
					<td><input type="text" id="findNm" name="findNm" value="명성완" placeholder="이름을 입력하세요!" maxlength="6" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"
					/></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" id="findEmail" name="findEmail" value="plutomsw@gmail.com" placeholder="이메일을 입력하세요!" maxlength="20" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align:center;border-bottom:0px;padding-top: 10px"><input type="button" value="아이디 찾기" 
					style="width:100%; padding:10px; background-color:#dead6f; color:white; border:none; border-radius:5px; cursor:pointer; font-size:16px;"
						onMouseOver="this.style.backgroundColor='#d9c88c';" 
						onMouseOut="this.style.backgroundColor='#dead6f';" 
						onClick="findIdForm();"/></td>
				</tr>
			</table>
			<table>
			<tr>
				<td style="text-align: center">
					<c:choose>
						<c:when test="${not empty foundId}">
							<plutozoneUtilTag:masking text="${foundId}" letter="*" count="4" mode="right" />
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td style="text-align: center">
					<a href="/front/member/registerForm.jsp">[회원가입하기]</a>
					<a href="/front/member/findPasswdForm.jsp">[비밀번호 찾기]</a>
					<a href="/front/login/loginForm.jsp">[로그인]</a>
				</td>
				
			</tr>
		</table>
		</article>
		<aside></aside>
	</section>
	<footer>
	</footer>
</div>
</form>
${foundId}
</body>
</html>