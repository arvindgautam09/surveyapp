package com.okaya.services.survey.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.QuestionCategoryDAO;
import com.okaya.services.survey.dao.QuestionDAO;
import com.okaya.services.survey.dataBean.QuestionDB;
import com.okaya.services.survey.dataBean.QuestionOptionDB;

/**
 * @author sameera
 * 
 */
public class QuestionActions {

	public String execute() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.categoryGet();
		return "SUCCESS";
	}

	public String add() {
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		QuestionDAO quesCreateDAO = new QuestionDAO();
		QuestionDB quesDB = new QuestionDB();
		QuestionOptionDB quesOptionDB = new QuestionOptionDB();
		categoryList = quesDAO.categoryGet();
		int qsmm_id = 0;
		String[] choiceArr = { "" };
		quesDB.setQsm_question(questionText.toUpperCase());
		quesDB.setQsm_qst_id(questionType);
		quesDB.setQsm_qsc_id(questionCategory);
		qsmm_id = quesCreateDAO.insertQuestion(quesDB);
		if (!answerChoices.equals("")) {
			choiceArr = answerChoices.split(",");
			for (int i = 0; i < choiceArr.length; i++) {
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase());
				quesOptionDB.setQso_qsm_id(qsmm_id);
				quesOptionDB.setQso_type('C');
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}
		if (!rowChoices.equals("")) {
			choiceArr = rowChoices.split(",");
			for (int i = 0; i < choiceArr.length; i++) {
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase());
				quesOptionDB.setQso_qsm_id(qsmm_id);
				quesOptionDB.setQso_type('R');
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}
		if (!label.equals("")) {
			choiceArr = label.split(",");
			for (int i = 0; i < choiceArr.length; i++) {
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase());
				quesOptionDB.setQso_qsm_id(qsmm_id);
				quesOptionDB.setQso_type('C');
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}
		 HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","AddKey");
		this.setMessage("Question added successfully");
		return "SUCCESS";
	}

	public String update() {

		QuestionDAO quesCreateDAO = new QuestionDAO();
		QuestionCategoryDAO quesDAO = new QuestionCategoryDAO();
		categoryList = quesDAO.categoryGet();
		QuestionDB quesDB = new QuestionDB();
		QuestionOptionDB quesOptionDB = new QuestionOptionDB();
		int qso_id = 0;
		quesDB.setQsm_id(questionId);
		quesDB.setQsm_question(questionText.toUpperCase());
		quesDB.setQsm_qsc_id(editQuestionCategory);
		quesCreateDAO.updateQuestion(quesDB);

		if (!editRowChoice.equals("")) {
			String[] choiceRowArr = editRowChoice.split(",");
			String[] choiceIdRowArr = rowChoiceId.split(",");
			for (int i = 0; i < choiceRowArr.length; i++) {
				qso_id = (Integer.parseInt(choiceIdRowArr[i].trim()));
				quesOptionDB.setQso_option(choiceRowArr[i].toUpperCase().trim());
				quesOptionDB.setQso_type('R');
				quesCreateDAO.updateOption(quesOptionDB, qso_id);
			}
		}
		if (!editAnsChoice.equals("")) {
			String[] choiceArr = editAnsChoice.split(",");
			String[] choiceIdArr = colChoiceId.split(",");
			for (int i = 0; i < choiceArr.length; i++) {
				qso_id = (Integer.parseInt(choiceIdArr[i].trim()));
				quesOptionDB.setQso_option(choiceArr[i].toUpperCase().trim());
				quesOptionDB.setQso_type('C');
				quesCreateDAO.updateOption(quesOptionDB, qso_id);
			}
		}

		if (!addColChoice.equals("")) {
			String[] choiceAddArr = addColChoice.split(",");
			for (int i = 0; i < choiceAddArr.length; i++) {
				quesOptionDB.setQso_option(choiceAddArr[i].toUpperCase().trim());
				quesOptionDB.setQso_type('C');
				quesOptionDB.setQso_qsm_id(questionId);
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}

		if (!addRowChoice.equals("")) {
			String[] choiceRowAddArr = addRowChoice.split(",");
			for (int i = 0; i < choiceRowAddArr.length; i++) {
				quesOptionDB.setQso_option(choiceRowAddArr[i].toUpperCase().trim());
				quesOptionDB.setQso_type('R');
				quesOptionDB.setQso_qsm_id(questionId);
				quesCreateDAO.insertOption(quesOptionDB);
			}
		}
		HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","UpdateKey");
		this.setMessage("Question updated successfully");
		return "SUCCESS";
	}

	public String delete() {
		QuestionCategoryDAO catDAO = new QuestionCategoryDAO();
		categoryList = catDAO.categoryGet();
		QuestionDAO quesDAO = new QuestionDAO();
		quesDAO.deleteQuestion(questionId);
		 HttpServletRequest request = ServletActionContext.getRequest(); 
		 HttpSession session=request.getSession();
		 session.setAttribute("key","DeleteKey");
		this.setMessage("Question deleted successfully");
		return "SUCCESS";
	}

	private int questionType = 0;
	private String questionText = "";
	private int questionCategory = 0;
	private String rowChoices = "";
	private String answerChoices = "";
	private char qo_type;
	private String label = "";
	private int editQuestionCategory = 0;
	private String editAnsChoice = "";
	private String editRowChoice = "";
	private int questionId = 0;
	private String addRowChoice = "";
	private String addColChoice = "";
	private String colChoiceId = "";
	private String rowChoiceId = "";
	private List questionList=null;
	private List categoryList=null;
	private String message="";

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
	 * @return the label
	 */
	public String getLabel() {
		return label;
	}

	/**
	 * @param label
	 *            the label to set
	 */
	public void setLabel(String label) {
		this.label = label;
	}

	/**
	 * @return the editQuestionCategory
	 */
	public int getEditQuestionCategory() {
		return editQuestionCategory;
	}

	/**
	 * @param editQuestionCategory
	 *            the editQuestionCategory to set
	 */
	public void setEditQuestionCategory(int editQuestionCategory) {
		this.editQuestionCategory = editQuestionCategory;
	}

	/**
	 * @return the editAnsChoice
	 */
	public String getEditAnsChoice() {
		return editAnsChoice;
	}

	/**
	 * @param editAnsChoice
	 *            the editAnsChoice to set
	 */
	public void setEditAnsChoice(String editAnsChoice) {
		this.editAnsChoice = editAnsChoice;
	}

	/**
	 * @return the editRowChoice
	 */
	public String getEditRowChoice() {
		return editRowChoice;
	}

	/**
	 * @param editRowChoice
	 *            the editRowChoice to set
	 */
	public void setEditRowChoice(String editRowChoice) {
		this.editRowChoice = editRowChoice;
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
	 * @return the addRowChoice
	 */
	public String getAddRowChoice() {
		return addRowChoice;
	}

	/**
	 * @param addRowChoice
	 *            the addRowChoice to set
	 */
	public void setAddRowChoice(String addRowChoice) {
		this.addRowChoice = addRowChoice;
	}

	/**
	 * @return the addColChoice
	 */
	public String getAddColChoice() {
		return addColChoice;
	}

	/**
	 * @param addColChoice
	 *            the addColChoice to set
	 */
	public void setAddColChoice(String addColChoice) {
		this.addColChoice = addColChoice;
	}

	/**
	 * @return the colChoiceId
	 */
	public String getColChoiceId() {
		return colChoiceId;
	}

	/**
	 * @param colChoiceId
	 *            the colChoiceId to set
	 */
	public void setColChoiceId(String colChoiceId) {
		this.colChoiceId = colChoiceId;
	}

	/**
	 * @return the rowChoiceId
	 */
	public String getRowChoiceId() {
		return rowChoiceId;
	}

	/**
	 * @param rowChoiceId
	 *            the rowChoiceId to set
	 */
	public void setRowChoiceId(String rowChoiceId) {
		this.rowChoiceId = rowChoiceId;
	}

	/**
	 * @return the questionList
	 */
	public List getQuestionList() {
		return questionList;
	}

	/**
	 * @param questionList the questionList to set
	 */
	public void setQuestionList(List questionList) {
		this.questionList = questionList;
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

	/**
	 * @return the questionCategory
	 */
	public int getQuestionCategory() {
		return questionCategory;
	}

	/**
	 * @param questionCategory the questionCategory to set
	 */
	public void setQuestionCategory(int questionCategory) {
		this.questionCategory = questionCategory;
	}

}
