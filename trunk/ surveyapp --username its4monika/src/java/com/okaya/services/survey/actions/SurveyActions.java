/**
 * 
 */
package com.okaya.services.survey.actions;

import java.util.ArrayList;
import java.util.List;

import com.okaya.services.survey.dao.QuestionCategoryDAO;
import com.okaya.services.survey.dao.SurveyTypeDAO;

/**
 * @author monika
 *
 */
public class SurveyActions {
	public String execute() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.getCategoryList();
		SurveyTypeDAO stDAO = new SurveyTypeDAO();
		surveyTypeList=stDAO.getSurveyTypeList();
		return "SUCCESS";
	}

	public String Add() {
		
		return "SUCCESS";
	}

	List surveyTypeList=null;
	List categoryList=null;
	/**
	 * @return the surveyTypeList
	 */
	public List getSurveyTypeList() {
		return surveyTypeList;
	}

	/**
	 * @param surveyTypeList the surveyTypeList to set
	 */
	public void setSurveyTypeList(List surveyTypeList) {
		this.surveyTypeList = surveyTypeList;
	}

	/**
	 * @return the categoryList
	 */
	public List getCategoryList() {
		return categoryList;
	}

	/**
	 * @param categoryList the categoryList to set
	 */
	public void setCategoryList(List categoryList) {
		this.categoryList = categoryList;
	}
	
}
