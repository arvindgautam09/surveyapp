package com.okaya.services.survey.ajax;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.okaya.services.survey.dao.CreateQuestionDAO;
import com.okaya.services.survey.dataBean.QuestionDB;
import com.okaya.services.survey.dataBean.QuestionOptionDB;

/**
 * 
 * @author sameera
 */
public class GetQuestionNameAjaxAction {
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/json");
		//String categoryId = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(request.getParameter("questionCategory"));
		System.out.println("categoryId is-->" + categoryId);
		int qsmId = 0;
		if(request.getParameter("qsmId")!=null)
		qsmId = Integer.parseInt(request.getParameter("qsmId"));
		//System.out.println("qsmId is-->" + qsmId);
		PrintWriter out = response.getWriter();
		CreateQuestionDAO quesCreateDAO = new CreateQuestionDAO();
		QuestionDB quesDB = new QuestionDB();
		QuestionOptionDB  quesOptionDB = new QuestionOptionDB();
		String quesName = "";
		int quesId = 0;
		String quesNameIdList = "";
		if (categoryId != 0) {
			System.out.println("in index");
			quesNameList = quesCreateDAO.getQuestionNameAccCategory(categoryId);
			System.out.println(quesNameList);
			for (int i = 0; i < quesNameList.size(); i++) {
				quesDB = (QuestionDB) quesNameList.get(i);
				quesName = quesDB.getQsm_question();
				quesId = quesDB.getQsm_id();
				quesNameIdList += quesName + ";" + quesId + ",";
			}
			out.print(quesNameList);
		}
		if (qsmId != 0) {
			System.out.println("in qsm");
			String quesDetailList ="";
			String quesDetailList_C ="";
			String quesDetailList_R ="";
			char option_C=' ';
			char option_R=' ';
			char optionType;
			quesDB = quesCreateDAO.getQuestionDetail(qsmId);
			System.out.println("quesDB is-->"+quesDB.getOptionSet());
			Iterator ts1 = quesDB.getOptionSet().iterator (  ) ; 
			 while ( ts1.hasNext (  )  )  {  			 
			 quesOptionDB=  (QuestionOptionDB)ts1.next();
			 optionType = quesOptionDB.getQso_type();
			 if(optionType=='C'){
				 quesDetailList_C+=quesOptionDB.getQso_option()+";"+optionType+",";
			 }
			 
			 if(optionType=='R'){
				 quesDetailList_R+=quesOptionDB.getQso_option()+";"+optionType+",";
			 }
			
			 
			 } 
			 quesDetailList+=quesDetailList_C+"/"+quesDetailList_R+"/";
			 System.out.println("quesDetailList_C is-->"+quesDetailList_C);
			 System.out.println("quesDetailList_R is-->"+quesDetailList_R);
		out.print(quesDetailList);
		}
		
		return null;
	}
	
	List quesNameList=null;

	/**
	 * @return the quesNameList
	 */
	public List getQuesNameList() {
		return quesNameList;
	}

	/**
	 * @param quesNameList the quesNameList to set
	 */
	public void setQuesNameList(List quesNameList) {
		this.quesNameList = quesNameList;
	}
	
}
