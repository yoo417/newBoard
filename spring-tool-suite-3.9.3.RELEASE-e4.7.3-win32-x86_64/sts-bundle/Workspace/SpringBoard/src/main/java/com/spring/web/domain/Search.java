package com.spring.web.domain;

import org.springframework.stereotype.Component;

@Component
public class Search {
	
	private String searchCondition;
	private String searchText;
	
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchText=" + searchText + "]";
	}
	

}
