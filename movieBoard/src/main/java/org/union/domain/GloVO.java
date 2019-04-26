package org.union.domain;

import java.util.Date;

public class GloVO {

	private Integer glo_idx;
	private String glo_num;
	private String glo_site;
	private String glo_nation;
	private String glo_cp;
	private String glo_k_word;
	private String glo_title;
	private String glo_title_null;
	private String glo_url;
	private Date glo_regdate;
	private String glo_work;
	private Date glo_work_date;
	private String glo_del_chk;
	private Date glo_del_date;
	private String glo_chk_img;
	private String glo_chk_file;
	private String glo_txt;
	private String glo_rv;
	
	private String regdate;
	private String work_date;
	
	private Integer total, del, sen, etc;
	
	public Integer getGlo_idx() {
		return glo_idx;
	}
	public void setGlo_idx(Integer glo_idx) {
		this.glo_idx = glo_idx;
	}
	public String getGlo_num() {
		return glo_num;
	}
	public void setGlo_num(String glo_num) {
		this.glo_num = glo_num;
	}
	public String getGlo_site() {
		return glo_site;
	}
	public void setGlo_site(String glo_site) {
		this.glo_site = glo_site;
	}
	public String getGlo_nation() {
		return glo_nation;
	}
	public void setGlo_nation(String glo_nation) {
		this.glo_nation = glo_nation;
	}
	public String getGlo_cp() {
		return glo_cp;
	}
	public void setGlo_cp(String glo_cp) {
		this.glo_cp = glo_cp;
	}
	public String getGlo_k_word() {
		return glo_k_word;
	}
	public void setGlo_k_word(String glo_k_word) {
		this.glo_k_word = glo_k_word;
	}
	public String getGlo_title() {
		return glo_title;
	}
	public void setGlo_title(String glo_title) {
		this.glo_title = glo_title;
	}
	public String getGlo_title_null() {
		return glo_title_null;
	}
	public void setGlo_title_null(String glo_title_null) {
		this.glo_title_null = glo_title_null;
	}
	public String getGlo_url() {
		return glo_url;
	}
	public void setGlo_url(String glo_url) {
		this.glo_url = glo_url;
	}
	public Date getGlo_regdate() {
		return glo_regdate;
	}
	public void setGlo_regdate(Date glo_regdate) {
		this.glo_regdate = glo_regdate;
	}
	public String getGlo_work() {
		return glo_work;
	}
	public void setGlo_work(String glo_work) {
		this.glo_work = glo_work;
	}
	public Date getGlo_work_date() {
		return glo_work_date;
	}
	public void setGlo_work_date(Date glo_work_date) {
		this.glo_work_date = glo_work_date;
	}
	public String getGlo_del_chk() {
		return glo_del_chk;
	}
	public void setGlo_del_chk(String glo_del_chk) {
		this.glo_del_chk = glo_del_chk;
	}
	public Date getGlo_del_date() {
		return glo_del_date;
	}
	public void setGlo_del_date(Date glo_del_date) {
		this.glo_del_date = glo_del_date;
	}
	public String getGlo_chk_img() {
		return glo_chk_img;
	}
	public void setGlo_chk_img(String glo_chk_img) {
		this.glo_chk_img = glo_chk_img;
	}
	public String getGlo_chk_file() {
		return glo_chk_file;
	}
	public void setGlo_chk_file(String glo_chk_file) {
		this.glo_chk_file = glo_chk_file;
	}
	public String getGlo_txt() {
		return glo_txt;
	}
	public void setGlo_txt(String glo_txt) {
		this.glo_txt = glo_txt;
	}
	public String getGlo_rv() {
		return glo_rv;
	}
	public void setGlo_rv(String glo_rv) {
		this.glo_rv = glo_rv;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getDel() {
		return del;
	}
	public void setDel(Integer del) {
		this.del = del;
	}
	public Integer getSen() {
		return sen;
	}
	public void setSen(Integer sen) {
		this.sen = sen;
	}
	public Integer getEtc() {
		return etc;
	}
	public void setEtc(Integer etc) {
		this.etc = etc;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getWork_date() {
		return work_date;
	}
	public void setWork_date(String work_date) {
		this.work_date = work_date;
	}
	
	@Override
	public String toString() {
		return "GloVO [glo_idx=" + glo_idx + ", glo_num=" + glo_num + ", glo_site=" + glo_site + ", glo_nation="
				+ glo_nation + ", glo_cp=" + glo_cp + ", glo_k_word=" + glo_k_word + ", glo_title=" + glo_title
				+ ", glo_title_null=" + glo_title_null + ", glo_url=" + glo_url + ", glo_regdate=" + glo_regdate
				+ ", glo_work=" + glo_work + ", glo_work_date=" + glo_work_date + ", glo_del_chk=" + glo_del_chk
				+ ", glo_del_date=" + glo_del_date + ", glo_chk_img=" + glo_chk_img + ", glo_chk_file=" + glo_chk_file
				+ ", glo_txt=" + glo_txt + ", glo_rv=" + glo_rv + ", regdate=" + regdate + ", work_date=" + work_date
				+ ", total=" + total + ", del=" + del + ", sen=" + sen + ", etc=" + etc + "]";
	}
}
