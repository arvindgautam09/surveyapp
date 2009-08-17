/**
 * 
 */
package com.okaya.services.survey.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.okaya.services.survey.dataBean.SurveyTypeDB;
import com.okaya.utilities.HibernateUtil;

/**
 * @author sameera
 * 
 */
public class SurveyTypeDAO {

	public void insertSurveyType(String surveyType) {
		System.out.println("in insert");
		// HibernateUtil.createSessionFactory();
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			SurveyTypeDB surType = new SurveyTypeDB();
			// surType.setSrt_id(1);
			surType.setSrt_name(surveyType.toUpperCase());
			session.save(surType);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	public List getSurveyTypeList() {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List result = null;
		try {
			tx = session.beginTransaction();
			result = session
					.createQuery(
							" from com.okaya.services.survey.dataBean.SurveyTypeDB where srt_flag='E' ").list();
				
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return result;
	}

	public void updateSurveyType(String surveyType, int surveyTypeId) {
		System.out.println("in insert surveytype--->" + surveyType);
		System.out.println("in insert editsurveyType--->" + surveyTypeId);
		SessionFactory factory = null;
		Session session = null;
		try {
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			Transaction tx = session.beginTransaction();
			String hql = " UPDATE SurveyTypeDB SET SRT_NAME='"
					+ surveyType.toUpperCase() + "'where srt_id ="
					+ surveyTypeId;
			Query query = session.createQuery(hql);
			System.out.println("query is---->" + query);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			System.out.println("Exception is::::" + e.getMessage());
		} finally {
			// Actual contact insertion will happen at this step
			if (session != null) {
				session.flush();
				session.close();
			}
		}

	}

	public void deleteSurveyType(int surveyTypeId) {
		System.out.println("in delete surveytype--->" + surveyTypeId);
		SessionFactory factory = null;
		Session session = null;
		try {
			// Create the SessionFactory from hibernate.cfg.xml
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			Transaction tx = session.beginTransaction();
			// String hql = "delete from SurveyTypeDB where srt_name
			// ='"+surveyType+"'";
			String hql = "UPDATE SurveyTypeDB SET SRT_FLAG='D'  where srt_id ="
					+ surveyTypeId;
			Query query = session.createQuery(hql);
			System.out.println("query is---->" + query);
			query.executeUpdate();

			tx.commit();
		} catch (Exception e) {
			System.out.println("Exception is::::" + e.getMessage());
		} finally {
			// Actual contact insertion will happen at this step
			if (session != null) {
				session.flush();
				session.close();
			}
		}

	}
}
