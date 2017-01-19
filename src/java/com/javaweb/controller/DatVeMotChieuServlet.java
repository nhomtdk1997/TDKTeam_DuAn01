/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Ve;
import com.javaweb.service.VeService;
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
public class DatVeMotChieuServlet extends HttpServlet {

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

        String Ho, DemVaTen, DiaChi, SDT, SoCMND, giachuyenbay, idQuocTich;
        int idTK, soNguoilon, soTreem, soEmbe, idChuyenbay;

        //Xử lý ngày tháng năm sinh
        String ngaysinh = request.getParameter("ngaysinh");
        Date NgaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);

        Ho = request.getParameter("ho");
        DemVaTen = request.getParameter("demvaten");
        DiaChi = request.getParameter("diachi");
        SDT = request.getParameter("sdt");
        SoCMND = request.getParameter("cmnd");
        soNguoilon = Integer.parseInt(request.getParameter("songuoilon"));
        soTreem = Integer.parseInt(request.getParameter("sotreem"));
        soEmbe = Integer.parseInt(request.getParameter("soembe"));
        idChuyenbay = Integer.parseInt(request.getParameter("idchuyenbay"));
        idQuocTich = request.getParameter("quoctich");
        giachuyenbay = request.getParameter("giachuyenbay");

        BigDecimal GiaVe = new BigDecimal(giachuyenbay);

        HttpSession session = request.getSession();
        if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null) {
            idTK = Integer.parseInt(request.getParameter("idtaikhoan"));
            Ve ve = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, idQuocTich, idChuyenbay, idTK, soNguoilon, soTreem, soEmbe, GiaVe);
            VeService veservice = new VeService();
            boolean kiemtra = veservice.InsertVe(ve);
            if (kiemtra) {
                session.setAttribute("kiemtra", "1");
                response.sendRedirect("VeDaDat.jsp");
            } else {
                session.setAttribute("kiemtra", "0");
                response.sendRedirect("VeDaDat.jsp");
            }
        } else {
            Ve ve = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, idQuocTich, idChuyenbay, null, soNguoilon, soTreem, soEmbe, GiaVe);
            VeService veservice = new VeService();
            boolean kiemtra = veservice.InsertVe(ve);
            if (kiemtra) {
                //session.setAttribute("kiemtra", "1");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                //session.setAttribute("kiemtra", "0");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet DatVeMotChieuServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DatVeMotChieuServlet at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(DatVeMotChieuServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DatVeMotChieuServlet.class.getName()).log(Level.SEVERE, null, ex);
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
