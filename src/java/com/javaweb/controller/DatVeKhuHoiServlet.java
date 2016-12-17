/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Ve;
import com.javaweb.service.VeService;
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

        String Ho, DemVaTen, DiaChi, SDT, SoCMND;
        int idTK, idQuocTich, soNguoilonVedi, soTreemVedi, soEmbeVedi , soNguoilonVeve, soTreemVeve, soEmbeVeve;

        //Xử lý ngày tháng năm sinh
        String ngaysinh = request.getParameter("ngaysinh");
        Date NgaySinh = new SimpleDateFormat("yyyy-MM-dd").parse(ngaysinh);

        Ho = request.getParameter("ho");
        DemVaTen = request.getParameter("demvaten");
        DiaChi = request.getParameter("diachi");
        SDT = request.getParameter("sdt");
        SoCMND = request.getParameter("cmnd");
        
        soNguoilonVedi = Integer.parseInt(request.getParameter("songuoilon-vedi"));
        soTreemVedi = Integer.parseInt(request.getParameter("sotreem-vedi"));
        soEmbeVedi = Integer.parseInt(request.getParameter("soembe-vedi"));
        
        soNguoilonVeve = Integer.parseInt(request.getParameter("songuoilon-veve"));
        soTreemVeve = Integer.parseInt(request.getParameter("sotreem-veve"));
        soEmbeVeve = Integer.parseInt(request.getParameter("soembe-veve"));
        idQuocTich = Integer.parseInt(request.getParameter("quoctich"));
//        BigDecimal GiaVe = BigDecimal.valueOf(123123);

        HttpSession session = request.getSession();
        if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null) {
            idTK = Integer.parseInt(request.getParameter("idtaikhoan"));
            Ve ve = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, DiaChi, idQuocTich, idTK, soNguoilonVedi, soTreemVedi, soEmbeVedi, null);
            VeService veservice = new VeService();
            veservice.InsertVe(ve);
        } else {
            Ve vedi = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, DiaChi, idQuocTich, null, soNguoilonVedi, soTreemVedi, soEmbeVedi, null);
            VeService veservice = new VeService();
            veservice.InsertVe(vedi);
            
            Ve veve = new Ve(Ho, DemVaTen, NgaySinh, DiaChi, SDT, SoCMND, DiaChi, idQuocTich, null, soNguoilonVeve, soTreemVeve, soEmbeVeve, null);
            veservice.InsertVe(veve);
        }

        String url = "/index.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);

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
