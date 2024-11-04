/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF COM.HAPPYSTEPS.
 * COM.HAPPYSTEPS OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 COM.HAPPYSTEPS ALL RIGHTS RESERVED.
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
 * File			: AdapApi.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241101155854][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.adap.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.happySteps.front.common.Common;


/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-11-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.adap.controller.AdapApi")
public class AdapApi extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(AdapApi.class);

	

	/**
	* 외부 API와 통신하여 JSON 응답을 받는 메서드
	* @param requestJson 요청할 JSON 데이터
	* @return 외부 API의 응답
	*/
	@RequestMapping(value = "/front/adap/list.web", method = RequestMethod.POST)
	public ResponseEntity<String> callExternalApi(@RequestBody String requestJson) {
		String responseJson = null;
		int pageIndex = 1; // 기본 페이지 번호

		// 요청 JSON에서 pageIndex를 추출
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> requestMap = objectMapper.readValue(requestJson, new TypeReference<Map<String, Object>>() {});
			pageIndex = (int) requestMap.getOrDefault("pageIndex", 1); // 기본값 1
		} catch (Exception e) {
			logger.error("요청 본문 파싱 중 오류 발생", e);
		}

		String apiUrl = "https://openapi.gg.go.kr/AbdmAnimalProtect?KEY=e705ae67f910466d9eef16b2618fa1c2&Type=json&pIndex=" + pageIndex + "&pSize=20";

		logger.debug("API 호출 시작: {}", apiUrl);
		try {
			// URL 객체 생성
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// 요청 방식 설정
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			// 요청 바디 전송
			try (OutputStream os = conn.getOutputStream()) {
				byte[] input = requestJson.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			// 응답 읽기
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
				StringBuilder responseBuilder = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					responseBuilder.append(responseLine.trim());
				}
				responseJson = responseBuilder.toString();
			}

			return ResponseEntity.ok(responseJson);
		} catch (RuntimeException e) {
			logger.error("API 호출 중 RuntimeException 발생, 상태 코드: {}, 메시지: {}", e.getMessage());
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		} catch (Exception e) {
			logger.error("API 호출 중 오류 발생", e);
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		}
	}
	/*
	@RequestMapping(value = "/front/adap/list.web", method = RequestMethod.POST)
	public ResponseEntity<String> callExternalApi(@RequestBody String requestJson) {
		String apiUrl = "https://openapi.gg.go.kr/AbdmAnimalProtect?KEY=e705ae67f910466d9eef16b2618fa1c2&Type=json&pIndex=1&Size=100";
		String responseJson = null;

		logger.debug("API 호출 시작: {}", apiUrl);
		try {
			// URL 객체 생성
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// 요청 방식 설정
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			// 요청 바디 전송
			try (OutputStream os = conn.getOutputStream()) {
				byte[] input = requestJson.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			// 응답 읽기
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
				StringBuilder responseBuilder = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					responseBuilder.append(responseLine.trim());
				}
				responseJson = responseBuilder.toString();
			}

			return ResponseEntity.ok(responseJson);
		} catch (RuntimeException e) {
			logger.error("API 호출 중 RuntimeException 발생, 상태 코드: {}, 메시지: {}", e.getMessage());
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		} catch (Exception e) {
			logger.error("API 호출 중 오류 발생", e);
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		}
	}
	*/
}