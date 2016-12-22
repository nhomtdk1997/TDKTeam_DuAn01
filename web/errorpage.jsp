<%-- 
    Document   : errorpage
    Created on : Dec 21, 2016, 10:26:05 AM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Bạn không được phép truy cập vào trang này!</h1>
        <a href="${pageContext.request.contextPath}/index.jsp">Trở về trang chủ</a>
    </body>
</html>