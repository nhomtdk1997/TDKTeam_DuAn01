<%-- 
    Document   : headerStaff
    Created on : Dec 21, 2016, 11:44:24 AM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("TKRole") == null || !session.getAttribute("TKRole").toString().equals("1") && !session.getAttribute("TKRole").toString().equals("2")) {
        response.sendRedirect("errorpage.jsp");
    }
%>

<!--
Fixed Navigation
==================================== -->
<header id="navigation" class="navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">

            <!-- logo -->
            <h1 class="navbar-brand">
                <a href="${pageContext.request.contextPath}/index.jsp#home">
                    <img src="img/logo.png" alt="TDKTeam Logo">
                </a>
            </h1>
            <!-- /logo -->
        </div>

        <!-- main nav -->
        <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
            <ul id="nav" class="nav navbar-nav">
                <%
                    if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null && session.getAttribute("TKRole").toString().equals("1")) {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li style="display: none;"><a href="#">ID Tài khoản = <%=session.getAttribute("iduser")%></a></li>
                        <li><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan.jsp">Thông tin tài khoản</a></li>
                        <li><a href="${pageContext.request.contextPath}/ChuyenBay.jsp">Chuyến bay <span class="quanly"> Management</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/TaiKhoan.jsp">Tài khoản <span class="quanly"> Management</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/QuanLyTinTuc.jsp">Tin Tức <span class="quanly"> Management</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/Logout.jsp"><span class="required">Đăng xuất</span></a></li>
                    </ul>
                </li>
                <%
                } else if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null && session.getAttribute("TKRole").toString().equals("2")) {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li style="display: none;"><a href="#">ID Tài khoản = <%=session.getAttribute("iduser")%></a></li>
                        <li><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan.jsp">Thông tin tài khoản</a></li>
                        <li><a href="${pageContext.request.contextPath}/ChuyenBay.jsp">Chuyến bay <span class="quanly"> Management</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/QuanLyTinTuc.jsp">Tin Tức <span class="quanly"> Management</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/Logout.jsp"><span class="required">Đăng xuất</span></a></li>
                    </ul>
                </li>
                <%
                } else if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null && session.getAttribute("TKRole").toString().equals("3")) {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li style="display: none;"><a href="#">ID Tài khoản = <%=session.getAttribute("iduser")%></a></li>
                        <li><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan.jsp">Thông tin tài khoản</a></li>
                        <li><a href="${pageContext.request.contextPath}/ChuyenBay.jsp">Chuyến bay <span class="quanly"> Management</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/Logout.jsp"><span class="required">Đăng xuất</span></a></li>
                    </ul>
                </li>
                <%
                } else if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null && session.getAttribute("TKRole").toString().equals("4")) {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li style="display: none;"><a href="#">ID Tài khoản = <%=session.getAttribute("iduser")%></a></li>
                        <li><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan.jsp">Thông tin tài khoản</a></li>
                        <li><a href="${pageContext.request.contextPath}/Logout.jsp"><span class="required">Đăng xuất</span></a></li>
                    </ul>
                </li>
                <%
                } else if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null && session.getAttribute("TKRole").toString().equals("5")) {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li style="display: none;"><a href="#">ID Tài khoản = <%=session.getAttribute("iduser")%></a></li>
                        <li><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan.jsp">Thông tin tài khoản</a></li>
                        <li><a href="${pageContext.request.contextPath}/Logout.jsp"><span class="required">Đăng xuất</span></a></li>
                    </ul>
                </li>
                <%
                } else if (session.getAttribute("youruser") != null && session.getAttribute("iduser") != null && session.getAttribute("TKRole").toString().equals("6")) {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li style="display: none;"><a href="#">ID Tài khoản = <%=session.getAttribute("iduser")%></a></li>
                        <li><a href="${pageContext.request.contextPath}/ThongTinTaiKhoan.jsp">Thông tin tài khoản</a></li>
                        <li><a href="${pageContext.request.contextPath}/Logout.jsp"><span class="required">Đăng xuất</span></a></li>
                    </ul>
                </li>
                <%
                } else {
                %>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#timve">Tìm vé</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#khuyenmai">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#tintuc">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#service">Điều khoản</a></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp#contact">Phản hồi</a></li>
                <li><a href="" data-toggle="modal" data-target="#myModal">Đăng Nhập</a></li>
                <%
                    }
                %>
            </ul>
        </nav>
        <!-- /main nav -->
    </div>

</div>
</header>
<!--
End Fixed Navigation
==================================== -->
