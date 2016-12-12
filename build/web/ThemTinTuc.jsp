<%-- 
    Document   : ThemTinTuc
    Created on : Dec 6, 2016, 11:26:00 AM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Tin Tức</title>
        <%@include file="includes/headtag.jsp"  %>
    </head>
    <body>
        <%@include file="includes/header.jsp"  %>
        <%@include file="includes/slider.jsp" %>
        <div class="row col-md-8 col-md-offset-2 text-center" style="margin-top: 90px;">
            <h1>Thêm Tin Tức</h1>
        </div>
        <div class="container" style="padding-bottom: 0;">
            <div class="row col-md-8 col-md-offset-2">
                <form action="#" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="TieuDe">Tiêu Đề: </label>
                        <input type="text" name="TieuDe" class="form-control" required id="giasanpham">
                    </div>
                    <div class="form-group">
                        <label for="NoiDung">Nội Dung: </label>
                        <input type="text" name="NoiDung" class="form-control" id="ngaydang">
                    </div>
                    <div class="form-group">
                        <label for="NgayDang">Ngày Đăng: </label>
                        <input type="text" name="NgayDang" class="form-control" id="mota">
                    </div>
                    <div class="form-group">
                        <label for="GhiChu">Ghi Chú: </label>
                        <input type="text" name="GhiChu" class="form-control" id="mota">
                    </div>
                    <div class="form-group">
                        <input type="file" name="file" size="50" />
                    </div>
                    <button type="submit" class="btn btn-default">Insert</button>
                </form>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
