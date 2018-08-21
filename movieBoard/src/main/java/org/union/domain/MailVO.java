package org.union.domain;

import java.util.Date;

public class MailVO {
	
	private Integer n_idx;
	private String M_id;
	private Integer M_type;
	private Integer M_keyword_idx;
	private String M_keyword;
	private String success;
	private String fail;
	private String M_mail_type;
	private Integer M_seq_number;
	private String sendCount;
	private String M_sender;
	private String M_group;
	private String M_recipi;
	private String M_subject;
	private String M_body;
	private String M_file;
	private String M_file_name;
	private Date M_send;
	private Date M_regdate;
	private Integer total;
	
	public Integer getN_idx() {
		return n_idx;
	}
	public void setN_idx(Integer n_idx) {
		this.n_idx = n_idx;
	}
	public String getM_id() {
		return M_id;
	}
	public void setM_id(String m_id) {
		M_id = m_id;
	}
	public Integer getM_type() {
		return M_type;
	}
	public void setM_type(Integer m_type) {
		M_type = m_type;
	}
	public Integer getM_keyword_idx() {
		return M_keyword_idx;
	}
	public void setM_keyword_idx(Integer m_keyword_idx) {
		M_keyword_idx = m_keyword_idx;
	}
	public String getM_keyword() {
		return M_keyword;
	}
	public void setM_keyword(String m_keyword) {
		M_keyword = m_keyword;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getFail() {
		return fail;
	}
	public void setFail(String fail) {
		this.fail = fail;
	}
	public String getM_mail_type() {
		return M_mail_type;
	}
	public void setM_mail_type(String m_mail_type) {
		M_mail_type = m_mail_type;
	}
	public Integer getM_seq_number() {
		return M_seq_number;
	}
	public void setM_seq_number(Integer m_seq_number) {
		M_seq_number = m_seq_number;
	}
	public String getSendCount() {
		return sendCount;
	}
	public void setSendCount(String sendCount) {
		this.sendCount = sendCount;
	}
	public String getM_sender() {
		return M_sender;
	}
	public void setM_sender(String m_sender) {
		M_sender = m_sender;
	}
	public String getM_group() {
		return M_group;
	}
	public void setM_group(String m_group) {
		M_group = m_group;
	}
	public String getM_recipi() {
		return M_recipi;
	}
	public void setM_recipi(String m_recipi) {
		M_recipi = m_recipi;
	}
	public String getM_subject() {
		return M_subject;
	}
	public void setM_subject(String m_subject) {
		M_subject = m_subject;
	}
	public String getM_body() {
		return M_body;
	}
	public void setM_body(String m_body) {
		M_body = m_body;
	}
	public String getM_file() {
		return M_file;
	}
	public void setM_file(String m_file) {
		M_file = m_file;
	}
	public String getM_file_name() {
		return M_file_name;
	}
	public void setM_file_name(String m_file_name) {
		M_file_name = m_file_name;
	}
	public Date getM_send() {
		return M_send;
	}
	public void setM_send(Date m_send) {
		M_send = m_send;
	}
	public Date getM_regdate() {
		return M_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		M_regdate = m_regdate;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "MailVO [n_idx=" + n_idx + ", M_id=" + M_id + ", M_type=" + M_type + ", M_keyword_idx=" + M_keyword_idx
				+ ", M_keyword=" + M_keyword + ", success=" + success + ", fail=" + fail + ", M_mail_type="
				+ M_mail_type + ", M_seq_number=" + M_seq_number + ", sendCount=" + sendCount + ", M_sender=" + M_sender
				+ ", M_group=" + M_group + ", M_recipi=" + M_recipi + ", M_subject=" + M_subject + ", M_body=" + M_body
				+ ", M_file=" + M_file + ", M_file_name=" + M_file_name + ", M_send=" + M_send + ", M_regdate="
				+ M_regdate + ", total=" + total + "]";
	}
}
