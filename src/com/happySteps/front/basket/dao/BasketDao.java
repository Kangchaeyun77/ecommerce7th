/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BasketDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240827165109][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package com.happySteps.front.basket.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.happySteps.front.basket.dto.BasketDto;
import com.happySteps.front.common.dao.BaseDao;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2024-08-27
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.front.basket.dao.BasketDao")
public class BasketDao extends BaseDao {
	
	public List<BasketDto> listing(int seq_mbr) {
		return sqlSessionFront.selectList("kr.co.himedia.ecommerce.front.mybatis.basket.Basket.listing", seq_mbr);
	}
	
	public int insert(BasketDto basketDto) {
		return sqlSessionFront.insert("kr.co.himedia.ecommerce.front.mybatis.basket.Basket.insert", basketDto);
	}
}
