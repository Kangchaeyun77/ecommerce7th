package com.happySteps.front.community.controller;

import java.io.File;
import java.util.Hashtable;
import java.util.LinkedList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.common.dto.FileDownloadDto;
import com.happySteps.common.dto.FileDto;
import com.happySteps.common.dto.FileUploadDto;
import com.happySteps.common.file.FileUpload;
import com.happySteps.front.community.controller.CommunityWeb;
import com.happySteps.front.community.dto.CommunityDto;
import com.happySteps.front.community.service.CommunitySrvc;

import com.happySteps.front.common.Common;
import com.happySteps.front.common.component.SessionCmpn;
import com.happySteps.front.common.dto.PagingDto;
import com.happySteps.front.common.dto.PagingListDto;

/**
 * @version 1.0.0
 * @author 
 * @param model
 * @return ModelAndView 
 * @since : 2024-10-10
 * <p>DESCRIPTION: 커뮤니티(전체글/인기글/자유게시판/Q&A/입양후기/정보글) 컨트롤러</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.community.controller.community")
public class CommunityWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(CommunityWeb.class);
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	SessionCmpn sessionCmpn;
	
	@Inject
	CommunitySrvc communitySrvc;
	
	/**
	 * @param type
	 * @param sequence
	 * @param model
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 파일 다운로드</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/download.web", method = RequestMethod.POST)
	public ModelAndView download(String type, long sequence, Model model) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			CommunityDto communityDto = new CommunityDto();
			
			FileDownloadDto fileDownloadDto = new FileDownloadDto();
			File file = null;
			
			//[TODO-개선: 타입이 정의되어 있지 않을 경우 처리]
			if (type.equals("BbsNotice")) communityDto.setCd_bbs_type(1);
			else if (type.equals("BbsQuestion")) communityDto.setCd_bbs_type(3);
			
			communityDto.setSeq_bbs((int)sequence);
			
			communityDto	= communitySrvc.select(communityDto);
			communityDto.setFile_orig(communityDto.getFile_orig());
			communityDto.setFile_save(communityDto.getFile_save());
			
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			
			file = new File(pathBase + "" + File.separator + communityDto.getFile_save());
			
			fileDownloadDto.setFile_original(communityDto.getFile_orig());
			fileDownloadDto.setFile_size(file.length());
			
			if (file == null || file.exists() == false ) {
				mav.setViewName("redirect:/error.web?code=404");
				
				return mav;
			}
			else {
				model.addAttribute("file", file);
				model.addAttribute("filename", fileDownloadDto.getFile_original());
				model.addAttribute("filesize", fileDownloadDto.getFile_size());
				
				mav.setViewName("fileDownloadView");
			}
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".download()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/remove.web", method = RequestMethod.POST)
	public ModelAndView remove(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			communityDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (communitySrvc.deleteFlag(communityDto)) {
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/front/center/board/list.web?cd_bbs_type=" + communityDto.getCd_bbs_type());
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".remove()] " + e.getMessage(), e);
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
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/modifyProc.web", method = RequestMethod.POST)
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			communityDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			if (communitySrvc.update(communityDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/community/board/list.web?cd_bbs_type=" + communityDto.getCd_bbs_type());
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
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/modifyForm.web", method = RequestMethod.POST)
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			CommunityDto _communityDto = communitySrvc.select(communityDto);
			
			mav.addObject("boardDto", communityDto);
			
			if (communityDto.getCd_bbs_type() == 3) {
				mav.setViewName("front/community/board/storyboard/modifyForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
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
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/view.web", method = RequestMethod.POST)
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			CommunityDto _communityDto = communitySrvc.select(communityDto);
			
			mav.addObject("communityDto", _communityDto);
			
			if (communityDto.getCd_bbs_type() == 5) {
				mav.setViewName("front/community/board/all/view");
			}
			else if (communityDto.getCd_bbs_type() == 6) {
				mav.setViewName("front/community/board/popular/view");
			}
			else if (communityDto.getCd_bbs_type() == 7) {
				mav.setViewName("front/community/board/storyboard/view");
			}
			else if (communityDto.getCd_bbs_type() == 8) {
				mav.setViewName("front/community/board/qna/view");
			}
			else if (communityDto.getCd_bbs_type() == 9) {
				mav.setViewName("front/community/board/adap/view");
			}
			else if (communityDto.getCd_bbs_type() == 11) {
				mav.setViewName("front/community/board/information/view");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 쓰기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	@RequestMapping(value = "/front/community/board/writeProc.web", method = RequestMethod.POST)
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto, FileUploadDto fileUploadDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			
			communityDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			// **************************
			// For Board File
			// **************************
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]") + "/bbs/";
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max10MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.doc"	, "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			FileDto[] fileDto = new FileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				long totalSize		= 0;
				
				logger.debug("countFile=" + countFile);
				for (int loop = 0; loop < countFile; loop++) {
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileDto[loop] = new FileDto();
					fileDto[loop].setFileNameOriginal(fileNameSrc);
					fileDto[loop].setFileNameSave(fileNameSve);
					fileDto[loop].setFileSize((Long.parseLong(fileSize)));
					logger.debug("fileNameSrc=" + fileNameSrc);
					logger.debug("fileNameSve=" + fileNameSve);
					logger.debug("fileSize=" + fileSize);
					
					totalSize += Long.parseLong(fileSize);
				}
				
				/*
				if (countFile >=2 ) {
					boardSrvc.insert(boardDto, boardFileDto);
				}
				else {
					boardSrvc.insert(boardDto);
				}
				*/
				
				communityDto.setFile_orig(fileNameSrc);
				communityDto.setFile_save("bbs\\" + fileNameSve);
				
				if (communitySrvc.insert(communityDto)) {
					// GET에서 POST로 변경
					String[] arrName = new String[1];
					String[] arrValue = new String[1];
					
					arrName[0] = "cd_bbs_type";
					arrValue[0] = "3";
					
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("post"		, "/front/community/board/list.web");
					request.setAttribute("name"		, arrName);
					request.setAttribute("value"	, arrValue);
					
					// request.setAttribute("script"	, "alert('등록되었습니다.');");
					// request.setAttribute("redirect"	, "/front/center/board/list.web?cd_bbs_type=" + boardDto.getCd_bbs_type());
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 쓰기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/board/writeForm.web", method = RequestMethod.POST)
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response,CommunityDto communityDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			if (communityDto.getCd_bbs_type() == 3) {
				mav.setViewName("front/community/board/storyboard/writeForm");
			}
			else {
				request.setAttribute("redirect"	, "/");
				mav.setViewName("forward:/servlet/result.web");
			}
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
	 * @param communityDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 고객센터 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/community/board/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 고객 문의(3)이면서 세션이 없을 경우는 로그인 페이지로 보냄
			if (pagingDto.getCd_bbs_type() == 5 && !sessionCmpn.isSession(request)) {
				request.setAttribute("redirect"	, "/front/login/loginForm.web?url=/front/community/board/list.web");
				mav.setViewName("forward:/servlet/result.web");
			}
			else {
				
				if (pagingDto.getCd_bbs_type() ==5)
					pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				PagingListDto pagingListDto = communitySrvc.list(pagingDto);
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());
				
				if (pagingDto.getCd_bbs_type() == 5) {
					mav.setViewName("front/community/board/all/list");
				}
				else if (pagingDto.getCd_bbs_type() == 6) {
					mav.setViewName("front/community/board/popular/list");
				}
				else if (pagingDto.getCd_bbs_type() == 7) {
					mav.setViewName("front/community/board/storyboard/list");
				}
				else if (pagingDto.getCd_bbs_type() == 8) {
					mav.setViewName("front/community/board/qna/list");
				}
				else if (pagingDto.getCd_bbs_type() == 9) {
					mav.setViewName("front/community/board/adap/list");
				}
				else if (pagingDto.getCd_bbs_type() == 11) {
					mav.setViewName("front/community/board/information/list");
				}
				else {
					request.setAttribute("redirect"	, "/");
					mav.setViewName("forward:/servlet/result.web");
				}
			}
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
	 * @return ModelAndView
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/community/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/community/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}