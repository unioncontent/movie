package org.union.domain;

import java.util.Date;

public class UserVO {

	
	private Integer user_idx;
	private Integer user_type; // 1 = 관리자, 2 = CP
	private String user_ID;
	private String user_PW;
	private String user_name;
	private Integer user_phoneNum;
	private String user_email;
	private String company_name;
	private String company_type;
	private String company_licensee;
	private String company_location;
	private String thumbnail;
	private Date createDate;
	private Date updateDAte;
}
