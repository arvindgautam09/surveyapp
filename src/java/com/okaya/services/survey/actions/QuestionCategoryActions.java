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
public class QuestionCategoryActions extends ActionSupport {

	private static final long serialVersionUID = 1L;

	public String execute() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.getCategoryList();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("key", "");
		return "SUCCESS";
	}

	public String add() {
		System.out.println("category:"+questionCategory);
//		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
//		quesDAO.categoryInsert(questionCategory);
//		categoryList = quesDAO.getCategoryList();
//		HttpServletRequest request = ServletActionContext.getRequest();
//		HttpSession session = request.getSession();
//		session.setAttribute("key", "AddKey");
		this.setMessage("Category added Successfully");
		return "SUCCESS";
	}

	public String update() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		quesDAO.categoryUpdate(categoryId, questionCategory);
		categoryList = quesDAO.getCategoryList();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("key", "UpdateKey");
		this.setMessage("Category updated Successfully");
		return "SUCCESS";
	}

	public String delete() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		quesDAO.categoryDelete(categoryId);
		categoryList = quesDAO.getCategoryList();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("key", "DeleteKey");
		this.setMessage("Category deleted Successfully");
		return "SUCCESS";
	}

	private String questionCategory;
	private int categoryId = 0;
	private String message = "";
	private List categoryList = null;

	/**
	 * @return the questionCategory
	 */
	public String getQuestionCategory() {
		return questionCategory;
	}

	/**
	 * @param questionCategory
	 *            the questionCategory to set
	 */
	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId
	 *            the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
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

}