<%-- 
    Document   : SuaNguoidung
    Created on : Dec 28, 2016, 5:21:21 PM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Nguoidung"%>
<%@page import="com.javaweb.service.NguoidungService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa người dùng</title>
        <%@include file="includes/headtag.jsp" %>
        <%@include file="includes/headerFix.jsp" %>
    </head>
    <body onload="kiemtrataikhoan()">
        <section class="container" style="padding-top: 150px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>- Sửa thông tin -<br>người dùng</h2>
                    </div>
                </div>
            </div>
            <%                
                NguoidungService ndsv = new NguoidungService();
                Nguoidung nd = new Nguoidung();
                int idNguoidung = Integer.parseInt(request.getParameter("idNguoidung"));
                nd = ndsv.GetUserByIdNguoidung(idNguoidung);
            %>
            <form action="SuaTaiKhoanServlet" method="post">
                <div class="col-md-12">

                    <input class="hidden" id="kiemtra" value="<%=session.getAttribute("kiemtra")%>">

                    <input class="hidden" name="idNguoidung" value="<%=idNguoidung%>">
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label>Họ<span class="required"> *</span></label>
                        <input name="Ho" type="text" required value="<%=nd.getHo()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-8 col-md-offset-2">
                        <label>Đệm và tên<span class="required"> *</span></label>
                        <input name="Demvaten" type="text" required value="<%=nd.getDemVaTen()%>" class="form-control">
                    </div>

                    <div class="form-group col-md-8 col-md-offset-2">
                        <button style="float: right;" type="submit" class="btn btn-blue">Sửa thông tin</button>
                    </div>
                </div>
            </form>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
