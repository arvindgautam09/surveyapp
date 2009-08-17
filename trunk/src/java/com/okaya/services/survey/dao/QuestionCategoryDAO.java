package com.okaya.services.survey.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.okaya.services.survey.dataBean.QuestionCategoryDB;
import com.okaya.services.survey.dataBean.SurveyTypeDB;
import com.okaya.utilities.HibernateUtil;
/**
 * @author sameera
 * 
 */
public class QuestionCategoryDAO {
	public void categoryInsert(String questionCategory) {
		System.out.println("in insert questionCategory" + questionCategory);
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			QuestionCategoryDB quesCategory = new QuestionCategoryDB();
			quesCategory.setQsc_name(questionCategory.toUpperCase());
			session.save(quesCategory);
			tx.commit();

		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}

	}

	public List getCategoryList() {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List categoryList = null;
		try {
			tx = session.beginTransaction();
			categoryList = session
					.createQuery(
							"from com.okaya.services.survey.dataBean.QuestionCategoryDB where qsc_flag='E' ")
					.list();
			
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		System.out.println(categoryList);
		return categoryList;
	}
	
	public void categoryUpdate(int categoryId, String questionCategory) {
	
		Session session = null;
		try {
			SessionFactory fact = new Configuration().configure()
					.buildSessionFactory();
			session = fact.openSession();
			Transaction tx = session.beginTransaction();
			String hql = " UPDATE QuestionCategoryDB SET QSC_NAME='"
					+ questionCategory.toUpperCase() + "'where QSC_ID ="
					+ categoryId;
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
	
	public void categoryDelete(int categoryId) {
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
			String hql = "UPDATE QuestionCategoryDB SET QSC_FLAG='D'  where qsc_id ="
					+ categoryId;
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
	
	public List categoryGet() {
		Session session = HibernateUtil.getSession();
		Transaction tx = null;
		List categoryList = null;
		try {
			tx = session.beginTransaction();
			categoryList = session
					.createQuery(
							"from com.okaya.services.survey.dataBean.QuestionCategoryDB where qsc_flag='E' ")
					.list();
			
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		} finally {
			session.close();
		}
		return categoryList;
	}
	
}