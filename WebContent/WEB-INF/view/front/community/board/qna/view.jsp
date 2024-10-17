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
 * File			: view.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-17][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/qna/view.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<%@ include file="/include/front/gnb_community.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" href="/css/table.css" />
	<style></style>
	<script>
		function download(type, sequence) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", type);
			frmMain.sequence.setAttribute("value", sequence);
			frmMain.action = "/front/community/board/download.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
		}
		function goView(value) {
		    var frmMain = document.getElementById("frmMain");
		    document.getElementById("seq_bbs").value = value;
		    frmMain.action="/front/community/board/view.web";
		    frmMain.target = "";
		    frmMain.submit();
		}
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/community/board/list.web";
			frmMain.target = "";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_bbs_type"	name="cd_ctg" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${communityDto.seq_bbs}" />
<div class="container">
	<section class="content">
		<article class="txtCenter">
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">제목</th>
					<td>
						${communityDto.title}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="content">
						${communityDto.content}
					</td>
				</tr>
				<c:if test="${communityDto.file_orig != ''}">
				<tr>
					<th>첨부 파일</th>
					<td>
						<a href="javascript:download('BbsNotice', ${communityDto.seq_bbs});">다운로드</a>
					</td>
				</tr>
				</c:if>
				<tr>
					<th>등록 일자</th>
					<td>
						${communityDto.dt_reg}
					</td>
				</tr>
			</table>
			<div style="width: 900px; margin-left: auto; margin-right: auto">
				<input type="button" value="목록" style="width:100px" onclick="javascript:goList(8);"/>
			</div>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</form>
</body>
</html>