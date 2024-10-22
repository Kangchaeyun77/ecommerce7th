<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF happyStep.com.
 * happyStep.com OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 happyStep.com ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happyStep.com에 있으며,
 * happyStep.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happyStep.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happyStep.com All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241021195400][kbs@happyStep.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/member/list.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/console/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<style></style>
	<script>
		
		function goModifyState(seq_mbr, cd_state) {
			
			if (confirm("상태를 변경하시겠습니까?")) {
				var frmMain = document.getElementById("frmMain");
				
				document.getElementById("seq_mng").value = seq_mng;
				document.getElementById("cd_state").value = cd_state;
				frmMain.action="/console/users/manager/modifyProc.web";
				frmMain.submit();
			}
		}
		
		function goModifyForm(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_state").remove();
			
			document.getElementById("seq_mng").value = value;
			frmMain.action="/console/users/manager/modifyForm.web";
			frmMain.submit();
		}
		
		function goPage(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = value;
			frmMain.action="/console/users/manager/list.web";
			frmMain.submit();
		}
	</script>
<%	String ID = (String) session.getAttribute("ID");
	if (ID == null || !"admin".equals(ID)) {
%>
		<script>
			alert("최고관리자만 접속 가능합니다.");
			window.location.href = "/console/index.web";  // 로그인 페이지로 리다이렉트
		</script>
<%
		return;
	}
%>
</head>
<body>
<form id="frmMain" method="POST" action="/console/users/manager/list.web">
<input type="hidden" name="seq_mng"		id="seq_mng" />
<input type="hidden" name="cd_state"	id="cd_state" />
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />
<div class="container">
	<header>
		<%@ include file="/include/console/top.jsp" %>
	</header>
	<nav>
		<%@ include file="/include/console/gnb.jsp" %>
	</nav>
	<section class="content">
		<nav>
			<%@ include file="/include/console/lnbUsers.jsp" %>
		</nav>
		<article class="txtCenter">
			<div class="brdSearchArea">
				<select name="searchKey">
					<option value="id"<c:if test="${paging.searchKey == 'id'}"> selected</c:if>>아이디</option>
					<option value="nickname"<c:if test="${paging.searchKey == 'nickname'}"> selected</c:if>>닉네임</option>
					<option value="mng_nm"<c:if test="${paging.searchKey == 'mng_nm'}"> selected</c:if>>성명</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> <input type="submit" value="검색"/>
			</div>
			<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<table class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">NO</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th style="width: 10%">상태</th>
					<th style="width: 15%">성명</th>
					<th style="width: 10%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="7">등록된 관리자가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>
								${list.rnum}
							</td>
							<td class="txtCenter">
								<a href="javascript:goModifyForm(${list.seq_mng});">
									${list.id}
								</a>
							</td>
							<td>
								<a href="javascript:goModifyForm(${list.seq_mng});">
									${list.nickname}
								</a>
							</td>
							<td>
								<select style="background:#F0F0F0" onchange="goModifyState(${list.seq_mng}, this.value);">
									<option value="0"<c:if test="${list.cd_state == 0}"> selected</c:if>>대기</option>
									<option value="1"<c:if test="${list.cd_state == 1}"> selected</c:if>>사용중</option>
									<option value="2"<c:if test="${list.cd_state == 2}"> selected</c:if>>사용불가</option>
								</select>
							</td>
							<td>
								${list.mng_nm}
							</td>
							<td>
								${list.dt_reg}
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br/>
			<plutozoneUtilTag:page styleID="admin_text" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/console/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>