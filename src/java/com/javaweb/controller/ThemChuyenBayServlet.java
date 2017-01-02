/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Chuyenbay;
import com.javaweb.service.ChuyenbayService;
import java.io.IOException;
import java.math.BigDecimal;
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
public class ThemChuyenBayServlet extends HttpServlet {

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

        String Diemkhoihanh, Diemden, giocatcanh, giohacanh, Loaimaybay, ngaykhoihanh;

        Diemkhoihanh = request.getParameter("Diemkhoihanh");
        Diemden = request.getParameter("Diemden");
        ngaykhoihanh = request.getParameter("Ngaykhoihanh");
        giocatcanh = request.getParameter("Giocatcanh");
        giohacanh = request.getParameter("Giohacanh");
        Loaimaybay = request.getParameter("Loaimaybay");

        String giachuyenb = request.getParameter("Giachuyenbay");
        giachuyenb = giachuyenb.replaceAll("[^\\d]", "");

        int giachuyenbay = Integer.parseInt(giachuyenb);
        double Giachuyenbayfm = (double) giachuyenbay / 1000.000;
        BigDecimal Giachuyenbay = new BigDecimal(Giachuyenbayfm);

        Date Ngaykhoihanh = new SimpleDateFormat("yyyy-MM-dd").parse(ngaykhoihanh);
        Date Giocatcanh = new SimpleDateFormat("HH:mm").parse(giocatcanh);
        Date Giohacanh = new SimpleDateFormat("HH:mm").parse(giohacanh);

        ChuyenbayService cbsv = new ChuyenbayService();
        Chuyenbay cb = new Chuyenbay(Diemkhoihanh, Diemden, Ngaykhoihanh, Giocatcanh, Giohacanh, Loaimaybay, Giachuyenbay);

        HttpSession session = request.getSession();
        boolean kt = cbsv.InsertChuyenbay(cb);
        if (kt) {
            session.setAttribute("kiemtra", "1");
            String url = "ThemChuyenBay.jsp";
            response.sendRedirect(url);
        } else {
            session.setAttribute("kiemtra", "0");
            String url = "ThemChuyenBay.jsp";
            response.sendRedirect(url);
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ThemChuyenBayServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ThemChuyenBayServlet at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(ThemChuyenBayServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ThemChuyenBayServlet.class.getName()).log(Level.SEVERE, null, ex);
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
