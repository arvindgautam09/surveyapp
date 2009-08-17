/**
 * 
 */
package com.okaya.services.survey.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.CreateSurveyDAO;
import com.okaya.services.survey.dao.QuestionCategoryDAO;
import com.okaya.services.survey.dao.SurveyTypeDAO;
import com.okaya.services.survey.dataBean.SurveyDB;
import com.okaya.services.survey.dataBean.SurveyQuestionDB;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author sameera
 *
 */
public class SurveyActions {
	public String execute() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.getCategoryList();
		SurveyTypeDAO stDAO = new SurveyTypeDAO();
		surveyTypeList=stDAO.getSurveyTypeList();
		CreateSurveyDAO surveyDAO = new CreateSurveyDAO();
		surveyNameList=surveyDAO.getSurveyName();
		System.out.println("surveyNameList"+surveyNameList);
		return "SUCCESS";
	}

	public String createSurvey() {
		SurveyDB surveyDB = new SurveyDB();
		SurveyQuestionDB surveyQuesDB = new SurveyQuestionDB();
		CreateSurveyDAO surveyDAO = new CreateSurveyDAO();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.getCategoryList();
		SurveyTypeDAO stDAO = new SurveyTypeDAO();
		surveyTypeList=stDAO.getSurveyTypeList();			
		quesArr = selectedQuestionList.split(",");	
		surveyDB.setSrm_name(surveyName.toUpperCase());
		surveyDB.setSrm_repeat_count(repeatcount);
		surveyDB.setSrm_repeat_interval(repeatinterval);
		surveyDB.setSrm_srt_id(surveyType);
		surveyDB.setSrm_status(status);
		srm_id=surveyDAO.insertSurvey(surveyDB);
		for (int i = 0; i < quesArr.length; i++) {
			surveyQuesDB.setSqm_qsm_id((Integer.parseInt(quesArr[i].trim())));
			surveyQuesDB.setSqm_srm_id(srm_id);
			surveyDAO.insertSurveyQuestion(surveyQuesDB);
		}		
		HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","AddKey");
		return "SUCCESS";
	}
	
	public String deleteSurvey(){		
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.getCategoryList();
		SurveyTypeDAO stDAO = new SurveyTypeDAO();
		surveyTypeList=stDAO.getSurveyTypeList();
		CreateSurveyDAO surveyDAO = new CreateSurveyDAO();
		surveyNameList=surveyDAO.getSurveyName();
		surveyDAO.deleteSurveyName(surveyName);
		 HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","DeleteKey");
		return "SUCCESS";
	}
	
	public String updateSurvey(){		
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.getCategoryList();
		SurveyTypeDAO stDAO = new SurveyTypeDAO();
		surveyTypeList=stDAO.getSurveyTypeList();
		CreateSurveyDAO surveyDAO = new CreateSurveyDAO();
		SurveyQuestionDB surveyQuesDB = new SurveyQuestionDB();
		SurveyDB surveyDB = new SurveyDB();
		surveyNameList=surveyDAO.getSurveyName();		
		System.out.println("selectedQuestionList--->"+selectedQuestionList);
		quesArr = selectedQuestionList.split(",");	
		surveyDB.setSrm_name(editSurveyName.toUpperCase());
		surveyDB.setSrm_repeat_count(repeatcount);
		surveyDB.setSrm_repeat_interval(repeatinterval);
		surveyDB.setSrm_srt_id(surveyType);
		surveyDB.setSrm_status(status);
		int srmId=(Integer.parseInt(surveyName));		
		System.out.println("srmId---->"+srmId);
		surveyDAO.updateSurvey(surveyDB,srmId);
		for (int i = 0; i < quesArr.length; i++) {
			surveyQuesDB.setSqm_qsm_id((Integer.parseInt(quesArr[i].trim())));
			System.out.println("quesArr[i]-->"+quesArr[i]);
			//surveyDAO.deleteSurveyQuestionMapping(srmId);
		surveyDAO.updateSurveyOption(surveyQuesDB,srmId);
		}	
		 HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","UpdateKey");
		return "SUCCESS";
	}
	List surveyTypeList=null;
	List categoryList=null;
	int surveyType=0;
	String surveyName="";
	int repeatcount=0;
	char repeatinterval=' ';
	String selectedQuestionList="";
	int srm_id=0;
	char status=' ';
	String[] quesArr = { "" };	
	List surveyNameList = null;
	String deletesurveyName="";
	String editSurveyName="";
	/**
	 * @return the editSurveyName
	 */
	public String getEditSurveyName() {
		return editSurveyName;
	}

	/**
	 * @param editSurveyName the editSurveyName to set
	 */
	public void setEditSurveyName(String editSurveyName) {
		this.editSurveyName = editSurveyName;
	}

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

	/**
	 * @return the surveyType
	 */
	public int getSurveyType() {
		return surveyType;
	}

	/**
	 * @param surveyType the surveyType to set
	 */
	public void setSurveyType(int surveyType) {
		this.surveyType = surveyType;
	}

	/**
	 * @return the surveyName
	 */
	public String getSurveyName() {
		return surveyName;
	}

	/**
	 * @param surveyName the surveyName to set
	 */
	public void setSurveyName(String surveyName) {
		this.surveyName = surveyName;
	}

	/**
	 * @return the repeatcount
	 */
	public int getRepeatcount() {
		return repeatcount;
	}

	/**
	 * @param repeatcount the repeatcount to set
	 */
	public void setRepeatcount(int repeatcount) {
		this.repeatcount = repeatcount;
	}

	/**
	 * @return the repeatinterval
	 */
	public char getRepeatinterval() {
		return repeatinterval;
	}

	/**
	 * @param repeatinterval the repeatinterval to set
	 */
	public void setRepeatinterval(char repeatinterval) {
		this.repeatinterval = repeatinterval;
	}

	/**
	 * @return the selectedQuestionList
	 */
	public String getSelectedQuestionList() {
		return selectedQuestionList;
	}

	/**
	 * @param selectedQuestionList the selectedQuestionList to set
	 */
	public void setSelectedQuestionList(String selectedQuestionList) {
		this.selectedQuestionList = selectedQuestionList;
	}

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
	 * @return the status
	 */
	public char getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(char status) {
		this.status = status;
	}

	/**
	 * @return the quesArr
	 */
	public String[] getQuesArr() {
		return quesArr;
	}

	/**
	 * @param quesArr the quesArr to set
	 */
	public void setQuesArr(String[] quesArr) {
		this.quesArr = quesArr;
	}

	/**
	 * @return the surveyNameList
	 */
	public List getSurveyNameList() {
		return surveyNameList;
	}

	/**
	 * @param surveyNameList the surveyNameList to set
	 */
	public void setSurveyNameList(List surveyNameList) {
		this.surveyNameList = surveyNameList;
	}

	/**
	 * @return the deletesurveyName
	 */
	public String getDeletesurveyName() {
		return deletesurveyName;
	}

	/**
	 * @param deletesurveyName the deletesurveyName to set
	 */
	public void setDeletesurveyName(String deletesurveyName) {
		this.deletesurveyName = deletesurveyName;
	}
	
	

	
	

}
