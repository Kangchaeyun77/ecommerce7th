/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happysteps.com에 있으며,
 * happysteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happysteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happysteps.com All Rights Reserved.
 *
 *
 * Program		: com.happysteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: MemberWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240620143410][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.front.member.controller;

import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.front.common.Common;
import com.happySteps.front.member.dto.MemberDto;
import com.happySteps.front.member.service.MemberSrvc;
import com.happySteps.util.security.HSwithSHA;
import com.happySteps.util.security.SKwithAES;
/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-06-20
 * <p>DESCRIPTION: 회원 컨트롤러</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.member.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	/*
	 * @Autowired private MessageSourceAccessor dynamicProperties;
	 * 
	 * @Inject private EmailCmpn emailCmpn;
	 */
	
	@Inject
	private MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 비밀번호 찾기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findPasswdForm.web")
	public ModelAndView findPasswdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdForm()] " + e.getMessage(), e);
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
	 * @since 2024-08-02
	 * <p>DESCRIPTION: 아이디 찾기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findIdProc.web", method = RequestMethod.POST)
	public ModelAndView findIdProc(HttpServletRequest request, HttpServletResponse response,
	                                 MemberDto memberDto) {

	    ModelAndView mav = new ModelAndView("redirect:/error.web");

	    try {
	        // HttpSession session = request.getSession();

	        // 아이디 찾기 폼에서 입력한 사용자의 이름과 이메일을 가져옴
	        String findNm		= request.getParameter("findNm");
	        String findEmail	= request.getParameter("findEmail");

	        // session.setAttribute("findNm", findNm);
	        // session.setAttribute("findEmail", findEmail);
	        
	        //memberDto.setMbr_nm(findNm);
	        //memberDto.setEmail(findEmail);
	        
	        logger.debug("인풋이름=" + findNm);
	        logger.debug("인풋이메일=" + findEmail);
	        /*
	        if (findNm != null && findEmail != null) { // AND 연산으로 수정
	            logger.debug("설정된 memberDto 이메일(findEmail): " + memberDto.getEmail());
	            logger.debug("설정된 memberDto 이름(findNm): " + memberDto.getMbr_nm());
	        }
	        */
	        // DB값을 불러오기
	        String staticKey = staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
	        SKwithAES aes = new SKwithAES(staticKey);
	        
	        // 브라우저에서 입력한 값들을 암호화함
	        memberDto.setMbr_nm(aes.encode(findNm));
	        memberDto.setEmail(aes.encode(findEmail));

	        MemberDto _memberDto = memberSrvc.findId(memberDto);
	        
	     // 암호화된 이름과 이메일 비교
	        if (_memberDto != null) {
	            
	            logger.debug("복호화된 ID: " + aes.decode(_memberDto.getId()));

	            // 브라우저에 ID 출력
	            // request.setAttribute("foundId", aes.decode(memberDto.getId()));
	            
	            mav.addObject("foundId", aes.decode(_memberDto.getId()));
	            mav.setViewName("front/member/findIdForm"); // ID를 보여줄 JSP 페이지로 리디렉션
	            
	        }
	        else {
	            logger.debug("이름 또는 이메일이 일치하지 않습니다.");
	            mav.setViewName("front/member/termAgreeForm");
	        }
	        
	        
	    } 
	    catch (Exception e) {
	        logger.error("[" + this.getClass().getName() + ".findIdProc()] " + e.getMessage(), e);
	    } 
	    return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 아이디 찾기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findIdForm.web")
	public ModelAndView findIdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findIdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findIdForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	// 약관페이지
	@RequestMapping(value = "/front/member/termAgreeForm.web")
	public ModelAndView termAgreeForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/termAgreeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".termAgreeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	//인증 이메일 발송
	/*
	 * @RequestMapping(value = "/front/member/emailConfirm.web", method =
	 * RequestMethod.POST) public ModelAndView emailConfirm(HttpServletRequest
	 * request, HttpServletResponse response, MemberDto memberDto) {
	 * 
	 * ModelAndView mav = new ModelAndView("redirect:/error.web");
	 * 
	 * try {
	 * 
	 * EmailDto emailDto = new EmailDto();
	 * 
	 * emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
	 * emailDto.setTo(new String[] {memberDto.getEmail()});
	 * emailDto.setSubject("인증 메일"); emailDto.setMessage("인증 번호" + "???");
	 * 
	 * emailCmpn.send(emailDto);
	 * 
	 * mav.setViewName("forward:/servlet/result.web"); } catch (Exception e) {
	 * logger.error("[" + this.getClass().getName() + ".emailConfirm()] " +
	 * e.getMessage(), e); } finally {}
	 * 
	 * return mav;
	 * 
	 * }
	 */
			
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/modifyProc.web")
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, String _Pets, String _flg_sms, String _flg_email) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			int seq_mbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			memberDto.setSeq_mbr(seq_mbr);
			memberDto.setUpdater(seq_mbr);
			
			// SMS 또는 Email 수신 동의 정보가 없을 경우 기본값(N)로 설정
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			// 입력한 정보와 기존 정보가 같으면 업데이트를 안 하고 다르면 입력한 정보로 업데이트(시간 포함)
			if (memberDto.getFlg_email().equals(_flg_email)) memberDto.setFlg_email("");
			if (memberDto.getFlg_sms().equals(_flg_sms)) memberDto.setFlg_sms("");
			
			if(memberDto.getPets().equals(_Pets)) memberDto.setPets("");
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			if (memberSrvc.update(memberDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/myPage/");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyProc()] " + e.getMessage(), e);
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
	 * <p>DESCRIPTION: 마이페이지 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/modifyForm.web")
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			MemberDto _memberDto = memberSrvc.select(memberDto);
			
			_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			
			mav.addObject("memberDto", _memberDto);
			
			mav.setViewName("front/member/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/checkIdDuplicate.json", method = RequestMethod.POST, 
					headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, 
					consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkIdDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean idDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setId(aes.encode(memberDto.getId()));
			
			int count = memberSrvc.selectIdDuplicate(memberDto);
			
			if (count == 0) idDuplicate = false;
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkIdDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return idDuplicate;
	}
	@RequestMapping(value = "/front/member/checkNickDuplicate.json", method = RequestMethod.POST, 
					headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, 
					consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
		public @ResponseBody boolean checkNickDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean nickDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setNickname(aes.encode(memberDto.getNickname()));
			
			int count = memberSrvc.selectNickDuplicate(memberDto);
			
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
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 회원 가입 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response, String term1 ,String
			  term2 , String term3 ) {
		
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.addObject("term1", term1);
			mav.addObject("term2", term2);
			mav.addObject("term3", term3);
			mav.setViewName("front/member/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
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
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 회원 가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/registerProc.web", method = RequestMethod.POST)

	public ModelAndView registerProc(HttpServletRequest request,
	HttpServletResponse response , MemberDto memberDto , String term1 , String
	term2 , String term3) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if (term1 == null || term1.equals("")) term1 = "N";
			if (term2 == null || term2.equals("")) term2 = "N";
			if (term3 == null || term3.equals("")) term3 = "N";
			
			logger.debug("term1="+term1);
			logger.debug("term2="+term2);
			logger.debug("term3="+term3);
			
			// [2024-10-04][kbs@happySteps.com]
			String[] arrTermAgreement = {term1, term2, term3};
			
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			if (memberDto.getFlg_pets() == null || memberDto.getFlg_pets().equals("")) memberDto.setFlg_pets("N");
			
			if (memberDto.getPets() == null || memberDto.getPets().equals("")) memberDto.setPets("N");
			logger.debug("pets=" + memberDto.getPets());
			
			// 해쉬 암호화(SHA-256)
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setNickname(memberDto.getNickname());
			
			memberDto.setId(aes.encode(memberDto.getId()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			boolean insert = memberSrvc.insert(memberDto, arrTermAgreement, aes.decode(memberDto.getPost()));
			if (insert) {
				logger.debug("가입 성공");
				
				/*
				 * // 가입 축하 이메일 발송 EmailDto emailDto = new EmailDto();
				 * 
				 * emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				 * emailDto.setTo(new String[] {memberDto.getEmail()});
				 * emailDto.setSubject("가입 축하 메일"); emailDto.setMessage("<b>가입</b>을 축하합니다.");
				 * 
				 * emailCmpn.send(emailDto);
				 */
				
			}
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
}