package com.happySteps.front.community.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.happySteps.front.common.dao.BaseDao;

import com.happySteps.front.community.dto.CommunityDto;

import com.happySteps.front.common.dto.PagingDto;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-09
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.front.community.dao.Communitydao")
public class Communitydao extends BaseDao {
	/**
	 * @param communityDto [게시판 빈]
	 * @return CommunityDto
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 보기(답변)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public CommunityDto selectReply(CommunityDto communityDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.selectReply", communityDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.count", pagingDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 글 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int delete(CommunityDto communityDto) {
		return sqlSessionFront.delete("com.happySteps.front.mybatis.community.Community.delete", communityDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int insert(CommunityDto communityDto) {
		return sqlSessionFront.insert("com.happySteps.front.mybatis.community.Community.insert", communityDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return CommunityDto
	 * 
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 삭제(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int deleteFlag(CommunityDto communityDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.community.Community.deleteFlag", communityDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return int
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int update(CommunityDto communityDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.community.Community.update", communityDto);
	}
	/**
	 * @param communityDto [게시판 빈]
	 * @return CommunityDto
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public CommunityDto select(CommunityDto communityDto) {
		
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.select", communityDto);
	}
	/**
	 * @param pagingDto [페이징 빈]
	 * @return List<CommunityDto>
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<CommunityDto> list(PagingDto pagingDto) {
		
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.list", pagingDto);
		
	}
	public int sequence() {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.sequence");
	}
	/**
	 * @param pagingDto [페이징 빈]
	 * @return List<CommunityDto>
	 * 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<CommunityDto> writeForm(PagingDto pagingDto) {
		
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.writeForm", pagingDto);
		
	}
}
