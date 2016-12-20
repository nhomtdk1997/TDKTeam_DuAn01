<%-- 
    Document   : TimVeKhuHoi
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
        <title>Tìm vé khứ hồi</title>
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

            TuDi = request.getParameter("Tu-vekhuhoi");
            DenDi = request.getParameter("Den-vekhuhoi");
            NgayDi = request.getParameter("Ngaykhoihanh-khuhoi");

            TuVe = request.getParameter("Den-vekhuhoi");
            DenVe = request.getParameter("Tu-vekhuhoi");
            NgayVe = request.getParameter("Ngayquayve-khuhoi");

            listChuyenbayDi = cb.TimKiemChuyenbay(TuDi, DenDi, NgayDi);
            try {
                listChuyenbayVe = cb.TimKiemChuyenbay(TuVe, DenVe, NgayVe);
            } catch (Exception e) {
            }

        %>

        <section class="container">
            <form action="ChonChuyenBayServlet" method="post">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center wow fadeInDown">
                            <h2>Tìm chuyến bay</h2>
                            <p>Danh sách các chuyến bay đi!</p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default" style="margin-bottom: 50px;">
                    <!-- Default panel contents -->
                    <div class="panel-heading">DANH SÁCH CHUYẾN BAY ĐI</div>
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
                        <tbody class="radiofix">
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
                                    <input name="Vedi" type="radio" required="" value="<%= chuyenbaydi.getIdchuyenbay()%>">
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">DANH SÁCH CHUYẾN BAY VỀ</div>
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
                        <tbody class="radiofix">
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
                                    <input name="Veve" type="radio" required="" value="<%= chuyenbayve.getIdchuyenbay()%>">
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div><br>
                <%
                    if (listChuyenbayDi.size() <= 0 || listChuyenbayVe.size() <=0) {
                %>
                <a href="index.jsp"><button type="button" class="btn btn-blue col-md-12">Tìm chuyến bay khác</button></a>
                <%
                } else {
                %>
                <button id="btnDatVeKhuHoi" type="submit" class="btn btn-blue col-md-12">Đặt vé</button>
                <%
                    }
                %>
            </form>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
