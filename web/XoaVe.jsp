<%-- 
    Document   : XoaVe
    Created on : Jan 3, 2017, 12:10:42 AM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.service.VeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            VeService vesv = new VeService();
            int idVe = Integer.parseInt(request.getParameter("idVe"));
            boolean xve = vesv.DeleteVe(idVe);
            if (xve) {
                response.sendRedirect("VeDaDat.jsp");
            }
        %>
    </body>
</html>
