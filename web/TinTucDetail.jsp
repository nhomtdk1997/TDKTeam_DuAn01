<%-- 
    Document   : TinTucDetail
    Created on : Dec 24, 2016, 2:50:55 PM
    Author     : DuongNguyen
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.javaweb.model.Taikhoan"%>
<%@page import="com.javaweb.service.TaikhoanService"%>
<%@page import="com.javaweb.model.Nguoidung"%>
<%@page import="com.javaweb.service.NguoidungService"%>
<%@page import="com.javaweb.model.Tintuc"%>
<%@page import="com.javaweb.service.TintucService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes/headtag.jsp" %>
        <%@include file="includes/popuplogin.jsp" %>
    </head>
    <body>
        <%@include file="includes/headerFix.jsp" %>

        <%            
            TintucService ttsv = new TintucService();
            TaikhoanService tksv = new TaikhoanService();
            NguoidungService ndsv = new NguoidungService();
            Tintuc news = null;
            Nguoidung nd = null;
            if (request.getParameter("idTintuc") != null) {
                int id = Integer.parseInt(request.getParameter("idTintuc"));
                news = ttsv.GetTintucID(id);
                String taikhoanID = Integer.toString(news.getIdTaiKhoan());
                Taikhoan tk = tksv.GetUserById(taikhoanID);
                int idNguoidung = tk.getIdnguoidung();
                nd = ndsv.GetUserByIdNguoidung(idNguoidung);
            } else {
                response.sendRedirect("index.jsp");
            }
            DateFormat inputDF = new SimpleDateFormat("EEE, d MMM yyyy H:m:s");
            Date ngaydang = news.getNgayDang();
            String Ngaydang = inputDF.format(ngaydang);
            String folderupload = getServletContext().getInitParameter("file-upload");
        %>
        <section id="quotes" style="margin-top: 50px;">
            <div class="container">
                <div class="row wow zoomIn">
                    <div class="col-lg-12">
                        <div class="call-to-action text-center">
                            <img style="margin-bottom: 60px;" class="img-thumbnail" src="<%=folderupload%><%=news.getImgLink()%>">
                            <h1><%=news.getTieuDe()%></h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="container">
            <div class="col-md-10 col-md-offset-1 baidang panel page-header">
                <p style="color: #888; font-size: 14px; line-height: 2;">
                    <span class="quanly">Người viết: </span>
                    <%=nd.getHo()+" "%><%=nd.getDemVaTen()%> - <%=Ngaydang%>
                </p>
                <%=news.getNoiDung()%>
                <p style="color: #888; font-size: 16px; text-align: right; line-height: 2; font-style: italic;"><%=news.getGhiChu()%></p>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>        
    </body>
</html>
