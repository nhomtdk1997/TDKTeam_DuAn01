<%-- 
    Document   : SuaTaiKhoan
    Created on : Dec 26, 2016, 11:22:19 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.service.EnDeCryption"%>
<%@page import="com.javaweb.model.Loaitaikhoan"%>
<%@page import="com.javaweb.service.LoaitaikhoanService"%>
<%@page import="com.javaweb.model.Nguoidung"%>
<%@page import="com.javaweb.service.NguoidungService"%>
<%@page import="com.javaweb.model.Taikhoan"%>
<%@page import="com.javaweb.service.TaikhoanService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa tài khoản</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <%        
        if (session.getAttribute("kiemtra") != null) {
    %>
    <body onload="kiemtrataikhoan(<%=session.getAttribute("kiemtra")%>)">
        <%
            session.removeAttribute("kiemtra");
        } else {
        %>
    <body>
        <%
            }
        %>
        <%@include file="includes/headerAdminFix.jsp" %>
        <section class="container" style="margin-top: 50px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Sửa tài khoản</h2>
                    </div>
                </div>
            </div>
            <%
                TaikhoanService tksv = new TaikhoanService();
                Taikhoan tk = null;
                NguoidungService ndsv = new NguoidungService();
                Nguoidung nd = new Nguoidung();
                LoaitaikhoanService ltksv = new LoaitaikhoanService();
                Loaitaikhoan ltk = new Loaitaikhoan();
                String idtk = request.getParameter("idTaikhoan");
                tk = tksv.GetUserById(idtk);
                int idnd = tk.getIdnguoidung();
                nd = ndsv.GetUserByIdNguoidung(idnd);
                int idLoaiTK = tk.getIdLoaiTk();
                ltk = ltksv.GetLoaitaikhoanByID(idLoaiTK);
                
                //Giải mã password
                String password = tk.getMatKhau();
                EnDeCryption encryption = new EnDeCryption("TDKTeam_MaHoaMatKhau");
                String passmahoa = encryption.decoding(password);
            %>
            <form action="SuaTaiKhoanServlet" method="post">
                <div class="col-md-12">

                    <input class="hidden" name="idTaikhoan" value="<%=idtk%>">
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label>Tên đăng nhập<span class="required"> *</span></label>
                        <input name="Username" type="text" required value="<%=tk.getTenDangNhap()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label>Mật khẩu<span class="required"> *</span></label>
                        <input name="Passwd" type="password" required placeholder="Nhập mật khẩu mới!" value="<%=passmahoa%>" class="form-control">
                    </div>
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label>Xác nhận mật khẩu<span class="required"> *</span></label>
                        <input name="Passwd2nd" type="password" required placeholder="Nhập để xác nhận lại mật khẩu!" value="<%=passmahoa%>" class="form-control">
                    </div>
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label>Địa chỉ Email<span class="required"> *</span></label>
                        <input name="Email" type="text" value="<%=tk.getEmail()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label class="quanly">Loại tài khoản<span class="required"> *</span></label>
                        <select name="loaiTK" class="selectpicker form-control" required="">
                            <option hidden="" value="<%=tk.getIdLoaiTk()%>" selected=""><%=ltk.getLoaiTk()%></option>
                            <option value="1">Quản trị</option>
                            <option value="2">Quản lý</option>
                            <option value="3">Nhân viên</option>
                            <option value="4">Đại lý</option>
                            <option value="5">KH - Vip</option>
                            <option value="6">KH - Thường</option>
                        </select>
                    </div>
                    <div class="form-group col-md-8 col-md-offset-2">
                        <div style="padding-left: 0px;" class="col-md-6 col-xs-6">
                            <p style="padding-top: 0px;">Sửa thông tin người dùng: 
                                <a href="SuaNguoidung.jsp?idNguoidung=<%=tk.getIdnguoidung()%>"><%=nd.getHo() + " " + nd.getDemVaTen()%></a><br>
                                <a href="TaiKhoan.jsp">&laquo; Về trang quản lý</a>
                            </p>
                        </div>
                        <div style="padding-right: 0px;" class="col-md-6 col-xs-6">
                            <button style="float: right;" type="submit" class="btn btn-blue">Sửa tài khoản</button>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
