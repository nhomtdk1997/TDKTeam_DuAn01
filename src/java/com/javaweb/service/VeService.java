/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * ave open the template in the editor.
 */
package com.javaweb.service;

import com.javaweb.hibernate.util.HibernateUtil;
import com.javaweb.model.Ve;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DuongNguyen
 */
public class VeService {

    //Cập nhật Vé
    public boolean InsertVe(Ve ve) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(ve);
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

    //Lấy Vé theo ID
    public Ve GetVeById(String VeID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            String strQuery = "from Ve where idve = " + VeID;
            Query query = session.createQuery(strQuery);
            Ve ve = (Ve) query.uniqueResult();
            tx.commit();
            return ve;
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

    //Lấy thông tin vé theo ID Taikhoan
    public ArrayList<Ve> GetVeByIdTaikhoan(String VeID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Ve> listVe = new ArrayList<Ve>();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Ve where idtaikhoan = " + VeID);
            listVe = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("Error!" + e.toString());
        } finally {
            session.close();
        }
        return listVe;
    }
    
    //Lấy tất cả thông tin Vé
    public ArrayList<Ve> GetAllVe() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Ve> listVe = new ArrayList<Ve>();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Ve");
            listVe = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("Loi" + e.toString());
        } finally {
            session.close();
        }
        return listVe;
    }
    
    public int vecount = 0;
    //Lấy tất cả thông tin vé chia page
    public ArrayList<Ve> GetAllVe(int pageSize, int pageNumber) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Ve> listVe = new ArrayList<Ve>();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Ve");
            vecount = query.list().size();
            query = query.setFirstResult(pageSize * (pageNumber - 1));
            query.setMaxResults(pageSize);
            listVe = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return listVe;
    }
}
