/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.service;

import com.javaweb.hibernate.util.HibernateUtil;
import com.javaweb.model.Loaitaikhoan;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DuongNguyen
 */
public class LoaitaikhoanService {

    //Get Loại tài khoản theo ID
    public Loaitaikhoan GetLoaitaikhoanByID(int IDTaikhoan) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            tx.commit();

            String strQuery = "from Loaitaikhoan where idLoaitaikhoan=" + IDTaikhoan;
            Query query = session.createQuery(strQuery);
            Loaitaikhoan loaitaikhoan = (Loaitaikhoan) query.uniqueResult();
            return loaitaikhoan;
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
}
