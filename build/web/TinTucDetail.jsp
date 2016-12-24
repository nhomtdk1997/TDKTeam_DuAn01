<%-- 
    Document   : TinTucDetail
    Created on : Dec 24, 2016, 2:50:55 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Tintuc"%>
<%@page import="com.javaweb.service.TintucService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        
        <%
            TintucService ns = new TintucService();
            Tintuc news = null;
            if(request.getParameter("newsid")!= null){
            String id = request.getParameter("newsid");
            news = ns.GetTintucID(id);
            }else{
                response.sendRedirect("index.jsp");
            }
        %>
        
        <section class="container">
            <h1><%=news.getTieuDe()%></h1>
            
            <p>
                <%=news.getNoiDung()%>
            </p>
        </section>
        
        <%@include file="includes/footer.jsp" %>        
    </body>
</html>
