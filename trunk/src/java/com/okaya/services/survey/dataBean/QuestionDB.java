package com.okaya.services.survey.dataBean;

import java.util.Set;

/**
 * @author sameera
 * 
 */
public class QuestionDB{
	private int qsm_id=0;
	private String qsm_question="";
	private int qsm_qst_id=0;
	private int qsm_qsc_id=0;
	private Set optionSet=null;
	
	/**
	 * @return the qsm_id
	 */
	public int getQsm_id() {
		return qsm_id;
	}
	/**
	 * @param qsm_id the qsm_id to set
	 */
	public void setQsm_id(int qsm_id) {
		this.qsm_id = qsm_id;
	}
	/**
	 * @return the qsm_qst_id
	 */
	public int getQsm_qst_id() {
		return qsm_qst_id;
	}
	/**
	 * @param qsm_qst_id the qsm_qst_id to set
	 */
	public void setQsm_qst_id(int qsm_qst_id) {
		this.qsm_qst_id = qsm_qst_id;
	}
	/**
	 * @return the qsm_qsc_id
	 */
	public int getQsm_qsc_id() {
		return qsm_qsc_id;
	}
	/**
	 * @param qsm_qsc_id the qsm_qsc_id to set
	 */
	public void setQsm_qsc_id(int qsm_qsc_id) {
		this.qsm_qsc_id = qsm_qsc_id;
	}
	/**
	 * @return the qsm_question
	 */
	public String getQsm_question() {
		return qsm_question;
	}
	/**
	 * @param qsm_question the qsm_question to set
	 */
	public void setQsm_question(String qsm_question) {
		this.qsm_question = qsm_question;
	}
	/**
	 * @return the optionSet
	 */
	public Set getOptionSet() {
		return optionSet;
	}
	/**
	 * @param optionSet the optionSet to set
	 */
	public void setOptionSet(Set optionSet) {
		this.optionSet = optionSet;
	}
}