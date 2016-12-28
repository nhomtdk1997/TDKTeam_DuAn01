/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Nguoidung;
import com.javaweb.service.NguoidungService;
import java.io.IOException;
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
public class SuaNguoiDungServlet extends HttpServlet {

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

        String Ho, DemVaTen, DiaChi, SDT, SoCMND;
        int QuocTich, idnguoidung;

        //Xử lý giới tính
        String gioitinh = request.getParameter("gender-switch");
        boolean GioiTinh = true;
        if (gioitinh.equals("female")) {
            GioiTinh = false;
        }

        //Xử lý ngày tháng năm sinh
        String ngaysinh = request.getParameter("Ngaysinh");
        Date NgaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);

        idnguoidung = Integer.parseInt(request.getParameter("idNguoidung"));
        Ho = request.getParameter("Ho");
        DemVaTen = request.getParameter("Demvaten");
        DiaChi = request.getParameter("Diachi");
        SDT = request.getParameter("SDT");
        SoCMND = request.getParameter("CMND");
        QuocTich = Integer.parseInt(request.getParameter("quoctich"));

        HttpSession session = request.getSession();
       
        NguoidungService ndsv = new NguoidungService();
        Nguoidung nd = ndsv.GetUserByIdNguoidung(idnguoidung);
        nd.setHo(Ho);
        nd.setDemVaTen(DemVaTen);
        nd.setGioiTinh(GioiTinh);
        nd.setNgaySinh(NgaySinh);
        nd.setQuocTich(QuocTich);
        nd.setDiaChi(DiaChi);
        nd.setSdt(SDT);
        nd.setSoCmnd(SoCMND);
        
        boolean DateUpdate = ndsv.InsertNguoidung(nd);
        if (DateUpdate) {
            session.setAttribute("kiemtra", "1");
            request.getRequestDispatcher("SuaNguoidung.jsp").forward(request, response);
        } else {
            session.setAttribute("kiemtra", "0");
            request.getRequestDispatcher("SuaNguoidung.jsp").forward(request, response);
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SuaNguoiDungServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SuaNguoiDungServlet at " + request.getContextPath() + "</h1>");
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
        } catch (ParseException ex) {
            Logger.getLogger(SuaNguoiDungServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SuaNguoiDungServlet.class.getName()).log(Level.SEVERE, null, ex);
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
