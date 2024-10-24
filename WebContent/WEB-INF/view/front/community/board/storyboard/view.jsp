<%@page import="com.happySteps.front.community.dto.CommunityDto"%>
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
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/brdSearchArea.css">
	<link rel="stylesheet" href="/css/view.css">
		<title>커뮤니티 자유게시판 상세보기</title>
<style>
	.comment-item {
    padding: 10px; /* 여백 */
    margin: 10px 0; /* 상하 여백 */
    border: 1px solid #F9F3EC; /* 테두리 색상 */
    border-radius: 10px; /* 둥근 모서리 */
    background-color: #f9f9f9; /* 배경색 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 미세한 그림자 효과 */
    max-height: none; /* 최대 높이 제한을 없애줌 */
    overflow: visible; /* 내용이 넘칠 때 잘리지 않게 설정 */
    
}
</style>
	<script>
	// 서버에서 JSP로 넘어온 seq_bbs 값을 JavaScript 변수로 할당
	
	document.addEventListener('DOMContentLoaded', () => {
	var seq_bbs = "${communityDto.seq_bbs}"; 
    loadComments(seq_bbs); // seq_bbs는 필요한 값으로 설정
});
	
	var seq_bbs = "${communityDto.seq_bbs}";
	window.onload = function() {
	    loadComments(seq_bbs);  // 페이지 로드 시 댓글 목록을 불러옴
	};

