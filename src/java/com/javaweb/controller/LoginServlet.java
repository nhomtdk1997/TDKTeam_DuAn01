/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Nguoidung;
import com.javaweb.model.Taikhoan;
import com.javaweb.service.EnDeCryption;
import com.javaweb.service.NguoidungService;
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
public class LoginServlet extends HttpServlet {

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

        String username, password;
        username = request.getParameter("username");
        password = request.getParameter("pwd");

        boolean KiemTra;
        EnDeCryption encryption = new EnDeCryption("TDKTeam_MaHoaMatKhau");
        String passmahoa = encryption.encoding(password);
        TaikhoanService tk = new TaikhoanService();
        NguoidungService ndsv = new NguoidungService();
        KiemTra = tk.CheckLogin(username, passmahoa);

        HttpSession session = request.getSession();
        
        if (KiemTra) {
            Taikhoan taikhoan = tk.GetUserByEmailOrUserName(username);
            Nguoidung nguoidung = ndsv.GetUserByIdTaikhoan(taikhoan.getIdTaiKhoan());
            session.setAttribute("youruser", nguoidung.getHo() + " " + nguoidung.getDemVaTen());
            session.setAttribute("iduser", taikhoan.getIdTaiKhoan());
            session.setAttribute("HoNguoidung", nguoidung.getHo());
            session.setAttribute("DemvatenNguoidung", nguoidung.getDemVaTen());
            session.setAttribute("DiachiNguoidung", nguoidung.getDiaChi());
            session.setAttribute("NgaysinhNguoidung", nguoidung.getNgaySinh());
            session.setAttribute("SDTNguoidung", nguoidung.getSdt());
            session.setAttribute("CMNDNguoidung", nguoidung.getSoCmnd());
            session.setAttribute("TKRole", taikhoan.getIdLoaiTk());
            try {
                Thread.sleep(1000);
                String url = "/index.jsp";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            } catch (InterruptedException e) {
            }
        } else {
            try {
                Thread.sleep(1000);
                String url = "/index.jsp";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            } catch (InterruptedException e) {
            }
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet LoginServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
