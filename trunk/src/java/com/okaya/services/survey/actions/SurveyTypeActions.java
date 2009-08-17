/**
 * 
 */
package com.okaya.services.survey.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.SurveyTypeDAO;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author sameera
 * 
 */
public class SurveyTypeActions {
	
	private static final long serialVersionUID = 1L;
	public String execute()
	{
		SurveyTypeDAO stDao=new SurveyTypeDAO();		
		surveyTypeList = stDao.getSurveyTypeList();
		return "SUCCESS";
	}	
	public String add()  
	{ 	     
		SurveyTypeDAO stDao=new SurveyTypeDAO();	
		stDao.insertSurveyType(surveyType);
		this.setMessage("Survey type added Successfully");
		surveyTypeList = stDao.getSurveyTypeList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","AddKey");
		return "SUCCESS";
	} 
	
	public String update(){
		SurveyTypeDAO stDao=new SurveyTypeDAO();	
		stDao.updateSurveyType(surveyType,surveyTypeId);
		surveyTypeList = stDao.getSurveyTypeList();
		HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","UpdateKey");
		this.setMessage("Survey type updated Successfully");
		return "SUCCESS";
	}
	public String delete(){
		SurveyTypeDAO stDao=new SurveyTypeDAO();	
		stDao.deleteSurveyType(surveyTypeId);
		surveyTypeList = stDao.getSurveyTypeList();
		this.setMessage("Survey type deleted Successfully");
		 HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","DeleteKey");
		return "SUCCESS";
	}
	

	List surveyTypeList = null;
	private String surveyType="";
    private int surveyTypeId=0;
    private String message="";
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
	 * @return the surveyTypeId
	 */
	public int getSurveyTypeId() {
		return surveyTypeId;
	}
	/**
	 * @param surveyTypeId the surveyTypeId to set
	 */
	public void setSurveyTypeId(int surveyTypeId) {
		this.surveyTypeId = surveyTypeId;
	}
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	

	
	
}
