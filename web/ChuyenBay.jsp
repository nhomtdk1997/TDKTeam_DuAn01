<%-- 
    Document   : ChuyenBay
    Created on : Dec 11, 2016, 4:32:44 PM
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
        <title>Chuyến bay</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <%@include file="includes/slider.jsp" %>

        <%            
            ChuyenbayService cb = new ChuyenbayService();
            ArrayList<Chuyenbay> listChuyenbay = null;
            listChuyenbay = cb.GetAllChuyenbay();
        %>
        <section class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Tìm chuyến bay</h2>
                        <p>Tìm chuyến bay</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Danh sách tất cả các chuyến bay</div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>                        
                            <th>Điểm khởi hành</th>                        
                            <th>Điểm dừng</th>                                               
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
                            for (int i = 0; i < listChuyenbay.size(); i++) {
                                Chuyenbay chuyenbay = listChuyenbay.get(i);
                        %>        

                        <tr>
                            <td><%= i + 1%></td>                        
                            <td><%= chuyenbay.getTu()%></td>
                            <td><%= chuyenbay.getDen()%></td>
                            <td><%= chuyenbay.getNgayKhoiHanh()%></td>
                            <td><%= chuyenbay.getGioCatCanh()%></td>
                            <td><%= chuyenbay.getGioHaCanh()%></td>
                            <td><%= chuyenbay.getLoaiMayBay()%></td>
                            <td><%= chuyenbay.getGiaChuyenBay()%></td>
                            <td style="width: 47px;">
                                <a href="DatVe.jsp?idChuyenbay=<%= chuyenbay.getIdchuyenbay()%>"><input type="button" name="DatVe" value="Đặt" /></a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>