<%-- 
    Document   : SuaChuyenBay
    Created on : Dec 26, 2016, 4:48:23 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Chuyenbay"%>
<%@page import="com.javaweb.service.ChuyenbayService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa chuyến bay</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <%
        if (session.getAttribute("kiemtra") != null) {
    %>
    <body onload="kiemtrachuyenbay(<%=session.getAttribute("kiemtra")%>)">
        <%
            session.removeAttribute("kiemtra");
        } else {
        %>
    <body>
        <%
            }
        %>

        <%
            ChuyenbayService cbsv = new ChuyenbayService();
            Chuyenbay cb = null;
            String idchuyenbay = request.getParameter("idChuyenbay");
            cb = cbsv.GetChuyenbayById(idchuyenbay);
        %>
        <%@include file="includes/headerStaffFix.jsp" %>        
        <section style="margin-top: 50px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title text-center wow fadeInDown">
                            <h2>Sửa chuyến bay</h2>
                        </div>
                    </div>
                </div>
                <div class="row col-md-8 col-md-offset-2">
                    <form action="SuaChuyenBayServlet" method="post">
                        <input style="display: none;" name="idCB" value="<%=idchuyenbay%>">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Điểm khởi hành: </label>
                                <select name="Diemkhoihanh" class="selectpicker form-control" required="">
                                    <option hidden="" selected=""><%=cb.getTu()%></option>
                                    <optgroup label="Miền Bắc">
                                        <option>Hà Nội</option>
                                        <option>Hải Phòng</option>
                                        <option>Điện Biên</option>
                                        <option>Đồng Hới</option>
                                    </optgroup>
                                    <optgroup label="Miền Trung">
                                        <option>Buôn Mê Thuột</option>
                                        <option>Chu Lai</option>
                                        <option>Huế</option>
                                        <option>Pleiku</option>
                                        <option>Quy Nhơn</option>
                                        <option>Thanh Hóa</option>
                                        <option>TP. Vinh</option>
                                        <option>Tuy Hòa</option>
                                        <option>Đà Nẵng</option>
                                    </optgroup>
                                    <optgroup label="Miền Nam">
                                        <option>Đà Lạt</option>
                                        <option>Cà Mau</option>
                                        <option>Côn Đảo</option>
                                        <option>Cần Thơ</option>
                                        <option>Nha Trang</option>
                                        <option>Phú Quốc</option>
                                        <option>Rạch Giá</option>
                                        <option>TP. Hồ Chí Minh</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Điểm đến: </label>
                                <select name="Diemden" class="selectpicker form-control" required="">
                                    <option hidden="" selected=""><%=cb.getDen()%></option>
                                    <optgroup label="Miền Bắc">
                                        <option>Hà Nội</option>
                                        <option>Hải Phòng</option>
                                        <option>Điện Biên</option>
                                        <option>Đồng Hới</option>
                                    </optgroup>
                                    <optgroup label="Miền Trung">
                                        <option>Buôn Mê Thuột</option>
                                        <option>Chu Lai</option>
                                        <option>Huế</option>
                                        <option>Pleiku</option>
                                        <option>Quy Nhơn</option>
                                        <option>Thanh Hóa</option>
                                        <option>TP. Vinh</option>
                                        <option>Tuy Hòa</option>
                                        <option>Đà Nẵng</option>
                                    </optgroup>
                                    <optgroup label="Miền Nam">
                                        <option>Đà Lạt</option>
                                        <option>Cà Mau</option>
                                        <option>Côn Đảo</option>
                                        <option>Cần Thơ</option>
                                        <option>Nha Trang</option>
                                        <option>Phú Quốc</option>
                                        <option>Rạch Giá</option>
                                        <option>TP. Hồ Chí Minh</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>Ngày khởi hành: </label>
                                <input id="Ngaykhoihanh-motchang-getdate" name="Ngaykhoihanh" type="date" value="<%=cb.getNgayKhoiHanh()%>" class="form-control" required="">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Giờ cất cánh: </label>
                                <input type="time" name="Giocatcanh" class="form-control" value="<%=cb.getGioCatCanh()%>" required="">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Giờ hạ cánh: </label>
                                <input type="time" name="Giohacanh" class="form-control" value="<%=cb.getGioHaCanh()%>" required="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>Loại máy bay: </label>
                                <select name="Loaimaybay" class="selectpicker form-control" required="">
                                    <option hidden="" selected=""><%=cb.getLoaiMayBay()%></option>
                                    <option>Airbus A320</option>
                                    <option>Airbus A321-100/200</option>
                                    <option>Airbus 330-200</option>
                                    <option>Boeing 777</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Giá chuyến bay: </label>
                                <input type="number" name="Giachuyenbay" class="form-control" value="<%=cb.getGiaChuyenBay()%>" required="">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-8">
                                <button type="submit" class="btn btn-success form-control">Cập nhật thông tin chuyến bay</button>
                            </div>
                            <div class="form-group col-md-4">
                                <a href="javascript:history.go(-1)"><button class="btn btn-danger form-control">Hủy bỏ</button></a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
