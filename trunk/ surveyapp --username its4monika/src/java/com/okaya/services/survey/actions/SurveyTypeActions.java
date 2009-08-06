/**
 * 
 */
package com.okaya.services.survey.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.SurveyTypeDAO;

/**
 * @author sameera
 * 
 */
public class SurveyTypeActions {
	
	public String execute()
	{
		//System.out.println("in execute");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		SurveyTypeDAO stDao=new SurveyTypeDAO();		
		List survey_type = stDao.getSurveyTypeList();
		session.setAttribute("surveyTypeList",survey_type);
		return "SUCCESS";
	}	
	public String Add()  
	{ 	     
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		//System.out.println("in add method");
		SurveyTypeDAO stDao=new SurveyTypeDAO();	
		stDao.insertSurveyType(surveyType);
		List survey_type = stDao.getSurveyTypeList();
		session.setAttribute("surveyTypeList",survey_type);
		return "SUCCESS";
	} 
	
	public String Update(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		//System.out.println("in update method");
		SurveyTypeDAO stDao=new SurveyTypeDAO();	
		stDao.updateSurveyType(surveyType, editsurveyType);
		List survey_type = stDao.getSurveyTypeList();
		session.setAttribute("surveyTypeList",survey_type);
		request.setAttribute("Update","True");
		return "SUCCESS";
	}
	public String Delete(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println("in delete method surveyType is---->"+surveyType);
		SurveyTypeDAO stDao=new SurveyTypeDAO();	
		stDao.deleteSurveyType(surveyType);
		List survey_type = stDao.getSurveyTypeList();
		session.setAttribute("surveyTypeList",survey_type);
		request.setAttribute("Delete","True");
		return "SUCCESS";
	}
	

	
	private String surveyType="";
    private String editsurveyType="";
	/**
	 * @return the surveyType
	 */
	public String getSurveyType() {
		return surveyType;
	}

	/**
	 * @param surveyType the surveyType to set
	 */
	public void setSurveyType(String surveyType) {
		this.surveyType = surveyType;
	}

	/**
	 * @return the editsurveyType
	 */
	public String getEditsurveyType() {
		return editsurveyType;
	}

	/**
	 * @param editsurveyType the editsurveyType to set
	 */
	public void setEditsurveyType(String editsurveyType) {
		this.editsurveyType = editsurveyType;
	}

	

	
	
}
