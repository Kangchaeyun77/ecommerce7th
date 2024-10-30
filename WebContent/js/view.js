/**
 * @author rkdcodbs77@naver.com
 * @since 2024-10-24
 *
 * <p>DESCRIPTION: 커뮤니티 상세보기 관련 function
 * <p>IMPORTANT:</p>
 */

// 답글 저장
	function saveReply(seq_comment_parent, depth, seq_bbs) {
		//const seq_mbr = sessionStorage.getItem('SEQ_MBR');
		//console.log("회원번호 가져오셨나요??제출 해주세요"+seq_mbr);
		const content = document.getElementById(`replyContent_${seq_comment_parent}`).value;
		const seq_mbr = document.getElementById("seq_mbr").value;
		console.log("회원번호 가져오셨나요??제출 해주세요"+seq_mbr);
		const cd_ctg = document.getElementById("cd_ctg").value;
		const commentElement = document.querySelector(`div[data-seq-bbs]`);
		if (!content.trim()) {
			alert('답글 내용을 입력해 주세요.');
			return;
		}

		fetch(`/front/comment/saveReply.json`, {
			method: 'POST',
			headers: { 
				'Content-Type': 'application/json; charset=UTF-8' 
			},
			body: JSON.stringify({ 
				seq_bbs: seq_bbs,
				seq_comment_parent: seq_comment_parent, 
				//seq_mbr: seq_mbr,
				content: content, 
				depth: depth 
			})
		})
		.then(response => {
			if (!response.ok) throw new Error('오류 발생');
			return response.json();
		})
		.then(data => {
			if (data.error) {
				alert(data.error);
			} else {
				alert('답글이 등록되었습니다.');
				location.reload();// 등록 후 페이지 새로고침
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('답글 등록 중 오류가 발생했습니다.');
		});
	}

// 답글 폼 보여주기
function showReplyForm(seq_comment) {
		document.getElementById(`replyForm_${seq_comment}`).style.display = 'block';
	}

// 댓글 삭제
function deleteComment(seq_comment) {
	//const seq_mbr = sessionStorage.getItem('SEQ_MBR');
	//alert("삭제할 때 회원 일련번호: " + seq_mbr);

	// 삭제 확인 메시지
	if (!confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
		return; 
	}

	fetch(`/front/comment/delete.json`, {
		method: 'POST',
		headers: { 'Content-Type': 'application/json; charset=UTF-8' 
		},
		body: JSON.stringify({ seq_comment: seq_comment})
	})
	.then(response => {
		if (!response.ok) {
			throw new Error('오류 발생');
		}
		return response.json();
	})
	.then(data => {
		if (data.error) {
			alert(data.error); // 서버에서 에러 메시지가 있는 경우 표시
		} else {
			alert('댓글이 삭제되었습니다.'); // 성공 메시지
		location.reload(); // 삭제 후 페이지 새로고침
		}
	})
	.catch((error) => {
		console.error('Error:', error); // 오류 메시지 출력
		alert('댓글 삭제 중 오류가 발생했습니다.'); // 사용자에게 오류 알림
	});
}


// 댓글 수정
function editComment(seq_comment) {
	const seq_mbr = sessionStorage.getItem('SEQ_MBR');
	//alert("수정할 때 회원 일련번호: " + seq_mbr);
	const content = document.getElementById(`editCommentContent_${seq_comment}`).value; // 수정할 댓글 내용 입력

	// 댓글 내용 검증
	if (!content.trim()) {
		alert('수정할 댓글 내용을 입력해 주세요.');
		return; 
	}

	fetch(`/front/comment/edit.json`, {
		method: 'POST',
		headers: { 
			'Content-Type': 'application/json; charset=UTF-8' 
		},
		body: JSON.stringify({ seq_comment: seq_comment, seq_mbr: seq_mbr, content: content 
		})
	})
	.then(response => {
		if (!response.ok) {
			throw new Error('오류 발생');
		}
		return response.json();
	})
	.then(data => {
		if (data.error) {
			alert(data.error); // 서버에서 에러 메시지가 있는 경우 표시
		} else {
			alert('댓글이 수정되었습니다'); // 성공 메시지
			location.reload(); // 수정 후 페이지 새로고침
		}
	})
	.catch((error) => {
		console.error('Error:', error); // 오류 메시지 출력
		alert('댓글 수정 중 오류가 발생했습니다.', error); // 사용자에게 오류 알림
	});
}
//댓글 수정 폼 보여주기
function showEditForm(seq_comment) {
	const editArea = document.getElementById(`commentEditArea_${seq_comment}`);
	const commentContent = document.getElementById(`commentContent_${seq_comment}`).innerText;

	// 수정할 댓글 내용을 수정 폼에 채우기
	document.getElementById(`editCommentContent_${seq_comment}`).value = commentContent;

	// 수정 영역을 보이게 하고, 댓글 내용 숨김
	editArea.style.display = 'block';
}

/*방식변경
	// 수정 버튼 클릭 시 호출되는 함수 (loadComments 함수 밖에서 정의)
	function editComment(seq_comment, isReply = false) {
		// isReply가 true이면 대댓글의 요소 ID를, false이면 일반 댓글의 요소 ID를 설정
		const commentContentId = isReply ? `replyContent_${seq_comment}` : `commentContent_${seq_comment}`;
		const editTextAreaId = isReply ? `editReply_${seq_comment}` : `editComment_${seq_comment}`;
		// 해당하는 댓글 또는 대댓글의 텍스트 영역과 textarea 요소를 가져옴
		const commentContent = document.getElementById(commentContentId);
		const editTextArea = document.getElementById(editTextAreaId);

		if (commentContent && editTextArea) {
			commentContent.style.display = 'none';
			editTextArea.style.display = 'block';
		} else {
			console.error(`요소를 찾을 수 없습니다: ${commentContentId} 또는 ${editTextAreaId}`);
		}
	}
	
//댓글관련 기능(조회,수정,삭제,답글) 영역을 지정해서 비동기로 지정된 데이터가 업데이트 될때마다 데이터를 덮어쓰는 function
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
					
					// 버튼 영역 생성
					const actionContainer = document.createElement('div');
					actionContainer.classList.add('comment-actions');
					actionContainer.style.textAlign = 'left';
					actionContainer.style.backgroundColor = '#f9f9f9';
					actionContainer.style.padding = '10px';
					
					console.log("버튼 영역 추가 전: ", commentElement);
					
					// 수정 버튼 생성
					const editButton = document.createElement('button');
					editButton.textContent = '수정';
					editButton.type = 'button';
					editButton.onclick = function() {
						showEditForm(comment.seq_comment); // 수정 함수 호출
					};
					actionContainer.appendChild(editButton);

					// 삭제 버튼 생성
					const deleteButton = document.createElement('button');
					deleteButton.textContent = '삭제';
					deleteButton.type = 'button';
					deleteButton.onclick = function() {
						deleteComment(comment.seq_comment); // 삭제 함수 호출
					};
					actionContainer.appendChild(deleteButton);

					// 답글 버튼 생성
					const replyButton = document.createElement('button');
					replyButton.textContent = '답글';
					replyButton.type = 'button';
					replyButton.onclick = function() {
						showReplyForm(comment.seq_comment); // 답글 함수 호출
					};
					actionContainer.appendChild(replyButton);

					// 버튼 영역을 댓글 요소에 추가
					commentElement.appendChild(actionContainer);

					// 댓글 요소를 목록에 추가
					commentListContainer.appendChild(commentElement);
				});
			} else {
				// 댓글이 없는 경우 처리 (선택 사항)
				const noCommentElement = document.createElement('p');
				noCommentElement.textContent = '댓글이 없습니다.';
				commentListContainer.appendChild(noCommentElement);
			}
		})
		.catch((error) => {
			console.error('Error:', error); // 오류 메시지 출력
		});
	}
}
*/
	// 댓글 등록
		function addComment(seq_bbs) {
			const seq_mbr = sessionStorage.getItem('SEQ_MBR');
			const nickname = sessionStorage.getItem('NICKNAME');// 세션에서 닉네임 가져오기
			const dt_reg = sessionStorage.getItem('DT_REG');
			const content = document.getElementById('commentContent').value; 
			//console.log("닉네임:", sessionStorage.getItem('NICKNAME'));
			//alert("게시글번호 가져옴?=" + seq_bbs);
			//alert("댓글내용 가져옴?=" + content);
			
			fetch('/front/comment/add.json', {
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
// 좋아요 이미지 클릭 시 이모지 변경
function toggleLike(seq_bbs) {
	const likeElement = document.getElementById('likeElement'); // 이모지를 표시할 요소
	const seq_mbr = sessionStorage.getItem('SEQ_MBR');
	const cd_bbs_type = document.getElementById("cd_bbs_type").value;

	fetch('/front/community/board/like.json', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({ seq_bbs: seq_bbs, seq_mbr: seq_mbr, cd_bbs_type: cd_bbs_type })
	})
	.then(response => response.json())
	.then(data => {
		// 이모지 상태 토글
		if (likeElement.innerText === '🤍') {
			likeElement.innerText = '❤️'; // 좋아요 추가
		} else {
			likeElement.innerText = '🤍'; // 좋아요 취소
		}

		// 좋아요 수 업데이트
		LikeCount.innerText = `${data.like_count}개`;
	})
	.catch((error) => {
		console.error('Error:', error);
	});
}
	//좋아요 카운트
	function LikeCount(seq_bbs) {
		fetch('/front/community/board/like_count.json', {
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
		//목록 가기
		function goList(value) {
			location.href = "/front/community/board/list.web?cd_bbs_type=7";
		}