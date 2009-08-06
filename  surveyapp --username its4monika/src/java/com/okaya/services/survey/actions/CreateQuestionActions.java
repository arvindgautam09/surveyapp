package com.okaya.services.survey.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.CreateQuestionDAO;
import com.okaya.services.survey.dao.QuestionCategoryDAO;
import com.okaya.services.survey.dataBean.QuestionDB;
import com.okaya.services.survey.dataBean.QuestionOptionDB;

/**
 * @author sameera
 * 
 */
public class CreateQuestionActions {

	public String execute() {
		System.out.println("in CreateQuestionAction");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		CreateQuestionDAO quesCreateDAO = new CreateQuestionDAO();
		List QuesNameList =quesCreateDAO.getQuestionName();
		List categoryList1 = quesDAO.getCategoryList();
		setCategoryList(categoryList1);
		session.setAttribute("QuesNameList", QuesNameList);
		session.setAttribute("CategoryList", categoryList1);
		return "SUCCESS";
	}

	public String Add() {
		System.out.println("in add question action");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		CreateQuestionDAO quesCreateDAO = new CreateQuestionDAO();
		QuestionDB quesDB = new QuestionDB();
		QuestionOptionDB quesOptionDB = new QuestionOptionDB();
		List categoryList1 = quesDAO.getCategoryList();
		int qsmm_id = 0;
		String[] choiceArr = { "" };
		session.setAttribute("CategoryList", categoryList1);
		setCategoryList(categoryList1);
		quesDB.setQsm_question(questionText.toUpperCase());
		quesDB.setQsm_qst_id(questionType);
		quesDB.setQsm_qsc_id(categoryName);
		qsmm_id = quesCreateDAO.insertQuestion(quesDB);
		if (!answerChoices.equals("")) {
			System.out.println("in answerChoices");
			choiceArr = answerChoices.split(",");
			qo_type = 'C';
			for (int i = 0; i < choiceArr.length; i++) {
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase());
				quesOptionDB.setQso_qsm_id(qsmm_id);
				quesOptionDB.setQso_type(qo_type);
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}
		if (!rowChoices.equals("")) {
			System.out.println("in rowChoices" + rowChoices);
			choiceArr = rowChoices.split(",");
			qo_type = 'R';
			for (int i = 0; i < choiceArr.length; i++) {
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase());
				quesOptionDB.setQso_qsm_id(qsmm_id);
				quesOptionDB.setQso_type(qo_type);
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}
		if (!label.equals("")) {
			System.out.println("in label" + label);
			choiceArr = label.split(",");
			qo_type = 'C';
			for (int i = 0; i < choiceArr.length; i++) {
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase());
				quesOptionDB.setQso_qsm_id(qsmm_id);
				quesOptionDB.setQso_type(qo_type);
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}

		return "SUCCESS";
	}

	private int questionType = 0;
	private String questionText = "";
	private int categoryName = 0;
	private String rowChoices = "";
	private String answerChoices = "";
	private char qo_type;
	private String label = "";
	private List categoryList;

	/**
	 * @return the label
	 */
	public String getLabel() {
		return label;
	}

	/**
	 * @param label the label to set
	 */
	public void setLabel(String label) {
		this.label = label;
	}

	/**
	 * @return the qo_type
	 */
	public char getQo_type() {
		return qo_type;
	}

	/**
	 * @param qo_type
	 *            the qo_type to set
	 */
	public void setQo_type(char qo_type) {
		this.qo_type = qo_type;
	}

	/**
	 * @return the questionType
	 */
	public int getQuestionType() {
		return questionType;
	}

	/**
	 * @param questionType
	 *            the questionType to set
	 */
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}

	/**
	 * @return the questionText
	 */
	public String getQuestionText() {
		return questionText;
	}

	/**
	 * @param questionText
	 *            the questionText to set
	 */
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	/**
	 * @return the categoryName
	 */
	public int getCategoryName() {
		return categoryName;
	}

	/**
	 * @param categoryName
	 *            the categoryName to set
	 */
	public void setCategoryName(int categoryName) {
		this.categoryName = categoryName;
	}

	/**
	 * @return the rowChoices
	 */
	public String getRowChoices() {
		return rowChoices;
	}

	/**
	 * @param rowChoices
	 *            the rowChoices to set
	 */
	public void setRowChoices(String rowChoices) {
		this.rowChoices = rowChoices;
	}

	/**
	 * @return the answerChoices
	 */
	public String getAnswerChoices() {
		return answerChoices;
	}

	/**
	 * @param answerChoices
	 *            the answerChoices to set
	 */
	public void setAnswerChoices(String answerChoices) {
		this.answerChoices = answerChoices;
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