function loadComments(seq_bbs) {
	// 게시물 ID가 유효하지 않은 경우
	if (!seq_bbs || seq_bbs === "") {
		console.error("seq_bbs 값이 유효하지 않습니다.");
		return;
	} else {
		// 댓글을 불러올 URL 생성
		var requestUrl = "/front/comment/view.web?seq_bbs=" + seq_bbs;
		
		// Fetch API를 사용하여 댓글 데이터 요청
		fetch(requestUrl, {
			method: 'GET',
			headers: { 'Content-Type': 'application/json' }
		})
		.then(response => {
			// 응답이 성공적이지 않은 경우 오류 처리
			if (!response.ok) {
				throw new Error('댓글을 불러오는 중 오류 발생');
			}
			return response.json(); // JSON 형태로 응답 데이터 변환
		})
		.then(data => {
			console.log(data); // 응답 데이터 로그 출력

			// 댓글 목록을 출력할 영역 선택
			const commentListContainer = document.getElementById('commentListContainer');

			// 기존 댓글 목록을 지우기 (선택 사항)
			commentListContainer.innerHTML = ''; // 기존 댓글 목록 초기화

			// 댓글 데이터가 있는지 확인
			if (data.commentList && data.commentList.length > 0) {
				// 댓글 데이터 배열을 순회하며 DOM 요소 생성
				data.commentList.forEach(comment => {
					// 각 댓글을 위한 DIV 요소 생성
					const commentElement = document.createElement('div');
					commentElement.classList.add('comment-item');

					// 댓글 작성자 표시
					const author = document.createElement('p');
					author.textContent = '작성자: ' + comment.nickname;
					commentElement.appendChild(author);

					// 댓글 내용 표시
					const content = document.createElement('p');
					content.textContent = '내용: ' + comment.content;
					commentElement.appendChild(content);
					
					// 댓글 작성 시간 표시
					const dt_reg = document.createElement('p');
					dt_reg.textContent = '등록시간: ' + comment.dt_reg;
					commentElement.appendChild(dt_reg);
					
					// 댓글 요소를 목록에 추가
					commentListContainer.appendChild(commentElement);
				});
			} 
		})
		.catch((error) => {
			console.error('Error:', error); // 오류 메시지 출력
		});
	}
}

	// 댓글 등록
		function addComment(seq_bbs) {
			const seq_mbr = sessionStorage.getItem('SEQ_MBR');
			const nickname = sessionStorage.getItem('NICKNAME');// 세션에서 닉네임 가져오기
			const dt_reg = sessionStorage.getItem('DT_REG');
			const content = document.getElementById('commentContent').value; 
			//console.log("닉네임:", sessionStorage.getItem('NICKNAME'));
			//alert("게시글번호 가져옴?=" + seq_bbs);
			//alert("댓글내용 가져옴?=" + content);
			
			fetch('/front/comment/add.web', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ seq_bbs: seq_bbs, seq_mbr: seq_mbr, content: content, nickname: nickname, dt_reg: dt_reg}) // 오타 수정
			})
			.then(response => {
				if (!response.ok) {
					throw new Error('오류발생');
				}
				return response.json();
			})
			.then(data => {
				alert('댓글이 등록되었습니다.'); // 성공 메시지
				location.reload();  // 등록 후 페이지 새로고침
			})
			.catch((error) => {
				console.error('Error:', error); // 오류 메시지 출력
			});
		}
	// 댓글 또는 대댓글 삭제
	function deleteComment(seq_comment) {
		if (confirm('정말 삭제하시겠습니까?')) {
			fetch('/front/community/comment/delete.web', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
				},
				body: JSON.stringify({ seq_comment: seq_comment })
			})
			.then(response => response.json())
			.then(data => {
				alert('댓글이 삭제되었습니다.');
				location.reload();  // 삭제 후 페이지 새로고침
			})
			.catch((error) => {
				console.error('Error:', error);
			});
		}
	}
	//좋아요 이미지 클릭 시 이모지 변경
	function toggleLike(seq_bbs) {
		const likeElement = document.getElementById('likeElement'); // 이모지를 표시할 요소
		const seq_mbr = sessionStorage.getItem('SEQ_MBR');
		const cd_ctg = document.getElementById("cd_ctg").value;

		fetch('/front/community/board/like.web', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ seq_bbs: seq_bbs, seq_mbr: seq_mbr, cd_ctg: cd_ctg}) // seq_bbs를 포함
		})
		.then(response => response.json())
		.then(data => {
			document.getElementById('like_count').innerText = data.like_count;
			
			// 이모지 변경
			if (data.liked) {
				likeElement.innerText = '❤️'; // 눌린 하트 이모지
			} else {
				likeElement.innerText = '🤍'; // 기본 하트 이모지
			}
		})
		.catch((error) => {
			console.error('Error:', error);
		});
	}

	function fetchLikeCount(seq_bbs) {
		fetch('/front/community/board/like_count.web', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify({ seq_bbs: seq_bbs })
		})
		.then(response => response.json())
		.then(data => {
			// 좋아요 수 업데이트
			updateLikeCount(data.newLikeCount);
		})
		.catch((error) => {
			console.error('Error:', error);
		});
	}

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
			location.href = "/front/community/board/list.web?cd_bbs_type=7";
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_ctg" name="cd_ctg" value="${communityDto.cd_ctg}" />  
<input type="hidden" id="cd_ctg_pet"	name="cd_ctg_pet" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type" />
<c:set var="seq_mbr" value="${sessionScope.seq_mbr}" />
<input type="hidden" id="seq_mbr" name="seq_mbr" value="<%= session.getAttribute("seq_mbr") %>" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${communityDto.seq_bbs}" />
<div class="container">
	<section class="content">
		<article class="txtCenter">
		 <div class="content-container"> 
			<h2 class="title">제목: ${communityDto.title}</h2>			
			<div class="icon-cd_ctg_pet" style="display: flex; justify-content: center; align-items: flex-start; flex-direction: column;">
				<c:choose>
					<c:when test="${communityDto.cd_ctg_pet == 1}">
						<img src="/images/icon/community/dog.png" alt="Dog" style="width: 10%; height: 10%;" />
					</c:when>
					<c:when test="${communityDto.cd_ctg_pet == 2}">
						<img src="/images/icon/community/cat.png" alt="Cat" style="width: 10%; height: 10%;" />
					</c:when>
					<c:when test="${communityDto.cd_ctg_pet == 3}">
						<img src="/images/icon/community/hamster.png" alt="Hamster" style="width: 10%; height: 10%;" />
					</c:when>
					<c:when test="${communityDto.cd_ctg_pet == 4}">
						<img src="/images/icon/community/reptile.png" alt="Reptile" style="width: 10%; height: 10%;" />
					</c:when>
					<c:otherwise>
						<img src="/images/icon/community/default.png" alt="Default Pet" style="width: 10%; height: 10%;" />
					</c:otherwise>
				</c:choose>
			</div>
					<div class="tag-container">
						테그: ${communityDto.tag}
					</div>
		<hr>
			<table class="headLeft_01">
				<tr>
					<th>작성자</th>
					<td>
						${communityDto.nickname}
					</td>
				</tr>
				<tr>
				<tr>
					<th>등록 일자</th>
					<td>
						${communityDto.dt_reg}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="content">
						<c:out value="${communityDto.content}" escapeXml="false" />
					</td>
				</tr>
			<tr>
				<th>이미지 업로드</th>
				<td>
					<div class="image-upload-container">
					이미지영역
					</div>
				</td>
			</tr>
			<tr>
				<th>좋아요</th>
				<td>
					<span id="likeElement" style="cursor: pointer; font-size: 24px;" onclick="toggleLike(${communityDto.seq_bbs})">🤍</span>
					<span id="like_count">${communityDto.like_count}</span>
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
			</table>
			<div style="display: flex; justify-content: center; margin-top: 20px;">
				<input type="button" value="목록" style="width:50%; height:60px;" onclick="javascript:goList();" />
			</div>
			<hr>
			<div style="font-size:30px; margin-top: 20px;">댓글 </div>
			<c:set var="seq_mbr" value="${sessionScope.seq_mbr}" />
				<textarea id="commentContent" rows="5" cols="50"style="width: 100%; font-size: 18px;" placeholder="댓글을 입력하세요."></textarea>
				<button type="button" style="width: 100%; height: 50px; margin-top: 10px; font-size: 18px;" onclick="addComment(${communityDto.seq_bbs},<%= session.getAttribute("seq_mbr") %>,'${communityDto.nickname}','${communityDto.dt_reg}');">댓글 등록</button>
			</div>

