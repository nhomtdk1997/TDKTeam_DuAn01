/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.service;

import com.javaweb.hibernate.util.HibernateUtil;
import com.javaweb.model.Loaitintuc;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DuongNguyen
 */
public class LoaitintucService {
    
    //Get Loại tin tức theo ID
    public Loaitintuc GetLoaitintucByID(int IDLoaitin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            tx.commit();

            String strQuery = "from Loaitintuc where IdLoaitin =" + IDLoaitin;
            Query query = session.createQuery(strQuery);
            Loaitintuc loaitintuc = (Loaitintuc) query.uniqueResult();
            return loaitintuc;
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
