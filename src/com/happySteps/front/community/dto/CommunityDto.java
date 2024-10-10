package com.happySteps.front.community.dto;

public class CommunityDto {
	
	private int rnum			= 0;	// 글 순번
	private int seq_bbs			= 0;	// 글 일련번호
	private int seq_bbs_parent	= 0;	// 글 상위 일련번호
	private int seq_reply		= 0;	// 답변 일련번호
	private int cd_bbs_type		= 0;	// 게시판 종류: 공지사항(1),FAQ(2),문의(3),입양(4),커뮤니티(전체글)(5)인기글(6),자유게시판(7),Q&A(8),입양후기(9),정보글(11),기타(12)
	private String title		= "";	// 제목
	private int cd_ctg			= 0;	// 카테고리 코드:가입 및 탈퇴(1),입양(2),구매(3),결제(4),배송(5),환불(6),커뮤니티(8),기타(9)
	private int cd_ctg_pet		= 0;	// 카테고리 코드:강아지(1),고양이(2),햄스터(3),파충류(4),기타(5)
	private String ctg_nm		= "";	// 카테고리 명칭
	private String content		= "";	// 내용
	private String flg_delete	= "";	// 삭제 여부
	private String flg_top		= "";	// 최상위 여부
	private String flg_reply	= "";	// 답변 여부
	private int readed			= 0;	// 조회수
	private String file_save	= "";	// 저장 파일명
	private String file_orig	= "";	// 원본 파일명
	private String extension	= "";	// 원본 파일명 확장자
	private String dt_reg		= "";	// 등록 일시
	private int register		= 0;	// 등록자
	private String dt_upt		= "";	// 수정 일시
	private int updater			= 0;	// 수정자
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSeq_bbs() {
		return seq_bbs;
	}
	public void setSeq_bbs(int seq_bbs) {
		this.seq_bbs = seq_bbs;
	}
	public int getSeq_bbs_parent() {
		return seq_bbs_parent;
	}
	public void setSeq_bbs_parent(int seq_bbs_parent) {
		this.seq_bbs_parent = seq_bbs_parent;
	}
	public int getSeq_reply() {
		return seq_reply;
	}
	public void setSeq_reply(int seq_reply) {
		this.seq_reply = seq_reply;
	}
	public int getCd_bbs_type() {
		return cd_bbs_type;
	}
	public void setCd_bbs_type(int cd_bbs_type) {
		this.cd_bbs_type = cd_bbs_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCd_ctg() {
		return cd_ctg;
	}
	public void setCd_ctg(int cd_ctg) {
		this.cd_ctg = cd_ctg;
	}
	public int getCd_ctg_pet() {
		return cd_ctg_pet;
	}
	public void setCd_ctg_pet(int cd_ctg_pet) {
		this.cd_ctg_pet = cd_ctg_pet;
	}
	public String getCtg_nm() {
		return ctg_nm;
	}
	public void setCtg_nm(String ctg_nm) {
		this.ctg_nm = ctg_nm;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getFlg_top() {
		return flg_top;
	}
	public void setFlg_top(String flg_top) {
		this.flg_top = flg_top;
	}
	public String getFlg_reply() {
		return flg_reply;
	}
	public void setFlg_reply(String flg_reply) {
		this.flg_reply = flg_reply;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public String getFile_save() {
		return file_save;
	}
	public void setFile_save(String file_save) {
		this.file_save = file_save;
	}
	public String getFile_orig() {
		return file_orig;
	}
	public void setFile_orig(String file_orig) {
		this.file_orig = file_orig;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}
	
	
}
