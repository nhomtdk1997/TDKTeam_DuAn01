<%-- 
    Document   : menu
    Created on : Nov 14, 2016, 4:18:40 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
Fixed Navigation
==================================== -->
<header id="navigation" class="navbar-fixed-top">
    <div class="container">

        <div class="navbar-header">
            <!-- responsive nav button -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- /responsive nav button -->

            <!-- logo -->
            <h1 class="navbar-brand">
                <a href="#body">
                    <img src="img/logos.png" alt="Kasper Logo">
                </a>
            </h1>
            <!-- /logo -->
        </div>

        <!-- main nav -->
        <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
            <ul id="nav" class="nav navbar-nav">
                <%
                    if (session.getAttribute("youruser") != null) {
                %>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#timve">Tìm vé</a></li>
                <li><a href="#khuyenmai">Khuyến mãi</a></li>
                <li><a href="#tintuc">Tin tức</a></li>
                <li><a href="#service">Điều khoản</a></li>
                <li><a href="#contact">Phản hồi</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Xin Chào: <%=session.getAttribute("youruser")%>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Thông tin tài khoản</a></li>
                        <li><a href="Logout.jsp">Đăng xuất</a></li>
                    </ul>
                </li>
                <%
                } else {
                %>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#timve">Tìm vé</a></li>
                <li><a href="#khuyenmai">Khuyến mãi</a></li>
                <li><a href="#tintuc">Tin tức</a></li>
                <li><a href="#service">Điều khoản</a></li>
                <li><a href="#contact">Phản hồi</a></li>
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
