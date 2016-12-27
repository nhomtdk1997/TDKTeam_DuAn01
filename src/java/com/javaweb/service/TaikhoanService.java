/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.service;

import com.javaweb.hibernate.util.HibernateUtil;
import com.javaweb.model.Taikhoan;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DuongNguyen
 */
public class TaikhoanService {

    //Cập nhật tài khoản
    public boolean InsertTaikhoan(Taikhoan tk) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            session.saveOrUpdate(tk);
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

    //Xóa tài khoản
    public boolean DeleteTaikhoan(int idTK) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            Taikhoan tk = new Taikhoan();
            tk.setIdTaiKhoan(idTK);
            session.delete(tk);
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

    //Lấy tài khoản theo Email hoặc Username
    public Taikhoan GetUserByEmailOrUserName(String GiaTriNguoiDungNhap) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            String strQuery = "from Taikhoan where email='" + GiaTriNguoiDungNhap + "'or tendangnhap = '" + GiaTriNguoiDungNhap + "' ";
            Query query = session.createQuery(strQuery);
            Taikhoan tk = (Taikhoan) query.uniqueResult();
            tx.commit();
            return tk;
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

    //Kiểm tra đăng nhập
    public boolean CheckLogin(String Username, String MatKhau) {
        Taikhoan tk = GetUserByEmailOrUserName(Username);
        if (tk == null) {
            return false;
        } else if (tk.getMatKhau().equals(MatKhau)) {
            return true;
        } else {
            return false;
        }
    }

    //Lấy tất cả thông tin tài khoản
    public ArrayList<Taikhoan> GetAllTaikhoan() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Taikhoan> listTaikhoan = new ArrayList<Taikhoan>();
        try {
            tx = session.getTransaction();
            tx.begin();

            Query query = session.createQuery("from Taikhoan");
            listTaikhoan = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("Loi" + e.toString());
        } finally {
            session.close();
        }
        return listTaikhoan;
    }

    //Lấy tài khoản theo ID
    public Taikhoan GetUserById(String taikhoanID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.getTransaction();
            tx.begin();
            String strQuery = "from Taikhoan where idtaikhoan = " + taikhoanID;
            Query query = session.createQuery(strQuery);
            Taikhoan tk = (Taikhoan) query.uniqueResult();
            tx.commit();
            return tk;
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
    
    public int taikhoancount = 0;

    //Lấy tất cả thông tin tài khoản
    public ArrayList<Taikhoan> GetAllTaikhoan(int pageSize, int pageNumber) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList<Taikhoan> listTaikhoan = new ArrayList<Taikhoan>();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Taikhoan");
            taikhoancount = query.list().size();
            query = query.setFirstResult(pageSize * (pageNumber - 1));
            query.setMaxResults(pageSize);
            listTaikhoan = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return listTaikhoan;
    }

    //Tìm Tài khoản
    public ArrayList<Taikhoan> SearchTaikhoan(int pageSize, int pageNumber, String Email) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        ArrayList listTaikhoan = new ArrayList<Taikhoan>();
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Taikhoan where Email like '%"+Email+"%'");
            taikhoancount = query.list().size();
            query = query.setFirstResult(pageSize * (pageNumber - 1));
            query.setMaxResults(pageSize);
            listTaikhoan = (ArrayList) query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return listTaikhoan;
    }
    
}
