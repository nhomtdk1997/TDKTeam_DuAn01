<%-- 
    Document   : XoaTaiKhoan
    Created on : Dec 26, 2016, 11:16:14 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.service.TaikhoanService"%>
<%@page import="com.javaweb.service.NguoidungService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xóa tài khoản</title>
    </head>
    <body>
        <%
            NguoidungService ndsv = new NguoidungService();
            int idnd = Integer.parseInt(request.getParameter("idNguoidung"));
            boolean xnd = ndsv.DeleteNguoidung(idnd);
            if (xnd) {
                TaikhoanService tksv = new TaikhoanService();
                int idtk = Integer.parseInt(request.getParameter("idTaikhoan"));
                boolean xtk = tksv.DeleteTaikhoan(idtk);
                if (xtk) {
                    response.sendRedirect("TaiKhoan.jsp");
                }
            }
        %>
    </body>
</html>
