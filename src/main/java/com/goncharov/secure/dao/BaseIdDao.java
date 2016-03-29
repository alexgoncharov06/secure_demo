package com.goncharov.secure.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.goncharov.secure.entity.interfaces.BaseID;
import com.goncharov.secure.hibernate.util.HibernateMyUtil;

public class BaseIdDao {
	private static final Logger log = Logger.getLogger(BaseIdDao.class
			.getName());

	public BaseIdDao() {
	}

	public static void add(BaseID baseId) throws SQLException {
		Session session = null;
		try {
			session = HibernateMyUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(baseId);
			session.getTransaction().commit();
		} catch (Exception e) {
			log.severe(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}

	}

	public static void update(BaseID baseId) throws SQLException {
		Session session = null;
		try {
			session = HibernateMyUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.update(baseId);
			session.getTransaction().commit();
		} catch (Exception e) {
			log.severe(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
	}

	public static void modifyError(BaseID baseId) throws SQLException {
		Session session = null;
		try {
			session = HibernateMyUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.save(baseId);
			session.getTransaction().commit();
		} catch (Exception e) {
			log.severe(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
	}

	public static BaseID getById(int id) throws SQLException {
		BaseID error = null;
		Session session = null;
		try {
			session = HibernateMyUtil.getSessionFactory().openSession();
			error = (BaseID) session.get(BaseID.class, id);
		} catch (Exception e) {
			log.severe(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return error;
	}

	@SuppressWarnings("unchecked")
	public List<BaseID> getAll() throws SQLException {
		Session session = null;
		List<BaseID> baseIds = null;
		try {
			session = HibernateMyUtil.getSessionFactory().openSession();
			baseIds = session.createCriteria(BaseID.class)
					.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		} catch (Exception e) {
			log.severe(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return baseIds;
	}

	public static void delete(BaseID baseId) throws SQLException {
		Session session = null;
		try {
			session = HibernateMyUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.delete(baseId);
			session.getTransaction().commit();
		} catch (Exception e) {
			log.severe(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
	}

}
