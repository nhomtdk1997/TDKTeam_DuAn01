<%-- 
    Document   : Logout
    Created on : Dec 3, 2016, 7:59:02 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <%
                if (session != null) {
                    session.removeAttribute("youruser");
                    session.removeAttribute("iduser");
                    session.removeAttribute("HoNguoidung");
                    session.removeAttribute("DemvatenNguoidung");
                    session.removeAttribute("DiachiNguoidung");
                    session.removeAttribute("NgaysinhNguoidung");
                    session.removeAttribute("SDTNguoidung");
                    session.removeAttribute("CMNDNguoidung");
                    response.sendRedirect("index.jsp");
                }
            %>
        </section>
    </body>
</html>
