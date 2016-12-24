<%-- 
    Document   : ThemTinTuc
    Created on : Dec 6, 2016, 11:26:00 AM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Tin Tức</title>
        <%@include file="includes/headtag.jsp"%>
        <script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
    </head>
    <body>
        <%@include file="includes/header.jsp"  %>
        <%@include file="includes/slider.jsp" %>
        <div class="row col-md-8 col-md-offset-2 text-center" style="margin-top: 90px;">
            <h1>Thêm Tin Tức</h1>
        </div>
        <div class="container" style="padding-bottom: 0;">
            <div class="row col-md-8 col-md-offset-2">
                <form method="post" action="ThemTinTucServlet" enctype="multipart/form-data">
                    <div class="form-group" style="display: none;">
                        <label for="idtaikhoan">ID Tài khoản </label>
                        <input type="text" name="idtaikhoan" class="form-control" value="<%=session.getAttribute("iduser")%>">
                    </div>
                    <div class="form-group">
                        <label for="NgayDang">Ngày đăng: </label>
                        <input type="date" name="NgayDang" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="TieuDe">Tiêu đề: </label>
                        <input type="text" name="TieuDe" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label for="loaitintuc">Loại tin tức: </label>
                        <select name="loaitin" class="selectpicker form-control" required="">
                            <option value="" disabled selected hidden>Chọn một loại tin...</option>
                            <option value="1">Tin nổi bật</option>
                            <option value="2">Tin khuyến mãi</option>
                            <option value="3">Tin dịch vụ</option>
                            <option value="4">Tin khác</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="comment">Nội dung: </label>
                        <textarea class="form-control" name="NoiDung" id="editor1" name="editor1" rows="5"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="GhiChu">Ghi chú: </label>
                        <input type="text" name="GhiChu" class="form-control">
                    </div>
                    <div class="form-group">
                        Chọn hình ảnh để tải lên:
                        <input required="" type="file" name="file" />
                    </div>

                    <button type="submit" class="btn btn-default">Đăng bài</button>
                </form>
                <ckeditor:replace replace="editor1" basePath="/ckeditor/" />
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
