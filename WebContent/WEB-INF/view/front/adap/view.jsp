<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/adap/view.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<title>동물 입양공고 상세조회</title>
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<style>
		table {
			width: 100%;
			border-collapse: collapse;
		}
		th, td {
			border: 1px solid #ddd;
			padding: 8px;
		}
		th {
			background-color: #f2f2f2;
			text-align: left;
			width: 20%;
		}
	</style>
	<script>
		// API 호출 함수
		async function viewAnimalDetail(animalId) {
			alert("12345");
			console.log("12345678");
			try {
				// POST 요청을 위한 API 엔드포인트
				const response = await fetch('/front/adap/view.web', {
					method: 'POST', // POST 요청
					headers: {
						'Content-Type': 'application/json' // 요청의 Content-Type
					},
					body: JSON.stringify({ pblancId: animalId }) // 요청 본문에 동물 ID 포함
				});

				// 응답 처리
				if (!response.ok) {
					throw new Error('Network response was not ok');
				}

				const data = await response.json();

				// API 데이터가 있는지 확인 후, 각 요소에 매핑
				if (data) {
					const animal = data.AnimalProtect[0]; // API의 구조에 따라 적절히 수정 필요

					document.getElementById('species_nm').textContent = animal.species_nm || "정보 없음"; // 종류
					document.getElementById('color_nm').textContent = animal.color_nm || "정보 없음"; // 색상
					document.getElementById('sex_nm').textContent = animal.sex_nm || "정보 없음"; // 성별
					document.getElementById('neut_yn').textContent = animal.neut_yn ? "예" : "아니오"; // 중성화 여부
					
					// 나이와 체중을 '/'로 구분하여 표시
					document.getElementById('ageWeight').textContent = `${animal.age_info || "나이 정보 없음"} / ${animal.bdwgh_info || "체중 정보 없음"}`;
					
					// 특징
					document.getElementById('sfetr_info').textContent = animal.sfetr_info || "정보 없음";

					// 사회성 특징, 건강 특징, 기타 항목들
					document.getElementById('partclr_matr').textContent = animal.partclr_matr || "정보 없음";

					// 발견 장소와 접수 일시
					document.getElementById('discvry_plc_info').textContent = animal.discvry_plc_info || "정보 없음";
					document.getElementById('recept_de').textContent = animal.recept_de || "정보 없음";

					// 기타 사항, 관할 기관, 상태, 보호 센터 정보
					document.getElementById('shter_nm').textContent = animal.shter_nm || "정보 없음";
					document.getElementById('shter_telno').textContent = animal.shter_telno || "정보 없음";
					document.getElementById('protect_plc').textContent = animal.protect_plc || "정보 없음";
					document.getElementById('jurisd_inst_nm').textContent = animal.jurisd_inst_nm || "정보 없음";
					document.getElementById('chrgpsn_nm').textContent = animal.chrgpsn_nm || "정보 없음";
					document.getElementById('chrgpsn_contct_no').textContent = animal.chrgpsn_contct_no || "정보 없음";
				}
			} catch (error) {
				console.error('Error fetching animal details:', error);
			}
		}

		// 페이지 로드 시 데이터 가져오기
		window.onload = function() {
			// POST로 animalId 가져오기
			console.log("11111")
			const animalId = document.getElementById('animalId').value; // 숨겨진 입력 필드에서 ID 가져오기
			viewAnimalDetail(animalId); 
		};
	</script>
</head>
<body>
	<form id="frmMain" method="POST">
		<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" value="<%= request.getParameter("pblancId") %>" /> <!-- POST 방식으로 값 설정 -->
		<div class="container">
			<section class="content">
				<nav>
					<%@ include file="/include/front/gnbAdap.jsp" %>
				</nav>
				<h1>상세 정보</h1>
				<table>
					<tbody>
					<tr>
						<th>공고번호</th>
							<td id="pblanc_idntfy_no"></td>
						</tr>
						<tr>
							<th>품종</th>
							<td id="species_nm"></td>
						</tr>
						<tr>
							<th>색상</th>
							<td id="color_nm"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td id="sex_nm"></td>
							<th>중성화</th>
							<td id="neut_yn"></td>
						</tr>
						<tr>
							<th>나이</th>
							<td id="age_info"></td>
							<th>체중</th>
							<td id="bdwgh_info"></td>
							<th>동물의 특이사항</th>
							<td id="sfetr_info"></td>
						</tr>
						<tr>
							<th>특징</th>
							<td id="partclr_matr" colspan="3"></td>
						</tr>
						<tr>
							<th>발견장소</th>
							<td id="discvry_plc_info"></td>
							<th>접수일시</th>
							<td id="recept_de"></td>
						</tr>
						<tr>
							<th>관할기관 이름</th>
							<td id="shter_nm"></td>
							<th>관할기관 연락처</th>
							<td id="shter_telno"></td>
							<th>동물이 보호되는 장소</th>
							<td id="protect_plc"></td>
							<th>관할 기관 이름</th>
							<td id="jurisd_inst_nm"></td>
							<th>담당자 이름</th>
							<td id="chrgpsn_nm"></td>
							<th>담당자 연락처</th>
							<td id="chrgpsn_contct_no"></td>
						</tr>
					</tbody>
				</table>
			</section>
			<footer>
				<%@ include file="/include/front/footer.jsp" %>
			</footer>
		</div>
	</form>
</body>
</html>