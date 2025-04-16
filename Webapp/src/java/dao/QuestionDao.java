package dao;

import entities.Question;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class QuestionDao implements IDao<Question> {

    @Override
    public boolean create(Question o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(o);
            tx.commit();
            etat = true;
        } catch (HibernateException e) {
            if (tx != null) 
                tx.rollback();
        } finally {
            if (session != null) 
                session.close();
        }
        return etat;
    }

    @Override
    public boolean delete(Question o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(o);
            tx.commit();
            etat = true;
        } catch (HibernateException e) {
            if (tx != null) 
                tx.rollback();
        } finally {
            if (session != null) 
                session.close();
        }
        return etat;
    }

    @Override
    public boolean update(Question o) {
        Session session = null;
        Transaction tx = null;
        boolean etat = false;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(o);
            tx.commit();
            etat = true;
        } catch (HibernateException e) {
            if (tx != null) 
                tx.rollback();
        } finally {
            if (session != null) 
                session.close();
        }
        return etat;
    }

    @Override
    public List<Question> findAll() {
        Session session = null;
        Transaction tx = null;
        List<Question> questions = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            questions = session.createQuery("from Question").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) 
                tx.rollback();
        } finally {
            if (session != null) 
                session.close();
        }
        return questions;
    }

    @Override
    public Question findById(int id) {
        Session session = null;
        Transaction tx = null;
        Question question = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            question = (Question) session.get(Question.class, id);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) 
                tx.rollback();
        } finally {
            if (session != null) 
                session.close();
        }
        return question;
    }
}
