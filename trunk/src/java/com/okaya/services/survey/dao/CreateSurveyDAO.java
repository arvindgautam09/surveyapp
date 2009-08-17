package com.okaya.services.survey.dao;

import java.util.List;

import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import com.okaya.services.survey.dataBean.SurveyDB;
import com.okaya.services.survey.dataBean.SurveyQuestionDB;
import com.okaya.utilities.HibernateUtil;

/**
 * @author sameera
 * 
 */
public class CreateSurveyDAO {

	public int insertSurvey(SurveyDB surveyDB) {
		int id = 0;
		// HibernateUtil.createSessionFactory();
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(surveyDB);
			id = surveyDB.getSrm_id();
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

	public int insertSurveyQuestion(SurveyQuestionDB surveyQuesDB) {

		int id = 0;
		// HibernateUtil.createSessionFactory();
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(surveyQuesDB);
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

	public List getSurveyName() {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List surveyNameList = null;
		try {
			tx = session.beginTransaction();
			surveyNameList = session
					.createQuery(
							" from com.okaya.services.survey.dataBean.SurveyDB where srm_status='C' and SRM_FLAG='E' ")
					.list();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return surveyNameList;
	}

	public void deleteSurveyName(String surveyName) {
		SessionFactory factory = null;
		Session session = null;
		Transaction tx = null;
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			tx = session.beginTransaction();
			// ='"+surveyType+"'";
			String hql = "UPDATE SurveyDB SET SRM_FLAG='D'  where SRM_ID ="
					+ surveyName + "";
			Query query = session.createQuery(hql);
			System.out.println("query is---->" + query);
			query.executeUpdate();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	
	
	public void deleteSurveyQuestionMapping(int surveyId) {
		SessionFactory factory = null;
		Session session = null;
		Transaction tx = null;
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			tx = session.beginTransaction();
			// ='"+surveyType+"'";
			//DELETE FROM ROLE_PRIVILEGE WHERE RP_PM_ID='"+privid+"'";
			String hql = "DELETE FROM SurveyQuestionDB where SQM_SRM_ID ="+surveyId+"";
			Query query = session.createQuery(hql);
			System.out.println("query is---->" + query);
			query.executeUpdate();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
	

	public void updateSurvey(SurveyDB surveyDB, int srmId) {
		System.out.println(surveyDB.getSrm_name());
		System.out.println(surveyDB.getSrm_repeat_count());
		System.out.println(surveyDB.getSrm_repeat_interval());
		System.out.println(surveyDB.getSrm_srt_id());
		System.out.println(surveyDB.getSrm_status());
		SessionFactory factory = null;
		Session session = null;
		Transaction tx = null;
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			tx = session.beginTransaction();
			String hql = " UPDATE SurveyDB SET SRM_NAME='"
					+ surveyDB.getSrm_name().toUpperCase() + "', "
					+ "SRM_REPEAT_COUNT=" + surveyDB.getSrm_repeat_count()
					+ "," + "SRM_REPEAT_INTERVAL="
					+ surveyDB.getSrm_repeat_interval() + "," + "SRM_SRT_ID="
					+ surveyDB.getSrm_srt_id() + "," + "SRM_STATUS='"
					+ surveyDB.getSrm_status() + "' where SRM_ID =" + srmId + "";
			Query query = session.createQuery(hql);
			System.out.println("query is---->" + query);
			query.executeUpdate();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	public void updateSurveyOption(SurveyQuestionDB surveyQuesDB, int srmId) {
		System.out.println(surveyQuesDB.getSqm_qsm_id());
		System.out.println(surveyQuesDB.getSqm_srm_id());
		SessionFactory factory = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			tx = session.beginTransaction();
			String hql = " UPDATE SurveyQuestionDB SET SQM_QSM_ID="
					+ surveyQuesDB.getSqm_qsm_id()
					+ " where SQM_SRM_ID =" + srmId + "";
			Query query = session.createQuery(hql);
			System.out.println("query is---->" + query);
			query.executeUpdate();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	public SurveyDB getSurveyDetails(int srmId) {
		Session session = HibernateUtil.getSession();
		SurveyDB surveyDB = new SurveyDB();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			surveyDB = (SurveyDB) session.createCriteria(SurveyDB.class)
					.setFetchMode("questionSet", FetchMode.JOIN).add(
							Restrictions.idEq(srmId)).uniqueResult();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return surveyDB;
	}

}
