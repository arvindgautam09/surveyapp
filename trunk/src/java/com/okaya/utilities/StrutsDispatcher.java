/**
 * 
 */
package com.okaya.utilities;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;

import org.apache.struts2.dispatcher.FilterDispatcher;
import org.hibernate.HibernateException;

/**
 * @author Monika
 *
 */
public class StrutsDispatcher extends FilterDispatcher {

	/* (non-Javadoc)
	 * @see org.apache.struts2.dispatcher.FilterDispatcher#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		super.init(filterConfig);
		try{
			//HibernateUtil.createSessionFactory();
			System.out.println("Application initialized successfully.");
		}catch (HibernateException e) {
			throw new ServletException(e);
		}
	}
	
}
