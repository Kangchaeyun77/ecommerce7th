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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240626130000][pluto@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/registerForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style></style>
	<script>
		// 이메일 중복 여부
		var isDuplicate = true;
		
		$(function() {
			var $frm = $("#frmMain");
			
			$("#btnId").on("click", function(e) {
				
				// 이메일이 7자리 이하 또는 @가 없으면
				if ($("#email").val().length <=7 || $("#email").val().indexOf("@") <= 0) {
					alert("이메일/아이디를(@ 포함) 8자리 이상으로 입력하세요!");
					return false;
				}
				
				// var myData = $frm.serialize();
				// var myData = "email=" + $("#email").val();
				
				// var myData = {email: "plutomsw@gmail.com", passwd: "123456"};
				var myData = {email: $("#email").val()};
				//alert(JSON.stringify(myData));
				
				/*
				var myData = "{\"email\": \"plutomsw@gmail.com\", \"passwd\": \"12345678\"}";
				alert(myData);
				*/
				
				$.ajax({
					type: "POST",
					async: false,
					url: "/front/member/checkDuplicate.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success:function(res) {
						// alert(JSON.stringify(res));
						// var jsonData = JSON.parse(res);
						// 중복이 안 될 경우
						if (res != true) {
							isDuplicate = false;
							$("#email").attr("readonly",true);
							alert($("#email").val() + "는 사용 가능하며 변경할 수 없습니다.");
							document.getElementById("btnConfirm").disabled = false;
							document.getElementById("btnId").disabled = true;
							document.getElementById("emailPw").hidden = false;
							document.getElementById("matchPw").hidden = false;
						}
						else {
							alert($("#email").val() + "는 사용 불가능! 다른 이메일을 입력하세요!");
							$("#email").val("");
							$("#email").focus();
						}
					}
				});
			});
		});
	</script>
	<script>
	    function togglePetOptions() {
	        var petYes = document.getElementById('btnPet').checked;
	        var petOptions = document.getElementById('petOptions');
	        if (petYes) {
	            petOptions.style.display = 'block';
	        } else {
	            petOptions.style.display = 'none';
	        }
	    }
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="phone" id="phone" />
<input type="hidden" name="hobbys" id="hobbys" />
<div class="container">
	<section class="content">
		<nav></nav>
		<article class="txtCenter">
			(*) 표시는 필수 입력 사항입니다.
<!--			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">서비스 약관</th>
					<td>
						<input type="checkbox" id="term_1" name="term_1" value="Y" required /> [필수]이용 약관
						<input type="checkbox" id="term_2" name="term_2" value="Y" /> [선택]마케팅 수신 동의
						<input type="checkbox" id="term_3" name="term_3" value="Y"  /> [선택]제 3자 개인 정보 제공 동의
					</td>
				</tr>
			</table>-->
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto; ">
				<tr>
					<th style="width: 150px;">아이디</th>
					<td>
						<input value="plutomsw" type="text" id="id" name="id" required />
						 <input type="button" value="중복 찾기" style="width:100px" id="btnId" />
					</td>
				</tr>
				<tr>
					<th>비밀번호(*)</th>
					<td><input value="12345678!a" type="password" id="passwd" name="passwd" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인(*)</th>
					<td><input value="12345678!a" type="password" id="passwd_" name="passwd_" required /></td>
				</tr>
				<tr>
					<th style="width: 150px;">닉네임</th>
					<td>
						<input value="귀여운냥이" type="text" id="nickname" name="nickname" required />
						 <input type="button" value="중복 찾기" style="width:100px" id="btnNick" />
					</td>
				</tr>
				<tr>
					<th>성명(*)</th>
					<td>
						<input value="명성완" type="text" id="mbr_nm" name="mbr_nm" required />
						 <input type="radio" name="gender" value="M" checked /> 남
						 <input type="radio" name="gender" value="F" /> 여
					</td>
				</tr>
				<tr>
					<th>연락처(*)</th>
					<td>
						<input value="010" type="text" id="phone1" name="phone1" maxlength="3"     style="text-align:center;width:50px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input value="9947" type="text" id="phone2" name="phone2" maxlength="4" style="text-align:center;width:60px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input value="1973" type="text" id="phone3" name="phone3" maxlength="4" style="text-align:center;width:60px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th>주소(*)</th>
					<td>
						<input type="text" maxlength="5" style="text-align:center;width:70px;background-color:#F0F0F0" id="post" name="post" required readonly />
						 도로명 <input type="text" size="30" required id="addr1" name="addr1" style="background-color:#F0F0F0" readonly />
						 <input type="hidden" id="jibunAdd" />
						 <input type="hidden" id="extraAddress" />
						 <span id="guide" style="color:#999; display:none"></span>
						 <input type="button" value="우편번호 찾기" style="width:120px" onClick="execDaumPostcode();" />
						 <br> 상세주소 
						 <input value="주소2" type="text" placeholder="상세 주소" required id="addr2" name="addr2" />
						 </td>
				</tr>
				<tr>
					<tr>
					    <th>반려동물 유/무</th>
					    <td>
					        <input type="radio" name="havePet" value="Y" id="btnPet" onclick="togglePetOptions()"/> 있음 
					        <input type="radio" name="havePet" value="N" checked onclick="togglePetOptions()"/> 없음 
							<select id="petOptions" style="display:none;" name="petType"> 반려동물 종류
							    <option value="dog">강아지</option>
							    <option value="cat">고양이</option>
							    <option value="hamster">햄스터</option>
							    <option value="reptile">파충류</option>
							    <option value="other">기타</option>
							</select>
					    </td>
					</tr>
					<th>마케팅 수신 동의</th>
					<td>
						SMS <input type="checkbox" name="flg_sms" value="Y" />
						 Email <input type="checkbox" name="flg_email" value="Y" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
						<input type="reset" value="다시 쓰기" style="width:100px"/>
						 <input type="button" value="가입 하기" style="width:100px" onClick="checkRegister();"/>
					</td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>