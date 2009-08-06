package com.okaya.services.survey.dao;




import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.okaya.services.survey.dataBean.QuestionDB;
import com.okaya.services.survey.dataBean.QuestionOptionDB;
import com.okaya.utilities.HibernateUtil;
/**
 * @author sameera
 * 
 */
public class CreateQuestionDAO {
	public int insertQuestion(QuestionDB quesDB) {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		int id = 0;
		try {
			tx = session.beginTransaction();
			session.save(quesDB);
			id = quesDB.getQsm_id();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return id;
	}

	public void insertOption(QuestionOptionDB quesOptionDB) {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(quesOptionDB);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	public List getQuestionName(){
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List QuesNameList = null;
		try {
			tx = session.beginTransaction();
			QuesNameList = session
					.createQuery(
							"from com.okaya.services.survey.dataBean.QuestionDB where qsm_flag='E' ")
					.list();
			
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return QuesNameList;
	}
	public List getQuestionNameAccCategory(int index){
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List QuesNameList = null;
		try {
			tx = session.beginTransaction();
			QuesNameList = session
					.createQuery(
							"from com.okaya.services.survey.dataBean.QuestionDB where qsm_qsc_id="+index)
					.list();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return QuesNameList;
	}
	
	public QuestionDB getQuestionDetail(int qsmId){
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List QuesDetailList = null;
		QuestionDB quesDB =new QuestionDB();
		try {
			tx = session.beginTransaction();
			
			quesDB =	(QuestionDB)session.load(QuestionDB.class, qsmId);
						//	"from com.okaya.services.survey.dataBean.QuestionDB where qsm_id="+qsmId)
					//.list();
			System.out.println("in DaO-->"+quesDB);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return quesDB;
	}
	
	

}