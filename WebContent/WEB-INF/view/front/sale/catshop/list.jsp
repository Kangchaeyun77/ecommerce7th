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
 *				: [20241008172500][hyeen103#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/sale/catshop/list.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/top.jsp" %>
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/gnb.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<style></style>
	<script>
	<%-- 
		function goView(value) {
			
			/*
			document.getElementById("currentPage").remove();
			document.getElementById("searchKey").remove();
			document.getElementById("searchWord").remove();
			*/
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("seq_bbs").value = value;
			
			frmMain.action="/front/center/board/view.web";
			frmMain.submit();
		}
		
		function goPage(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = value;
			
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
		
		function goList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("searchWord").value = "";
			document.getElementById("currentPage").value = "1";
			document.getElementById("cd_bbs_type").value = value;
			
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
	--%>
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="seq_bbs"		id="seq_bbs" />
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
<div class="container">
	<section class="content">
		<article class="txtCenter">
			<div class="brdSearchArea">
				<select name="searchKey">
					<option value="sle_nm">상품명</option>
					<option value="sle_desces">상품설명</option>
					<option value="sle_desces_and_nm">상품명 및 설명</option>
				</select>
				<select name="cd_ctg" id="cd_ctg">
					<option value="1"<c:if test="${paging.cd_ctg == 1}">selected</c:if>>강아지</option>
					<option value="2"<c:if test="${paging.cd_ctg == 2}">selected</c:if>>고양이</option>
					<option value="3"<c:if test="${paging.cd_ctg == 3}">selected</c:if>>햄스터</option>
					<option value="4"<c:if test="${paging.cd_ctg == 4}">selected</c:if>>파충류</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}"/><input type="submit" value="검색"/>
			</div>
			<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<table class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">NO</th>
					<th style="width: 60%">판매명</th>
					<th style="width: 20%">가격</th>
					<th style="width: 10%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4">등록된 상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td class="txtCenter">
								${list.rnum}
							</td>
							<td class="txtLeft">
								<a href="/seller/sale/view.web?seq_sle=${list.seq_sle}">
								</a>
							</td>
							<td>
								${list.cd_where}
							</td>
							<td class="txtCenter">
								<c:choose>
									<c:when test="${list.cd_state_sale == '1'}">
										판매중
									</c:when>
									<c:when test="${list.cd_state_sale == '2'}">
										판매중지
									</c:when>
									<c:when test="${list.cd_state_sale == '3'}">
										반려
									</c:when>
									<c:when test="${list.cd_state_sale == '9'}">
										품절
									</c:when>
								</c:choose>
							</td>
							<td class="txtRight">
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
			<plutozoneUtilTag:page styleID="admin_text" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPages"/>
			<br/>
			<a href="/seller/sale/writeForm.web" class="btnBasic">판매 등록</a>
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