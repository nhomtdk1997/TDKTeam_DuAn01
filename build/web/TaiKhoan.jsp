<%-- 
    Document   : TaiKhoan
    Created on : Dec 21, 2016, 11:51:18 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.service.LoaitaikhoanService"%>
<%@page import="com.javaweb.model.Loaitaikhoan"%>
<%@page import="com.javaweb.service.NguoidungService"%>
<%@page import="com.javaweb.model.Nguoidung"%>
<%@page import="com.javaweb.service.TaikhoanService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javaweb.model.Taikhoan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tài khoản</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <body>
        <%@include file="includes/headerAdminFix.jsp" %>

        <%
            int pageSize = 15;
            int pageNumber = 1;
            request.setCharacterEncoding("UTF-8");
            ArrayList<Taikhoan> listTaikhoan = null;
            TaikhoanService tksv = new TaikhoanService();

            if (request.getParameter("Page") != null) {
                session.setAttribute("Page", request.getParameter("Page"));
                pageNumber = Integer.parseInt(request.getParameter("Page"));
            } else {
                session.setAttribute("Page", "1");
            }
            String Email = "";
            if (request.getParameter("email") != null) {
                session.setAttribute("emailkey", request.getParameter("email"));
                Email = request.getParameter("email");
                listTaikhoan = tksv.SearchTaikhoan(pageSize, pageNumber, Email);
                session.removeAttribute("emailkey");
            } else {
                listTaikhoan = tksv.GetAllTaikhoan(pageSize, pageNumber);
            }

            int pageCount = (tksv.taikhoancount / pageSize)
                    + (tksv.taikhoancount % pageSize > 0 ? 1 : 0);

            String nextPage = (pageCount > pageNumber
                    ? (pageNumber + 1) : pageNumber) + "";
            String prePage = (pageNumber <= 1 ? 1 : pageNumber - 1) + "";
        %>
        <%session.removeAttribute("kiemtra");%>
        <section class="container-fluid">
            <div class="row" style="padding-top: 50px;">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Tài khoản management</h2>
                        <p>Tài khoản management</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-2">
                            <a href="#" onClick="open_window('DangKy.jsp', 1200, 700)">
                                <button class="col-md-9 btn btn-success">+ Tài khoản</button>
                            </a>
                        </div>
                        <div class="col-md-3 col-md-offset-7">
                            <form action="TaiKhoan.jsp" method="get">
                                <div class="input-group">
                                    <input type="email" class="form-control" name="email" placeholder="Tìm kiếm theo Email...">
                                    <span class="input-group-btn">     
                                        <button class="btn btn-warning" type="submit">Search!</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID Tài khoản</th>
                            <th>Người dùng</th>
                            <th>Tên đăng nhập</th>
                            <th>Email</th>
                            <th>Mật khẩu</th>
                            <th>ID Loại TK</th>
                            <th>Sửa</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listTaikhoan.size(); i++) {
                                Taikhoan taikhoan = listTaikhoan.get(i);
                                Nguoidung nd = new Nguoidung();
                                NguoidungService ndsv = new NguoidungService();
                                Loaitaikhoan ltk = new Loaitaikhoan();
                                LoaitaikhoanService ltksv = new LoaitaikhoanService();

                                int idnd = taikhoan.getIdnguoidung();
                                nd = ndsv.GetUserByIdNguoidung(idnd);
                                int idLoaiTK = taikhoan.getIdLoaiTk();
                                ltk = ltksv.GetLoaitaikhoanByID(idLoaiTK);
                        %>        

                        <tr>
                            <td><%= taikhoan.getIdTaiKhoan()%></td>
                            <td><%= nd.getHo()+" "+nd.getDemVaTen()%></td>
                            <td><%= taikhoan.getTenDangNhap()%></td>
                            <td><%= taikhoan.getEmail()%></td>
                            <td><input class="form-control" type="password" disabled="" value="<%= taikhoan.getMatKhau()%>"></td>
                            <td><%= ltk.getLoaiTk()%></td>
                            <td style="width: 40px;">
                                <a href="SuaTaiKhoan.jsp?idTaikhoan=<%= taikhoan.getIdTaiKhoan()%>&idNguoidung=<%= taikhoan.getIdnguoidung()%>">
                                    <input type="button" class="btn btn-primary" name="suataikhoan" value="Sửa"/>
                                </a>
                            </td>
                            <td style="width: 47px;">
                                <a href="XoaTaiKhoan.jsp?idTaikhoan=<%= taikhoan.getIdTaiKhoan()%>&idNguoidung=<%= taikhoan.getIdnguoidung()%>">
                                    <input type="button" class="btn btn-danger" name="xoataikhoan" value="Xóa" />
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <%
                    String keyurl = "";
                    if (!Email.equals("")) {
                        keyurl = "&emailkey=" + Email;
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
