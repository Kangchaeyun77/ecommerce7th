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
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-10][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/qna/list" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<link rel="stylesheet" href="/css/brdSearchArea.css">
	<%@ include file="/include/front/top.jsp" %>
	<style></style>
	<script>
	function goView(value) {
		
		/*
		document.getElementById("currentPage").remove();
		document.getElementById("searchKey").remove();
		document.getElementById("searchWord").remove();
		*/
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("seq_bbs").value = value;
		
		frmMain.action="/front/center/community/view.web";
		frmMain.submit();
	}
	
	function goPage(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("currentPage").value = value;
		
		frmMain.action="/front/community/board/list.web";
		frmMain.submit();
	}
	
	function goList(value) {
		
		var frmMain = document.getElementById("frmMain");
		
		document.getElementById("searchWord").value = "";
		document.getElementById("currentPage").value = "1";
		document.getElementById("cd_bbs_type").value = value;
		
		frmMain.action="/front/community/board/list.web";
		frmMain.submit();
	}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage" id="currentPage" value="${paging.currentPage}" />
<div class="container">
	<header>
		<div style="text-align: center;">
		<%@ include file="/include/front/header.jsp" %>
		<div style="display: flex; justify-content: center;">
			<%@ include file="/include/front/gnb_community.jsp" %>
		</div>
		</div>	
	</header>
	<nav>
	</nav>
	<section class="content">
		<article class="txtCenter">
			<div class="brdSearchArea" style="display: flex; justify-content: center; align-items: center;">
				<select name="searchKey" id="searchKey">
					<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
					<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
					<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" />
				<input type="submit" value="검색"/>
			</div>
			<div class="brdInfo">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<table class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">NO</th>
					<th>제목</th>
					<th style="width: 10%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="3">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>
								${list.rnum}
							</td>
							<td style="text-align: left">
								<a href="/front/community/board/view.web?cd_bbs_type=8&seq_bbs=${list.seq_bbs}">
									<c:if test="${list.seq_reply == 0}">[미답변] </c:if>
									<c:if test="${list.seq_reply > 0}">[답변 완료] </c:if>
									${list.title}
								</a>
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
			<div style="display: flex; justify-content: center;">
			<plutozoneUtilTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
			</div>
			<br/>
			<div style="width: auto; margin-left: auto; margin-right: auto">
			</div>
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