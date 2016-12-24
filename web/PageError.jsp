<%-- 
    Document   : PageError
    Created on : Dec 24, 2016, 5:28:38 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error!</title>
    </head>
    <body>
        <h1>Bạn không được phép truy cập vào trang này!</h1>
        <a href="${pageContext.request.contextPath}/index.jsp">Trở về trang chủ</a>
    </body>
</html>