<div class="comment-list" id="commentListContainer">
	<c:if test="${not empty commentList}">
		<c:forEach var="comment" items="${commentList}">
			<div class="comment-item">
				<div class="comment-author">
					<strong>작성자:</strong> 
					<c:out value="${comment.nickname}"/> 
				</div>
				<div class="comment-content">
					<strong>내용:</strong>
					<span id="commentContent_${comment.seq_comment}">
						<c:out value="${comment.content}"/> 
					</span>
					<div class="comment-date">
					<strong>등록일:</strong> <c:out value="${comment.dt_reg}"/> 
					</div>
					<textarea id="editComment_${comment.seq_comment}">
						<c:out value="${comment.content}"/> 
					</textarea>
				</div>
				<div class="comment-actions" style="text-align: right;">
				    <button type="button" style="padding: 5px 10px; color: white; background-color: blue; border: none; cursor: pointer;" onclick="showEditForm(${comment.seq_comment})">수정</button> 
				    <button type="button" style="padding: 5px 10px; color: white; background-color: red; border: none; cursor: pointer;" onclick="deleteComment(${comment.seq_comment})">삭제</button> 
				</div>
			</div>

			<!-- 대댓글 처리 -->
			<c:forEach var="reply" items="${replyList}">
				<c:if test="${reply.seq_comment_parent == comment.seq_comment}">
					<div class="reply-item" style="padding-left: 40px;">
						<b>대댓글 - ${reply.nickname}</b>
						<span id="replyContent_${reply.seq_comment}">
							<c:out value="${reply.content}"/> 
						</span>
						<textarea id="editReply_${reply.seq_comment}" style="display:none;">
							<c:out value="${reply.content}"/> 
						</textarea>
						<div class="reply-actions" style="text-align: right;">
							<button type="button" onclick="showEditForm(${reply.seq_comment}, true)">수정</button>
							<button type="button" onclick="deleteComment(${reply.seq_comment})">삭제</button>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</c:forEach>
	</c:if>
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