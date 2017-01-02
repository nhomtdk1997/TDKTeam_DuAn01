/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaweb.controller;

import com.javaweb.model.Tintuc;
import com.javaweb.service.FileService;
import com.javaweb.service.TintucService;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author DuongNguyen
 */
public class ThemTinTucServlet extends HttpServlet {

    private boolean isMultipart;
    private String filePath;
    private int maxFileSize = 1000 * 600;
    private int maxMemSize = 1000 * 600;
    private File file;

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

        //response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
//        session.removeAttribute("errorreg");
        String TieuDe = "", NoiDung = "", ngaydang = "", GhiChu = "", fileName = "";
        int idloaitin = 0, idTK = 0;

        TintucService tintucservice = new TintucService();

        //File upload
        String folderupload = getServletContext().getInitParameter("file-upload");
        String rootPath = getServletContext().getRealPath("/");
        filePath = rootPath + folderupload;
        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("C:\\Windows\\Temp\\"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters

                    String fieldName = fi.getFieldName();
                    fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    //change file name
                    fileName = FileService.ChangeFileName(fileName);

                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath + "/"
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
//                    out.println("Uploaded Filename: " + fileName + "<br>");
                }

                if (fi.isFormField()) {
                    if (fi.getFieldName().equalsIgnoreCase("TieuDe")) {
                        TieuDe = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("NoiDung")) {
                        NoiDung = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("NgayDang")) {
                        ngaydang = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("GhiChu")) {
                        GhiChu = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("loaitin")) {
                        idloaitin = Integer.parseInt(fi.getString("UTF-8"));
                    } else if (fi.getFieldName().equalsIgnoreCase("idtaikhoan")) {
                        idTK = Integer.parseInt(fi.getString("UTF-8"));
                    }
                }
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }

        Date NgayDang = new SimpleDateFormat("yyyy-MM-dd").parse(ngaydang);
        Tintuc tintuc = new Tintuc(idloaitin, idTK, fileName, TieuDe, NoiDung, NgayDang, GhiChu);

        boolean rs = tintucservice.InsertTintuc(tintuc);
        if (rs) {
            session.setAttribute("kiemtra", "1");
            String url = "ThemTinTuc.jsp";
            response.sendRedirect(url);
        } else {
            session.setAttribute("kiemtra", "0");
            String url = "ThemTinTuc.jsp";
            response.sendRedirect(url);
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ThemTinTucServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ThemTinTucServlet at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(ThemTinTucServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ThemTinTucServlet.class.getName()).log(Level.SEVERE, null, ex);
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
