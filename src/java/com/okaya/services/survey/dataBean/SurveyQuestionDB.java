package com.okaya.services.survey.dataBean;

import java.util.Set;

/**
 * @author sameera
 * 
 */
public class SurveyQuestionDB{
	private int sqm_id=0;
	private int sqm_srm_id=0;
	private int sqm_qsm_id=0;
	private String questionText="";
	/**
	 * @return the sqm_id
	 */
	public int getSqm_id() {
		return sqm_id;
	}
	/**
	 * @param sqm_id the sqm_id to set
	 */
	public void setSqm_id(int sqm_id) {
		this.sqm_id = sqm_id;
	}
	/**
	 * @return the sqm_srm_id
	 */
	public int getSqm_srm_id() {
		return sqm_srm_id;
	}
	/**
	 * @param sqm_srm_id the sqm_srm_id to set
	 */
	public void setSqm_srm_id(int sqm_srm_id) {
		this.sqm_srm_id = sqm_srm_id;
	}
	/**
	 * @return the sqm_qsm_id
	 */
	public int getSqm_qsm_id() {
		return sqm_qsm_id;
	}
	/**
	 * @param sqm_qsm_id the sqm_qsm_id to set
	 */
	public void setSqm_qsm_id(int sqm_qsm_id) {
		this.sqm_qsm_id = sqm_qsm_id;
	}
	/**
	 * @return the questionText
	 */
	public String getQuestionText() {
		return questionText;
	}
	/**
	 * @param questionText the questionText to set
	 */
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	
}