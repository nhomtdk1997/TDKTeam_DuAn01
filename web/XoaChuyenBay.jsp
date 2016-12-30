<%-- 
    Document   : XoaChuyenBay
    Created on : Dec 26, 2016, 8:09:28 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.service.ChuyenbayService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xóa chuyến bay</title>
        <%@include file="includes/headerStaffFix.jsp" %>
    </head>
    <body>
        <%
            ChuyenbayService cbsv = new ChuyenbayService();
            int idCB = Integer.parseInt(request.getParameter("idChuyenbay"));
            boolean xcb = cbsv.DeleteChuyenbay(idCB);
            if (xcb) {
                response.sendRedirect("ChuyenBay.jsp");
            }
        %>
    </body>
</html>
