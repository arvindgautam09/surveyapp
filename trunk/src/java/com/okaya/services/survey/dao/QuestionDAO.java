package com.okaya.services.survey.dao;

import java.util.List;

import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.okaya.services.survey.dataBean.QuestionDB;
import com.okaya.services.survey.dataBean.QuestionOptionDB;
import com.okaya.utilities.HibernateUtil;

/**
 * @author sameera
 * 
 */
public class QuestionDAO {
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

	public int updateQuestion(QuestionDB quesDB) {
		Session session = null;
		int id = 0;
		try {
			SessionFactory fact = new Configuration().configure()
			.buildSessionFactory();
			session = fact.openSession();
			Transaction tx = session.beginTransaction();
			String hql = " UPDATE QuestionDB SET QSM_QUESTION='"
				+ quesDB.getQsm_question().toUpperCase() + "', "
				+ "QSM_QSC_ID=" + quesDB.getQsm_qsc_id()
				+ " where QSM_ID =" + quesDB.getQsm_id() + "";
			Query query = session.createQuery(hql);
			id = quesDB.getQsm_id();
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			System.out.println("Exception is::::" + e.getMessage());
		} finally {
			if (session != null) {
				session.flush();
				session.close();
			}
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

	public void updateOption(QuestionOptionDB quesOptionDB, int qso_id) {
		Session session = null;
		try {
			SessionFactory fact = new Configuration().configure()
			.buildSessionFactory();
			session = fact.openSession();
			Transaction tx = session.beginTransaction();
			String hql = " UPDATE QuestionOptionDB SET QSO_OPTION='"
				+ quesOptionDB.getQso_option().toUpperCase()
				+ "',QSO_TYPE='" + quesOptionDB.getQso_type()
				+ "' where QSO_ID =" + qso_id + "";
			Query query = session.createQuery(hql);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			System.out.println("Exception is::::" + e.getMessage());
		} finally {
			if (session != null) {
				session.flush();
				session.close();
			}
		}
	}

	public List getQuestionList() {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List questionList = null;
		try {
			tx = session.beginTransaction();
			questionList = session
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
		return questionList;
	}

	public List getQuestionsByCategory(int index) {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List QuesNameList = null;
		try {
			tx = session.beginTransaction();
			QuesNameList = session.createQuery(
					"from com.okaya.services.survey.dataBean.QuestionDB where qsm_qsc_id="+index+"and qsm_flag='E'" ).list();
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

	public QuestionDB getQuestionDetail(int qsmId) {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		QuestionDB quesDB = new QuestionDB();
		try {
			tx = session.beginTransaction();
			quesDB = (QuestionDB) session.createCriteria(QuestionDB.class)
			.setFetchMode("optionSet", FetchMode.JOIN)
			.add( Restrictions.idEq(qsmId) )
			.uniqueResult();
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
	

	public void deleteQuestion(int deleteQuestionId){
		Session session = HibernateUtil.getSession();
		try {
			Transaction tx = session.beginTransaction();
			String hql = "UPDATE QuestionDB SET QSM_FLAG='D'  where qsm_id ="
				+ deleteQuestionId + "";
			Query query = session.createQuery(hql);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			System.out.println("Exception is::::" + e.getMessage());
		} finally {
			if (session != null) {
				session.flush();
				session.close();
			}
		}

	}

}