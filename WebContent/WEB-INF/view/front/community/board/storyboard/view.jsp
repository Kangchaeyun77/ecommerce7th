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
<%@ page info="/WEB-INF/view/front/community/board/storyboard/view.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<%@ include file="/include/front/gnb_community.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/brdSearchArea.css">
	<style>
/* 전체 컨테이너 스타일 */
.content-container {
    border: 2px solid #F9F3EC; /* 외부 박스 테두리 색상 */
    border-radius: 15px; /* 둥근 모서리 */
    padding: 20px; /* 내부 여백 */
    margin-top: 20px; /* 상단 여백 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 미세한 그림자 효과 */
    background-color: #fff; /* 배경색 */
}

/* 제목 스타일 */
.headLeft_01 th {
    background-color: #F9F3EC; /* 부드러운 연한 핑크색 배경 */
    color: #333; /* 텍스트 색상 */
    font-size: 20px; /* 제목 폰트 크기 */
    padding: 12px; /* 내부 여백 */
    border-radius: 10px; /* 둥근 모서리 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 미세한 그림자 효과 */
}

/* 내용 스타일 */
.content {
    font-size: 16px; /* 폰트 크기 */
    line-height: 1.8; /* 줄 간격 */
    color: #555; /* 어두운 텍스트 색상 */
}

/* 등록일자 스타일 */
td {
    font-size: 14px; /* 폰트 크기 */
    color: #777; /* 연한 텍스트 색상 */
}

/* 첨부 파일 스타일 */
.attach-file {
    font-size: 16px; /* 폰트 크기 */
    color: #007BFF; /* 링크 색상 */
    text-decoration: underline; /* 밑줄 */
    transition: color 0.3s; /* 부드러운 색상 변화 */
}

.attach-file:hover {
    color: #0056b3; /* 호버시 색상 변화 */
}

/* 버튼 스타일 */
input[type="button"] {
    background-color: #F9F3EC; /* 하늘색 */
    color: black; /* 텍스트 색상 */
    border: none; /* 테두리 없음 */
    border-radius: 25px; /* 둥근 모서리 */
    padding: 10px 25px; /* 내부 여백 */
    cursor: pointer; /* 커서 포인터 */
    transition: background-color 0.3s, transform 0.2s; /* 부드러운 효과 */
    margin-top: 20px; /* 버튼 상단 여백 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 미세한 그림자 효과 */
}

input[type="button"]:hover {
    background-color: #f5f5dc; /* 호버시 색상 변화 */
    transform: scale(1.05); /* 호버시 약간 커짐 */
}


	</style>
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
		 <div class="content-container"> 
		   <h2 class="title">제목: ${communityDto.title}</h2>
		<hr>
			<table class="headLeft_01"">
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
			<div style="text-align: center; margin-top: 20px;">
				<input type="button" value="목록" style="width:500px" onclick="javascript:goList(7);"/>
			</div>
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