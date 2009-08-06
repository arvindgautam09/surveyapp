package com.okaya.services.survey.dataBean;
/**
 * @author sameera
 * 
 */
public class QuestionCategoryDB{
	private int qsc_id=0;
	private String qsc_name="";
	private String qsc_flag="";
	/**
	 * @return the qsc_id
	 */
	public int getQsc_id() {
		return qsc_id;
	}
	/**
	 * @param qsc_id the qsc_id to set
	 */
	public void setQsc_id(int qsc_id) {
		this.qsc_id = qsc_id;
	}
	/**
	 * @return the qsc_name
	 */
	public String getQsc_name() {
		return qsc_name;
	}
	/**
	 * @param qsc_name the qsc_name to set
	 */
	public void setQsc_name(String qsc_name) {
		this.qsc_name = qsc_name;
	}
	/**
	 * @return the qsc_flag
	 */
	public String getQsc_flag() {
		return qsc_flag;
	}
	/**
	 * @param qsc_flag the qsc_flag to set
	 */
	public void setQsc_flag(String qsc_flag) {
		this.qsc_flag = qsc_flag;
	}
}