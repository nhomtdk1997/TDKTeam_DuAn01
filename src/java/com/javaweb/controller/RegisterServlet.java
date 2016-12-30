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
import java.io.PrintWriter;
import java.security.InvalidKeyException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String Ho, DemVaTen, DiaChi, SDT, SoCMND, TenDangNhap, Email, MatKhau, MatKhau2;
        int loaiTK, QuocTich;

        //Xử lý giới tính
        String gioitinh = request.getParameter("gender-switch");
        boolean GioiTinh = true;
        if (gioitinh.equals("female")) {
            GioiTinh = false;
        }

        //Xử lý ngày tháng năm sinh
        String ngay = request.getParameter("ngay");
        String thang = request.getParameter("thang");
        String nam = request.getParameter("nam");
        String ngaysinh = nam + "-" + thang + "-" + ngay;
        Date NgaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);

        loaiTK = 6; // 6 là loại tài khoản đành cho khách hàng thường
        Ho = request.getParameter("LastName");
        DemVaTen = request.getParameter("FirstName");
        DiaChi = request.getParameter("Address1");
        SDT = request.getParameter("SDT");
        SoCMND = request.getParameter("PasportNum");
        QuocTich = Integer.parseInt(request.getParameter("quoctich"));
        TenDangNhap = request.getParameter("Username");
        Email = request.getParameter("Email");
        MatKhau = request.getParameter("Passwd");
        MatKhau2 = request.getParameter("Passwd2nd");

        HttpSession session = request.getSession();
        if (!MatKhau.equals(MatKhau2)) {
            session.setAttribute("kiemtra", "0");
            String url = "/Register.jsp";
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } else {
            try {
                session.setAttribute("kiemtra", "1");
                EnDeCryption encryption = new EnDeCryption("TDKTeam_MaHoaMatKhau");
                String Matkhaumahoa = encryption.encoding(MatKhau);

                //Tạo một người dùng mới với những thông tin trên sau đó thêm vào database
                Nguoidung nd = new Nguoidung(Ho, DemVaTen, GioiTinh, NgaySinh, DiaChi, SDT, SoCMND, QuocTich);
                NguoidungService nguoidungservice = new NguoidungService();
                nguoidungservice.InsertNguoidung(nd);

                //Tạo một tài khoản mới với những thông tin trên sau đó thêm váo database
                Taikhoan tk = new Taikhoan(nd.getIdnguoidung(), TenDangNhap, Email, Matkhaumahoa, loaiTK);
                TaikhoanService taikhoanservice = new TaikhoanService();
                taikhoanservice.InsertTaikhoan(tk);

                response.sendRedirect("Register.jsp");
            } catch (InvalidKeyException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        } catch (ParseException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
