package org.union.domain;

import java.util.Date;

public class FindVO {
	
	private Integer find_idx;
	private String find_ip;
	private Date createDate;
	
	public Integer getFind_idx() {
		return find_idx;
	}
	public void setFind_idx(Integer find_idx) {
		this.find_idx = find_idx;
	}
	public String getFind_ip() {
		return find_ip;
	}
	public void setFind_ip(String find_ip) {
		this.find_ip = find_ip;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "FindVO [find_idx=" + find_idx + ", find_ip=" + find_ip + ", createDate=" + createDate + "]";
	}
}
