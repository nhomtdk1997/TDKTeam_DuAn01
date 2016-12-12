<%-- 
    Document   : TimVe
    Created on : Dec 11, 2016, 1:37:37 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vé</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <%@include file="includes/slider.jsp" %>

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
                <!-- Default panel contents -->
                <div class="panel-heading">Danh sách chuyến bay được tìm thấy!</div>

                <!-- Table -->
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
                        <tr>
                            <td>stt</td>                        
                            <td>diemkhoihanh</td>                        
                            <td>diemdung</td>                       
                            <td>ngaykhoihanh</td>                       
                            <td>giocatcanh</td>
                            <td>giohacanh</td>
                            <td>loaimaybay</td>
                            <td>giachuyenbay</td>
                            <td style="width: 47px;">
                                <a href="XoaSanPham.jsp?idSanpham=?"><input type="button" name="Del" value="Đặt"/></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
