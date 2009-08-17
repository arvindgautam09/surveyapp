package com.okaya.services.survey.dataBean;

import java.util.Set;

/**
 * @author sameera
 * 
 */
public class SurveyDB{
	private int srm_id=0;
	private String srm_name="";
	private int srm_repeat_count=0;
	private char srm_repeat_interval=' ';
	private int srm_srt_id=0;
	private char srm_status=' ';
	private char srm_flag=' ';
	private Set questionSet=null;
	/**
	 * @return the srm_id
	 */
	public int getSrm_id() {
		return srm_id;
	}
	/**
	 * @param srm_id the srm_id to set
	 */
	public void setSrm_id(int srm_id) {
		this.srm_id = srm_id;
	}
	/**
	 * @return the srm_name
	 */
	public String getSrm_name() {
		return srm_name;
	}
	/**
	 * @param srm_name the srm_name to set
	 */
	public void setSrm_name(String srm_name) {
		this.srm_name = srm_name;
	}
	/**
	 * @return the srm_repeat_count
	 */
	public int getSrm_repeat_count() {
		return srm_repeat_count;
	}
	/**
	 * @param srm_repeat_count the srm_repeat_count to set
	 */
	public void setSrm_repeat_count(int srm_repeat_count) {
		this.srm_repeat_count = srm_repeat_count;
	}
	/**
	 * @return the srm_repeat_interval
	 */
	public char getSrm_repeat_interval() {
		return srm_repeat_interval;
	}
	/**
	 * @param srm_repeat_interval the srm_repeat_interval to set
	 */
	public void setSrm_repeat_interval(char srm_repeat_interval) {
		this.srm_repeat_interval = srm_repeat_interval;
	}
	/**
	 * @return the srm_srt_id
	 */
	public int getSrm_srt_id() {
		return srm_srt_id;
	}
	/**
	 * @param srm_srt_id the srm_srt_id to set
	 */
	public void setSrm_srt_id(int srm_srt_id) {
		this.srm_srt_id = srm_srt_id;
	}
	
	
	/**
	 * @return the srm_status
	 */
	public char getSrm_status() {
		return srm_status;
	}
	/**
	 * @param srm_status the srm_status to set
	 */
	public void setSrm_status(char srm_status) {
		this.srm_status = srm_status;
	}
	/**
	 * @return the srm_flag
	 */
	public char getSrm_flag() {
		return srm_flag;
	}
	/**
	 * @param srm_flag the srm_flag to set
	 */
	public void setSrm_flag(char srm_flag) {
		this.srm_flag = srm_flag;
	}
	/**
	 * @return the questionSet
	 */
	public Set getQuestionSet() {
		return questionSet;
	}
	/**
	 * @param questionSet the questionSet to set
	 */
	public void setQuestionSet(Set questionSet) {
		this.questionSet = questionSet;
	}
	
}