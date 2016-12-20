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
            int pageSize = 20;
            int pageNumber = 1;
            request.setCharacterEncoding("UTF-8");
            ArrayList<Chuyenbay> listChuyenbay = null;
            ChuyenbayService chuyenbayservice = new ChuyenbayService();

            if (request.getParameter("pagenumber") != null) {
                session.setAttribute("pagenumber", request.getParameter("pagenumber"));
                pageNumber = Integer.parseInt(request.getParameter("pagenumber"));
            } else {
                session.setAttribute("pagenumber", "1");
            }
            String Diemkhoihanh = "";
            String Diemden = "";
            String ngaykhoihanh = "";
            if (request.getParameter("Tu") != null && request.getParameter("Den") != null && request.getParameter("NgayKhoiHanh") != null) {
                session.setAttribute("searchkeyDiemkhoihanh", request.getParameter("Tu"));
                session.setAttribute("searchkeyDiemden", request.getParameter("Den"));
                session.setAttribute("searchkeyNgaykhoihanh", request.getParameter("NgayKhoiHanh"));
                Diemkhoihanh = request.getParameter("Tu");
                Diemden = request.getParameter("Den");
                ngaykhoihanh = request.getParameter("NgayKhoiHanh");
                listChuyenbay = chuyenbayservice.SearchChuyenbay(pageSize, pageNumber, Diemkhoihanh, Diemden, ngaykhoihanh);
                session.removeAttribute("searchkey");
            } else {
                listChuyenbay = chuyenbayservice.GetAllChuyenbay(pageSize, pageNumber);
            }

            int pageCount = (chuyenbayservice.chuyenbaycount / pageSize)
                    + (chuyenbayservice.chuyenbaycount % pageSize > 0 ? 1 : 0);

            String nextPage = (pageCount > pageNumber
                    ? (pageNumber + 1) : pageNumber) + "";
            String prePage = (pageNumber <= 1 ? 1 : pageNumber - 1) + "";
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
                <!-- Default panel contents -->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="ChuyenBay.jsp" method="get">
                                <div class="input-group col-md-12">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <select name="Tu" class="col-md-3 selectpicker form-control" required="">
                                                <option disabled selected value> -- Chọn điểm khởi hành -- </option>
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
                                        <div class="col-md-4">
                                            <select name="Den" class="col-md-3 selectpicker form-control" required="">
                                                <option disabled selected value> -- Chọn điểm đến -- </option>
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
                                        <div class="col-md-3">
                                            <input name="NgayKhoiHanh" type="date" class="form-control" required="">
                                        </div>
                                        <div class="col-md-1">
                                            <button class="form-control btn btn-success" type="submit">Tìm kiếm!</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>                        
                            <th>Điểm khởi hành</th>                        
                            <th>Điểm dừng</th>                                               
                            <th>Ngày khởi hành</th>                                               
                            <th>Giờ cất cánh</th>                       
                            <th>Giời hạ cánh</th>
                            <th>Loại máy bay</th>
                            <th>Giá chuyến bay</th>
                            <th>Sửa</th>                       
                            <th>Xóa</th>                       
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listChuyenbay.size(); i++) {
                                Chuyenbay chuyenbay = listChuyenbay.get(i);
                        %>        

                        <tr>
                            <td><%= chuyenbay.getIdchuyenbay()%></td>                        
                            <td><%= chuyenbay.getTu()%></td>
                            <td><%= chuyenbay.getDen()%></td>
                            <td><%= chuyenbay.getNgayKhoiHanh()%></td>
                            <td><%= chuyenbay.getGioCatCanh()%></td>
                            <td><%= chuyenbay.getGioHaCanh()%></td>
                            <td><%= chuyenbay.getLoaiMayBay()%></td>
                            <td><%= chuyenbay.getGiaChuyenBay()%></td>
                            <td style="width: 40px;">
                                <a href="SuaChuyenBay.jsp?idChuyenbay=<%= chuyenbay.getIdchuyenbay()%>"><input type="button" class="btn btn-primary" name="suachuyenbay" value="Sửa"/> </a>
                            </td>
                            <td style="width: 47px;">
                                <a href="XoaChuyenBay.jsp?idChuyenbay=<%= chuyenbay.getIdchuyenbay()%>"><input type="button" class="btn btn-danger" name="xoachuyenbay" value="Xóa" /> </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <%
                    String keyurl = "";
                    if (!Diemkhoihanh.equals("")) {
                        keyurl = "&key=" + Diemkhoihanh + Diemden + ngaykhoihanh;
                    }
                %>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a  aria-label="Previous" href="?Page=<%=prePage%><%=keyurl%>"> <span aria-hidden="true">&laquo;</span></a></li>
                            <%
                                for (int j = 1; j <= pageCount; j++) {
                                    if (pageNumber == j) {
                            %>
                        <li class="active"><a href="?Page=<%=j%><%=keyurl%>"><%=j%></a></li>
                            <%
                            } else {
                            %>                                   
                        <li ><a href="?Page=<%=j%><%=keyurl%>"><%=j%></a></li>
                            <%
                                    }
                                }
                            %>
                        <li ><a aria-label="Next" href="?Page=<%=nextPage%><%=keyurl%>"><span aria-hidden="true">&raquo;</span></a></li>
                    </ul>
                </nav>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>