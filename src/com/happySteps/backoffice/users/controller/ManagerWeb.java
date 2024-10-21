/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF happySteps.com.
 * happySteps.com OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 happySteps.com ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: ManagerWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240726154947][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.users.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.users.dto.ManagerDto;
import com.happySteps.backoffice.users.service.ManagerSrvc;
/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-07-26
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.users.controller.ManagerWeb")
public class ManagerWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ManagerWeb.class);
	
	@Inject
	private ManagerSrvc managerSrvc;
	
	@RequestMapping(value = "/console/users/manager/checkIdDuplicate.json", method = RequestMethod.POST, 
				headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, 
				consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkIdDuplicate(@RequestBody ManagerDto managerDto) {
	
	boolean idDuplicate = true;
	
	try {
		managerDto.setId(managerDto.getId());
		
		int count = managerSrvc.selectIdDuplicate(managerDto);
		
		if (count == 0) idDuplicate = false;
		
	}
	catch (Exception e) {
		logger.error("[" + this.getClass().getName() + ".checkIdDuplicate()] " + e.getMessage(), e);
	}
	finally {}
	
	return idDuplicate;
	}
	@RequestMapping(value = "/console/users/manager/checkNickDuplicate.json", method = RequestMethod.POST, 
				headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, 
				consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkNickDuplicate(@RequestBody ManagerDto managerDto) {
	
	boolean nickDuplicate = true;
	
	try {
		
		managerDto.setNickname(managerDto.getNickname());
		
		int count = managerSrvc.selectNickDuplicate(managerDto);
		
		if (count == 0) nickDuplicate = false;
		
	}
	catch (Exception e) {
		logger.error("[" + this.getClass().getName() + ".checkNickDuplicate()] " + e.getMessage(), e);
	}
	finally {}
	
	return nickDuplicate;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param managerDto [관리자 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-26
	 * <p>DESCRIPTION: 가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/users/manager/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			String searchWord = pagingDto.getSearchWord();
			pagingDto.setSearchWord(searchWord);
			
			PagingListDto pagingListDto = managerSrvc.list(pagingDto);
			
			@SuppressWarnings("unchecked")
			List<ManagerDto> list = (List<ManagerDto>) pagingListDto.getList();
			
			for (int loop = 0; loop < list.size(); loop++) {
				list.get(loop).setId(list.get(loop).getId());
				list.get(loop).setMng_nm(list.get(loop).getMng_nm());
			}
			
			pagingDto.setSearchWord(searchWord);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("backoffice/users/manager/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param mebmerDto [회원 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-26
	 * <p>DESCRIPTION: 가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/manager/registerProc.web", method = RequestMethod.POST)
	public ModelAndView registerProc(HttpServletRequest request, HttpServletResponse response, ManagerDto managetDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			boolean result = managerSrvc.insert(managetDto);
			
			if (result) logger.debug("가입 성공");
			else logger.debug("가입 실패");
			
			request.setAttribute("redirect"	, "/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-26
	 * <p>DESCRIPTION: 가입 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/manager/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.setViewName("backoffice/manager/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}

}