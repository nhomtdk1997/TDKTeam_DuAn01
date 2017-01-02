<%-- 
    Document   : newjsp
    Created on : Jan 2, 2017, 2:49:09 PM
    Author     : DuongNguyen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.javaweb.model.Ve"%>
<%@page import="com.javaweb.service.VeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vé đã đặt</title>
        <%@include file="includes/headtag.jsp" %>
        <%@include file="includes/popuplogin.jsp" %>
    </head>
    <body>
        <%@include file="includes/headerUserFix.jsp" %>
        <%            
            VeService vesv = new VeService();
            ArrayList<Ve> listVe = null;
            String idtk = "" + session.getAttribute("iduser");
            listVe = vesv.GetVeByIdTaikhoan(idtk);
        %>

        <section id="TimVeMotChieu" class="container" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Vé đã đặt</h2>
                        <p>Danh sách các vé máy bay đã đặt!</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">

                <!-- Table -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID Vé</th>                        
                            <th>Họ và tên</th>                        
                            <th>Địa chỉ</th>                                               
                            <th>Số điện thoại</th>                       
                            <th>Số CMND</th>
                            <th>Chuyến bay số</th>
                            <th>Số người lớn</th>
                            <th>Số trẻ em</th>
                            <th>Số em bé</th>
                            <th>Giá vé</th>
                            <th>Hủy vé</th>                       
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (listVe.size() <= 0) {
                        %>
                        <tr>
                            <td colspan="11">Hiện tại bạn chưa đặt vé nào! - <a href="index.jsp#timve">Tìm và đặt vé ngay!</a></td>
                        </tr>
                        <%
                        } else {
                            for (int i = 0; i < listVe.size(); i++) {
                                Ve ve = listVe.get(i);
                        %>
                        <tr>
                            <td><%= ve.getIdve()%></td>                        
                            <td><%= ve.getHo() +""+ ve.getDemVaTen()%></td>
                            <td><%= ve.getDiaChi() %></td>
                            <td><%= ve.getSdt() %></td>
                            <td><%= ve.getSoCmnd() %></td>
                            <td><%= ve.getIdchuyenbay() %></td>
                            <td><%= ve.getSoNguoiLon() %></td>
                            <td><%= ve.getSoTreEm() %></td>
                            <td><%= ve.getSoEmBe() %></td>
                            <td><strong><%= ve.getGiaVe() %></strong></td>
                            <td style="width: 47px;">
                                <a href=""><input type="button" class="btn btn-danger" name="HuyVe" value="Hủy" /></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
