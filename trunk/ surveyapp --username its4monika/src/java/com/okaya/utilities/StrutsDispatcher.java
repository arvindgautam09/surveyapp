
package com.okaya.utilities;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;

import org.apache.struts2.dispatcher.FilterDispatcher;
import org.hibernate.HibernateException;



/**
 * @author monika
 *
 */


public class StrutsDispatcher extends FilterDispatcher {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		super.init(filterConfig);
		try {
			HibernateUtil.createSessionFactory();
			System.out.print("application initializing successfully");
		} catch (HibernateException e) {
			throw new ServletException(e);
		}

	}

}
