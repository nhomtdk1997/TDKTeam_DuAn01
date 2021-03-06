/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Taikhoan;
import com.javaweb.service.EnDeCryption;
import com.javaweb.service.TaikhoanService;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DuongNguyen
 */
public class SuaTaiKhoanServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvalidKeyException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String idTaikhoan, TenDangNhap, Email, MatKhau, MatKhau2;
        idTaikhoan = request.getParameter("idTaikhoan");
        TenDangNhap = request.getParameter("Username");
        Email = request.getParameter("Email");
        MatKhau = request.getParameter("Passwd");
        MatKhau2 = request.getParameter("Passwd2nd");
        int loaiTK = Integer.parseInt(request.getParameter("loaiTK"));

        EnDeCryption encryption = new EnDeCryption("TDKTeam_MaHoaMatKhau");
        String passmahoa = encryption.encoding(MatKhau);
        TaikhoanService tksv = new TaikhoanService();
        Taikhoan tk = tksv.GetUserById(idTaikhoan);
        tk.setTenDangNhap(TenDangNhap);
        tk.setEmail(Email);
        tk.setMatKhau(passmahoa);
        tk.setIdLoaiTk(loaiTK);

        HttpSession session = request.getSession();
        if (!MatKhau.equals(MatKhau2)) {
            session.setAttribute("kiemtra", "0");
            request.getRequestDispatcher("SuaTaiKhoan.jsp").forward(request, response);
        } else {
            tksv.InsertTaikhoan(tk);
            session.setAttribute("kiemtra", "1");
            request.getRequestDispatcher("SuaTaiKhoan.jsp").forward(request, response);
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SuaTaiKhoanServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SuaTaiKhoanServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(SuaTaiKhoanServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InvalidKeyException ex) {
            Logger.getLogger(SuaTaiKhoanServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
