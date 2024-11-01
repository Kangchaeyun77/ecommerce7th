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

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.happySteps.front.common.Common;
import com.happySteps.util.net.HttpJson;

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
	@RequestMapping(value = "/front/adap/list.web", method = RequestMethod.POST) // POST 요청 처리
	public ResponseEntity<String> callExternalApi(@RequestBody String requestJson) {
		String apiUrl = "https://openapi.gg.go.kr/AbdmAnimalProtect?KEY=e705ae67f910466d9eef16b2618fa1c2&Type=json&pIndex=1&Size=100"; // 외부 API URL
		String responseJson;

		try {
			HttpJson httpJson = new HttpJson(apiUrl);
			responseJson = httpJson.connectPost(requestJson, 3000); // 타임아웃3초
			return ResponseEntity.ok(responseJson); // 응답을 반환
		} catch (Exception e) {
			logger.error("Error calling external API", e);
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		}
	}
}
