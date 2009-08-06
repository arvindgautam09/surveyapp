package com.okaya.services.survey.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.QuestionCategoryDAO;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author sameera
 * 
 */
public class QuestionCategoryActions extends ActionSupport  {
	public String execute()
	{
		System.out.println("in category");		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		List categoryList = quesDAO.getCategoryList();
		session.setAttribute("CategoryList", categoryList);
		return "SUCCESS";
	}	
	
	public String Add(){
		System.out.println("in category add");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		quesDAO.categoryInsert(questionCategory);		
		List categoryList = quesDAO.getCategoryList();		
		session.setAttribute("CategoryList", categoryList);
		request.setAttribute("viewDiv","viewAdd");
		request.setAttribute("message","Insert");
		return "SUCCESS";
	}
	public String Update(){
		System.out.println("in category update");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		quesDAO.categoryUpdate(questionCategNew, editquestionCategory);
		List categoryList = quesDAO.getCategoryList();
		session.setAttribute("CategoryList", categoryList);
		request.setAttribute("viewDiv","viewUpdate");
		request.setAttribute("message","Update");
		return "SUCCESS";
	}
	public String Delete(){
		System.out.println("in category delete");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		quesDAO.categoryDelete(questionCategoryDelete);
		List categoryList = quesDAO.getCategoryList();
		session.setAttribute("CategoryList", categoryList);
		request.setAttribute("viewDiv","viewDelete");
		request.setAttribute("message","Delete");
		return "SUCCESS";
	}
	private String questionCategory="";
	private String questionCategoryDelete="";
	private String editquestionCategory="";
	private String questionCategNew="";
	/**
	 * @return the editquestionCategory
	 */
	public String getEditquestionCategory() {
		return editquestionCategory;
	}
	/**
	 * @param editquestionCategory the editquestionCategory to set
	 */
	public void setEditquestionCategory(String editquestionCategory) {
		this.editquestionCategory = editquestionCategory;
	}
	/**
	 * @return the questionCategory
	 */
	public String getQuestionCategory() {
		return questionCategory;
	}
	/**
	 * @param questionCategory the questionCategory to set
	 */
	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}
	/**
	 * @return the questionCategoryDelete
	 */
	public String getQuestionCategoryDelete() {
		return questionCategoryDelete;
	}
	/**
	 * @param questionCategoryDelete the questionCategoryDelete to set
	 */
	public void setQuestionCategoryDelete(String questionCategoryDelete) {
		this.questionCategoryDelete = questionCategoryDelete;
	}
	/**
	 * @return the questionCategNew
	 */
	public String getQuestionCategNew() {
		return questionCategNew;
	}
	/**
	 * @param questionCategNew the questionCategNew to set
	 */
	public void setQuestionCategNew(String questionCategNew) {
		this.questionCategNew = questionCategNew;
	}
	
}