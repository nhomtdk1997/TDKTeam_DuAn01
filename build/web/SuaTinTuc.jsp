<%-- 
    Document   : SuaTinTuc
    Created on : Dec 6, 2016, 11:27:11 AM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Loaitintuc"%>
<%@page import="com.javaweb.service.LoaitintucService"%>
<%@page import="com.javaweb.model.Tintuc"%>
<%@page import="com.javaweb.service.TintucService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa tin tức</title>
        <%@include file="includes/headtag.jsp"%>
        <script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
    </head>
    <%        
        if (session.getAttribute("kiemtra") != null) {
    %>
    <body onload="kiemtratintuc(<%=session.getAttribute("kiemtra")%>)">
        <%
            session.removeAttribute("kiemtra");
        } else {
        %>
    <body>
        <%
            }
        %>
        <%@include file="includes/headerManageFix.jsp"  %>
        <section class="container-fluid" style="margin-top: 50px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Sửa tin tức</h2>
                    </div>
                </div>
            </div>

            <%
                TintucService ttsv = new TintucService();
                Tintuc tt = null;
                LoaitintucService lttsv = new LoaitintucService();
                Loaitintuc ltt = new Loaitintuc();
                int idtintuc = Integer.parseInt(request.getParameter("idTintuc"));
                tt = ttsv.GetTintucID(idtintuc);
                int idloaitin = tt.getIdMaLoaiTin();
                ltt = lttsv.GetLoaitintucByID(idloaitin);
            %>

            <div class="row col-md-8 col-md-offset-2">
                <form method="post" action="SuaTinTucServlet" enctype="multipart/form-data">
                    <div class="row">
                        <input style="display: none;" id="ngaydangtt" type="date" name="NgayDang" class="form-control">
                        <input style="display: none;" type="text" name="idtt" value="<%=tt.getIdtintuc()%>" class="form-control">
                        <div class="form-group col-md-3">
                            <label for="idtaikhoan">Người đăng tin </label>
                            <input style="display: none;" type="text" name="idtaikhoan" class="form-control" value="<%=session.getAttribute("iduser")%>">
                            <input type="text" name="idtaikhoan" class="form-control" value="<%=session.getAttribute("youruser")%>" disabled="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="TieuDe">Tiêu đề: </label>
                            <input type="text" name="TieuDe" class="form-control" value="<%=tt.getTieuDe()%>" required="">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="loaitintuc">Loại tin tức: </label>
                            <select name="loaitin" class="selectpicker form-control" required="">
                                <option hidden="" value="<%=idloaitin%>" selected=""><%=ltt.getLoaiTin()%></option>
                                <option value="1">Tin nổi bật</option>
                                <option value="2">Tin khuyến mãi</option>
                                <option value="3">Tin dịch vụ</option>
                                <option value="4">Tin khác</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-9">
                            <label for="comment">Nội dung: </label>
                            <textarea required="" class="form-control" name="NoiDung" id="editor1" name="editor1" rows="5"><%=tt.getNoiDung()%></textarea>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="GhiChu">Chọn hình ảnh để tải lên:</label>
                            <div class="row5">
                                <%
                                    if (tt.getImgLink() != null) {
                                        String folderupload = getServletContext().getInitParameter("file-upload");
                                %>
                                <img class="img-thumbnail" src="<%=folderupload%><%=tt.getImgLink()%>" />
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>      
                    <div class="row">
                        <div class="form-group col-md-9">
                            <label for="GhiChu">Ghi chú: </label>
                            <textarea type="text" name="GhiChu" class="form-control" rows="3"><%=tt.getGhiChu()%></textarea>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="GhiChu">Chọn hình ảnh để tải lên:</label>
                            <input class="" type="file" name="file" />
                            <label></label>
                            <button type="submit" class="form-control btn btn-success">Đăng bài</button>
                        </div>
                    </div>
                </form>
                <ckeditor:replace replace="editor1" basePath="/ckeditor/" />
            </div>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
