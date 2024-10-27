package com.happySteps.front.comment.dto;

public class CommentDto {
	private int seq_comment			= 0; // 댓글 일련번호
	private int seq_comment_parent		= 0; // 상위댓글 일련번호
	private String content				= ""; // 내용
	private String flg_reply			= ""; // 답변여부
	private String flg_delete			= ""; // 삭제여부
	private String dt_reg				= ""; // 등록일시
	private int seq_bbs				= 0; // 게시판일련번호
	private int seq_mbr				= 0; // 댓글을 작성한 회원 일련번호
	private String dt_upt				= ""; // 수정일시
	private String nickname				= ""; // 닉네임

	private int depth = 0; // 댓글의 깊이
	
	@Override
	public String toString() {
		return "CommentDto [nickname=" + nickname + ", content=" + content + "dt_reg=" + dt_reg +", seq_comment=" + seq_comment + "]";
	}
	
	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSeq_comment() {
		return seq_comment;
	}
	public void setSeq_comment(int seq_comment) {
		this.seq_comment = seq_comment;
	}
	public int getSeq_comment_parent() {
		return seq_comment_parent;
	}
	public void setSeq_comment_parent(int seq_comment_parent) {
		this.seq_comment_parent = seq_comment_parent;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlg_reply() {
		return flg_reply;
	}
	public void setFlg_reply(String flg_reply) {
		this.flg_reply = flg_reply;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public int getSeq_bbs() {
		return seq_bbs;
	}
	public void setSeq_bbs(int seq_bbs) {
		this.seq_bbs = seq_bbs;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	} 
}