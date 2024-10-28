<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF com.happySteps.
 * com.happySteps OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 com.happySteps ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241007032838][son062121#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/product/view.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<%@ include file="/include/bfc/header.jsp" %>
<style>
	
    /* 헤더 스타일 */
    th {
        background-color: #f2f2f2;
        color: #333;
        padding: 10px;
        border-bottom: 2px solid #ddd;
        text-align: center;
    }

    /* 데이터 셀 스타일 */
    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    /* 링크 스타일 */
    td a {
        color: #337ab7;
        text-decoration: none;
    }
    td a:hover {
        color: #0056b3;
        text-decoration: underline;
    }

    /* 홀수 줄 배경색 */
    tr:nth-child(odd) {
        background-color: #f9f9f9;
    }

    /* 빈 데이터 행 스타일 */
    .emptyRow td {
        text-align: center;
        color: #777;
        font-style: italic;
    }
    /* 버튼 스타일 */
	a.btnBasic {
	    display: inline-block; /* a 태그를 버튼처럼 보이게 하기 위해 추가 */
	    width: 100px;
	    padding: 10px;
	    font-weight: bold;
	    color: white;
	    background-color: #3B5368;
	    text-align: center; /* 텍스트 가운데 정렬 */
	    text-decoration: none; /* 밑줄 제거 */
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	/* 버튼 hover 효과 */
	a.btnBasic:hover {
	    background-color: #005bb5;
	}
</style>
</head>
<body class="nav-md">
<form id="frmMain" method="POST">
<input type="hidden" id="seq_prd"		name="seq_prd" 		value="${productDto.seq_prd}"	/>
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_state_prd" 	name="cd_state_prd"	value="${productDto.cd_state_prd}"/>
<input type="hidden" id="cd_ctg_pet" 	name="cd_ctg_pet"	value="${productDto.cd_ctg_pet}"/>
<input type="hidden" id="pet_items" 	name="pet_items" 	value="${productDto.pet_items}"/>
		<%@ include file="/include/bfc/navi.jsp" %>
			<div class="right_col" role="main">
			<!-- top tiles -->
				 <article class="x_panel">
					<table style="width: 100%; max-width: 1600px; margin-left: auto; margin-right: auto;">
						<tr>
							<th style="width: 150px;">상품명</th>
							<td>
								${productDto.prd_nm}
							</td>
						</tr>
						<c:if test="${productDto.flg_delete == 'N'}">
							<tr>
								<th>상품 상태</th>
								<td>
									<c:if test="${productDto.cd_state_prd == '1'}">판매중</c:if>
									<c:if test="${productDto.cd_state_prd == '2'}">판매중지</c:if>
									<c:if test="${productDto.cd_state_prd == '3'}">반려</c:if>
									<c:if test="${productDto.cd_state_prd == '9'}">재고소진</c:if>
								</td>
							</tr>
						</c:if>
						<tr>
							<th>카테고리</th>
							<td>
								
							</td>
						</tr>
						<tr>
							<th>상품 원가</th>
							<td>
								<fmt:formatNumber value="${productDto.price_cost}" type="number" /> 원
							</td>
						</tr>
						<tr>
							<th>재고 수량(*)</th>
							<td>
								${productDto.count_stock} 개
							</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>
								${productDto.dt_reg}
							</td>
						</tr>
						<tr>
							<th>수정일</th>
							<td>
								${productDto.dt_upt}
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
								<c:if test="${productDto.flg_delete == 'N'}">
									<input type="button" value="삭제" style="width:100px" onclick="javascript:location.href='/console/product/remove.web?seq_prd=${productDto.seq_prd}';" />
									<input type="button" value="수정" style="width:100px" onclick="javascript:modifyForm();" />
								</c:if>
								<!-- [TODO: 리스트로 이동할 때 검색 내역 기억] -->
								<input type="button" value="목록" style="width:100px" onclick="javascript:location.href='/console/product/list.web'"/>
							</td>
						</tr>
					</table>
					<br/>
					<div class="center-container"  style= "display: flex; justify-content: center;">
						<plutozoneUtilTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
					</div>
					<br/>
					<div class="center-container"  style= "display: flex; justify-content: center;">
						<a href="/console/product/writeForm.web" class="btnBasic">등록</a>
					</div>
				</article>
				 <!-- /top tiles -->
			</div>	 
	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
	<!-- /footer content -->
<script>
	function modifyForm() {
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/console/product/modifyForm.web";
		frmMain.submit();
	}
</script>
</form>
</body>
</html>
