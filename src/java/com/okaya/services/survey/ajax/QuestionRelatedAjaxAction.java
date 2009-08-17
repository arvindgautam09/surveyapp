package com.okaya.services.survey.ajax;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.okaya.services.survey.dao.CreateSurveyDAO;
import com.okaya.services.survey.dao.QuestionCategoryDAO;
import com.okaya.services.survey.dao.QuestionDAO;
import com.okaya.services.survey.dao.SurveyTypeDAO;
import com.okaya.services.survey.dataBean.QuestionDB;
import com.okaya.services.survey.dataBean.SurveyDB;
import com.okaya.services.survey.dataBean.SurveyQuestionDB;

/**
 * 
 * @author sameera
 */
public class QuestionRelatedAjaxAction {

	public String getQuestionListByCategory() throws Exception {
		QuestionDAO quesCreateDAO = new QuestionDAO();
		if (questionCategory != 0) {
			questionList = quesCreateDAO
					.getQuestionsByCategory(questionCategory);
		}
		return "SUCCESS";
	}

	public String getQuestionDetailById() throws Exception {
		QuestionDAO quesCreateDAO = new QuestionDAO();
		if (questionId != 0) {
			questionDetail = quesCreateDAO.getQuestionDetail(questionId);
		}
		return "SUCCESS";
	}

	public String getSurveyDetailOnChange() throws Exception {
		QuestionDAO quesDAO = new QuestionDAO();
		CreateSurveyDAO surveyDAO = new CreateSurveyDAO();
		SurveyTypeDAO stDAO = new SurveyTypeDAO();
		surveyTypeList = stDAO.getSurveyTypeList();
		QuestionCategoryDAO quesCategDAO = new QuestionCategoryDAO();
		categoryList = quesCategDAO.getCategoryList();
		surveyListDB = surveyDAO.getSurveyDetails(surveyName);
		Set questionSet = new HashSet();	
		if(surveyListDB!=null)
		{
			questionIdSet = surveyListDB.getQuestionSet();
			Iterator iter = questionIdSet.iterator();
			while (iter.hasNext()) {
				SurveyQuestionDB surveyquesDB = (SurveyQuestionDB) iter.next();
				questionSet.add(quesDAO.getQuestionDetail(surveyquesDB
						.getSqm_qsm_id()));
			}
			surveyListDB.setQuestionSet(questionSet);	
		}
		return "SUCCESS";
	}

	List questionList = null;
	int questionCategory = 0;
	int questionId = 0;
	SurveyDB surveyListDB;
	int quesId = 0;
	int surveyName = 0;
	List surveyTypeList = null;
	List categoryList = null;
	QuestionDB questionDetail = null;
	Set questionIdSet;

	/**
	 * @return the questionList
	 */
	public List getQuestionList() {
		return questionList;
	}

	/**
	 * @param questionList
	 *            the questionList to set
	 */
	public void setQuestionList(List questionList) {
		this.questionList = questionList;
	}

	/**
	 * @return the questionCategory
	 */
	public int getQuestionCategory() {
		return questionCategory;
	}

	/**
	 * @param questionCategory
	 *            the questionCategory to set
	 */
	public void setQuestionCategory(int questionCategory) {
		this.questionCategory = questionCategory;
	}

	/**
	 * @return the questionId
	 */
	public int getQuestionId() {
		return questionId;
	}

	/**
	 * @param questionId
	 *            the questionId to set
	 */
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	/**
	 * @return the questionDetail
	 */
	public QuestionDB getQuestionDetail() {
		return questionDetail;
	}

	/**
	 * @param questionDetail
	 *            the questionDetail to set
	 */
	public void setQuestionDetail(QuestionDB questionDetail) {
		this.questionDetail = questionDetail;
	}

	/**
	 * @return the surveyListDB
	 */
	public SurveyDB getSurveyListDB() {
		return surveyListDB;
	}

	/**
	 * @param surveyListDB
	 *            the surveyListDB to set
	 */
	public void setSurveyListDB(SurveyDB surveyListDB) {
		this.surveyListDB = surveyListDB;
	}

	/**
	 * @return the surveyName
	 */
	public int getSurveyName() {
		return surveyName;
	}

	/**
	 * @param surveyName
	 *            the surveyName to set
	 */
	public void setSurveyName(int surveyName) {
		this.surveyName = surveyName;
	}

	/**
	 * @return the surveyTypeList
	 */
	public List getSurveyTypeList() {
		return surveyTypeList;
	}

	/**
	 * @param surveyTypeList
	 *            the surveyTypeList to set
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
	 * @param categoryList
	 *            the categoryList to set
	 */
	public void setCategoryList(List categoryList) {
		this.categoryList = categoryList;
	}

	/**
	 * @return the questionIdSet
	 */
	public Set getQuestionIdSet() {
		return questionIdSet;
	}

	/**
	 * @param questionIdSet
	 *            the questionIdSet to set
	 */
	public void setQuestionIdSet(Set questionIdSet) {
		this.questionIdSet = questionIdSet;
	}

	/**
	 * @return the quesId
	 */
	public int getQuesId() {
		return quesId;
	}

	/**
	 * @param quesId
	 *            the quesId to set
	 */
	public void setQuesId(int quesId) {
		this.quesId = quesId;
	}

}
