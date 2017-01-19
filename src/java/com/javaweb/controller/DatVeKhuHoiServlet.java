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
public class DatVeKhuHoiServlet extends HttpServlet {

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

        String Ho, DemVaTen, DiaChi, SDT, SoCMND, giachuyenbaydi, giachuyenbayve, idQuocTich;
        int idTK, soNguoilonDi, soTreemDi, soEmbeDi, idChuyenbayDi, soNguoilonVe, soTreemVe, soEmbeVe, idChuyenbayVe;

        idChuyenbayDi = Integer.parseInt(request.getParameter("idchuyenbaydi"));
        giachuyenbaydi = request.getParameter("giachuyenbaydi");
        BigDecimal GiaChuyenbayDi = new BigDecimal(giachuyenbaydi);
        soNguoilonDi = Integer.parseInt(request.getParameter("songuoilon-vedi"));
        soTreemDi = Integer.parseInt(request.getParameter("sotreem-vedi"));
        soEmbeDi = Integer.parseInt(request.getParameter("soembe-vedi"));

        idChuyenbayVe = Integer.parseInt(request.getParameter("idchuyenbayve"));
        giachuyenbayve = request.getParameter("giachuyenbayve");
        BigDecimal GiaChuyenbayVe = new BigDecimal(giachuyenbayve);
        soNguoilonVe = Integer.parseInt(request.getParameter("songuoilon-veve"));
        soTreemVe = Integer.parseInt(request.getParameter("sotreem-veve"));
        soEmbeVe = Integer.parseInt(request.getParameter("soembe-veve"));

        Ho = request.getParameter("ho");
        DemVaTen = request.getParameter("demvaten");

        //Xử lý ngày tháng năm sinh
        String ngaysinh = request.getParameter("ngaysinh");
        Date NgaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);

        DiaChi = request.getParameter("diachi");
        SDT = request.getParameter("sdt");
        SoCMND = request.getParameter("cmnd");
        idQuocTich = request.getParameter("quoctich");

        HttpSession session = request.getSession();
        if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null) {
            idTK = Integer.parseInt(request.getParameter("idtaikhoan"));
            Ve ve = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, idQuocTich, idChuyenbayVe, idTK, soNguoilonVe, soTreemVe, soEmbeVe, GiaChuyenbayVe);
            Ve di = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, idQuocTich, idChuyenbayDi, idTK, soNguoilonDi, soTreemDi, soEmbeDi, GiaChuyenbayDi);
            VeService veservice = new VeService();
            veservice.InsertVe(ve);
            veservice.InsertVe(di);
            session.setAttribute("kiemtra", "1");
            request.getRequestDispatcher("VeDaDat.jsp").forward(request, response);
        } else {
            Ve ve = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, idQuocTich, idChuyenbayVe, null, soNguoilonVe, soTreemVe, soEmbeVe, GiaChuyenbayVe);
            Ve di = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, idQuocTich, idChuyenbayDi, null, soNguoilonDi, soTreemDi, soEmbeDi, GiaChuyenbayDi);
            VeService veservice = new VeService();
            veservice.InsertVe(ve);
            veservice.InsertVe(di);
            //session.setAttribute("kiemtra", "1");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet DatVeKhuHoiServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DatVeKhuHoiServlet at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(DatVeKhuHoiServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DatVeKhuHoiServlet.class.getName()).log(Level.SEVERE, null, ex);
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
