/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.service;

import com.javaweb.hibernate.util.HibernateUtil;
import com.javaweb.model.Tintuc;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DuongNguyen
 */
public class TintucService {
    
    //Lấy tất cả tin tức
    public ArrayList<Tintuc> GetAllTintuc() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Tintuc> listTintuc = new ArrayList<Tintuc>();
        try {
            tx = session.getTransaction();
            tx.begin();

            Query query = session.createQuery("from Tintuc");
            listTintuc = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("Error!" + e.toString());
        } finally {
            session.close();
        }
        return listTintuc;
    }

    //Thêm or sửa tin tức
    public boolean InsertTintuc(Tintuc tt) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(tt);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println(e.toString());
        } finally {
            session.close();
        }
        return false;
    }

    //Get tin tức ID
    public Tintuc GetTintucID(String TintucID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            tx.commit();

            String strQuery = "from Tintuc where idTinTuc =" + TintucID;
            Query query = session.createQuery(strQuery);
            Tintuc tintuc = (Tintuc) query.uniqueResult();
            return tintuc;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                System.out.println(e.toString());
            }
        } finally {
            session.close();
        }
        return null;
    }

    //Xóa Tin Tức
    public boolean DeleteTintuc(int idtt) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            Tintuc tt = new Tintuc();
            tt.setIdtintuc(idtt);
            session.delete(tt);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println(e.toString());
        } finally {
            session.close();
        }

        return false;
    }
}
