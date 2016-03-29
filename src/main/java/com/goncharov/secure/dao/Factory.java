package com.goncharov.secure.dao;

import com.goncharov.secure.hibernate.util.HibernateMyUtil;
import org.hibernate.SessionFactory;

public class Factory {
	private static Factory instance = null;

	private static LoginDao loginDao = null;
	
	private static BaseIdDao baseDao = null;

	private static SessionFactory sessionFactory = null;

	public static synchronized Factory getInstance() {
		if (sessionFactory == null) {
			 instance = new Factory();
			sessionFactory = HibernateMyUtil.getSessionFactory();
		}
		
		
		return instance;
	}

	public static LoginDao getLoginDAO() {
		if (loginDao == null) {
			loginDao = new LoginDao();
		}
		return loginDao;
	}

	public static BaseIdDao getBaseDao() {
		if (baseDao == null) {
			baseDao = new BaseIdDao();
		}
		return baseDao;
	}

	

	

}
