package com.okaya.services.survey.dataBean;
/**
 * @author sameera
 * 
 */
public class QuestionOptionDB{
	private int qso_id=0;
	private int qso_qsm_id=0;
	private String qso_option="";
	private char qso_type;
	/**
	 * @return the qso_id
	 */
	public int getQso_id() {
		return qso_id;
	}
	/**
	 * @param qso_id the qso_id to set
	 */
	public void setQso_id(int qso_id) {
		this.qso_id = qso_id;
	}
	/**
	 * @return the qso_qsm_id
	 */
	public int getQso_qsm_id() {
		return qso_qsm_id;
	}
	/**
	 * @param qso_qsm_id the qso_qsm_id to set
	 */
	public void setQso_qsm_id(int qso_qsm_id) {
		this.qso_qsm_id = qso_qsm_id;
	}
	/**
	 * @return the qso_option
	 */
	public String getQso_option() {
		return qso_option;
	}
	/**
	 * @param qso_option the qso_option to set
	 */
	public void setQso_option(String qso_option) {
		this.qso_option = qso_option;
	}
	/**
	 * @return the qso_type
	 */
	public char getQso_type() {
		return qso_type;
	}
	/**
	 * @param qso_type the qso_type to set
	 */
	public void setQso_type(char qso_type) {
		this.qso_type = qso_type;
	}
	
}