<%-- 
    Document   : TimVeKhuaHoi
    Created on : Dec 15, 2016, 11:59:12 AM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Chuyenbay"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javaweb.service.ChuyenbayService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm vé khứa hồi</title>
        <%@include file="includes/headtag.jsp" %>
        <%@include file="includes/popuplogin.jsp" %>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <%@include file="includes/slider.jsp" %>

        <%            
            ChuyenbayService cb = new ChuyenbayService();
            ArrayList<Chuyenbay> listChuyenbayDi = null;
            ArrayList<Chuyenbay> listChuyenbayVe = null;

            String TuDi, DenDi, NgayDi, TuVe, DenVe, NgayVe;

            TuDi = request.getParameter("Tu-vekhuahoi");
            DenDi = request.getParameter("Den-vekhuahoi");
            NgayDi = request.getParameter("Ngaykhoihanh-khuahoi");

            TuVe = request.getParameter("Den-vekhuahoi");
            DenVe = request.getParameter("Tu-vekhuahoi");
            NgayVe = request.getParameter("Ngayquayve-khuahoi");

            listChuyenbayDi = cb.SearchChuyenbay(TuDi, DenDi, NgayDi);
            try {
                listChuyenbayVe = cb.SearchChuyenbay(TuVe, DenVe, NgayVe);
            } catch (Exception e) {
            }

        %>

        <section class="container-fluid">
            <form action="ChonChuyenBayServlet" method="post">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center wow fadeInDown">
                            <h2>Chuyến bay đi</h2>
                            <p>Danh sách các chuyến bay đi!</p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <!-- Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>STT</th>                        
                                <th>Điểm khởi hành</th>                        
                                <th>Điểm đến</th>                                               
                                <th>Ngày khởi hành</th>                                               
                                <th>Giờ cất cánh</th>                       
                                <th>Giời hạ cánh</th>
                                <th>Loại máy bay</th>
                                <th>Giá chuyến bay</th>
                                <th>Đặt</th>                       
                            </tr>
                        </thead>
                        <tbody>
                            <%                                
                                if (listChuyenbayDi.size() <= 0) {
                            %>
                            <tr>
                                <td colspan="9">Chuyến bay ngày bạn chọn đã hết hoặc không có - <a href="index.jsp">Vui lòng chọn ngày khác!</a></td>
                            </tr>
                            <%
                            } else {
                                for (int i = 0; i < listChuyenbayDi.size(); i++) {
                                    Chuyenbay chuyenbaydi = listChuyenbayDi.get(i);
                            %>
                            <tr>
                                <td><%= i + 1%></td>                        
                                <td><%= chuyenbaydi.getTu()%></td>
                                <td><%= chuyenbaydi.getDen()%></td>
                                <td><%= chuyenbaydi.getNgayKhoiHanh()%></td>
                                <td><%= chuyenbaydi.getGioCatCanh()%></td>
                                <td><%= chuyenbaydi.getGioHaCanh()%></td>
                                <td><%= chuyenbaydi.getLoaiMayBay()%></td>
                                <td><%= chuyenbaydi.getGiaChuyenBay()%></td>
                                <td style="width: 47px;">
                                    <input name="Vedi" type="checkbox" value="<%= chuyenbaydi.getIdchuyenbay()%>">
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center wow fadeInDown" style="margin-top: 100px;">
                            <h2>Chuyến bay về</h2>
                            <p>Danh sách các chuyến bay về!</p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <!-- Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>STT</th>                        
                                <th>Điểm khởi hành</th>                        
                                <th>Điểm đến</th>                                               
                                <th>Ngày khởi hành</th>                                               
                                <th>Giờ cất cánh</th>                       
                                <th>Giời hạ cánh</th>
                                <th>Loại máy bay</th>
                                <th>Giá chuyến bay</th>
                                <th>Đặt</th>                       
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (listChuyenbayVe.size() <= 0) {
                            %>
                            <tr>
                                <td colspan="9">Chuyến bay ngày bạn chọn đã hết hoặc không có - <a href="index.jsp">Vui lòng chọn ngày khác!</a></td>
                            </tr>
                            <%
                            } else {
                                for (int i = 0; i < listChuyenbayVe.size(); i++) {
                                    Chuyenbay chuyenbayve = listChuyenbayVe.get(i);
                            %>
                            <tr>
                                <td><%= i + 1%></td>                        
                                <td><%= chuyenbayve.getTu()%></td>
                                <td><%= chuyenbayve.getDen()%></td>
                                <td><%= chuyenbayve.getNgayKhoiHanh()%></td>
                                <td><%= chuyenbayve.getGioCatCanh()%></td>
                                <td><%= chuyenbayve.getGioHaCanh()%></td>
                                <td><%= chuyenbayve.getLoaiMayBay()%></td>
                                <td><%= chuyenbayve.getGiaChuyenBay()%></td>
                                <td style="width: 47px;">
                                    <input name="Veve" type="checkbox" value="<%= chuyenbayve.getIdchuyenbay()%>">
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div><br>
                <button type="" class="btn btn-blue col-md-12">Đặt vé</button>
            </form>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
