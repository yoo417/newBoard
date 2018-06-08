package com.spring.web.domain;

import org.springframework.stereotype.Component;

@Component
public class BoardVo {
	
	int bno;
	String title;
	String userId;
	String content;
	String rgsde;
		
	
	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRgsde() {
		return rgsde;
	}


	public void setRgsde(String rgsde) {
		this.rgsde = rgsde;
	}


	@Override
	public String toString() {
	    return "BoardVO [bno=" + bno + ", title=" + title +  ", userId=" + userId+ ", content=" + content  + "]";
	}
	
	
}
