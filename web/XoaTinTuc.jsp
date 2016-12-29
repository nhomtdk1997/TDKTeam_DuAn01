<%-- 
    Document   : XoaTinTuc
    Created on : Dec 26, 2016, 1:29:40 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.service.TintucService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xóa tin tức</title>
    </head>
    <body>
        <%
            TintucService ttsv = new TintucService();
            int idtt = Integer.parseInt(request.getParameter("idTintuc"));
            boolean xtt = ttsv.DeleteTintuc(idtt);
            if (xtt) {
                response.sendRedirect("QuanLyTinTuc.jsp");
            }
        %>
    </body>
</html>
