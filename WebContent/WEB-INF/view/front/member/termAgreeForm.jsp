<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/termAgreeForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>약관 페이지</title>
		<style>
			.accordion {
				background-color: #eee;
				color: #444;
				cursor: pointer;
				padding: 5px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 15px;
				transition: 0.4s;
			}
			.accordion2 {
				background-color: #eee;
				color: #666;
				cursor: pointer;
				padding: 5px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 15px;
				transition: 0.4s;
				resize: none;
				overflow: auto; /* 스크롤바를 활성화합니다 */
			}

			/* 스크롤바 스타일링 */
			.accordion2::-webkit-scrollbar {
				width: 8px; /* 스크롤바의 너비 */
			}

			.accordion2::-webkit-scrollbar-thumb {
				background-color: #888; /* 스크롤바의 색상 */
				border-radius: 10px; /* 스크롤바의 둥근 모서리 */
			}

			.accordion2::-webkit-scrollbar-thumb:hover {
				background-color: #555; /* 스크롤바의 색상이 마우스를 올렸을 때 변경 */
			}

			.accordion2::-webkit-scrollbar-track {
				background: #f1f1f1; /* 스크롤바의 트랙 색상 */
			}
			
			/* 아코디언 액션 스타일링 */
			.accordion.active, .accordion:hover {
				background-color: #ccc;
			}

			.panel {
				padding: 1px 1px;
				display: none;
				background-color: white;
				overflow: hidden;
			}
		</style>
		
	<script>
		window.onload = function () {
			// alert(getNow());
		}
	</script>
</head>
<body>
	
<form action="registerForm.web" id="frmMain" method="POST">
	<div class="container">
		<section class="content">
			<nav></nav>
			<article class="txtCenter">
				서비스 이용 약관
					<!-- 폼 시작 -->
					<form >
						<!-- 첫 번째 아코디언 -->
						<button class="accordion" type="button">1. 필수 약관 (+)</button>
						<div class="panel">
							<textarea class="accordion2" readonly> 여기에 서비스 이용에 대한 일반 사항을 설명합니다. 여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.여기에 서비스 이용에 대한 일반 사항을 설명합니다.</textarea>
							<label for="agree">약관에 동의합니다</label>
							<input type="checkbox" id="term_1" name="term_1" value="Y" required></button><br>
						</div>

						<!-- 두 번째 아코디언 -->
						<button class="accordion" type="button">2. 마켓팅 수신 동의</button>
						<div class="panel">
							<textarea class="accordion2" readonly> 개인정보의 수집, 사용, 저장에 대한 정책을 여기에 설명합니다.</textarea>
							약관에 동의합니다
							<input type="checkbox" id="term_2" name="term_2" value="Y"></button><br>
						</div>

						<!-- 세 번째 아코디언 -->
						<button class="accordion" type="button">3. 후원 동의 </button>
						<div class="panel">
							<textarea class="accordion2" readonly> 결제 및 환불 절차에 대해 여기에 설명합니다.</textarea>
							약관에 동의합니다
							<input type="checkbox" id="term_3" name="term_3" value="Y"></button><br>
						</div>
						<br><br>

						<!-- 제출 버튼 -->
						<button type="submit" >체크 항목 동의하고 계속</button>
					</form>
					<!-- 폼 끝 -->

					<script>
						var acc = document.getElementsByClassName("accordion");
						for (var i = 0; i < acc.length; i++) {
							acc[i].addEventListener("click", function() {
								this.classList.toggle("active");
								var panel = this.nextElementSibling;
								if (panel.style.display === "block") {
									panel.style.display = "none";
								} else {
									panel.style.display = "block";
								}
							});
						}
				</script>
			</article>
		</section>
	</div>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>