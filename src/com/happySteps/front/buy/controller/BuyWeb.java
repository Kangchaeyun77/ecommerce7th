/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: history.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004115246][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.buy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.front.common.Common;
import com.happySteps.front.sale.dto.SaleDto;
import com.happySteps.front.sale.service.SaleSrvc;
import com.happySteps.front.buy.controller.BuyWeb;
import com.happySteps.front.buy.dto.BuyDto;
import com.happySteps.front.buy.service.BuySrvc;

//import com.happySteps.front.buy.dto.BuyDto;
//import com.happySteps.front.buy.service.BuySrvc;


/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.buy.controller.BuyWeb")
public class BuyWeb extends Common{

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BuyWeb.class);
	
	@Inject
	BuySrvc buySrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
	@RequestMapping(value = "/front/buy/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		//logger.debug("내가 확인");
		
		try {
			
			SaleDto _saleDto	= saleSrvc.select(saleDto);
			
			mav.addObject("saleDto"		, _saleDto);
			
			mav.setViewName("/front/buy/writeForm");
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 구매이력</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/history.web")
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			buyDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			// 구매 목록
			List<BuyDto> list = buySrvc.list(buyDto);
			
			// 총 구매금액
			String total_price = buySrvc.selectTotal(buyDto);
			
			mav.addObject("list", list);
			mav.addObject("total_price", total_price);
			
			mav.setViewName("front/buy/history");
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".history()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
