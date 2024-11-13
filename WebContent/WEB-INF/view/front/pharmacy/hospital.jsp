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
 * File			: list.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-11-06][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/pharmacy/list.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>동물병원 리스트</title>
    <style>

    </style>
</head>
<body>
    <nav>
        <%@ include file="/include/front/lnbHospital.jsp" %>
    </nav>
    <form id="frmMain" method="POST">
        <input type="hidden" name="cd_bbs_type" id="cd_bbs_type" />
        
        <div class="container">
            <h2>경기도 성남시에 있는 동물병원 리스트</h2>
        
            <label for="petType">진료 가능한 동물 종류를 선택하세요:</label>
            <select id="petType" name="petType">
                <option value="dog">강아지</option>
                <option value="cat">고양이</option>
                <option value="hamster">햄스터</option>
                <option value="reptile">파충류</option>
                <option value="fish">물고기</option>
            </select>
            <button type="submit">검색</button>
        </div>

    </form>

    <!-- 동물병원 목록 -->
    <h3>동물병원 목록</h3>
    <ul>
        <li>
            <span>성남동물병원</span>
            <span class="address">경기도 성남시 분당구 판교로 99</span>
        </li>
        <li>
            <span>강아지전문동물병원</span>
            <span class="address">경기도 성남시 수정구 수정로 123</span>
        </li>
        <li>
            <span>우리집동물병원</span>
            <span class="address">경기도 성남시 중원구 성남대로 45</span>
        </li>
        <li>
            <span>고양이사랑동물병원</span>
            <span class="address">경기도 성남시 분당구 야탑로 78</span>
        </li>
        <li>
            <span>햄스터전문동물병원</span>
            <span class="address">경기도 성남시 수정구 신흥로 56</span>
        </li>
        <li>
            <span>파충류동물병원</span>
            <span class="address">경기도 성남시 중원구 중앙로 101</span>
        </li>
        <li>
            <span>물고기전문동물병원</span>
            <span class="address">경기도 성남시 분당구 여수로 15</span>
        </li>
    </ul>



    <footer>
        <%@ include file="/include/front/footer.jsp" %>
    </footer>
</body>
</html>