<%-- 
    Document   : popuplogin
    Created on : Dec 7, 2016, 2:27:15 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="js/js-popup-login.js" type="text/javascript"></script>

<!DOCTYPE html>

<!--
<button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Log in
</button>
-->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: inherit;">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Đăng nhập</h4>
            </div> <!-- /.modal-header -->

            <div class="modal-body">
                <form action="LoginServlet" method="post">
                    <div class="form-group">
                        <span id="idghichu">Tên tài khoản<span class="required"> *</span></span>
                        <div class="input-group">
                            <input type="text" name="username" id="username" class="form-control form-popup" placeholder="Email hoặc Username" required="">
                            <label class="input-group-addon glyphicon glyphicon-user"></label>
                        </div>
                    </div> <!-- /.form-group -->

                    <div class="form-group">
                        <span id="idghichu">Mật khẩu<span class="required"> *</span></span>
                        <div class="input-group">
                            <input type="password" name="pwd" id="pwd" class="form-control form-popup" id="uPassword" placeholder="Mật khẩu" required="">
                            <label class="input-group-addon glyphicon glyphicon-lock"></label>
                        </div> <!-- /.input-group -->
                    </div> <!-- /.form-group -->
                    <div class="dangky">
                        <label>
                            <a href="Register.jsp">Đăng ký tại đây!</a>
                        </label>
                    </div> <!-- /.dangky -->
                    <div class="inputdn">
                        <button id="btndangnhap" type="submit" class="form-control btn btn-primary" onclick="LoginFunction()">ĐĂNG NHẬP</button>
                        <div class="progress" style="display: none; margin-bottom: 0px; height: 30px;">
                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" style="width: 0%;">
                                <p style="padding-top: 5px;">Đang đăng nhập...</p>
                            </div>
                        </div>
                    </div>
                </form>
            </div> <!-- /.modal-body -->

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
