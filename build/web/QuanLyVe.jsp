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
        <title>Quản lý vé</title>
        <%@include file="includes/headtag.jsp" %>
        <%@include file="includes/popuplogin.jsp" %>
    </head>
    <body>
        <%@include file="includes/headerStaffFix.jsp" %>
        <%            
            int pageSize = 20;
            int pageNumber = 1;
            request.setCharacterEncoding("UTF-8");
            ArrayList<Ve> listVe = null;
            VeService vesv = new VeService();

            if (request.getParameter("Page") != null) {
                session.setAttribute("Page", request.getParameter("Page"));
                pageNumber = Integer.parseInt(request.getParameter("Page"));
            } else {
                session.setAttribute("Page", "1");
            }
            
            listVe = vesv.GetAllVe(pageSize, pageNumber);

            int pageCount = (vesv.vecount / pageSize)
                    + (vesv.vecount % pageSize > 0 ? 1 : 0);

            String nextPage = (pageCount > pageNumber
                    ? (pageNumber + 1) : pageNumber) + "";
            String prePage = (pageNumber <= 1 ? 1 : pageNumber - 1) + "";
        %>

        <section id="TimVeMotChieu" class="container-fluid" style="margin-top: 50px">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Quản lý vé</h2>
                        <p>Danh sách vé khách hàng đặt!</p>
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
                            <th>Ngày sinh</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th>Số CMND</th>
                            <th>Quốc tịch</th>
                            <th>Chuyến bay số</th>
                            <th>Số người lớn</th>
                            <th>Số trẻ em</th>
                            <th>Số em bé</th>
                            <th>Giá vé</th>
                            <th>Xác nhận</th>                       
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (listVe.size() <= 0) {
                        %>
                        <tr>
                            <td colspan="13">Hiện tại không có vé nào - <a href="index.jsp">Về trang chủ!</a></td>
                        </tr>
                        <%
                        } else {
                            for (int i = 0; i < listVe.size(); i++) {
                                Ve ve = listVe.get(i);
                        %>
                        <tr>
                            <td><%= ve.getIdve()%></td>                        
                            <td><%= ve.getHo() + "" + ve.getDemVaTen()%></td>
                            <td><%= ve.getNgaySinh()%></td>
                            <td><%= ve.getDiaChi()%></td>
                            <td><%= ve.getSdt()%></td>
                            <td><%= ve.getSoCmnd()%></td>
                            <td><%= ve.getIdquoctich()%></td>
                            <td><%= ve.getIdchuyenbay()%></td>
                            <td><%= ve.getSoNguoiLon()%></td>
                            <td><%= ve.getSoTreEm()%></td>
                            <td><%= ve.getSoEmBe()%></td>
                            <td><strong><%= ve.getGiaVe()%></strong></td>
                            <td style="width: 60px;">
                                <a href=""><input type="button" class="btn btn-primary" value="Xác nhận" /></a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a  aria-label="Previous" href="?Page=<%=prePage%>"> <span aria-hidden="true">&laquo;</span></a></li>
                            <%
                                for (int j = 1; j <= pageCount; j++) {
                                    if (pageNumber == j) {
                            %>
                        <li class="active"><a href="?Page=<%=j%>"><%=j%></a></li>
                            <%
                            } else {
                            %>                                   
                        <li ><a href="?Page=<%=j%>"><%=j%></a></li>
                            <%
                                    }
                                }
                            %>
                        <li ><a aria-label="Next" href="?Page=<%=nextPage%>"><span aria-hidden="true">&raquo;</span></a></li>
                    </ul>
                </nav>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>