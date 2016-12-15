/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.service;

import com.javaweb.hibernate.util.HibernateUtil;
import com.javaweb.model.Chuyenbay;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DuongNguyen
 */
public class ChuyenbayService {

    //Tìm chuyến bay
    public ArrayList<Chuyenbay> SearchChuyenbay(String Tu, String Den, String NgayKhoiHanh) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList listChuyenbay = new ArrayList<Chuyenbay>();

        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Chuyenbay where "
                    + "Tu like  '" + Tu + "' and "
                    + "Den like '" + Den + "' "
                    + "and NgayKhoiHanh = '" + NgayKhoiHanh + "'");
            listChuyenbay = (ArrayList) query.list();
            tx.commit();

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return listChuyenbay;
    }

    //Lấy Chuyến bay theo ID
    public Chuyenbay GetChuyenbayById(String ChuyenbayID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            String strQuery = "from Chuyenbay where idchuyenbay = " + ChuyenbayID;
            Query query = session.createQuery(strQuery);
            Chuyenbay cb = (Chuyenbay) query.uniqueResult();
            tx.commit();
            return cb;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println(e.toString());
        } finally {
            session.close();
        }
        return null;
    }

    //Lấy tất cả thông tin tài khoản
    public ArrayList<Chuyenbay> GetAllChuyenbay() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Chuyenbay> listChuyenbay = new ArrayList<Chuyenbay>();
        try {
            tx = session.getTransaction();
            tx.begin();

            Query query = session.createQuery("from Chuyenbay");
            listChuyenbay = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("Loi" + e.toString());
        } finally {
            session.close();
        }
        return listChuyenbay;
    }
}